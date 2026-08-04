#include "msgdata/msg.naix"

#include "bg_window.h"
#include "dialog_box.h"
#include "field_system.h"
#include "fieldmap.h"
#include "font.h"
#include "mail_message.h"
#include "map_object.h"
#include "message_format.h"
#include "msgdata.h"
#include "overlay_01.h"
#include "pm_string.h"
#include "scrcmd.h"
#include "script.h"
#include "text.h"

#include "field/message_box.h"

static void MessageBox_ShowInstant(ScriptContext *ctx, MsgData *messageData, u32 messageNum);
static void MessageBox_ShowTemplate(ScriptContext *ctx, MessageFormat *messageFormat, u8 messageNum, u32 canABSpeedUp);
static u32 GetTextFrameDelay(ScriptContext *ctx);
static void MessageBox_Init(FieldSystem *fieldSystem, MessageBox *messageBox);
static void MessageBoxTemplate_Init(FieldSystem *fieldSystem, MessageFormat *messageFormat, MessageBox *messageBox);
static void CreateMessageBox(FieldSystem *fieldSystem, MessageBox *messageBox);
static void LoadAndFormatMessage(MessageBox *messageBox, MsgData *messageData, u32 messageNum);
static void GetStringFromEasyChatMessage(MessageBox *messageBox, u16 messageBank, u16 messageNum, u16 word1, u16 word2);
static void PrintFieldMessage(MessageBox *messageBox, FontID fontId, u32 textFrameDelay, BOOL canABSpeedUp, BOOL autoScroll);
static void PrintTextParameterized(MessageBox *messageBox, FontID fontId);

const u16 ov01_022067C8[] = {
    NARC_msg_msg_0752_bin, // day of the week siblings
    NARC_msg_msg_0211_bin, // field moves
    NARC_msg_msg_0030_bin, // cameron the photographer
    NARC_msg_msg_0435_bin, // pokemart and various shops
};

BOOL ScrCmd_NonNPCMsg(ScriptContext *ctx) {
    u8 messageNum = ScriptReadByte(ctx);
    MessageBox_ShowInstant(ctx, ctx->msgdata, messageNum);
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

BOOL ScrCmd_NonNPCMsgExtern(ScriptContext *ctx) {
    u16 fileId = ScriptGetVar(ctx);
    u16 messageNum = ScriptGetVar(ctx);
    MsgData *messageData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, fileId, HEAP_ID_FIELD3);
    MessageBox_ShowInstant(ctx, messageData, messageNum);
    DestroyMsgData(messageData);
    return FALSE;
}

BOOL ScrCmd_MsgBoxExtern(ScriptContext *ctx) {
    u16 fileId = ScriptGetVar(ctx);
    u16 messageNum = ScriptGetVar(ctx);
    MsgData *messageData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, fileId, HEAP_ID_FIELD3);
    MessageBox_Show(ctx, messageData, messageNum, TRUE, NULL);
    DestroyMsgData(messageData);
    SetupNativeScript(ctx, ScriptContext_WaitForFinishedPrinting);
    return TRUE;
}

BOOL ScrCmd_441(ScriptContext *ctx) {
    u16 messageBank = ScriptReadHalfword(ctx);
    u16 messageNum = ScriptReadHalfword(ctx);
    u16 word1 = ScriptReadHalfword(ctx);
    u16 word2 = ScriptReadHalfword(ctx);
    MessageBox_ShowSentence(ctx, messageBank, messageNum, word1, (s16)word2, 0xFF);
    return FALSE;
}

BOOL ScrCmd_442(ScriptContext *ctx) {
    u16 messageBank = ScriptReadHalfword(ctx);
    u16 messageNum = ScriptReadHalfword(ctx);
    u16 word1 = ScriptReadHalfword(ctx);
    u16 word2 = ScriptReadHalfword(ctx);
    MessageBox_ShowSentence(ctx, messageBank, messageNum, word1, (s16)word2, TRUE);
    SetupNativeScript(ctx, ScriptContext_WaitForFinishedPrinting);
    return TRUE;
}

