#include "global.h"
#include "heap.h"
#include "pm_string.h"
#include "font.h"
#include "math_util.h"

#define STRING_MAGIC    (0xB6F8D2EC)
#define STRING_INVAL    (0xB6F8D2ED)

#define ASSERT_STRING(str) do { GF_ASSERT(str != NULL); GF_ASSERT((str)->magic == STRING_MAGIC); } while (0)

String *String_New(u32 maxsize, HeapID heapId) {
    String *ret = (String*)AllocFromHeap(heapId, 2 * maxsize + sizeof(String) + sizeof(u16));
    if (ret != NULL) {
        ret->magic = STRING_MAGIC;
        ret->maxsize = maxsize;
        ret->size = 0;
        ret->data[0] = EOS;
    }
    return ret;
}

void String_Delete(String *string) {
    ASSERT_STRING(string);
    string->magic = STRING_INVAL;
    FreeToHeap(string);
}

void String_SetEmpty(String *string) {
    ASSERT_STRING(string);
    string->size = 0;
    string->data[0] = EOS;
}

void String_Copy(String *dest, const String *src) {
    ASSERT_STRING(dest);
    ASSERT_STRING(src);
    if (dest->maxsize > src->size) {
        memcpy(dest->data, src->data, (src->size + 1) * 2);
        dest->size = src->size;
        return;
    }
    GF_ASSERT(0);
}

String *String_Dup(const String *src, HeapID heapId) {
    String *ret;
    ASSERT_STRING(src);
    ret = String_New(src->size + 1, heapId);
    if (ret != NULL) {
        String_Copy(ret, src);
    }
    return ret;
}

void String16_FormatInteger(String * str, int num, u32 ndigits, PrintingMode strConvMode, BOOL whichCharset) {
    static const u32 sPowersOfTen[10] = {
        1ul,
        10ul,
        100ul,
        1000ul,
        10000ul,
        100000ul,
        1000000ul,
        10000000ul,
        100000000ul,
        1000000000ul,
    };

    static const u16 sCharset_JP[10] = {
        CHAR_JP_0,
        CHAR_JP_1,
        CHAR_JP_2,
        CHAR_JP_3,
        CHAR_JP_4,
        CHAR_JP_5,
        CHAR_JP_6,
        CHAR_JP_7,
        CHAR_JP_8,
        CHAR_JP_9,
    };

    static const u16 sCharset_EN[10] = {
        CHAR_0,
        CHAR_1,
        CHAR_2,
        CHAR_3,
        CHAR_4,
        CHAR_5,
        CHAR_6,
        CHAR_7,
        CHAR_8,
        CHAR_9,
    };

    ASSERT_STRING(str);

    const u16 * charbase;
    BOOL isNegative = (num < 0);

    if (str->maxsize > ndigits + isNegative) {
        charbase = (whichCharset == 0) ? sCharset_JP : sCharset_EN;
        String_SetEmpty(str);
        if (isNegative) {
            num *= -1;
            u16 hyphen = (u16)((whichCharset == 0) ? CHAR_JP_HYPHEN : CHAR_HYPHEN);
            str->data[str->size++] = hyphen;
        }
        u32 dividend = sPowersOfTen[ndigits - 1];
        while (dividend != 0) {
            u16 digit = (u16)(num / dividend);
            num -= dividend * digit;
            if (strConvMode == PRINTING_MODE_LEADING_ZEROS) {
                u16 value = (u16)((digit < 10) ? charbase[digit] : CHAR_JP_QUESTION_MARK);
                str->data[str->size++] = value;
            }
            else if (digit != 0 || dividend == 1) {
                strConvMode = PRINTING_MODE_LEADING_ZEROS;
                u16 value = (u16)((digit < 10) ? charbase[digit] : CHAR_JP_QUESTION_MARK);
                str->data[str->size++] = value;
            }
            else if (strConvMode == PRINTING_MODE_RIGHT_ALIGN) {
                u16 value = (u16)((whichCharset == 0) ? CHAR_JP_SPACE : CHAR_NARROW_SPACE);
                str->data[str->size++] = value;
            }
            dividend /= 10;
        }
        str->data[str->size] = EOS;
        return;
    }
    GF_ASSERT(0);
}

