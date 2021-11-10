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
    strtab.resize(sec->sh_size);
    handle.seekg(sec->sh_offset);
    handle.read((char*)strtab.data(), sec->sh_size);
}

vector<char> Elf32File::ReadSectionData(Elf32_Shdr &_shdr) {
    vector<char> ret;
    ret.resize(_shdr.sh_size);
    handle.seekg(_shdr.sh_offset);
    handle.read(ret.data(), _shdr.sh_size);
    return ret;
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

string Elf32File::GetSectionName(Elf32_Shdr &section) {
    return shstrtab.data() + section.sh_name;
}
