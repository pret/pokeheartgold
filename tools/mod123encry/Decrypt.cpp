#include <cstring>
#include "Decrypt.h"
#include "CryptoRc4.h"

u32 Decryptor::FindDecryLvl2(u32 offset) {
    offset = (offset + 3) & ~3; // round up
    static const u8 pattern1[] = {
        0xf0, 0x00, 0x2d, 0xe9, 0x0f, 0x00, 0x2d, 0xe9, 0xf0, 0x00, 0xbd, 0xe8, 0x60, 0x10, 0x9f, 0xe5,
        0x50, 0x30, 0x8f, 0xe2, 0x00, 0xe0, 0x83, 0xe5, 0x4c, 0x20, 0x9f, 0xe5, 0x4c, 0x00, 0x9f, 0xe5,
    }; // size=32
    static const u8 pattern2[] = {
        0x00, 0xc0, 0xa0, 0xe1, 0xf0, 0x00, 0x2d, 0xe9, 0x0f, 0x00, 0xbd, 0xe8,
        0xf0, 0x00, 0xbd, 0xe8, 0x3c, 0xff, 0x2f, 0xe1, 0x10, 0x00, 0x2d, 0xe9, 0x00, 0x40, 0xa0, 0xe1,
        0x2c, 0x10, 0x9f, 0xe5, 0x20, 0x20, 0x9f, 0xe5, 0x20, 0x00, 0x9f, 0xe5,
    }; // size=40
    static const u8 pattern3[] = {
        0x18, 0x00, 0x8f, 0xe5, 0x04, 0x00, 0xa0, 0xe1, 0x10, 0x00, 0xbd, 0xe8, 0x04, 0xe0, 0x9f, 0xe5,
        0x00, 0xf0, 0x8f, 0xe5, 0x1e, 0xff, 0x2f, 0xe1
    }; // size=24

    for (int i = offset; i < data.size() - sizeof(pattern1) - sizeof(pattern2) - sizeof(pattern3) - 8; i += 4) {
        if (memcmp(&data[i], pattern1, sizeof(pattern1)) == 0
            && memcmp(&data[i + sizeof(pattern1) + 4], pattern2, sizeof(pattern2)) == 0
            && memcmp(&data[i + sizeof(pattern1) + sizeof(pattern2) + 8], pattern3, sizeof(pattern3)) == 0) {
            return i;
        }
    }
    return data.size();
}

u32 Decryptor::DoDecryptLvl2(u32 tableOffset) {
    u32 *pool = (u32 *)&data[tableOffset + 104];
    pool[1] -= info.start + info.size + 0x1300;
    pool[2] -= info.start + info.size + 0x1300;
    pool[3] -= 0x1300;
    u32 param = pool[2];
    u32 start = pool[3];
    u32 size = pool[1];
    u32 keys[4] = {
        size ^ param,
        size ^ ((param << 8) | (param >> 24)),
        size ^ ((param << 16) | (param >> 16)),
        size ^ ((param << 24) | (param >> 8)),
    };
    CryptoRC4Context buffer((const u8 *)keys);
    buffer.Decrypt((u32 *) &data[start - info.start], (u32 *) &data[start + size - info.start]);
    return tableOffset + 120;
}

void Decryptor::DecryptLvl2() {
    u32 i = 0;
    while ((i = FindDecryLvl2(i)) != data.size()) {
        i = DoDecryptLvl2(i);
    }
}

u32 Decryptor::DoDecryptLvl1(u32 tableOffset) {
    FATEntry *table;
    FATEntry *table_start = (FATEntry *)(&data[tableOffset]);
    for (table = table_start; table->start != 0 && table->end != 0; table++) {
        table->start -= 0x1300;
        table->end -= info.start + info.size + 0x1300;
        u32 start_offs = table->start - info.start;
        u32 size = table->end & ~3;
        for (int i = start_offs; i < start_offs + size; i += 4) {
            u32 & word = (u32 &)data[i];
            switch (GetInsnType(word)) {
            case 1:
            case 2:
                word = (((word & ~0xFF000000) - 0x1300) & ~0xFF000000) | ((word & 0xFF000000) ^ 0x01000000);
                break;
            case 3:
                word = (((word & ~0xFF000000) - 0x4C2) & ~0xFF000000) | ((word & 0xFF000000) ^ 0x01000000);
                break;
            default:
                u8 *ptr = (u8 *)&word;
                word = ((ptr[0] ^ 0x56) << 0) | ((ptr[1] ^ 0x65) << 8) | ((ptr[2] ^ 0x56) << 16) | ((ptr[3] ^ 0xF0) << 24);
                break;
            }
        }
    }
    return (u8 *)table - (u8 *)table_start + tableOffset + sizeof(*table);
}

void Decryptor::DecryptLvl1() {
    for (int i = info.sinit_start; i != info.sinit_end; i += 4) {
        if (*(u32 *)&data[i - info.start] != 0) {
            (void)DoDecryptLvl1(*(u32 *)&data[i - info.start] - info.start + 16);
        }
    }
}

void Decryptor::Decrypt() {
    DecryptLvl1();
    DecryptLvl2();
}

void Decryptor::Write(std::ofstream &outfile) {
    outfile.write((char *)data.data(), data.size());
}

DecryptOptions::DecryptOptions(int argc, char ** argv) : Options(argc, argv) {
    if (argc < 5) {
        throw std::invalid_argument("missing required argument: " +
                                    ((std::string[]) {"", "mode", "baserom", "outfile", "ovy_id"})[argc]);
    }
    baserom = new NtrRom(argv[2], std::ios::binary);
    outfile = std::ofstream(argv[3], std::ios::binary);
    if (!outfile.good()) {
        throw std::runtime_error(std::string("unable to open file '") + argv[3] + "' for reading");
    }

    // Translate module number
    ovy_id = std::strtoul(argv[4], nullptr, 10);
}

DecryptOptions::~DecryptOptions() {
    delete baserom;
}

int DecryptOptions::main() {
    Decryptor decryptor(baserom, ovy_id);
    decryptor.Decrypt();
    decryptor.Write(outfile);
    return 0;
}
