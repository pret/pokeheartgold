#ifndef HEARTGOLD_STRING_CONTROL_CODE_H
#define HEARTGOLD_STRING_CONTROL_CODE_H

BOOL MsgArray_ControlCodeIsStrVar(const u16 *str);
const u16 *MsgArray_SkipControlCode(const u16 *str);
const u32 MsgArray_ControlCodeGetField(const u16 *str, int fieldno);
u16 MsgArray_GetControlCode(const u16 *arr);

#endif //HEARTGOLD_STRING_CONTROL_CODE_H
