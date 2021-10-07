#ifndef GUARD_DECRYPT_H
#define GUARD_DECRYPT_H

#include "NtrRom.h"

struct DecryptPart2 {
    u32 unk0;
    u32 unk4;
    u8 unk8[256];
    const u8 *keys = nullptr;

    DecryptPart2() {
        unk0 = 0;
        unk4 = 0;
        for (int i = 0; i < 256; i++) {
            unk8[i] = i;
        }
    }
    DecryptPart2(const u8 *_keys) : DecryptPart2() {
        keys = _keys;
        int r6 = 0;
        int r7 = 0;
        for (int i = 255; i >= 0; i--) {
            u8 r4 = unk8[i];
            r7 = (r7 + keys[r6++] + r4) & 0xFF;
            u8 ip = unk8[r7];
            if (r6 >= 16)
                r6 = 0;
            unk8[r7] = r4;
            unk8[i] = ip;
        }
    }
    u8 GetEncodedByte();
    void DoDecrypt(u32 *start, u32 *end);
};

class Decryptor : public NtrOverlay {
    u32 FindDecryLvl2(u32 offset);
    void DecryptLvl2Part1(u32 start_addr, u32 end_addr, u8 *keys);
    u32 DoDecryptLvl1(u32 tableOffset);
    u32 DoDecryptLvl2(u32 tableOffset);
    void DecryptLvl1();
    void DecryptLvl2();
public:
    Decryptor(FSOverlayInfo &_info, std::vector<u8> &_data) : NtrOverlay(_info, _data) {}
    void Decrypt();
    void Write(std::ofstream &outfile);
};

struct DecryptOptions {
    NtrRom *baserom;
    std::ofstream outfile;
    std::uint32_t ovy_id;

    int main();
};

int decrypt_main(DecryptOptions &options);

#endif //GUARD_DECRYPT_H
