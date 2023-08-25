#include "field_map_object.h"
#include "field_system.h"
#include "fieldmap.h"
#include "font.h"
#include "mail_message.h"
#include "msgdata.h"
#include "message_format.h"
#include "overlay_01.h"
#include "pm_string.h"
#include "scrcmd.h"
#include "script.h"
#include "text.h"
#include "text_0205B4EC.h"
#include "bg_window.h"
#include "msgdata/msg.naix"

typedef struct MessageBox {
    String *message;
    String *buffer;
    MessageFormat *messageFormat;
    Window *window;
    u8 *unk10;
    u8 *textPrinterNumPtr;
} MessageBox;

static void ovFieldMain_ShowMessageInField(ScriptContext *ctx, MsgData *messageData, u32 messageNum);
static void ov01_021EF5C8(ScriptContext *ctx, MessageFormat *messageFormat, u8 messageNum, u32 canABSpeedUp);
static u32 ovFieldMain_GetTextFrameDelay(ScriptContext *ctx);
static void ovFieldMain_GetMsgBoxParameters(FieldSystem *fieldSystem, MessageBox *messageBox);
static void ovFieldMain_GetMsgBoxParametersEx(FieldSystem *fieldSystem, MessageFormat *messageFormat, MessageBox *messageBox);
static void ovFieldMain_CreateMessageBox(FieldSystem *fieldSystem, MessageBox *messageBox);
static void ovFieldMain_ReadAndExpandMsgDataViaBuffer(MessageBox *messageBox, MsgData *messageData, u32 messageNum);
static void ovFieldMain_GetFormattedECMessage(MessageBox *messageBox, u16 messageBank, u16 messageNum, u16 word1, u16 word2);
static void ov01_021EF758(MessageBox *messageBox, FontID fontId, u32 textFrameDelay, BOOL canABSpeedUp, u32 a4);
static void ovFieldMain_AddTextPrinterParameterized(MessageBox *messageBox, FontID fontId);

const u16 ov01_022067C8[] = {
    NARC_msg_msg_0752_bin, // day of the week siblings
    NARC_msg_msg_0211_bin, // field moves
    NARC_msg_msg_0030_bin, // cameron the photographer
    NARC_msg_msg_0435_bin, // pokemart and various shops
};

BOOL ScrCmd_NonNPCMsg(ScriptContext *ctx) {
    u8 messageNum = ScriptReadByte(ctx);
    ovFieldMain_ShowMessageInField(ctx, ctx->msgdata, messageNum);
    return FALSE;
}

BOOL ScrCmd_GetStdMsgNaix(ScriptContext *ctx) {
    u16 r5 = ScriptGetVar(ctx);
    u16 *fileIdPtr = ScriptGetVarPointer(ctx);
    if (r5 >= NELEMS(ov01_022067C8)) {
        *fileIdPtr = 0;
    } else {
        *fileIdPtr = ov01_022067C8[r5];
    }
    return FALSE;
}

BOOL ScrCmd_NonNpcMsgExtern(ScriptContext *ctx) {
    u16 fileId = ScriptGetVar(ctx);
    u16 messageNum = ScriptGetVar(ctx);
    MsgData *messageData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, fileId, HEAP_ID_32);
    ovFieldMain_ShowMessageInField(ctx, messageData, messageNum);
    DestroyMsgData(messageData);
    return FALSE;
}

BOOL ScrCmd_MsgboxExtern(ScriptContext *ctx) {
    u16 fileId = ScriptGetVar(ctx);
    u16 messageNum = ScriptGetVar(ctx);
    MsgData *messageData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, fileId, HEAP_ID_32);
    ov01_021EF4DC(ctx, messageData, messageNum, TRUE, NULL);
    DestroyMsgData(messageData);
    SetupNativeScript(ctx, ov01_021EF348);
    return TRUE;
}

BOOL ScrCmd_441(ScriptContext *ctx) {
    u16 messageBank = ScriptReadHalfword(ctx);
    u16 messageNum = ScriptReadHalfword(ctx);
    u16 word1 = ScriptReadHalfword(ctx);
    u16 word2 = ScriptReadHalfword(ctx);
    ov01_021EF564(ctx, messageBank, messageNum, word1, (s16)word2, 0xFF);
    return FALSE;
}

