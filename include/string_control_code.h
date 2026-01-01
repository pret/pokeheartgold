#ifndef HEARTGOLD_STRING_CONTROL_CODE_H
#define HEARTGOLD_STRING_CONTROL_CODE_H

#include "global.h"

typedef u16 charcode_t;

const u16 *MsgArray_SkipControlCode(const u16 *arr);
int MsgArray_GetControlCode(const u16 *arr);
BOOL MsgArray_ControlCodeIsStrVar(const u16 *arr);
int MsgArray_ControlCodeGetField(const u16 *arr, u32 fieldno);

#endif // HEARTGOLD_STRING_CONTROL_CODE_H
