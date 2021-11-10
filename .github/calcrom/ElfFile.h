#ifndef CALCROM_ELFFILE_H
#define CALCROM_ELFFILE_H

#include <vector>
#include <fstream>
#include <filesystem>
#include <elf.h>

using namespace std;
using namespace std::filesystem;

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
    vector<char> ReadSectionData(Elf32_Shdr &_shdr);
    vector<Elf32_Shdr>& GetSectionHeaders();
    string GetSectionName(Elf32_Shdr &section);
};

#endif //CALCROM_ELFFILE_H