BOOL ScrCmd_443(ScriptContext *ctx) {
    u8 index = ScriptReadByte(ctx);
    FrontierFieldSystem *frontierFsys = ctx->fieldSystem->frontierFsys;
    if (frontierFsys == NULL) {
        return FALSE;
    }
    MailMessage *intro = &frontierFsys->unk78[index].introMessage;
    if (intro->msg_bank == 0xFFFF) {
        MsgData *messageData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, 723, HEAP_ID_FIELD3);
        MessageBox_Show(ctx, messageData, intro->msg_no, TRUE, NULL);
        DestroyMsgData(messageData);
    } else {
        MessageBox_ShowSentence(ctx, intro->msg_bank, intro->msg_no, intro->fields[0], intro->fields[1], TRUE);
    }
    SetupNativeScript(ctx, ScriptContext_WaitForFinishedPrinting);
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
    MessageBox_ShowTemplate(ctx, messageFormat, baseMessageNum + numLegendaryPokemonSeen, TRUE);
    MessageFormat_Delete(messageFormat);
    SetupNativeScript(ctx, ScriptContext_WaitForFinishedPrinting);
    return TRUE;
}

BOOL ScrCmd_527(ScriptContext *ctx) {
    MessageBoxOptions options;
    u16 messageNum = ScriptReadHalfword(ctx);
    MessageBoxOptions_Init(&options, ctx);
    options.fontID = 3;
    MessageBox_Show(ctx, ctx->msgdata, messageNum, FALSE, &options);
    SetupNativeScript(ctx, ScriptContext_WaitForFinishedPrinting);
    return TRUE;
}

BOOL ScrCmd_NPCMsg(ScriptContext *ctx) {
    u8 messageNum = ScriptReadByte(ctx);
    MessageBox_Show(ctx, ctx->msgdata, messageNum, TRUE, NULL);
    SetupNativeScript(ctx, ScriptContext_WaitForFinishedPrinting);
    return TRUE;
}

BOOL ScriptContext_WaitForFinishedPrinting(ScriptContext *ctx) {
    u8 *textPrinterNumPtr = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_TEXT_PRINTER_NUMBER);
    return DialogBox_IsPrintFinished(*textPrinterNumPtr);
}

BOOL ScrCmd_NonNPCMsgVar(ScriptContext *ctx) {
    u16 messageNum = ScriptGetVar(ctx);
    MessageBox_Show(ctx, ctx->msgdata, (u8)messageNum, TRUE, NULL);
    SetupNativeScript(ctx, ScriptContext_WaitForFinishedPrinting);
    return TRUE;
}

BOOL ScrCmd_592(ScriptContext *ctx) {
    MessageBoxOptions options;
    u16 messageNum = ScriptGetVar(ctx);
    MessageBoxOptions_Init(&options, ctx);
    options.autoScroll = TRUE;
    MessageBox_Show(ctx, ctx->msgdata, (u8)messageNum, TRUE, &options);
    SetupNativeScript(ctx, ScriptContext_WaitForFinishedPrinting);
    return TRUE;
}

BOOL ScrCmd_NPCMsgVar(ScriptContext *ctx) {
    u16 messageNum = ScriptGetVar(ctx);
    MessageBox_Show(ctx, ctx->msgdata, (u8)messageNum, FALSE, NULL);
    SetupNativeScript(ctx, ScriptContext_WaitForFinishedPrinting);
    return TRUE;
}

