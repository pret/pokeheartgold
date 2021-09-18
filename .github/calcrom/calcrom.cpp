/*
 * CALCROM.CPP
 * © PikalaxALT 2020-2021
 *
 * Permission is granted to copy and/or modify this code under GPL 3.0.
 *
 * Simple C++ executable to measure the completion rate of Nintendo DS
 * reverse engineering (decompilation).
 * Similar in scope to calcrom.pl from pret-agb projects, but designed
 * to cope with restrictions imposed by the DS toolchain.
 *
 * Requirements:
 *  - Must have C++11 compliant compiler.
 *  - MacOS X: Must provide elf.h on the include (-I) path.
 *  - Must be placed in ".github/calcrom/".
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
 *  - 0.2.1 (31 Aug 2021):
 *      Make calcrom more generic and configurable via command line
 *  - 0.2.2 (18 Sep 2021):
 *      Handle errors when paths are missing
 */

#include <iostream>
#include <fstream>
#include <elf.h>
#include <glob.h>
#include <cstring>
#include <vector>
#include <string>
#include <cassert>
#include <algorithm>
#include <filesystem>

using namespace std;
using namespace std::filesystem;

// Wraps glob results from <glob.h>
struct Glob : public vector<char const *> {
    glob_t glob_result;
    int glob_flags;
public:
    // Call glob with the supplied pattern
    Glob(const char * pattern, int _glob_flags) : glob_flags(_glob_flags) {
        int result = glob(pattern, glob_flags, nullptr, &glob_result);
        if (result) {
            throw runtime_error(string("Glob(") + pattern + ") failed with error " + to_string(result));
        }
        assign(glob_result.gl_pathv, glob_result.gl_pathv + glob_result.gl_pathc);
    };
    Glob(const string& pattern, int _glob_flags) : Glob(pattern.c_str(), _glob_flags) {}
    ~Glob() {
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
        assert(sec != shdr.end());
        strtab.resize(sec->sh_size);
        handle.seekg(sec->sh_offset);
        handle.read((char*)strtab.data(), sec->sh_size);
    }
public:
    Elf32File(path const& filename, bool read_syms = false) : handle(filename, ios::binary) {
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

void analyze(path& basedir, path& subdir, string& version = default_version) {
    // Accumulate sizes
    //        src   asm
    // data  _____|_____
    // text       |
    unsigned sizes[2][2] = {{0, 0}, {0, 0}};

    if (!version.empty()) {
        sizes[1][1] = 0x800; // libsyscall.a
    }

    path srcbase = basedir / subdir;
    string builddir = srcbase / "build" / version;
    if (!exists(srcbase)) {
        throw runtime_error("No such directory: " + srcbase.string());
    }
    string pattern = srcbase.string() + "/{src,asm,lib/{src,asm},lib/{!syscall}/{src,asm}}/*.{c,s,cpp}";
    for (char const * & fname : Glob(pattern, GLOB_TILDE | GLOB_BRACE | GLOB_NOSORT))
    {
        path fname_s(fname);
        string ext = fname_s.extension();
        bool is_asm = ext == ".s";
        fname_s = builddir / relative(fname_s, srcbase);
        fname_s = fname_s.replace_extension(".o");
#ifndef NDEBUG
        cerr << fname << " --> " << fname_s << endl;
#endif
        if (!exists(fname_s)) {
            throw runtime_error("No such file: " + fname_s.string());
        }

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

    cout << "Analysis of " << (version.empty() ? subdir.string() : version) << " binary:" << endl;
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

class missing_option : public invalid_argument {
public:
    missing_option(string& error) : invalid_argument{error.c_str()} {}
};

struct Options {
    path arm9subdir = "";
    path arm7subdir = "sub";
    path projectdir = ".";
    vector<string> romnames;
    Options(int argc, char ** argv) {
        for (int i = 1; i < argc; i++) {
            string arg = argv[i];
            if (arg == "-9") {
                if (++i == argc) throw missing_option(arg);
                arm9subdir = argv[i];
            } else if (arg == "-7") {
                if (++i == argc) throw missing_option(arg);
                arm7subdir = argv[i];
            } else if (arg == "-d") {
                if (++i == argc) throw missing_option(arg);
                projectdir = argv[i];
            } else if (arg[0] != '-') {
                romnames.push_back(arg);
            } else {
                throw invalid_argument(arg);
            }
        }
    }
};

int main(int argc, char ** argv)
{
    try {
        Options options(argc, argv);

        for (string &romname: options.romnames)
        {
            analyze(options.projectdir, options.arm9subdir, romname);
            cout << endl;
        }
        analyze(options.projectdir, options.arm7subdir);
    } catch (missing_option& e) {
        cerr << "Missing value for option " << e.what() << endl;
        return 1;
    } catch (invalid_argument& e) {
        cerr << "Unrecognized option flag: " << e.what() << endl;
        return 1;
    } catch (runtime_error& e) {
        cerr << e.what() << endl;
        return 1;
    } catch (exception& e) {
        cerr << "Unhandled exception: " << e.what() << endl;
        return 1;
    }
    return 0;
}
