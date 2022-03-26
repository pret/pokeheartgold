#include "ascii_util.h"

int Ascii_StrLen(const char *s) {
    int i=0;
    while(s[i] != 0){
        i++;
    }
    return i;
}

const char *Ascii_GetDelim(const char *s, char *d, int c) {
    int i;

    for (i = 0; i < 256; i++) {
        d[i] = s[i];
        if (s[i] == c || s[i] == 0) {
            d[i] = 0;
            if (c == '\r' && s[i + 1] == '\n') {
                return &s[i + 2];
            } else {
                return &s[i + 1];
            }
        }
    }

    return NULL;
}

int Ascii_StrToL(const char *s) {
    int length, i, pow10, num;
    length = Ascii_StrLen(s);

    pow10 = 1;
    num = 0;

    // Traverse from right to left
    for (i = length - 1; i >= 0; i--) {
        if (s[i] >= '0' && s[i] <= '9') {
            // Numeric digit
            num += pow10 * (s[i] - '0');
        } else {
            // If first character is a minus sign, it's negative
            if (i == 0) {
                if (s[i] == '-') {
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

void sub_02020B3C(NNSG3dResName *resName, const char *input) {
    // memset(resName, 0, NNS_G3D_RESNAME_SIZE);
    // strncpy(resName->name, input, NNS_G3D_RESNAME_SIZE);

    u8 length, i;

    for (i = 0; i < NNS_G3D_RESNAME_VALSIZE; i++) {
        resName->val[i] = 0;
    }
    length = Ascii_StrLen(input);
    for (i = 0; i < length; i++) {
        resName->name[i] = input[i];
    }
}

BOOL sub_02020B78(u16 c) {
    return c < CHAR_0;
}