BOOL ScrCmd_GenderMsgBox(ScriptContext *ctx) {
    void *unused = Save_PlayerData_GetProfile(FieldSystem_GetSaveData(ctx->fieldSystem));
    u8 messageNumMale = ScriptReadByte(ctx);
    u8 messageNumFemale = ScriptReadByte(ctx);
    u32 gender = PlayerProfile_GetTrainerGender(Save_PlayerData_GetProfile(FieldSystem_GetSaveData(ctx->fieldSystem)));
    if (gender != PLAYER_GENDER_MALE) {
        MessageBox_Show(ctx, ctx->msgdata, messageNumFemale, TRUE, NULL);
    } else {
        MessageBox_Show(ctx, ctx->msgdata, messageNumMale, TRUE, NULL);
    }
    SetupNativeScript(ctx, ScriptContext_WaitForFinishedPrinting);
    return TRUE;
}

BOOL ScrCmd_455(ScriptContext *ctx) {
    LocalMapObject **objPtr = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_LAST_INTERACTED);
    u8 mapObjectType = MapObject_GetType(*objPtr);
    MessageBox_Show(ctx, ctx->msgdata, mapObjectType, TRUE, NULL);
    SetupNativeScript(ctx, ScriptContext_WaitForFinishedPrinting);
    return TRUE;
}

void MessageBoxOptions_Init(MessageBoxOptions *options, ScriptContext *ctx) {
    options->textFrameDelay = GetTextFrameDelay(ctx);
    options->autoScroll = FALSE;
    options->fontID = 1; // FONT_MESSAGE
}

void MessageBox_Show(ScriptContext *ctx, MsgData *messageData, u16 messageNum, u8 canABSpeedUp, MessageBoxOptions *options) {
    MessageBox messageBox;
    MessageBox_Init(ctx->fieldSystem, &messageBox);
    CreateMessageBox(ctx->fieldSystem, &messageBox);
    LoadAndFormatMessage(&messageBox, messageData, messageNum);

    u32 textFrameDelay;
    u32 autoScroll;
    u8 fontID;
    if (options == NULL) {
        textFrameDelay = GetTextFrameDelay(ctx);
        autoScroll = FALSE;
        fontID = 1; // FONT_MESSAGE
    } else {
        textFrameDelay = options->textFrameDelay;
        autoScroll = options->autoScroll;
        fontID = options->fontID;
    }
    PrintFieldMessage(&messageBox, fontID, textFrameDelay, canABSpeedUp, autoScroll);
}

static void MessageBox_ShowInstant(ScriptContext *ctx, MsgData *messageData, u32 messageNum) {
    MessageBox messageBox;
    MessageBox_Init(ctx->fieldSystem, &messageBox);
    CreateMessageBox(ctx->fieldSystem, &messageBox);
    LoadAndFormatMessage(&messageBox, messageData, messageNum);
    PrintTextParameterized(&messageBox, 1); // FONT_MESSAGE
}

// word2 needs to be signed to match
void MessageBox_ShowSentence(ScriptContext *ctx, u16 messageBank, u16 messageNum, u16 word1, s16 word2, u8 canABSpeedUp) {
    MessageBox messageBox;
    MessageBox_Init(ctx->fieldSystem, &messageBox);
    CreateMessageBox(ctx->fieldSystem, &messageBox);
    GetStringFromEasyChatMessage(&messageBox, messageBank, messageNum, word1, (u16)word2);

    if (canABSpeedUp != FIELD_MESSAGE_SENTENCE_INSTANT) {
        PrintFieldMessage(&messageBox, 1, GetTextFrameDelay(ctx), canABSpeedUp, FALSE); // FONT_MESSAGE
    } else {
        PrintTextParameterized(&messageBox, 1); // FONT_MESSAGE
    }
}

static void MessageBox_ShowTemplate(ScriptContext *ctx, MessageFormat *messageFormat, u8 messageNum, u32 canABSpeedUp) {
    MessageBox messageBox;
    MessageBoxTemplate_Init(ctx->fieldSystem, messageFormat, &messageBox);
    CreateMessageBox(ctx->fieldSystem, &messageBox);
    LoadAndFormatMessage(&messageBox, ctx->msgdata, messageNum);
    PrintFieldMessage(&messageBox, 1, GetTextFrameDelay(ctx), canABSpeedUp, FALSE); // FONT_MESSAGE
}

