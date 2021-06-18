#include <iostream>
#include <fstream>
#include <getopt.h>
#include <cstring>
#include <vector>
#include "elf.h"
#include "Narc.h"

using namespace std;

static Elf32_Sym NullSym { 0 };

static Elf32_Shdr NullShdr { 0 };

class Symtab : public vector<Elf32_Sym> {
public:
    char * strtab;
    Symtab() : strtab(nullptr) {}
    Elf32_Sym & operator[](const char * name) {
        for (auto& value : *this) {
            if (strcmp(strtab + value.st_name, name) == 0)
                return value;
        }
        return NullSym;
    }
};

class ShdrTab : public vector<Elf32_Shdr> {
public:
    char * shstrtab;
    ShdrTab() : shstrtab(nullptr) {}
    Elf32_Shdr & operator[](const int idx) {
        return data()[idx];
    }
    Elf32_Shdr & operator[](const char * name) {
        for (auto& value : *this) {
            if (strcmp(shstrtab + value.sh_name, name) == 0)
                return value;
        }
        return NullShdr;
    }
};

class Elf {
    fstream handle;
    Elf32_Ehdr ehdr;
    Elf32_Phdr * phdr;
    uint32_t symnum;
public:
    ShdrTab shdr;
    Symtab symtab;
    Elf(const char * filename) {
        // Read the ELF header
        phdr = nullptr;
        handle.open(filename, ios_base::in | ios_base::binary);
        if (!handle.good()) {
            cerr << "ERROR: Unable to open file '" << filename << "' for reading" << endl;
            exit(1);
        }
        handle.read((char *)&ehdr, sizeof(ehdr));
        if (memcmp(ehdr.e_ident, ELFMAG, SELFMAG) != 0) {
            handle.close();
            cerr << "ERROR: Opened file is not a valid ELF" << endl;
            exit(1);
        }

        // Read the section headers
        shdr.resize(ehdr.e_shnum);
        handle.seekg(ehdr.e_shoff);
        handle.read((char *)shdr.data(), ehdr.e_shnum * ehdr.e_shentsize);

        // Read the program headers
        phdr = new Elf32_Phdr [ehdr.e_phnum];
        handle.seekg(ehdr.e_phoff);
        handle.read((char *)phdr, ehdr.e_phnum * ehdr.e_phentsize);

        // Read the section string table
        shdr.shstrtab = new char[shdr[ehdr.e_shstrndx].sh_size];
        handle.seekg(shdr[ehdr.e_shstrndx].sh_offset);
        handle.read(shdr.shstrtab, shdr[ehdr.e_shstrndx].sh_size);

        // Read the symbol table
        for (int i = 0; i < ehdr.e_shnum; i++) {
            switch (shdr[i].sh_type)
            {
            case SHT_SYMTAB:
                if (!symtab.empty()) {
                    handle.close();
                    cerr << "ERROR: double symtab" << endl;
                    exit(1);
                }
                symnum = shdr[i].sh_size / sizeof(Elf32_Sym);
                symtab.resize(symnum);
                handle.seekg(shdr[i].sh_offset);
                handle.read((char *)symtab.data(), shdr[i].sh_size);
                break;
            case SHT_STRTAB:
                if (i == ehdr.e_shstrndx)
                    break;
                if (symtab.strtab != nullptr) {
                    handle.close();
                    cerr << "ERROR: double strtab" << endl;
                    exit(1);
                }
                symtab.strtab = new char[shdr[i].sh_size];
                handle.seekg(shdr[i].sh_offset);
                handle.read(symtab.strtab, shdr[i].sh_size);
                break;
            }
        }
    }

    void operator ~() {
        delete[] symtab.strtab;
        delete[] shdr.shstrtab;
        delete[] phdr;
    }

    void * read(Elf32_Sym & sym) {
        // Reads the value of a symbol
        if (sym.st_size == 0)
            return nullptr;
        if (shdr.empty())
            return nullptr;
        Elf32_Shdr & sec = shdr[sym.st_shndx];
        size_t size = (sym.st_size + 3) & ~3;
        off_t off = sym.st_value - sec.sh_addr + sec.sh_offset;
        auto ret = new char[size];
        handle.seekg(off);
        handle.read(ret, sym.st_size);
        if (sym.st_size & 3)
            memset(ret + sym.st_size, 0, size - sym.st_size);
        return ret;
    }

    void * read(Elf32_Shdr & sec) {
        // Reads the contents of an ELF section
        if (sec.sh_size == 0)
            return nullptr;
        size_t size = (sec.sh_size + 3) & ~3;
        auto ret = new char[size];
        handle.seekg(sec.sh_offset);
        handle.read(ret, sec.sh_size);
        if (sec.sh_size & 3)
            memset(ret + sec.sh_size, 0, size - sec.sh_size);
        return ret;
    }
};

static inline void usage() {
    cout << "Usage: o2narc [-f|--flatten] infile outfile" << endl;
    cout << endl;
    cout << "Arguments:" << endl;
    cout << "\tinfile\tELF object file with symbols __size and __data" << endl;
    cout << "\toutfile\tOutput NARC file" << endl;
    cout << "Options:" << endl;
    cout << "\t-f|--flatten\tDon't generate NARC headers" << endl;
}