BOOL ScrCmd_442(ScriptContext *ctx) {
    u16 messageBank = ScriptReadHalfword(ctx);
    u16 messageNum = ScriptReadHalfword(ctx);
    u16 word1 = ScriptReadHalfword(ctx);
    u16 word2 = ScriptReadHalfword(ctx);
    ov01_021EF564(ctx, messageBank, messageNum, word1, (s16)word2, TRUE);
    SetupNativeScript(ctx, ov01_021EF348);
    return TRUE;
}

BOOL ScrCmd_443(ScriptContext *ctx) {
    u8 r1 = ScriptReadByte(ctx);
    void *r2 = ctx->fieldSystem->unkA0;
    if (r2 == NULL) {
        return FALSE;
    }
    u16 *r4 = r2 + 0x90 + r1 * 0x110;
    if (r4[0] == 0xFFFF) {
        MsgData *messageData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, 723, HEAP_ID_32);
        ov01_021EF4DC(ctx, messageData, r4[1], TRUE, NULL);
        DestroyMsgData(messageData);
    } else {
        ov01_021EF564(ctx, r4[0], r4[1], r4[2], (s16)r4[3], TRUE);
    }
    SetupNativeScript(ctx, ov01_021EF348);
    return TRUE;
}

BOOL ScrCmd_444(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    u8 baseMessageNum = ScriptReadByte(ctx);
    u16 numEligiblePokemon = ScriptGetVar(ctx);
    u16 r2 = ScriptReadHalfword(ctx);
    u8 r3 = ScriptReadByte(ctx);
    u8 numLegendaryPokemonSeen = 0;
    MessageFormat *messageFormat = sub_0204B538(fieldSystem->saveData, numEligiblePokemon, r2, r3, &numLegendaryPokemonSeen);
    ov01_021EF5C8(ctx, messageFormat, baseMessageNum + numLegendaryPokemonSeen, TRUE);
    MessageFormat_Delete(messageFormat);
    SetupNativeScript(ctx, ov01_021EF348);
    return TRUE;
}

BOOL ScrCmd_527(ScriptContext *ctx) {
    struct UnkStruct_Ov01_021EF4C4 unkStruct;
    u16 messageNum = ScriptReadHalfword(ctx);
    ov01_021EF4C4(&unkStruct, ctx);
    unkStruct.fontId = 3;
    ov01_021EF4DC(ctx, ctx->msgdata, messageNum, FALSE, &unkStruct);
    SetupNativeScript(ctx, ov01_021EF348);
    return TRUE;
}

BOOL ScrCmd_NPCMsg(ScriptContext *ctx) {
    u8 messageNum = ScriptReadByte(ctx);
    ov01_021EF4DC(ctx, ctx->msgdata, messageNum, TRUE, NULL);
    SetupNativeScript(ctx, ov01_021EF348);
    return TRUE;
}

BOOL ov01_021EF348(ScriptContext *ctx) {
    u8 *textPrinterNumPtr = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_TEXT_PRINTER_NUMBER);
    return IsPrintFinished(*textPrinterNumPtr);
}

BOOL ScrCmd_NonNpcMsgVar(ScriptContext *ctx) {
    u16 messageNum = ScriptGetVar(ctx);
    ov01_021EF4DC(ctx, ctx->msgdata, (u8)messageNum, TRUE, NULL);
    SetupNativeScript(ctx, ov01_021EF348);
    return TRUE;
}

BOOL ScrCmd_592(ScriptContext *ctx) {
    struct UnkStruct_Ov01_021EF4C4 unkStruct;
    u16 messageNum = ScriptGetVar(ctx);
    ov01_021EF4C4(&unkStruct, ctx);
    unkStruct.unk1 = 1;
    ov01_021EF4DC(ctx, ctx->msgdata, (u8)messageNum, TRUE, &unkStruct);
    SetupNativeScript(ctx, ov01_021EF348);
    return TRUE;
}

BOOL ScrCmd_NpcMsgVar(ScriptContext *ctx) {
    u16 messageNum = ScriptGetVar(ctx);
    ov01_021EF4DC(ctx, ctx->msgdata, (u8)messageNum, FALSE, NULL);
    SetupNativeScript(ctx, ov01_021EF348);
    return TRUE;
}

