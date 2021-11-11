#include <iostream>
#include <cassert>
#include <algorithm>
#include "ElfFile.h"

void Elf32File::ReadElfHeaderAndVerify() {
    handle.seekg(0);
    handle.read((char *)ehdr.e_ident, EI_NIDENT);
    assert(memcmp(ehdr.e_ident, ELFMAG, SELFMAG) == 0);
    assert(ehdr.e_ident[EI_CLASS] == ELFCLASS32);
    assert(ehdr.e_ident[EI_DATA] == ELFDATA2LSB);
    assert(ehdr.e_ident[EI_VERSION] == EV_CURRENT);
    handle.read((char*)&ehdr + EI_NIDENT, sizeof(ehdr) - EI_NIDENT);
    assert(ehdr.e_shentsize == sizeof(Elf32_Shdr));
}
void Elf32File::ReadSectionHeaders() {
    shdr.resize(ehdr.e_shnum);
    handle.seekg(ehdr.e_shoff);
    handle.read((char*)shdr.data(), ehdr.e_shnum * ehdr.e_shentsize);
}
void Elf32File::ReadShstrtab() {
    shstrtab.resize(shdr[ehdr.e_shstrndx].sh_size);
    handle.seekg(shdr[ehdr.e_shstrndx].sh_offset);
    handle.read((char*)shstrtab.data(), shdr[ehdr.e_shstrndx].sh_size);
}
void Elf32File::ReadStrtab() {
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
void Elf32File::ReadSymtab() {
    auto sec = find_if(shdr.begin(), shdr.end(), [](Elf32_Shdr const& candidate) { return candidate.sh_type == SHT_SYMTAB; });
    assert(sec != shdr.end());
    symtab.resize(sec->sh_size);
    handle.seekg(sec->sh_offset);
    handle.read((char*)symtab.data(), sec->sh_size);
}

Elf32File::Elf32File(path const& filename, bool read_syms) : handle(filename, ios::binary) {
    assert(handle.good());
    ReadElfHeaderAndVerify();
    ReadSectionHeaders();
    ReadShstrtab();
    if (read_syms) {
        ReadStrtab();
        ReadSymtab();
    }
}

Elf32File::~Elf32File() {
    handle.close();
}

vector<Elf32_Shdr> &Elf32File::GetSectionHeaders() {
    return shdr;
}

string Elf32File::GetSectionName(const Elf32_Shdr &section) const {
    return string(shstrtab.data() + section.sh_name);
}

string Elf32File::GetSymbolName(const Elf32_Sym &symbol) const {
    return string(strtab.data() + symbol.st_name);
}

Elf32_Sym &Elf32File::FindSymbol(const string &name) {
    for (Elf32_Sym &sym : symtab) {
        cerr << GetSymbolName(sym) << endl;
        if (name == GetSymbolName(sym)) {
            return sym;
        }
    }
    return *symtab.end();
}

Elf32_Sym &Elf32File::operator[](const string &name) {
    sym_iterator ret;

    for (ret = symtab.begin(); ret != symtab.end(); ret++) {
        if (name == GetSymbolName(*ret)) {
            break;
        }
    }
    return *ret;
}

Elf32_Sym &Elf32File::at(const string &name) {
    sym_iterator ret;

    for (ret = symtab.begin(); ret != symtab.end(); ret++) {
        if (name == GetSymbolName(*ret)) {
            break;
        }
    }
    if (ret == symtab.end()) {
        throw runtime_error("no symbol named " + name);
    }
    return *ret;
}