static u32 GetTextFrameDelay(ScriptContext *ctx) {
    return Options_GetTextFrameDelay(Save_PlayerData_GetOptionsAddr(ctx->fieldSystem->saveData));
}

static void MessageBox_Init(FieldSystem *fieldSystem, MessageBox *messageBox) {
    messageBox->message = *(String **)FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_STRING_BUFFER_0);
    messageBox->buffer = *(String **)FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_STRING_BUFFER_1);
    messageBox->messageFormat = *(MessageFormat **)FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    messageBox->window = (Window *)FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_WINDOW);
    messageBox->isOpen = (u8 *)FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_FIELD_08);
    messageBox->textPrinterNumPtr = (u8 *)FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_TEXT_PRINTER_NUMBER);
}

static void MessageBoxTemplate_Init(FieldSystem *fieldSystem, MessageFormat *messageFormat, MessageBox *messageBox) {
    messageBox->message = *(String **)FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_STRING_BUFFER_0); // SCRIPTENV_STRING_BUFFER_MESSAGE
    messageBox->buffer = *(String **)FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_STRING_BUFFER_1); // SCRIPTENV_STRING_BUFFER_TEMP
    messageBox->messageFormat = messageFormat;
    messageBox->window = (Window *)FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_WINDOW);
    messageBox->isOpen = (u8 *)FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_FIELD_08); // SCRIPTENV_IS_MSG_BOX_OPEN
    messageBox->textPrinterNumPtr = (u8 *)FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_TEXT_PRINTER_NUMBER);
}

static void CreateMessageBox(FieldSystem *fieldSystem, MessageBox *messageBox) {
    if (*(messageBox->isOpen) == FALSE) {
        DialogBox_AddWindowToLayer3(fieldSystem->bgConfig, messageBox->window, GF_BG_LYR_MAIN_3);
        DialogBox_LoadFrame(messageBox->window, Save_PlayerData_GetOptionsAddr(fieldSystem->saveData));
        *(messageBox->isOpen) = TRUE;
        fieldSystem->messageBoxOpen = TRUE;
    }
    FillWindowPixelBuffer(messageBox->window, 15);
}

static void LoadAndFormatMessage(MessageBox *messageBox, MsgData *messageData, u32 messageNum) {
    ReadMsgDataIntoString(messageData, messageNum, messageBox->buffer);
    StringExpandPlaceholders(messageBox->messageFormat, messageBox->message, messageBox->buffer);
}

static void GetStringFromEasyChatMessage(MessageBox *messageBox, u16 messageBank, u16 messageNum, u16 word1, u16 word2) {
    struct MailMessage mailMessage;
    MailMsg_Init(&mailMessage);
    MailMsg_SetMsgBankAndNum(&mailMessage, messageBank, messageNum);
    MailMsg_SetFieldI(&mailMessage, 0, word1);
    MailMsg_SetFieldI(&mailMessage, 1, word2);

    String *string = MailMsg_GetExpandedString(&mailMessage, HEAP_ID_FIELD3);
    
    String_Copy(messageBox->message, string);
    String_Delete(string);
}

static void PrintFieldMessage(MessageBox *messageBox, FontID fontID, u32 textFrameDelay, BOOL canABSpeedUp, BOOL autoScroll) {
    *(messageBox->textPrinterNumPtr) = DialogBox_PrintMessageEx(messageBox->window, messageBox->message, fontID, textFrameDelay, canABSpeedUp, autoScroll);
}

static void PrintTextParameterized(MessageBox *messageBox, FontID fontID) {
    *(messageBox->textPrinterNumPtr) = AddTextPrinterParameterized(messageBox->window, fontID, messageBox->message, 0, 0, TEXT_SPEED_INSTANT, NULL);
}
