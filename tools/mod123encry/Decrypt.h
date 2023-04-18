#ifndef GUARD_DECRYPT_H
#define GUARD_DECRYPT_H

#include <cstdint>
#include "NtrRom.h"
#include "Options.h"

struct DecryptPart2 {
    u32 i;
    u32 j;
    u8 s[256];
    const u8 *keys = nullptr;

    DecryptPart2() {
        i = 0;
        j = 0;
        for (int _i = 0; _i < 256; _i++) {
            s[_i] = _i;
        }
    }
    DecryptPart2(const u8 *_keys) : DecryptPart2() {
        keys = _keys;
        int r6 = 0;
        int r7 = 0;
        for (int _i = 255; _i >= 0; _i--) {
            u8 r4 = s[_i];
            r7 = (r7 + keys[r6++] + r4) & 0xFF;
            u8 ip = s[r7];
            if (r6 >= 16)
                r6 = 0;
            s[r7] = r4;
            s[_i] = ip;
        }
    }
    u8 GetEncodedByte();
    void DoDecrypt(u32 *start, u32 *end);
};

class Decryptor : public NtrOverlay {
protected:
    u32 FindDecryLvl2(u32 offset);
    u32 DoDecryptLvl1(u32 tableOffset);
    u32 DoDecryptLvl2(u32 tableOffset);
    void DecryptLvl1();
    void DecryptLvl2();
public:
    Decryptor() = default;
    Decryptor(FSOverlayInfo &_info, std::vector<u8> &_data) : NtrOverlay(_info, _data) {}
    Decryptor(NtrOverlay &_overlay) : NtrOverlay(_overlay) {}
    Decryptor(NtrRom *baserom, u32 ovy_id) : NtrOverlay(baserom, ovy_id) {}
    void Decrypt();
    void Write(std::ofstream &outfile);
};

struct DecryptOptions: public Options {
    NtrRom *baserom;
    std::ofstream outfile;
    std::uint32_t ovy_id;

    DecryptOptions(int argc, char ** argv);
    ~DecryptOptions();
    int main();
};

int decrypt_main(DecryptOptions &options);

#endif //GUARD_DECRYPT_H
