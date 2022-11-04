#include <iostream>
#include "Encrypt.h"
#include "CryptoRc4.h"

Encryptor::Encryptor(std::string &buildname, u32 ovy_id) {
    std::filesystem::path table_path(buildname + "_table.sbin");
    std::ifstream table(table_path, std::ios::binary);
    if (!table.good()) {
        throw std::runtime_error("unable to open " + buildname + "_table.sbin for reading");
    }
    table.seekg(ovy_id * sizeof(FSOverlayInfo));
    table.read((char *)&info, sizeof(info));

    std::ifstream defs(buildname + "_defs.sbin", std::ios::binary);
    if (!defs.good()) {
        throw std::runtime_error("unable to open " + buildname + "_defs.sbin for reading");
    }
    defs.seekg(16);
    std::string filename;
    for (int i = 0; i < ovy_id; i++) {
        std::getline(defs, filename, '\0');
    }
    std::getline(defs, filename, '\0');

    std::filesystem::path ovyfname = table_path.replace_filename(filename);
    std::ifstream ovyfile(ovyfname, std::ios::binary | std::ios::ate);
    if (!ovyfile.good()) {
        throw std::runtime_error("unable to open " + ovyfname.string() + " for reading");
    }
    u32 size = ovyfile.tellg();
    data.resize(size);
    ovyfile.seekg(0);
    ovyfile.read((char *)data.data(), size);
}

u32 Encryptor::DoEncryptLvl2(u32 tableOffset) {
    u32 *pool = (u32 *)&data[tableOffset + 104];
    u32 param = pool[2];
    u32 start = pool[3];
    u32 size = pool[1];
    pool[1] += info.start + info.size + 0x1300;
    pool[2] += info.start + info.size + 0x1300;
    pool[3] += 0x1300;
    u32 keys[4] = {
        size ^ param,
        size ^ ((param << 8) | (param >> 24)),
        size ^ ((param << 16) | (param >> 16)),
        size ^ ((param << 24) | (param >> 8)),
    };
    CryptoRC4Context buffer((const u8 *)keys);
    buffer.Encrypt((u32 *) &data[start - info.start], (u32 *) &data[start + size - info.start]);
    return tableOffset + 120;
}

void Encryptor::EncryptLvl2() {
    u32 i = 0;
    while ((i = FindDecryLvl2(i)) != data.size()) {
        i = DoEncryptLvl2(i);
    }
}

u32 Encryptor::DoEncryptLvl1(u32 tableOffset) {
    FATEntry *table;
    FATEntry *table_start = (FATEntry *)(&data[tableOffset]);
    for (table = table_start; table->start != 0 && table->end != 0; table++) {
        u32 start_offs = table->start - info.start;
        u32 size = table->end & ~3;
        table->start += 0x1300;
        table->end += info.start + info.size + 0x1300;
        for (int i = start_offs; i < start_offs + size; i += 4) {
            u32 & word = (u32 &)data[i];
            switch (GetInsnType(word)) {
            case 1:
            case 2:
                word = (((word & ~0xFF000000) + 0x4C2) & ~0xFF000000) | ((word & 0xFF000000) ^ 0x01000000);
                break;
            case 3:
                word = (((word & ~0xFF000000) + 0x1300) & ~0xFF000000) | ((word & 0xFF000000) ^ 0x01000000);
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

void Encryptor::EncryptLvl1() {
    for (int i = info.sinit_start; i != info.sinit_end; i += 4) {
        if (*(u32 *)&data[i - info.start] != 0) {
            (void)DoEncryptLvl1(*(u32 *)&data[i - info.start] - info.start + 16);
        }
    }
}

void Encryptor::Encrypt() {
    EncryptLvl2();
    EncryptLvl1();
}

EncryptOptions::EncryptOptions(int argc, char ** argv) : Options(argc, argv) {
    if (argc < 5) {
        throw std::invalid_argument("missing required argument: " +
                                    ((std::string[]) {"", "mode", "buildname", "outfile", "ovy_id"})[argc]);
    }

    buildname = argv[2];
    outfile = std::ofstream(argv[3], std::ios::binary);
    if (!outfile.good()) {
        throw std::runtime_error(std::string("unable to open file '") + argv[3] + "' for reading");
    }

    // Translate module number
    ovy_id = std::strtoul(argv[4], nullptr, 10);
}

int EncryptOptions::main() {
    Encryptor encryptor(buildname, ovy_id);
    encryptor.Encrypt();
    encryptor.Write(outfile);
    return 0;
}
