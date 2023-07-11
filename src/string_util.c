#include "global.h"
#include "string_util.h"
#include "constants/charcode.h"

u16 * CopyU16StringArray(u16 *dest, const u16 *src) {
    while (*src != EOS) {
        *dest = *src;
        src++;
        dest++;
    }
    *dest = EOS;
    return dest;
}

u16 * CopyU16StringArrayN(u16 *dest, const u16 *src, u32 n) {
    int i;
    for (i = 0; i < n; i++) {
        dest[i] = src[i];
    }
    dest += n;
    return dest;
}

int StringLength(const u16 *str) {
    int i;
    for (i = 0; str[i] != EOS; i++) {}
    return i;
}

BOOL StringNotEqual(const u16 *a, const u16 *b) {
    while (*a == *b) {
        if (*a == EOS) {
            return FALSE;
        }
        a++;
        b++;
    }
    return TRUE;
}

BOOL StringNotEqualN(const u16 *a, const u16 *b, u32 n) {
    while (*a == *b) {
        if (n == 0) {
            return FALSE;
        }
        if (*a == EOS && *b == EOS) {
            return FALSE;
        }
        a++;
        b++;
        n--;
    }
    return TRUE;
}

u16 *StringFill(u16 *str, u16 val, u32 n) {
    int i;
    for (i = 0; i < n; i++) {
        str[i] = val;
    }
    return str + i;
}

u16 *StringFillEOS(u16 *str, u32 n) {
    return StringFill(str, EOS, n);
}

u16 *ConvertUIntToDecimalString(u16 *dest, u32 num, PrintingMode strconvmode, u32 ndigits) {
    static const u16 _digit_strcode[] = {
        CHAR_JP_0,CHAR_JP_1,CHAR_JP_2,CHAR_JP_3,CHAR_JP_4,
        CHAR_JP_5,CHAR_JP_6,CHAR_JP_7,CHAR_JP_8,CHAR_JP_9,
        CHAR_JP_A,CHAR_JP_B,CHAR_JP_C,CHAR_JP_D,CHAR_JP_E,CHAR_JP_F

    };
    static const u32 _power_of_10[] = {
        1,
        10,
        100,
        1000,
        10000,
        100000,
        1000000,
        10000000,
        100000000,
        1000000000,
    };
    u32 denom;
    u16 digit;

    for (denom = _power_of_10[ndigits - 1]; denom != 0; denom /= 10) {
        digit = num / denom;
        num -= denom * digit;
        if (strconvmode == PRINTING_MODE_LEADING_ZEROS) {
            *dest = (digit >= 10) ? CHAR_JP_QUESTION_MARK : _digit_strcode[digit];
            dest++;
        } else if (digit != 0 || denom == 1) {
            strconvmode = PRINTING_MODE_LEADING_ZEROS;
            *dest = (digit >= 10) ? CHAR_JP_QUESTION_MARK : _digit_strcode[digit];
            dest++;
        } else if (strconvmode == PRINTING_MODE_RIGHT_ALIGN) {
            *dest = CHAR_JP_SPACE;
            dest++;
        }
    }
    *dest = EOS;
    return dest;
}