void String16_FormatUnsignedLongLong(String * str, u64 num, u32 ndigits, PrintingMode strConvMode, BOOL whichCharset) {
    static const u64 sPowersOfTen[20] = {
        1ull,
        10ull,
        100ull,
        1000ull,
        10000ull,
        100000ull,
        1000000ull,
        10000000ull,
        100000000ull,
        1000000000ull,
        10000000000ull,
        100000000000ull,
        1000000000000ull,
        10000000000000ull,
        100000000000000ull,
        1000000000000000ull,
        10000000000000000ull,
        100000000000000000ull,
        1000000000000000000ull,
        10000000000000000000ull,
    };

    static const u16 sCharset_JP[10] = {
        CHAR_JP_0,
        CHAR_JP_1,
        CHAR_JP_2,
        CHAR_JP_3,
        CHAR_JP_4,
        CHAR_JP_5,
        CHAR_JP_6,
        CHAR_JP_7,
        CHAR_JP_8,
        CHAR_JP_9,
    };

    static const u16 sCharset_EN[10] = {
        CHAR_0,
        CHAR_1,
        CHAR_2,
        CHAR_3,
        CHAR_4,
        CHAR_5,
        CHAR_6,
        CHAR_7,
        CHAR_8,
        CHAR_9,
    };

    ASSERT_STRING(str);

    const u16 * charbase;
    BOOL isNegative = (num < 0);

    if (str->maxsize > ndigits + isNegative) {
        charbase = (whichCharset == 0) ? sCharset_JP : sCharset_EN;
        String_SetEmpty(str);
        if (isNegative) {
            num *= -1;
            u16 hyphen = (u16)((whichCharset == 0) ? CHAR_JP_HYPHEN : CHAR_HYPHEN);
            str->data[str->size++] = hyphen;
        }
        u64 dividend = sPowersOfTen[ndigits - 1];
        while (dividend != 0ull) {
            u64 digit = num / dividend;
            num -= dividend * digit;
            if (strConvMode == PRINTING_MODE_LEADING_ZEROS) {
                u16 value = (u16)((digit < 10ull) ? charbase[digit] : CHAR_JP_QUESTION_MARK);
                str->data[str->size++] = value;
            }
            else if (digit != 0 || dividend == 1) {
                strConvMode = PRINTING_MODE_LEADING_ZEROS;
                u16 value = (u16)((digit < 10ull) ? charbase[digit] : CHAR_JP_QUESTION_MARK);
                str->data[str->size++] = value;
            }
            else if (strConvMode == PRINTING_MODE_RIGHT_ALIGN) {
                u16 value = (u16)((whichCharset == 0) ? CHAR_JP_SPACE : CHAR_SPACE);
                str->data[str->size++] = value;
            }
            dividend /= 10ull;
        }
        str->data[str->size] = EOS;
        return;
    }
    GF_ASSERT(0);
}

s64 String_atoi(String * str, BOOL * flag) {
    s64 ret = 0ll;
    s64 pow10 = 1ll;
    if (str->size > 18) {
        return 0;
    }
    int ndigits = str->size - 1;
    while (ndigits >= 0) {
        s64 digit = str->data[ndigits] - CHAR_JP_0;
        if (digit >= 10ull) {
            digit = str->data[ndigits] - CHAR_0;
            if (digit >= 10ull) {
                *flag = FALSE;
                return ret;
            }
        }
        digit *= pow10;
        ret += digit;
        pow10 *= 10ll;
        ndigits--;
    }
    *flag = TRUE;
    return ret;
}

BOOL String_Compare(String * str1, String * str2) {
    ASSERT_STRING(str1);
    ASSERT_STRING(str2);

    for (int i = 0; str1->data[i] == str2->data[i]; i++) {
        if (str1->data[i] == EOS) {
            return FALSE;
        }
    }
    return TRUE;
}

u16 String_GetLength(String * str) {
    ASSERT_STRING(str);
    return str->size;
}

int String_CountLines(volatile String * str) {
    ASSERT_STRING(str);

    int i, nline;
    for (i = 0, nline = 1; i < str->size; i++) {
        if (str->data[i] == CHAR_LF)
            nline++;
    }
    return nline;
}

void String_GetLineN(String * dest, volatile String * src, u32 n) {
    ASSERT_STRING(src);
    ASSERT_STRING(dest);

    int i = 0;
    if (n != 0) {
        for (i = 0; i < src->size; i++) {
            if (src->data[i] == CHAR_LF && --n == 0) {
                i++;
                break;
            }
        }
    }
    String_SetEmpty(dest);
    for (; i < src->size; i++) {
        u16 c = src->data[i];
        if (c == CHAR_LF) {
            break;
        }
        String_AddChar(dest, c);
    }
}

