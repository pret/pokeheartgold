#ifndef GUARD_CRYPTORC4_H
#define GUARD_CRYPTORC4_H

#include "ntrtypes.h"

static inline int GetInsnType(u32 value) {
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

class CryptoRC4Context {
    u32 i;
    u32 j;
    u8 s[256];

    u8 GetEncodedByte();

public:
    CryptoRC4Context() {
        i = 0;
        j = 0;
        for (int _i = 0; _i < 256; _i++) {
            s[_i] = _i;
        }
    }
    CryptoRC4Context(const u8 *keys) : CryptoRC4Context() {
        int key_i = 0;
        int s_i = 0;
        for (int s_j = 255; s_j >= 0; s_j--) {
            u8 s_k = s[s_j];
            s_i = (s_i + keys[key_i++] + s_k) & 0xFF;
            u8 s_l = s[s_i];
            if (key_i >= 16)
                key_i = 0;
            s[s_i] = s_k;
            s[s_j] = s_l;
        }
    }
    void Decrypt(u32 *start, u32 *end);
    void Encrypt(u32 *start, u32 *end);
};


#endif //GUARD_CRYPTORC4_H
