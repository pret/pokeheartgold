/*
 * CALCROM.CPP
 * © PikalaxALT 2020
 *
 * Simple C++ executable to measure the completion rate of Pokémon Diamond
 * reverse engineering (decompilation).
 *
 * Requirements:
 *  - Must have C++11 compliant compiler.
 *  - MacOS X: Must provide elf.h on the include (-I) path.
 *  - Must be placed in ".travis/calcrom/".
 *
 * Changelog:
 *  - 0.1.0 (26 May 2020):
 *      Initial implementation
 *  - 0.1.1 (26 May 2020):
 *      Allow program to be run from wherever
 *  - 0.1.2 (27 May 2020):
 *      Extra security on ELF header
 *  - 0.1.3 (30 Jun 2020):
 *      Account for diamond/pearl split
 *  - 0.2.0 (30 Aug 2021):
 *      Support hgss
 */

#include <iostream>
#include <fstream>
#include <sstream>
#include <elf.h>
#include <glob.h>
#include <cstring>
#include <vector>
#include <string>
#include <cassert>
#include <algorithm>

using namespace std;

struct Glob : public vector<char const *> {
    glob_t glob_result;
public:
    Glob(string const & pattern) {
        int result = glob(pattern.c_str(), GLOB_TILDE | GLOB_BRACE, NULL, &glob_result);
        if (result) {
            stringstream ss;
            ss << "Glob(" << pattern << ") failed with error " << result << endl;
            throw runtime_error(ss.str());
        }
        assign(glob_result.gl_pathv, glob_result.gl_pathv + glob_result.gl_pathc);
    };
    void operator~() {
        globfree(&glob_result);
    }
};

struct Elf32File {
    ifstream handle;
    Elf32_Ehdr ehdr;
    vector<Elf32_Shdr> shdr;
    vector<Elf32_Sym> symtab;
    vector<char> shstrtab;
    vector<char> strtab;

private:
    void ReadElfHeaderAndVerify() {
        handle.seekg(0);
        handle.read((char *)ehdr.e_ident, EI_NIDENT);
        assert(memcmp(ehdr.e_ident, ELFMAG, SELFMAG) == 0);
        assert(ehdr.e_ident[EI_CLASS] == ELFCLASS32);
        assert(ehdr.e_ident[EI_DATA] == ELFDATA2LSB);
        assert(ehdr.e_ident[EI_VERSION] == EV_CURRENT);
        handle.read((char*)&ehdr + EI_NIDENT, sizeof(ehdr) - EI_NIDENT);
        assert(ehdr.e_shentsize == sizeof(Elf32_Shdr));
    }
    void ReadSectionHeaders() {
        shdr.resize(ehdr.e_shnum);
        handle.seekg(ehdr.e_shoff);
        handle.read((char*)shdr.data(), ehdr.e_shnum * ehdr.e_shentsize);
    }
    void ReadShstrtab() {
        shstrtab.resize(shdr[ehdr.e_shstrndx].sh_size);
        handle.seekg(shdr[ehdr.e_shstrndx].sh_offset);
        handle.read((char*)shstrtab.data(), shdr[ehdr.e_shstrndx].sh_size);
    }
    void ReadStrtab() {
        int i;
        for (i = 1; i < ehdr.e_shnum; i++) {
            if (i == ehdr.e_shstrndx) continue;
            if (shdr[i].sh_type == SHT_STRTAB) break;
        }
        assert(i != ehdr.e_shnum);
        strtab.resize(shdr[i].sh_size);
        handle.seekg(shdr[i].sh_offset);
        handle.read((char*)strtab.data(), shdr[i].sh_size);
    }
    void ReadSymtab() {
        auto sec = find_if(shdr.begin(), shdr.end(), [](Elf32_Shdr const& candidate) { return candidate.sh_type == SHT_SYMTAB; });
        strtab.resize(sec->sh_size);
        handle.seekg(sec->sh_offset);
        handle.read((char*)strtab.data(), sec->sh_size);
    }
public:
    Elf32File(string const& filename, bool read_syms = false) : handle(filename, ios::binary) {
        assert(handle.good());
        ReadElfHeaderAndVerify();
        ReadSectionHeaders();
        ReadShstrtab();
        if (read_syms) {
            ReadStrtab();
            ReadSymtab();
        }
    }
    ~Elf32File() {
        handle.close();
    }
};

