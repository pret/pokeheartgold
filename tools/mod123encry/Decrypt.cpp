#include "Decrypt.h"

static u32 FindDecryLvl2(std::vector<u8>& data, u32 offset) {
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

static u32 DoDecryptLvl2(std::vector<u8>& data, u32 tableOffset, FSOverlayInfo &ovyi) {
    return tableOffset + 120;
}

static void DecryptLvl2(std::vector<u8>& ovydat, FSOverlayInfo& ovyi) {
    u32 i = 0;
    while ((i = FindDecryLvl2(ovydat, i)) != ovydat.size()) {
        i = DoDecryptLvl2(ovydat, i, ovyi);
    }
}

static int GetInsnType(u32 value) {
    u8 highByte = (value >> 24) & 0xFF;
    if ((highByte & 0xE) == 0xA) {
        if ((highByte & 0xF0) == 0xF0)
            return 1;
        else if (highByte & 1)
            return 2;
        else
            return 3;
    }
    return 0;
}

static u32 DoDecryptLvl1(std::vector<u8>& data, u32 tableOffset, FSOverlayInfo &ovyi) {
    FATEntry *table;
    FATEntry *table_start = (FATEntry *)(&data[tableOffset]);
    for (table = table_start; table->start != 0 && table->end != 0; table++) {
        u32 start_offs = table->start - ovyi.start - 0x1300;
        u32 size = (table->end - (ovyi.start + ovyi.size) - 0x1300) & ~3;
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

static void DecryptLvl1(std::vector<u8> &ovydat, FSOverlayInfo &ovyi) {
    for (int i = ovyi.sinit_start; i != ovyi.sinit_end; i += 4) {
        if (*(u32 *)&ovydat[i - ovyi.start] != 0) {
            (void)DoDecryptLvl1(ovydat, *(u32 *)&ovydat[i - ovyi.start] - ovyi.start + 16, ovyi);
        }
    }
}

int DecryptOptions::main() {
    std::vector<u8> ovydat = baserom->getOverlay(0, ovy_id);
    FSOverlayInfo &ovyi = baserom->getOverlayInfo(0, ovy_id);
    DecryptLvl1(ovydat, ovyi);
    DecryptLvl2(ovydat, ovyi);
    outfile.write((char *)ovydat.data(), ovydat.size());
    return 0;
}
