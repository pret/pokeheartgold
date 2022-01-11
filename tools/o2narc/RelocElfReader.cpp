#include <cstring>
#include <algorithm>
#include "RelocElfReader.h"

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