int main(int argc, char ** argv) {
    // CLI arguments
    int flatten = 0;
    char padding = '\xFF';
    static option options [] {
        { "flatten", no_argument, &flatten, 1 },
        { "padding", required_argument, nullptr, 'p' },
        {nullptr, 0, nullptr, 0}
    };
    int opt_index;
    int c;
    while ((c = getopt_long(argc, argv, "fp:", options, &opt_index)) != -1)
    {
        if (c == 'f') {
            flatten = 1;
        } else if (c == 'p') {
            padding = strtol(optarg, NULL, 0);
        }
    }
    argv += optind;
    argc -= optind;
    if (argc < 2) {
        usage();
        cerr << "Insufficient arguments: missing " << (argc == 0 ? "infile, " : "") << "outfile" << endl;
        return 1;
    }
    if (argc > 2) {
        usage();
        cerr << "Excess arguments: first unrecognized '" << argv[2] << "'" << endl;
        return 1;
    }
    char * infname = argv[0];
    char * outfname = argv[1];

    // Read the ELF file
    Elf elf(infname);
    // .rodata contains the data
    Elf32_Shdr & rodata_sec = elf.shdr[".rodata"];
    char * _rodata = (char *)elf.read(rodata_sec);
    if (_rodata == nullptr) {
        cerr << "ERROR: Missing required section .rodata" << endl;
        exit(1);
    }

    fstream ofile;
    ofile.open(outfname, ios_base::out | ios_base::binary);
    if (!ofile.good()) {
        cerr << "ERROR: Unable to open '" << outfname << "' for writing" << endl;
        exit(1);
    }

    if (!flatten) // then build the NARC chunks
    {
        // .data contains the size table
        Elf32_Shdr & data_sec = elf.shdr[".data"];
        uint32_t * _data = (uint32_t *)elf.read(data_sec);

        if (_data == nullptr) {
            cerr << "ERROR: Missing required section .data" << endl;
            exit(1);
        }

        uint16_t count;
        size_t narc_size;
        size_t size_aln;
        size_t size = *_data;

        if (data_sec.sh_size == sizeof(uint32_t))
        {
            size_aln = (size + 3) & ~3;
            count = rodata_sec.sh_size / size_aln;
        }
        else
        {
            size_aln = -1u;
            count = data_sec.sh_size / sizeof(uint32_t);
        }
        // NARC header: 16
        // FATB header: 12 + 8 * count
        // FNTB header: 8
        // GMIF header: 8 + data_sym.st_size
        narc_size = (
            sizeof(NarcHeader) +
            sizeof(FileAllocationTable) + sizeof(FileAllocationTableEntry) * count +
            sizeof(FileNameTable) + sizeof(FileNameTableEntry) +
            sizeof(FileImages) + (rodata_sec.sh_size + 3) & ~3
        );

        NarcHeader header{
            .Id = *(uint32_t *) "NARC",
            .ByteOrderMark = 0xFFFE,
            .Version = 0x100,
            .FileSize = static_cast<uint32_t>(narc_size),
            .ChunkSize = sizeof(NarcHeader),
            .ChunkCount = 3
        };
        FileAllocationTable fat{
            .Id = *(uint32_t *) "BTAF",
            .ChunkSize = static_cast<uint32_t>(sizeof(FileAllocationTable) + sizeof(FileAllocationTableEntry) * count),
            .FileCount = count,
            .Reserved = 0
        };
        auto fat_entries = new FileAllocationTableEntry[count];
        for (int i = 0; i < count; i++)
        {
            // Each element of the size array corresponds to
            // a NARC member
            if (data_sec.sh_size > sizeof(uint32_t)) {
                size = _data[i];
                size_aln = (size + 3) & ~3;
            }
            fat_entries[i].Start = i == 0 ? 0 : (fat_entries[i - 1].End + 3) & ~3;
            fat_entries[i].End = fat_entries[i].Start + _data[data_sec.sh_size == sizeof(uint32_t) ? 0 : i];
            // Padding
            for (int j = size; j < size_aln; j++)
            {
                _rodata[fat_entries[i].Start + j] = padding;
            }
        }
        // These NARCs have empty FNTs
        FileNameTable fnt{
            .Id = *(uint32_t *) "BTNF",
            .ChunkSize = static_cast<uint32_t>(sizeof(FileNameTable) + sizeof(FileNameTableEntry))
        };
        FileNameTableEntry fnt_entry{
            .Offset = 4,
            .FirstFileId = 0,
            .Utility = 1
        };
        FileImages fimg{
            .Id = *(uint32_t *) "GMIF",
            .ChunkSize = static_cast<uint32_t>(sizeof(FileImages) + (rodata_sec.sh_size + 3) & ~3)
        };

        ofile.write((char *) &header, sizeof(header));
        ofile.write((char *) &fat, sizeof(fat));
        ofile.write((char *) fat_entries, sizeof(FileAllocationTableEntry) * count);
        ofile.write((char *) &fnt, sizeof(fnt));
        ofile.write((char *) &fnt_entry, sizeof(fnt_entry));
        ofile.write((char *) &fimg, sizeof(fimg));
        // Cleanup
        delete[] fat_entries;
        delete[] _data;
    }
    // NARC members are contiguous in memory
    ofile.write(_rodata, rodata_sec.sh_size);
    if (!flatten && (rodata_sec.sh_size & 3)) {
        for (int i = rodata_sec.sh_size & 3; i < 4; i++)
            ofile.put(padding);
    }
    // Cleanup
    delete[] _rodata;
    ofile.close();
    return 0;
}
