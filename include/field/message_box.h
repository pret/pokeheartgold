#ifndef POKEHEARTGOLD_MESSAGE_BOX_H
#define POKEHEARTGOLD_MESSAGE_BOX_H

#include "global.h"

#define FIELD_MESSAGE_SENTENCE_INSTANT 0xFF

// This should probably be moved elsewhere once scrcmd is split properly.
typedef struct MessageBox {
    String *message;
    String *buffer;
    MessageFormat *messageFormat;
    Window *window;
    u8 *isOpen;
    u8 *textPrinterNumPtr;
} MessageBox;

typedef struct MessageBoxOptions {
    u8 textFrameDelay;
    u8 autoScroll;
    u8 fontID;
} MessageBoxOptions;

void MessageBoxOptions_Init(MessageBoxOptions *options, ScriptContext *ctx);
void MessageBox_Show(ScriptContext *ctx, MsgData *msgData, u16 messageNum, u8 canABSpeedUp, MessageBoxOptions *options);
void MessageBox_ShowSentence(ScriptContext *ctx, u16 messageBank, u16 messageNum, u16 word1, s16 word2, u8 canABSpeedUp);

#endif // POKEHEARTGOLD_MESSAGE_BOX_H
