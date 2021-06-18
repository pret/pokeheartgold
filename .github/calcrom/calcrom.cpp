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
 */

#include <iostream>
#include <fstream>
#include <sstream>
#include <elf.h>
#include <glob.h>
#include <string.h>
#include <vector>
#include <string>

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

void analyze(string basedir, string subdir, string version) {
    fstream elf;
    Elf32_Ehdr ehdr;
    vector<Elf32_Shdr> shdr;
    stringstream pattern;

    // Accumulate sizes
    //        src   asm
    // data  _____|_____
    // text       |
    unsigned sizes[2][2] = {{0, 0}, {0, 0}};
    char * shstrtab = NULL;
    size_t shstrsz = 0;
    stringstream builddir;
    builddir << subdir << "/build/" << version;
    pattern << basedir << "/" << subdir << "/{src,asm,lib/{src,asm},modules/*/{src,asm}}/*.{c,s,cpp}";
    for (char const * & fname : Glob(pattern.str()))
    {
        string fname_s(fname);
        string ext = fname_s.substr(fname_s.rfind('.'), 4);
        bool is_asm = ext == ".s";
        fname_s = fname_s.replace(fname_s.find(subdir), 4, builddir.str());
        fname_s = fname_s.replace(fname_s.rfind('.'), 4, ".o");
        elf.open(fname_s, ios_base::in | ios_base::binary);
        if (!elf.good()) {
            cerr << "Error: file not found: " << fname_s << endl;
            return;
        }
        elf.read((char *)&ehdr, sizeof(ehdr));
        if (memcmp(ehdr.e_ident, ELFMAG, SELFMAG) != 0
            || ehdr.e_ehsize != sizeof(Elf32_Ehdr)
            || ehdr.e_shentsize != sizeof(Elf32_Shdr))
        {
            elf.close();
            stringstream ss;
            ss << "Error validating " << fname_s << " as an ELF file" << endl;
            throw runtime_error(ss.str());
        }
        // Read ELF sections
        elf.seekg(ehdr.e_shoff);
        shdr.resize(ehdr.e_shnum);
        elf.read((char *)shdr.data(), ehdr.e_shnum * ehdr.e_shentsize);

        // Read .shstrtab
        if (shstrsz < shdr[ehdr.e_shstrndx].sh_size) {
            shstrtab = (char *)realloc(shstrtab, shdr[ehdr.e_shstrndx].sh_size);
            shstrsz = shdr[ehdr.e_shstrndx].sh_size;
        }
        elf.seekg(shdr[ehdr.e_shstrndx].sh_offset);
        elf.read(shstrtab, shdr[ehdr.e_shstrndx].sh_size);
        elf.close();

        // Analyze sections
        for (Elf32_Shdr & hdr : shdr) {
            string shname = shstrtab + hdr.sh_name;
            bool is_text = (shname == ".text" || shname == ".init" || shname == ".itcm");
            bool is_data = (shname == ".data" || shname == ".rodata" || shname == ".sdata" || shname == ".dtcm");
            size_t size = hdr.sh_size + (hdr.sh_size & 3 ? 4 - (hdr.sh_size & 3) : 0);
            if (is_text || is_data)
            {
                sizes[is_text][is_asm] += size;
            }
        }
    }
    free(shstrtab);

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

    analyze(argv[1], "arm9", "diamond.us");
    cout << endl;
    analyze(argv[1], "arm9", "pearl.us");
    cout << endl;
    analyze(argv[1], "arm7", "");

    return 0;
}
