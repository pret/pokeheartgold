#include "string_gf.h"

#include "global.h"

#include "font.h"
#include "heap.h"
#include "math_util.h"

#define STRING_HEADER_SIZE  (10)
#define STRING_MAGIC_NUMBER (0xB6F8D2EC)
#define STRING_INVAL        (STRING_MAGIC_NUMBER + 1)

static inline void String_Assert(const String *string) {
    GF_ASSERT(string != NULL);
    GF_ASSERT(string->integrity == STRING_MAGIC_NUMBER);
}

String *String_New(u32 maxSize, enum HeapID heapID) {
    String *string = Heap_Alloc(heapID, STRING_HEADER_SIZE + (maxSize * sizeof(charcode_t)));
    if (string != NULL) {
        string->integrity = STRING_MAGIC_NUMBER;
        string->maxSize = maxSize;
        string->size = 0;
        string->data[0] = EOS;
    }
    return string;
}

void String_Free(String *string) {
    String_Assert(string);
    string->integrity = STRING_INVAL;
    Heap_Free(string);
}

void String_Clear(String *string) {
    String_Assert(string);
    string->size = 0;
    string->data[0] = EOS;
}

void String_Copy(String *dest, String *src) {
    String_Assert(dest);
    String_Assert(src);
    if (dest->maxSize > src->size) {
        memcpy(dest->data, src->data, (src->size + 1) * sizeof(charcode_t));
        dest->size = src->size;
        return;
    }
    GF_ASSERT(FALSE);
}

String *String_Clone(String *src, enum HeapID heapID) {
    String_Assert(src);
    String *ret = String_New(src->size + 1, heapID);
    if (ret != NULL) {
        String_Copy(ret, src);
    }
    return ret;
}