BOOL ScrCmd_GenderMsgbox(ScriptContext *ctx) {
    void *unused = Save_PlayerData_GetProfileAddr(FieldSystem_GetSaveData(ctx->fieldSystem));
    u8 messageNumMale = ScriptReadByte(ctx);
    u8 messageNumFemale = ScriptReadByte(ctx);
    u32 gender = PlayerProfile_GetTrainerGender(Save_PlayerData_GetProfileAddr(FieldSystem_GetSaveData(ctx->fieldSystem)));
    if (gender != PLAYER_GENDER_MALE) {
        ov01_021EF4DC(ctx, ctx->msgdata, messageNumFemale, TRUE, NULL);
    } else {
        ov01_021EF4DC(ctx, ctx->msgdata, messageNumMale, TRUE, NULL);
    }
    SetupNativeScript(ctx, ov01_021EF348);
    return TRUE;
}

BOOL ScrCmd_455(ScriptContext *ctx) {
    LocalMapObject **objPtr = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_LAST_INTERACTED);
    u8 mapObjectType = MapObject_GetType(*objPtr);
    ov01_021EF4DC(ctx, ctx->msgdata, mapObjectType, TRUE, NULL);
    SetupNativeScript(ctx, ov01_021EF348);
    return TRUE;
}

void ov01_021EF4C4(struct UnkStruct_Ov01_021EF4C4 *unkStruct, ScriptContext *ctx) {
    unkStruct->textFrameDelay = ovFieldMain_GetTextFrameDelay(ctx);
    unkStruct->unk1 = 0;
    unkStruct->fontId = 1;
}

void ov01_021EF4DC(ScriptContext *ctx, MsgData *messageData, u16 messageNum, u8 canABSpeedUp, struct UnkStruct_Ov01_021EF4C4 *unkStruct) {
    MessageBox messageBox;
    ovFieldMain_GetMsgBoxParameters(ctx->fieldSystem, &messageBox);
    ovFieldMain_CreateMessageBox(ctx->fieldSystem, &messageBox);
    ovFieldMain_ReadAndExpandMsgDataViaBuffer(&messageBox, messageData, messageNum);
    u32 textFrameDelay;
    u32 unk1;
    u8 fontId;
    if (unkStruct == NULL) {
        textFrameDelay = ovFieldMain_GetTextFrameDelay(ctx);
        unk1 = 0;
        fontId = 1;
    } else {
        textFrameDelay = unkStruct->textFrameDelay;
        unk1 = unkStruct->unk1;
        fontId = unkStruct->fontId;
    }
    ov01_021EF758(&messageBox, fontId, textFrameDelay, canABSpeedUp, unk1);
}

static void ovFieldMain_ShowMessageInField(ScriptContext *ctx, MsgData *messageData, u32 messageNum) {
    MessageBox messageBox;
    ovFieldMain_GetMsgBoxParameters(ctx->fieldSystem, &messageBox);
    ovFieldMain_CreateMessageBox(ctx->fieldSystem, &messageBox);
    ovFieldMain_ReadAndExpandMsgDataViaBuffer(&messageBox, messageData, messageNum);
    ovFieldMain_AddTextPrinterParameterized(&messageBox, 1);
}

// word2 needs to be signed to match
void ov01_021EF564(ScriptContext *ctx, u16 messageBank, u16 messageNum, u16 word1, s16 word2, u8 canABSpeedUp) {
    MessageBox messageBox;
    ovFieldMain_GetMsgBoxParameters(ctx->fieldSystem, &messageBox);
    ovFieldMain_CreateMessageBox(ctx->fieldSystem, &messageBox);
    ovFieldMain_GetFormattedECMessage(&messageBox, messageBank, messageNum, word1, (u16)word2);
    if (canABSpeedUp != 0xFF) {
        ov01_021EF758(&messageBox, 1, ovFieldMain_GetTextFrameDelay(ctx), canABSpeedUp, 0);
    } else {
        ovFieldMain_AddTextPrinterParameterized(&messageBox, 1);
    }
}

