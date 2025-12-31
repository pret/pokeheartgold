#include "string_control_code.h"

#include "global.h"

#include "pm_string.h"

const u16 *MsgArray_SkipControlCode(const u16 *arr) {
    GF_ASSERT(*arr == CHAR_CONTROL_CODE_ARG);
    if (*arr == CHAR_CONTROL_CODE_ARG) {
        u16 size = arr[2];
        arr += 3;
        arr += size;
    }
    return arr;
}

int MsgArray_GetControlCode(const u16 *arr) {
    GF_ASSERT(*arr == CHAR_CONTROL_CODE_ARG);
    return arr[1];
}

BOOL MsgArray_ControlCodeIsStrVar(const u16 *arr) {
    int strcode = MsgArray_GetControlCode(arr) & 0xFF00;
    return strcode == 0x100 || strcode == 0x300 || strcode == 0x400 || strcode == 0x3400;
}

int MsgArray_ControlCodeGetField(const u16 *arr, u32 fieldno) {
    GF_ASSERT(*arr == CHAR_CONTROL_CODE_ARG);
    GF_ASSERT(fieldno < arr[2]);
    arr += 3;
    return arr[fieldno];
}
