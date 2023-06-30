#include "global.h"
#include "ascii_util.h"

s32 Ascii_StrLen(const s8 *str) {
    s32 i = 0;
    while (str[i] != 0) {
        i++;
    }
    return i;
}

const s8 *Ascii_GetDelim(const s8 *src, s8 *dst, s32 c) {
    for (int i = 0; i < 256; i++) {
        dst[i] = src[i];
        if (src[i] == c || src[i] == 0) {
            dst[i] = 0;
            if (c == '\r' && src[i + 1] == '\n') {
                return &src[i + 2];
            }
            return &src[i + 1];
        }
    }

    return NULL;
}

s32 Ascii_StrToL(const s8 *str) {
    s32 length = Ascii_StrLen(str);
    s32 i;
    s32 pow10 = 1;
    s32 num = 0;

    // Traverse from right to left
    for (i = length - 1; i >= 0; i--) {
        if (str[i] >= '0' && str[i] <= '9') {
            // Numeric digit
            num += pow10 * (str[i] - '0');
        } else {
            // If first character is a minus sign, it's negative
            if (i == 0) {
                if (str[i] == '-') {
                    num *= -1;
                }
            } else {
                // Invalid character
                return -1;
            }
            // UB: If first character is invalid, still treated as valid string
        }
        pow10 *= 10;

        // UB: No check for integer overflow!
    }
    return num;
}

void sub_02020B3C(NNSG3dResName *resName, const s8 *input) {
    // memset(resName, 0, NNS_G3D_RESNAME_SIZE);
    // strncpy(resName->name, input, NNS_G3D_RESNAME_SIZE);

    for (u8 i = 0; i < NNS_G3D_RESNAME_VALSIZE; i++) {
        resName->val[i] = 0;
    }
    u8 length = Ascii_StrLen(input);
    for (u8 i = 0; i < length; i++) {
        resName->name[i] = input[i];
    }
}

BOOL sub_02020B78(u16 c) {
    return c < CHAR_0;
}