static void ov01_021EF5C8(ScriptContext *ctx, MessageFormat *messageFormat, u8 messageNum, u32 canABSpeedUp) {
    MessageBox messageBox;
    ovFieldMain_GetMsgBoxParametersEx(ctx->fieldSystem, messageFormat, &messageBox);
    ovFieldMain_CreateMessageBox(ctx->fieldSystem, &messageBox);
    ovFieldMain_ReadAndExpandMsgDataViaBuffer(&messageBox, ctx->msgdata, messageNum);
    ov01_021EF758(&messageBox, 1, ovFieldMain_GetTextFrameDelay(ctx), canABSpeedUp, 0);
}

static u32 ovFieldMain_GetTextFrameDelay(ScriptContext *ctx) {
    return Options_GetTextFrameDelay(Save_PlayerData_GetOptionsAddr(ctx->fieldSystem->saveData));
}

static void ovFieldMain_GetMsgBoxParameters(FieldSystem *fieldSystem, MessageBox *messageBox) {
    messageBox->message = *(String **)FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_STRING_BUFFER_0);
    messageBox->buffer = *(String **)FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_STRING_BUFFER_1);
    messageBox->messageFormat = *(MessageFormat **)FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    messageBox->window = (Window *)FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_WINDOW);
    messageBox->unk10 = (u8 *)FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_FIELD_08);
    messageBox->textPrinterNumPtr = (u8 *)FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_TEXT_PRINTER_NUMBER);
}

static void ovFieldMain_GetMsgBoxParametersEx(FieldSystem *fieldSystem, MessageFormat *messageFormat, MessageBox *messageBox) {
    messageBox->message = *(String **)FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_STRING_BUFFER_0);
    messageBox->buffer = *(String **)FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_STRING_BUFFER_1);
    messageBox->messageFormat = messageFormat;
    messageBox->window = (Window *)FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_WINDOW);
    messageBox->unk10 = (u8 *)FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_FIELD_08);
    messageBox->textPrinterNumPtr = (u8 *)FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_TEXT_PRINTER_NUMBER);
}

static void ovFieldMain_CreateMessageBox(FieldSystem *fieldSystem, MessageBox *messageBox) {
    if (*(messageBox->unk10) == 0) {
        sub_0205B514(fieldSystem->bgConfig, messageBox->window, 3);
        sub_0205B564(messageBox->window, Save_PlayerData_GetOptionsAddr(fieldSystem->saveData));
        *(messageBox->unk10) = 1;
        fieldSystem->unkD2_6 = TRUE;
    }
    FillWindowPixelBuffer(messageBox->window, 15);
}

static void ovFieldMain_ReadAndExpandMsgDataViaBuffer(MessageBox *messageBox, MsgData *messageData, u32 messageNum) {
    ReadMsgDataIntoString(messageData, messageNum, messageBox->buffer);
    StringExpandPlaceholders(messageBox->messageFormat, messageBox->message, messageBox->buffer);
}

static void ovFieldMain_GetFormattedECMessage(MessageBox *messageBox, u16 messageBank, u16 messageNum, u16 word1, u16 word2) {
    struct MailMessage mailMessage;
    MailMsg_Init(&mailMessage);
    MailMsg_SetMsgBankAndNum(&mailMessage, messageBank, messageNum);
    MailMsg_SetFieldI(&mailMessage, 0, word1);
    MailMsg_SetFieldI(&mailMessage, 1, word2);
    String *string = MailMsg_GetExpandedString(&mailMessage, HEAP_ID_32);
    String_Copy(messageBox->message, string);
    String_Delete(string);
}

static void ov01_021EF758(MessageBox *messageBox, FontID fontId, u32 textFrameDelay, BOOL canABSpeedUp, u32 a4) {
    *(messageBox->textPrinterNumPtr) = sub_0205B5EC(messageBox->window, messageBox->message, fontId, textFrameDelay, canABSpeedUp, a4);
}

static void ovFieldMain_AddTextPrinterParameterized(MessageBox *messageBox, FontID fontId) {
    *(messageBox->textPrinterNumPtr) = AddTextPrinterParameterized(messageBox->window, fontId, messageBox->message, 0, 0, 0, NULL);
}

