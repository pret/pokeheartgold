#ifndef CALCROM_ELFFILE_H
#define CALCROM_ELFFILE_H

#include <vector>
#include <fstream>
#include <filesystem>
#include <elf.h>

using namespace std;
using namespace std::filesystem;
using sym_iterator = vector<Elf32_Sym>::iterator;

class Elf32File {
    ifstream handle;
    Elf32_Ehdr ehdr;
    vector<Elf32_Shdr> shdr;
    vector<Elf32_Sym> symtab;
    vector<char> shstrtab;
    vector<char> strtab;

private:
    void ReadElfHeaderAndVerify();
    void ReadSectionHeaders();
    void ReadShstrtab();
    void ReadStrtab();
    void ReadSymtab();
public:
    Elf32File(path const& filename, bool read_syms = false);
    ~Elf32File();
    template <typename _V>
    vector<_V> ReadSectionData(const Elf32_Shdr &_shdr) {
        vector<_V> ret;
        ret.resize((_shdr.sh_size + sizeof(_V) - 1) / sizeof(_V));
        handle.seekg(_shdr.sh_offset);
        handle.read((char *)ret.data(), _shdr.sh_size);
        return ret;
    }
    template <typename _V>
    size_t GetSectionElementCount(const Elf32_Shdr &_shdr) {
        return (_shdr.sh_size + sizeof(_V) - 1) / sizeof(_V);
    }
    vector<Elf32_Shdr>& GetSectionHeaders();
    string GetSectionName(const Elf32_Shdr &section) const;
    string GetSymbolName(const Elf32_Sym &symbol) const;
    Elf32_Sym &FindSymbol(const string &name);
    Elf32_Sym &operator[](const string &name);
    Elf32_Sym &at(const string &name);
};

#endif //CALCROM_ELFFILE_H
