#ifndef POKEHEARTGOLD_STRING_GF_H
#define POKEHEARTGOLD_STRING_GF_H

#include "constants/charcode.h"
#include "constants/heap.h"

#include "string_control_code.h"
#include "string_util.h"

/**
 * Managed string buffer.
 */
typedef struct String {
    u16 maxSize;
    u16 size;
    u32 integrity;
    charcode_t data[0];
} String;

enum CharsetMode {
    CHARSET_MODE_JP,
    CHARSET_MODE_EN,
};

/**
 * @brief Init routine. Allocates memory for a new String, initializes it
 * with an integrity-check value, and exposes its address.
 *
 * @param maxSize The maximum size of the new String to allocate from the heap.
 * @param heapID ID of the heap to own the new String.
 * @return Address to the new String.
 */
String *String_New(u32 maxSize, enum HeapID heapID);

/**
 * @brief Free routine. Destroys an existing String and returns its memory
 * to the owning heap.
 *
 * @param string Address to the String to be freed.
 */
void String_Free(String *string);

/**
 * @brief Clears out a string of any existing character data. The first value
 * in the underlying data buffer is set to `CHAR_EOS`, and `string->size` is
 * set to 0.
 *
 * @param string Address to the String to be cleared.
 */
void String_Clear(String *string);

/**
 * @brief Copies the contents of the data buffer in `src` to the data buffer
 * in `dest`. Fails if the contents of `src` will not fit into `dest`'s
 * allocated memory.
 *
 * @param dest Destination buffer. `dest->size` and `dest->data` will be modified.
 * @param src Source buffer. `src->size` and `src->data` will be accessed.
 */
void String_Copy(String *dest, String *src);

/**
 * @brief Clones the contents of a given String into a new String and returns
 * the address of the newly-created struct.
 *
 * This is effectively a nice wrapper around the following code:
 *
 * ```c
 * String *dest = String_New(src->size + 1, heapID);
 * String_Copy(dest, src);
 * ```
 *
 * @param src Source buffer to clone.
 * @param heapID ID of the heap which will own the new String.
 * @return Address to the cloned String.
 */
String *String_Clone(String *src, enum HeapID heapID);

/**
 * @brief Format a number into a destination buffer.
 *
 * The destination buffer must already be initialized.
 *
 * @param[out] dest Destination buffer.
 * @param num Number to be formatted.
 * @param maxDigits Maximum number of digits to format, right-justified.
 * @param paddingMode Padding mode to use when formatting the number.
 * @param charsetMode Charset mode to use when formatting the number.
 */
void String_FormatInt(String *dest, int num, u32 maxDigits, enum PaddingMode paddingMode, enum CharsetMode charsetMode);

/**
 * @brief Format a number into a destination buffer.
 *
 * The destination buffer must already be initialized.
 *
 * @param[out] dest Destination buffer.
 * @param num Number to be formatted.
 * @param maxDigits Maximum number of digits to format, right-justified.
 * @param paddingMode Padding mode to use when formatting the number.
 * @param charsetMode Charset mode to use when formatting the number.
 */
void String_FormatU64(String *dest, u64 num, u32 maxDigits, enum PaddingMode paddingMode, enum CharsetMode charsetMode);

/**
 * @brief Parses a numeric string into a number.
 *
 * @param string Numeric string.
 * @param[out] success Flag denoting if the result string was fully processed.
 * @return Parsed result.
 */
s64 String_AtoI(String *string, BOOL *success);

/**
 * @brief Compares two strings. Similar to the `strcmp` standard, but without returning -1. Essentially a BOOL.
 *
 * @param str1 First string.
 * @param str2 Second string.
 * @return FALSE if the strings match, TRUE if they do not.
 */
BOOL String_Compare(String *str1, String *str2);

/**
 * @brief Accessor for the length of a string.
 *
 * @param string
 * @return `string->size`
 */
u16 String_GetLength(String *string);

/**
 * @brief Counts the number of lines in a string.
 *
 * @param string
 * @return The number of lines in `string`.
 */
int String_CountLines(const String *string);

/**
 * @brief Copies a particular line number from `src` into `dest`.
 *
 * Lines are zero-indexed, e.g. `lineNum == 0` will copy the first line,
 * `lineNum == 1` will copy the second line, etc.
 *
 * @param[out] dest Destination buffer.
 * @param src Source buffer.
 * @param lineNum Number of the line to copy, zero-indexed.
 */
void String_CopyLine(String *dest, const String *src, u32 lineNum);

/**
 * @brief Modifies chars from `string` into different amounts of dots.
 *
 * @param[out] string.
 * @param level Level of "static" to add.
 */
void String_AddRadioStatic(String *string, u8 level);

/**
 * @brief Copies data from a raw character buffer into a managed String.
 *
 * @param[out] dest Destination buffer.
 * @param src Raw character source buffer.
 */
void String_CopyFromChars(String *dest, const charcode_t *src);

/**
 * @brief Copies a specific number of values from a raw character buffer into
 * a managed String.
 *
 * @param[out] dest Destination buffer.
 * @param src Raw character source buffer.
 * @param num Number of values to copy.
 */
void String_CopyNumChars(String *dest, const charcode_t *src, u32 num);

/**
 * @brief Dumps the contents of a String into a raw character buffer.
 *
 * Fails if `src->size + 1 > destSize`.
 *
 * @param src Source buffer.
 * @param[out] dest Destination buffer.
 * @param destSize Size of `dest`.
 */
void String_CopyToChars(String *src, charcode_t *dest, u32 destSize);

/**
 * @brief Accessor for the underlying data buffer of a managed string.
 *
 * @param string
 * @return Underlying data buffer for `string`.
 */
charcode_t *String_GetChars(String *string);

/**
 * @brief Concatenates `src` onto the end of `dest`, if allocation permits.
 *
 * Fails if `dest->maxSize < dest->size + src->size + 1`.
 *
 * @param[out] dest Destination buffer.
 * @param src Source buffer.
 */
void String_Concat(String *dest, String *src);

/**
 * @brief Appends a single character onto `string`, if allocation permits.
 *
 * Fails if `string->maxSize >= string->size + 1`.
 *
 * @param[out] string Destination buffer.
 * @param c Character to append.
 */
void String_AppendChar(String *string, charcode_t c);

/**
 * @brief Checks if a given string is a trainer name.
 *
 * Trainer names are identified using a specific leader character which denotes
 * different handling methods for their concatenation.
 *
 * @param string
 * @return TRUE if `string` is a trainer name, FALSE otherwise.
 */
BOOL String_IsTrainerName(String *string);

/**
 * @brief Concatenates `src` onto the end of `dest`, accounting for trainer
 * name compression.
 *
 * If `src` is not a trainer name, then this falls back to `String_Concat`.
 *
 * @param[out] dest Destination buffer.
 * @param src Source buffer.
 */
void String_ConcatTrainerName(String *dest, String *src);

/**
 * @brief Converts a particular character to uppercase.
 *
 * @param string
 * @param index Index of the character to capitalize, zero-indexed.
 */
void String_UpperChar(String *string, int index);

#endif // POKEHEARTGOLD_STRING_GF_H
