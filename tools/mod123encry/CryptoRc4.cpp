#include "CryptoRc4.h"

u8 CryptoRC4Context::GetEncodedByte() {
    i = (++i) & 0xFF;
    u8 x = s[i];
    j = (j + x) & 0xFF;
    u8 y = s[j];
    s[j] = x;
    s[i] = y;
    return s[(x + y) & 0xFF];
}

void CryptoRC4Context::Decrypt(u32 *start, u32 *end) {
    // assert (!(size & 3));
    u8 buffer[256];
    for (int _i = 0; _i < 256; _i++) {
        buffer[_i] = _i ^ 1;
    }
    for (; start < end; start++) {
        u32 &word = *start;
        switch (GetInsnType(word)) {
        case 1:
        case 2:
            word = (((word & ~0xFF000000) - 0x1300) & ~0xFF000000) | ((word & 0xFF000000) ^ 0x01000000);
            break;
        case 3:
            word = (((word & ~0xFF000000) - 0x4C2) & ~0xFF000000) | ((word & 0xFF000000) ^ 0x01000000);
            break;
        default:
            u8 *bytes = (u8 *)&word;
            bytes[0] ^= GetEncodedByte();
            bytes[1] ^= GetEncodedByte();
            bytes[2] = buffer[bytes[2]];
            break;
        }
    }
}

void CryptoRC4Context::Encrypt(u32 *start, u32 *end) {
    // assert (!(size & 3));
    u8 buffer[256];
    for (int _i = 0; _i < 256; _i++) {
        buffer[_i] = _i ^ 1;
    }
    for (; start < end; start++) {
        u32 &word = *start;
        switch (GetInsnType(word)) {
        case 1:
        case 2:
            word = (((word & ~0xFF000000) + 0x4C2) & ~0xFF000000) | ((word & 0xFF000000) ^ 0x01000000);
            break;
        case 3:
            word = (((word & ~0xFF000000) + 0x1300) & ~0xFF000000) | ((word & 0xFF000000) ^ 0x01000000);
            break;
        default:
            u8 *bytes = (u8 *)&word;
            bytes[0] ^= GetEncodedByte();
            bytes[1] ^= GetEncodedByte();
            bytes[2] = buffer[bytes[2]];
            break;
        }
    }
}