void String_FormatInt(String *dest, int num, u32 maxDigits, enum PaddingMode paddingMode, enum CharsetMode charsetMode) {
    static const u32 sPowersOfTen[] = {
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

    static const charcode_t sDigits_JP[] = {
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

    static const charcode_t sDigits_EN[] = {
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

    String_Assert(dest);

    BOOL isNegative = (num < 0);

    if (dest->maxSize > maxDigits + isNegative) {
        const charcode_t *digitSet = (charsetMode == CHARSET_MODE_JP) ? sDigits_JP : sDigits_EN;

        String_Clear(dest);

        if (isNegative) {
            num *= -1;
            dest->data[dest->size++] = (charsetMode == CHARSET_MODE_JP) ? CHAR_JP_HYPHEN : CHAR_HYPHEN;
        }

        u32 dividend = sPowersOfTen[maxDigits - 1];
        while (dividend != 0) {
            u16 digit = num / dividend;
            num -= dividend * digit;

            if (paddingMode == PADDING_MODE_ZEROES) {
                dest->data[dest->size++] = (digit < 10) ? digitSet[digit] : CHAR_JP_QUESTION_MARK;
                // If we hit a non-zero digit, flip the padding mode off
            } else if (digit != 0 || dividend == 1) {
                paddingMode = PADDING_MODE_ZEROES;
                dest->data[dest->size++] = (digit < 10) ? digitSet[digit] : CHAR_JP_QUESTION_MARK;
            } else if (paddingMode == PADDING_MODE_SPACES) {
                dest->data[dest->size++] = (charsetMode == CHARSET_MODE_JP) ? CHAR_JP_SPACE : CHAR_NARROW_SPACE;
            }
            dividend /= 10;
        }
        dest->data[dest->size] = EOS;
        return;
    }
    GF_ASSERT(FALSE);
}

void String_FormatU64(String *dest, u64 num, u32 maxDigits, enum PaddingMode paddingMode, enum CharsetMode charsetMode) {
    static const u64 sPowersOfTen[] = {
        1ll,
        10ll,
        100ll,
        1000ll,
        10000ll,
        100000ll,
        1000000ll,
        10000000ll,
        100000000ll,
        1000000000ll,
        10000000000ll,
        100000000000ll,
        1000000000000ll,
        10000000000000ll,
        100000000000000ll,
        1000000000000000ll,
        10000000000000000ll,
        100000000000000000ll,
        1000000000000000000ll,
        10000000000000000000ll,
    };

    static const charcode_t sDigits_JP[] = {
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

    static const charcode_t sDigits_EN[] = {
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

    String_Assert(dest);

    BOOL isNegative = (num < 0);

    if (dest->maxSize > maxDigits + isNegative) {
        const charcode_t *digitSet = (charsetMode == CHARSET_MODE_JP) ? sDigits_JP : sDigits_EN;

        String_Clear(dest);

        if (isNegative) {
            num *= -1;
            dest->data[dest->size++] = (charsetMode == CHARSET_MODE_JP) ? CHAR_JP_HYPHEN : CHAR_HYPHEN;
        }

        u64 dividend = sPowersOfTen[maxDigits - 1];
        while (dividend != 0ull) {
            u64 digit = num / dividend;
            num -= dividend * digit;

            if (paddingMode == PADDING_MODE_ZEROES) {
                dest->data[dest->size++] = (digit < 10ull) ? digitSet[digit] : CHAR_JP_QUESTION_MARK;
            } else if (digit != 0 || dividend == 1) {
                paddingMode = PADDING_MODE_ZEROES;
                dest->data[dest->size++] = (digit < 10ull) ? digitSet[digit] : CHAR_JP_QUESTION_MARK;
            } else if (paddingMode == PADDING_MODE_SPACES) {
                dest->data[dest->size++] = (charsetMode == CHARSET_MODE_JP) ? CHAR_JP_SPACE : CHAR_SPACE;
            }
            dividend /= 10ull;
        }
        dest->data[dest->size] = EOS;
        return;
    }
    GF_ASSERT(FALSE);
}

s64 String_AtoI(String *string, BOOL *success) {
    s64 ret = 0ll;
    s64 pow = 1ll;
    if (string->size > 18) {
        return 0;
    }

    for (int i = (string->size - 1); i >= 0; i--) {
        s64 digit = string->data[i] - CHAR_JP_0;
        if (digit >= 10ull) {
            digit = string->data[i] - CHAR_0;
            if (digit >= 10ull) {
                *success = FALSE;
                return ret;
            }
        }
        digit *= pow;
        ret += digit;
        pow *= 10;
    }
    *success = TRUE;
    return ret;
}

BOOL String_Compare(String *str1, String *str2) {
    String_Assert(str1);
    String_Assert(str2);

    for (int i = 0; str1->data[i] == str2->data[i]; i++) {
        if (str1->data[i] == EOS) {
            return FALSE;
        }
    }
    return TRUE;
}

u16 String_GetLength(String *string) {
    String_Assert(string);
    return string->size;
}

int String_CountLines(const String *string) {
    String_Assert(string);

    int i, count;
    for (i = 0, count = 1; i < string->size; i++) {
        if (string->data[i] == CHAR_LF) {
            count++;
        }
    }
    return count;
}

void String_CopyLine(String *dest, const String *src, u32 lineNum) {
    String_Assert(src);
    String_Assert(dest);

    int i = 0;
    if (lineNum != 0) {
        for (i = 0; i < src->size; i++) {
            if (src->data[i] == CHAR_LF && --lineNum == 0) {
                i++;
                break;
            }
        }
    }
    String_Clear(dest);
    for (; i < src->size; i++) {
        if (src->data[i] == CHAR_LF) {
            break;
        }
        String_AppendChar(dest, src->data[i]);
    }
}

void String_AddRadioStatic(String *string, u8 level) {
    u32 width3dots = FontID_GetGlyphWidth(0, CHAR_ELLIPSIS);
    u32 width1dot = FontID_GetGlyphWidth(0, CHAR_ONE_DOT);
    u32 width2dots = FontID_GetGlyphWidth(0, CHAR_TWO_DOTS);
    u32 curWidth;

    String_Assert(string);
    int strLen = String_GetLength(string); // the result is never used
    for (int i = 0; i < string->size - 1; i++) {
        if (string->data[i] != CHAR_SPACE && ((MTRandom() / 256u) % 101) < level) {
            curWidth = FontID_GetGlyphWidth(0, string->data[i]);
            if (curWidth >= width3dots) {
                string->data[i] = CHAR_ELLIPSIS;
            } else if (curWidth >= width2dots) {
                string->data[i] = CHAR_TWO_DOTS;
            } else if (curWidth >= width1dot) {
                string->data[i] = CHAR_ONE_DOT;
            }
        }
    }
}

void String_CopyFromChars(String *dest, const charcode_t *src) {
    String_Assert(dest);

    for (dest->size = 0; *src != EOS;) {
        if (dest->size >= dest->maxSize - 1) {
            GF_ASSERT(FALSE);
            break;
        }
        dest->data[dest->size++] = *src++;
    }
    dest->data[dest->size] = EOS;
}

void String_CopyNumChars(String *dest, const charcode_t *src, u32 num) {
    String_Assert(dest);

    if (num <= dest->maxSize) {
        memcpy(dest->data, src, num * sizeof(charcode_t));

        int i;
        for (i = 0; i < num; i++) {
            if (dest->data[i] == EOS) {
                break;
            }
        }
        dest->size = i;
        if (i == num) {
            dest->data[num - 1] = EOS;
        }
        return;
    }
    GF_ASSERT(FALSE);
}

void String_CopyToChars(String *src, charcode_t *dest, u32 destSize) {
    String_Assert(src);

    if (src->size + 1 <= destSize) {
        memcpy(dest, src->data, (src->size + 1) * sizeof(charcode_t));
        return;
    }
    GF_ASSERT(FALSE);
}

charcode_t *String_GetChars(String *string) {
    String_Assert(string);

    return string->data;
}

void String_Concat(String *dest, String *src) {
    String_Assert(dest);
    String_Assert(src);

    if (dest->size + src->size + 1 <= dest->maxSize) {
        memcpy(dest->data + dest->size, src->data, (src->size + 1) * sizeof(charcode_t));
        dest->size += src->size;
        return;
    }
    GF_ASSERT(FALSE);
}

void String_AppendChar(String *string, charcode_t c) {
    String_Assert(string);

    if (string->size + 1 < string->maxSize) {
        string->data[string->size++] = c;
        string->data[string->size] = EOS;
        return;
    }
    GF_ASSERT(FALSE);
}

BOOL String_IsTrainerName(String *string) {
    return string->size > 0 && string->data[0] == TRNAMECODE;
}

void String_ConcatTrainerName(String *dest, String *src) {
    // Trainer names are expressed using a format with a designating leader
    // code followed by compression algorithm that trims individual characters
    // from 16 bits to 10 bits.
    //
    // TODO: This process could do with some more documentation, i.e. why this
    // is done.
    if (String_IsTrainerName(src)) {
        charcode_t *dstChar = &dest->data[dest->size];
        charcode_t *srcChar = &src->data[1];
        s32 shift = 0;
        u32 charsAdded = 0;
        charcode_t curChar = 0;

        while (TRUE) {
            curChar = (*srcChar >> shift) & TRNAME_MASK;
            shift += 9;
            if (shift >= 15) {
                srcChar++;
                shift -= 15;
                if (shift != 0) {
                    curChar |= (*srcChar << (9 - shift)) & TRNAME_MASK;
                }
            }

            if (curChar == EOS_TRNAME) {
                break;
            }
            *dstChar++ = curChar;
            charsAdded++;
        }
        *dstChar = EOS;
        dest->size += charsAdded;
    } else {
        String_Concat(dest, src);
    }
}

void String_UpperChar(String *string, int index) {
    String_Assert(string);

    if (string->size > index) {
        if (string->data[index] >= CHAR_a && string->data[index] <= CHAR_z) {
            string->data[index] += CHAR_A - CHAR_a;
        }
    }
}
