#include <iostream>
#include <fstream>
#include <string>
#include <cstring>
#include <vector>
#include <algorithm>
#include "elf.h"
#include "Narc.h"

using namespace std;

class command_error : public exception {
    const char *_what;
public:
    explicit command_error(const char *s) {_what = s;}
    explicit command_error(const string &s) {_what = s.c_str();}
    const char *what() const noexcept override { return _what; }
};

class elf_exception : public exception {
    const char *_what;
public:
    explicit elf_exception(const char *s) {_what = s;}
    explicit elf_exception(const string &s) {_what = s.c_str();}
    const char *what() const noexcept override { return _what; }
};

#define ELF_ASSERT(expr) do {if(!(expr)) {throw elf_exception("ELF_ASSERT(" #expr ") failed");}} while (0)

class Elf {
    fstream handle;
    Elf32_Ehdr ehdr {};
    vector<Elf32_Shdr> shdr;
    vector<Elf32_Sym> sym;
    char *strtab = nullptr;
    char *shstrtab = nullptr;
public:
    Elf() = default;
    explicit Elf(const string &filename, ios::openmode openmode = ios::in | ios::binary);
    void open(const string &filename, ios::openmode openmode = ios::in | ios::binary);
    ~Elf();
    bool is_open() const {
        return handle.is_open();
    }
    Elf32_Shdr &GetSectionHeader(const char *name);
    Elf32_Shdr &GetSectionHeader(const string &name) { return GetSectionHeader(name.c_str()); }
    bool HasSection(const char *name);
    bool HasSection(const string &name) { return HasSection(name.c_str()); }
    Elf32_Sym &GetSymbol(const char *name);
    Elf32_Sym &GetSymbol(const string &name) { return GetSymbol(name.c_str()); }
    bool HasSymbol(const char *name);
    bool HasSymbol(const string &name) { return HasSymbol(name.c_str()); }
    void *ReadSectionData(const Elf32_Shdr &sec);
    void *ReadSymbolData(const Elf32_Sym &symbol);
    template <typename T> void ReadSectionData(const Elf32_Shdr &sec, T *dest);
    template <typename T> void ReadSymbolData(const Elf32_Sym &symbol, T *dest);
    vector<Elf32_Shdr>& sections() { return shdr; }
    vector<Elf32_Sym>& symbols() { return sym; }
    const char *GetSymbolName(const Elf32_Sym &symbol) const { return strtab + symbol.st_name; }
    const char *GetSectionName(const Elf32_Shdr &sec) const { return shstrtab + sec.sh_name; }
};

class Options {
    vector<string> posargs;
    bool flatten;
    bool naix;
    char padval = '\xFF';
    Elf objfile;
    ofstream narcfile;
public:
    Options(int argc, char ** argv);
    int main();
};

static inline void usage() {
    cout << "Usage: o2narc [-f|--flatten] infile outfile" << endl;
    cout << endl;
    cout << "Arguments:" << endl;
    cout << "\tinfile\tELF object file with symbols __size and __data" << endl;
    cout << "\toutfile\tOutput NARC file" << endl;
    cout << "Options:" << endl;
    cout << "\t-f|--flatten\tDon't generate NARC headers" << endl;
    cout << "\t-n|--naix\tCreate a NARC index header" << endl;
    cout << "\t-p PAD|--padding PAD\tPad with byte value (default: 255)" << endl;
}

int main(int argc, char ** argv) {
    try {
        Options options(argc, argv);
        return options.main();
    } catch (const command_error &e) {
        usage();
        cerr << e.what() << endl;
        return 1;
    } catch (const elf_exception &e) {
        cerr << e.what() << endl;
        return 1;
    } catch (const exception &e) {
        cerr << "Unhandled exception: " << e.what() << endl;
        return 1;
    }
}

Elf::Elf(const string &filename, ios::openmode openmode) {
    open(filename, openmode);
}

