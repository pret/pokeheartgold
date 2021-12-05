#ifndef CALCROM_ELFFILE_H
#define CALCROM_ELFFILE_H

#include <vector>
#include <fstream>
#include "find_filesystem.h"
#ifdef __APPLE__
#include <libelf/libelf.h>
#else
#include <elf.h>
#endif //__APPLE__

using namespace std;
using namespace fs;

class Elf32File {
    ifstream handle;
    Elf32_Ehdr ehdr {};
    vector<Elf32_Shdr> shdr;
    vector<Elf32_Sym> symtab;
    vector<Elf32_Phdr> phdr;
    vector<char> shstrtab;
    vector<char> strtab;

private:
    void ReadElfHeaderAndVerify();
    void ReadSectionHeaders();
    void ReadProgramHeaders();
    void ReadShstrtab();
    void ReadStrtab();
    void ReadSymtab();
public:
    typedef unsigned int elfload;
    static const elfload sections = 1;
    static const elfload programs = 2;
    static const elfload symbols  = 4;

    Elf32File() = default;
    explicit Elf32File(path const& filename, elfload load = sections);
    ~Elf32File();
    void open(path const& filename, elfload load = sections);
    void close();
    bool is_open() const;
    template <typename V>
    vector<V> ReadSectionData(const Elf32_Shdr &_shdr) {
        vector<V> ret;
        ret.resize(GetSectionElementCount<V>(_shdr));
        handle.seekg(_shdr.sh_offset);
        handle.read((char *)ret.data(), _shdr.sh_size);
        return ret;
    }
    template <typename V>
    size_t GetSectionElementCount(const Elf32_Shdr &_shdr) {
        return (_shdr.sh_size + sizeof(V) - 1) / sizeof(V);
    }
    vector<Elf32_Shdr>& GetSectionHeaders();
    vector<Elf32_Phdr>& GetProgramHeaders();
    string GetSectionName(const Elf32_Shdr &section) const;
    string GetSymbolName(const Elf32_Sym &symbol) const;
    Elf32_Sym &operator[](const string &name);
    Elf32_Sym &at(const string &name);
};

#endif //CALCROM_ELFFILE_H
