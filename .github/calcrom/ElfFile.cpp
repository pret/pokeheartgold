#include <iostream>
#include <cassert>
#include <algorithm>
#include <cstring>
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
    assert(shdr.empty());
    shdr.resize(ehdr.e_shnum);
    handle.seekg(ehdr.e_shoff);
    handle.read((char*)shdr.data(), ehdr.e_shnum * ehdr.e_shentsize);
}

void Elf32File::ReadProgramHeaders() {
    assert(phdr.empty());
    phdr.resize(ehdr.e_phnum);
    handle.seekg(ehdr.e_phoff);
    handle.read((char*)phdr.data(), ehdr.e_phnum * ehdr.e_phentsize);
}

void Elf32File::ReadShstrtab() {
    assert(shstrtab.empty());
    shstrtab.resize(shdr[ehdr.e_shstrndx].sh_size);
    handle.seekg(shdr[ehdr.e_shstrndx].sh_offset);
    handle.read((char*)shstrtab.data(), shdr[ehdr.e_shstrndx].sh_size);
}

void Elf32File::ReadStrtab() {
    assert(strtab.empty());
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
    assert(symtab.empty());
    auto sec = find_if(shdr.begin(), shdr.end(), [](Elf32_Shdr const& candidate) { return candidate.sh_type == SHT_SYMTAB; });
    assert(sec != shdr.end());
    symtab.resize(sec->sh_size);
    handle.seekg(sec->sh_offset);
    handle.read((char*)symtab.data(), sec->sh_size);
}

Elf32File::Elf32File(path const& filename, elfload load) {
    open(filename, load);
}

void Elf32File::open(path const& filename, elfload load) {
    assert(!is_open());
    handle.open(filename, ios::binary);
    assert(handle.good());
    ReadElfHeaderAndVerify();
    if (load & sections) {
        ReadSectionHeaders();
        ReadShstrtab();
    }
    if (load & programs) {
        ReadProgramHeaders();
    }
    if (load & symbols) {
        assert(load & sections);
        ReadStrtab();
        ReadSymtab();
    }
}

void Elf32File::close() {
    if (is_open()) {
        handle.close();
    }
    memset(&ehdr, 0, sizeof(ehdr));
    shdr.clear();
    symtab.clear();
    phdr.clear();
    shstrtab.clear();
    strtab.clear();
}

bool Elf32File::is_open() const {
    return handle.is_open();
}

Elf32File::~Elf32File() {
    close();
}

vector<Elf32_Shdr> &Elf32File::GetSectionHeaders() {
    return shdr;
}

vector<Elf32_Phdr> &Elf32File::GetProgramHeaders() {
    return phdr;
}

string Elf32File::GetSectionName(const Elf32_Shdr &section) const {
    return string(shstrtab.data() + section.sh_name);
}

string Elf32File::GetSymbolName(const Elf32_Sym &symbol) const {
    return string(strtab.data() + symbol.st_name);
}

Elf32_Sym &Elf32File::operator[](const string &name) {
    return *find_if(symtab.begin(), symtab.end(), [&](Elf32_Sym const &sym) { return name == GetSymbolName(sym); });
}

Elf32_Sym &Elf32File::at(const string &name) {
    auto ret = find_if(symtab.begin(), symtab.end(), [&](Elf32_Sym const &sym) { return name == GetSymbolName(sym); });
    if (ret == symtab.end()) {
        throw runtime_error("no symbol named " + name);
    }
    return *ret;
}