string default_version("");

void analyze(string& basedir, string& subdir, string& version = default_version) {
    // Accumulate sizes
    //        src   asm
    // data  _____|_____
    // text       |
    unsigned sizes[2][2] = {{0, 0}, {0, 0x800 /* libsyscall.a */}};

    string srcbase = basedir + (subdir.empty() ? "" : "/" + subdir);
    string builddir = srcbase + "/build/" + version;
    string pattern = srcbase + "/{src,asm,lib/{src,asm},lib/{!syscall}/{src,asm}}/*.{c,s,cpp}";
    for (char const * & fname : Glob(pattern))
    {
        string fname_s(fname);
        string ext = fname_s.substr(fname_s.rfind('.'), 4);
        bool is_asm = ext == ".s";
        fname_s = fname_s.replace(0, srcbase.size(), builddir);
        fname_s = fname_s.replace(fname_s.rfind('.'), string::npos, ".o");
#ifndef NDEBUG
        cerr << fname << " --> " << fname_s << endl;
#endif

        Elf32File elf(fname_s);

        // Analyze sections
        for (Elf32_Shdr & hdr : elf.shdr) {
            string shname = elf.shstrtab.data() + hdr.sh_name;
            bool is_text = (shname == ".text" || shname == ".init" || shname == ".itcm");
            bool is_data = (shname == ".data" || shname == ".rodata" || shname == ".sdata" || shname == ".dtcm");
            size_t size = hdr.sh_size + (hdr.sh_size & 3 ? 4 - (hdr.sh_size & 3) : 0);
            if (is_text || is_data)
            {
                sizes[is_text][is_asm] += size;
            }
        }
    }

    cout << "Analysis of " << (version.empty() ? subdir : version) << " binary:" << endl;
    // Report code
    unsigned total_text = sizes[1][0] + sizes[1][1];
    double total_text_d = total_text;
    double src_text_d = sizes[1][0];
    double asm_text_d = sizes[1][1];
    cout << "  " << total_text << " total bytes of code" << endl;
    cout << "    " << sizes[1][0] << " bytes of code in src (" << (src_text_d / total_text_d * 100.0) << "%)" << endl;
    cout << "    " << sizes[1][1] << " bytes of code in asm (" << (asm_text_d / total_text_d * 100.0) << "%)" << endl;
    cout << endl;
    // Report data
    unsigned total_data = sizes[0][0] + sizes[0][1];
    double total_data_d = total_data;
    double src_data_d = sizes[0][0];
    double asm_data_d = sizes[0][1];
    cout << "  " << total_data << " total bytes of data" << endl;
    cout << "    " << sizes[0][0] << " bytes of data in src (" << (src_data_d / total_data_d * 100.0) << "%)" << endl;
    cout << "    " << sizes[0][1] << " bytes of data in asm (" << (asm_data_d / total_data_d * 100.0) << "%)" << endl;
    // Let vectors fall to gc
}

int main(int argc, char ** argv)
{
    if (argc < 2) {
        cout << "usage: calcrom PROJECT_DIR" << endl;
        throw invalid_argument("missing required argument: PROJECT_DIR\n");
    }

    string basepath(argv[1]);
    string arm9subdir("");
    string rom1name("heartgold.us");
    string rom2name("soulsilver.us");
    string arm7subdir("sub");

    analyze(basepath, arm9subdir, rom1name);
    cout << endl;
    analyze(basepath, arm9subdir, rom2name);
    cout << endl;
    analyze(basepath, arm7subdir);

    return 0;
}
