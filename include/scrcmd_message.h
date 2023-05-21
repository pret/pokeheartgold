#ifndef POKEHEARTGOLD_SCRCMD_MESSAGE_H
#define POKEHEARTGOLD_SCRCMD_MESSAGE_H

#include "field_system.h"
#include "message_format.h"
#include "msgdata.h"
#include "script.h"

typedef struct MessageBox {
    STRING *message;
    STRING *buffer;
    MessageFormat *messageFormat;
    WINDOW *window;
    u8 *unk10;
    u8 *textPrinterNumPtr;
} MessageBox;

BOOL ov01_021EF348(SCRIPTCONTEXT *ctx);
void ovFieldMain_ShowMessageInField(SCRIPTCONTEXT *ctx, MSGDATA *messageData, u32 messageNum);
void ov01_021EF564(SCRIPTCONTEXT *ctx, u16 messageBank, u16 messageNum, u16 word1, s16 word2, u8 canABSpeedUp);
void ov01_021EF5C8(SCRIPTCONTEXT *ctx, MessageFormat *messageFormat, u8 messageNum, u32 canABSpeedUp);
u32 ovFieldMain_GetTextFrameDelay(SCRIPTCONTEXT *ctx);
void ovFieldMain_GetMsgBoxParameters(FieldSystem *fsys, MessageBox *messageBox);
void ovFieldMain_GetMsgBoxParametersEx(FieldSystem *fsys, MessageFormat *messageFormat, MessageBox *messageBox);
void ovFieldMain_CreateMessageBox(FieldSystem *fsys, MessageBox *messageBox);
void ovFieldMain_ReadAndExpandMsgDataViaBuffer(MessageBox *messageBox, MSGDATA *messageData, u32 messageNum);
void ovFieldMain_GetFormattedECMessage(MessageBox *messageBox, u16 messageBank, u16 messageNum, u16 word1, u16 word2);
void ov01_021EF758(MessageBox *messageBox, FontID fontId, u32 textFrameDelay, BOOL canABSpeedUp, u32 a4);
void ovFieldMain_AddTextPrinterParameterized(MessageBox *messageBox, FontID fontId);

#endif
