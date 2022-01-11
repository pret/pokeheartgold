#ifndef GUARD_RELOCELFREADER_H
#define GUARD_RELOCELFREADER_H

#include <fstream>
#include <vector>
#include "elf.h"

using namespace std;


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
    template <typename T>
    T *ReadSectionData(const Elf32_Shdr &sec, T *dest = nullptr) {
        if (dest == nullptr) {
            if (sec.sh_size == 0) {
                return nullptr;
            }
            dest = new T[sec.sh_size];
        }
        handle.seekg(sec.sh_offset);
        handle.read((char *)dest, sec.sh_size);
        return dest;
    }

    template <typename T>
    T *ReadSymbolData(const Elf32_Sym &symbol, T *dest = nullptr) {
        if (dest == nullptr) {
            if (symbol.st_size == 0) {
                return nullptr;
            }
            dest = new T[symbol.st_size];
        }
        handle.seekg(symbol.st_value - shdr[symbol.st_shndx].sh_addr + shdr[symbol.st_shndx].sh_offset);
        handle.read((char *)dest, symbol.st_size);
        return dest;
    }

    vector<Elf32_Shdr>& sections() { return shdr; }
    vector<Elf32_Sym>& symbols() { return sym; }
    const char *GetSymbolName(const Elf32_Sym &symbol) const { return strtab + symbol.st_name; }
    const char *GetSectionName(const Elf32_Shdr &sec) const { return shstrtab + sec.sh_name; }
};


#endif //GUARD_RELOCELFREADER_H