void Elf::open(const string &filename, ios::openmode openmode) {
    handle.open(filename, openmode);
    ELF_ASSERT(handle.good());
    handle.read((char *)&ehdr, sizeof(Elf32_Ehdr));
    ELF_ASSERT(memcmp(ehdr.e_ident, ELFMAG, SELFMAG) == 0);
    ELF_ASSERT(ehdr.e_ident[EI_CLASS] == ELFCLASS32);
    ELF_ASSERT(ehdr.e_ident[EI_DATA] == ELFDATA2LSB);
    ELF_ASSERT(ehdr.e_ident[EI_VERSION] == EV_CURRENT);
    ELF_ASSERT(ehdr.e_ehsize == sizeof(Elf32_Ehdr));
    shdr.resize(ehdr.e_shnum);
    handle.seekg(ehdr.e_shoff);
    handle.read((char *)shdr.data(), static_cast<streamsize>(ehdr.e_shnum * sizeof(Elf32_Shdr)));
    for (const auto & sec : shdr) {
        switch (sec.sh_type) {
        case SHT_STRTAB: {
            char *&_strtab = (&sec - shdr.data() == ehdr.e_shstrndx) ? shstrtab : strtab;
            ELF_ASSERT(_strtab == nullptr);
            _strtab = new char[sec.sh_size];
            handle.seekg(sec.sh_offset);
            handle.read(_strtab, sec.sh_size);
            break;
        }
        case SHT_SYMTAB:
            ELF_ASSERT(sym.empty());
            sym.resize(sec.sh_size / sizeof(Elf32_Sym));
            handle.seekg(sec.sh_offset);
            handle.read((char *)sym.data(), sec.sh_size);
            break;
        }
    }
}

Elf::~Elf() {
    delete[] strtab;
    delete[] shstrtab;
}

Elf32_Shdr &Elf::GetSectionHeader(const char *name) {
    return *find_if(shdr.begin(), shdr.end(), [=](const Elf32_Shdr &sec) {
        return strcmp(shstrtab + sec.sh_name, name) == 0;
    } );
}

bool Elf::HasSection(const char *name) {
    return any_of(shdr.begin(), shdr.end(), [=](const Elf32_Shdr &sec) {
        return strcmp(shstrtab + sec.sh_name, name) == 0;
    } );
}

Elf32_Sym &Elf::GetSymbol(const char *name) {
    return *find_if(sym.begin(), sym.end(), [=](const Elf32_Sym &symbol) {
        return strcmp(strtab + symbol.st_name, name) == 0;
    });
}

bool Elf::HasSymbol(const char *name) {
    return any_of(sym.begin(), sym.end(), [=](const Elf32_Sym &symbol) {
        return strcmp(strtab + symbol.st_name, name) == 0;
    });
}

void *Elf::ReadSectionData(const Elf32_Shdr &sec) {
    if (sec.sh_size == 0) {
        return nullptr;
    }
    auto ret = new char[sec.sh_size];
    ReadSectionData(sec, ret);
    return ret;
}

void *Elf::ReadSymbolData(const Elf32_Sym &symbol) {
    if (symbol.st_size == 0) {
        return nullptr;
    }
    auto ret = new char[symbol.st_size];
    ReadSymbolData(symbol, ret);
    return ret;
}

template<typename T>
void Elf::ReadSectionData(const Elf32_Shdr &sec, T *dest) {
    handle.seekg(sec.sh_offset);
    handle.read((char *)dest, sec.sh_size);
}

template<typename T>
void Elf::ReadSymbolData(const Elf32_Sym &symbol, T *dest) {
    handle.seekg(symbol.st_value - shdr[symbol.st_shndx].sh_addr + shdr[symbol.st_shndx].sh_offset);
    handle.read((char *)dest, symbol.st_size);
}

Options::Options(int argc, char **argv) {
    for (int i = 1; i < argc; i++) {
        string arg{argv[i]};
        if (arg == "-f" || arg == "--flatten") {
            flatten = true;
        } else if (arg == "-p" || arg == "--padding") {
            int padval_i = stoi(argv[++i]);
            if (padval_i < 0 || padval_i > 255) {
                throw command_error(string{"invalid 8-bit value "} + argv[i] + " for " + arg);
            }
            padval = static_cast<char>(padval_i);
        } else if (arg == "-n" || arg == "--naix") {
            naix = true;
        } else if (arg[0] == '-') {
            throw command_error("unrecognized option flag: " + arg);
        } else if (posargs.size() >= 2) {
            throw command_error("unrecognized positional argument: " + arg);
        } else {
            posargs.emplace_back(arg);
        }
    }
    if (posargs.size() < 2) {
        throw command_error("missing positional arg");
    }
    objfile.open(posargs[0], ios::in | ios::binary);
    narcfile.open(posargs[1], ios::out | ios::binary);
}