void String_RadioAddStatic(String *string, u8 level) {
    u32 width_3dots = FontID_GetGlyphWidth(0, CHAR_ELLIPSIS);
    u32 width_1dot = FontID_GetGlyphWidth(0, CHAR_ONE_DOT);
    u32 width_2dots = FontID_GetGlyphWidth(0, CHAR_TWO_DOTS);
    u32 cur_width;
    int str_len;
    int i;

    ASSERT_STRING(string);
    str_len = String_GetLength(string); // the result is never used
    for (i = 0; i < string->size - 1; i++) {
        if (string->data[i] != CHAR_SPACE && ((MTRandom() / 256u) % 101) < level) {
            cur_width = FontID_GetGlyphWidth(0, string->data[i]);
            if (cur_width >= width_3dots) {
                string->data[i] = CHAR_ELLIPSIS;
            } else if (cur_width >= width_2dots) {
                string->data[i] = CHAR_TWO_DOTS;
            } else if (cur_width >= width_1dot) {
                string->data[i] = CHAR_ONE_DOT;
            }
        }
    }
}

void CopyU16ArrayToString(String * str, const u16 * buf) {
    ASSERT_STRING(str);

    for (str->size = 0; *buf != EOS;) {
        if (str->size >= str->maxsize - 1) {
            GF_ASSERT(0);
            break;
        }
        str->data[str->size++] = *buf++;
    }
    str->data[str->size] = EOS;
}

void CopyU16ArrayToStringN(String * str, const u16 * buf, u32 length) {
    ASSERT_STRING(str);

    if (length <= str->maxsize) {
        int i;
        memcpy(str->data, buf, length * 2);
        for (i = 0; i < length; i++) {
            if (str->data[i] == EOS)
                break;
        }
        str->size = (u16)i;
        if (i == length) {
            str->data[length - 1] = EOS;
        }
        return;
    }
    GF_ASSERT(0);
}

void CopyStringToU16Array(const String * str, u16 * buf, u32 length) {
    ASSERT_STRING(str);

    if (str->size + 1 <= length) {
        memcpy(buf, str->data, (u32)((str->size + 1) * 2));
        return;
    }
    GF_ASSERT(0);
}

u16 * String_cstr(String * str) {
    ASSERT_STRING(str);

    return str->data;
}

void String_Cat(String * dest, String * src) {
    ASSERT_STRING(dest);
    ASSERT_STRING(src);

    if (dest->size + src->size + 1 <= dest->maxsize) {
        memcpy(dest->data + dest->size, src->data, (u32)(2 * (src->size + 1)));
        dest->size += src->size;
        return;
    }
    GF_ASSERT(0);
}

void String_AddChar(String * str, u16 val) {
    ASSERT_STRING(str);

    if (str->size + 1 < str->maxsize) {
        str->data[str->size++] = val;
        str->data[str->size] = EOS;
        return;
    }
    GF_ASSERT(0);
}

BOOL String_IsTrainerName(String * string) {
    return string->size != 0 && string->data[0] == TRNAMECODE;
}

void String_Cat_HandleTrainerName(String * dest, String * src) {
    if (String_IsTrainerName(src)) {
        u16 * dest_p = &dest->data[dest->size];
        u16 * src_p = &src->data[1];
        s32 bit = 0;
        u32 outsize = 0;
        u16 cur_char = 0;

        while (1) {
            cur_char = (u16)((*src_p >> bit) & TRNAME_MASK);
            bit += 9;
            if (bit >= 15) {
                src_p++;
                bit -= 15;
                if (bit != 0) {
                    cur_char |= (*src_p << (9 - bit)) & TRNAME_MASK;
                }
            }
            if (cur_char == EOS_TRNAME) {
                break;
            }
            *dest_p++ = cur_char;
            outsize++;
        }
        *dest_p = EOS;
        dest->size += outsize;
    }
    else {
        String_Cat(dest, src);
    }
}

void String_UpperCharN(String * str, int n) {
    ASSERT_STRING(str);

    if (str->size > n) {
        if (str->data[n] >= CHAR_a && str->data[n] <= CHAR_z) {
            str->data[n] += CHAR_A - CHAR_a;
        }
    }
}