int Options::main() {
    ELF_ASSERT(objfile.HasSection(".rodata"));

    vector<uint32_t> sizes;
    vector<unsigned char> rodata(objfile.GetSectionHeader(".rodata").sh_size);
    objfile.ReadSectionData(objfile.GetSectionHeader(".rodata"), rodata.data());
    // Determine what O file we're dealing with
    if (objfile.HasSymbol("__size")) {
        uint32_t size = objfile.GetSymbol("__size").st_size;
        if (size == sizeof(uint32_t)) {
            objfile.ReadSymbolData(objfile.GetSymbol("__size"), &size);
            sizes.resize((rodata.size() + size - 1) / size);
            fill(sizes.begin(), sizes.end(), size);
        } else {
            sizes.resize(objfile.GetSymbol("__size").st_size / sizeof(uint32_t));
            objfile.ReadSymbolData(objfile.GetSymbol("__size"), sizes.data());
        }
    } else {
        auto pred = [&](const Elf32_Sym &sym) {
            return sym.st_size != 0
                   && strcmp(objfile.GetSectionName(objfile.sections()[sym.st_shndx]), ".rodata") == 0
                   && strcmp(objfile.GetSymbolName(sym), "__size") != 0
                   && strcmp(objfile.GetSymbolName(sym), "__data") != 0
                   && strcmp(objfile.GetSymbolName(sym), ".rodata") != 0;
        };
        sizes.resize(count_if(objfile.symbols().begin(), objfile.symbols().end(), pred));
        ELF_ASSERT(!sizes.empty());
        int t = 0;
        for (const auto &sym : objfile.symbols()) {
            if (pred(sym)) {
                sizes[t++] = sym.st_size;
            }
        }
    }

    uint32_t end = 0;
    for (auto & size : sizes) {
        end += size;
        uint32_t pad_end = (end + 3) & ~3;
        memset(&rodata[end], padval, pad_end - end);
        end = pad_end;
    }

    if (!flatten) {
        FileImages fimg(rodata);
        FileNameTableEntry fntent;
        FileNameTable fnt;
        vector<FileAllocationTableEntry> fatent = FileAllocationTableEntry::_make(sizes);
        FileAllocationTable fat(fatent);
        NarcHeader narc(fat, fnt, fimg);
        narcfile.write((char *)&narc, sizeof(narc));
        narcfile.write((char *)&fat, sizeof(fat));
        narcfile.write((char *)fatent.data(), fatent.size() * sizeof(FileAllocationTableEntry));
        narcfile.write((char *)&fnt, sizeof(fnt));
        narcfile.write((char *)&fntent, sizeof(fntent));
        narcfile.write((char *)&fimg, sizeof(fimg));
    }
    narcfile.write((char *)rodata.data(), rodata.size());
    if (naix) {
        string naixname = posargs[1].substr(0, posargs[1].find_last_of('.')) + ".naix";
        string stem = naixname.substr(naixname.find_last_of('/') + 1, naixname.find_last_of('.') - naixname.find_last_of('/') - 1);
        string stem_upper = stem;
        for (auto &c : stem_upper) { c = toupper(c); }
        ofstream naixfile(naixname);
        naixfile << "/*\n"
                    " * THIS FILE WAS AUTOMATICALLY\n"
                    " *  GENERATED BY tools/o2narc\n"
                    " *      DO NOT MODIFY!!!\n"
                    " */\n"
                    "\n"
                    "#ifndef NARC_" << stem_upper << "_NAIX_\n"
                                                     "#define NARC_" << stem_upper << "_NAIX_\n"
                                                                                      "\n"
                                                                                      "enum {\n";
        char num_buf[9] = "00000000";
        for (int i = 0; i < sizes.size(); i++) {
            naixfile << "    NARC_" << stem << "_" << stem << "_" << num_buf << " = " << i << "," << endl;
            for (int k = 7; k >= 0; k--) {
                num_buf[k]++;
                if (num_buf[k] > '9') {
                    num_buf[k] = '0';
                } else {
                    break;
                }
            }
        }
        naixfile << "};\n\n#endif //NARC_" << stem_upper << "_NAIX_\n";
    }
    return 0;
}
