#ifndef GUARD_POKEHEARTGOLD_OAKS_SPEECH_INTERNAL_H
#define GUARD_POKEHEARTGOLD_OAKS_SPEECH_INTERNAL_H

#include "bg_window.h"
#include "msgdata.h"
#include "options.h"
#include "overlay_manager.h"
#include "unk_0200CF18.h"
#include "unk_020163E0.h"
#include "unk_02082908.h"

typedef struct OakSpeechMultichoice {
    u8 unk_0;
    u8 numOptions;
    u8 inPadMode;
    u8 cursorPos;
    u8 flashDelay;
    u8 flashFramesPer;
    u8 pressDelay;
    u8 flashState;
} OakSpeechMultichoice;

typedef struct OakSpeechData_Sub178 {
    HeapID heapId;
} OakSpeechData_Sub178;

typedef struct OakSpeechData {
    HeapID heapId;      // 0x000
    SaveData *saveData; // 0x004
    Options *options;   // 0x008
    int state;
    int unk_010;
    OVY_MANAGER *overlayManager;
    BgConfig *bgConfig; // 0x018
    Window fullScreenMsgWindow;
    Window dialogWindow;
    Window multichoiceMenuButtonWindows[3];
    Window controlTutorialTouchMsgWindow;
    int numMultichoiceOptions;
    int unk_080;
    u8 filler_084[0x4C];
    SpriteRenderer *spriteRenderer;
    SpriteGfxHandler *spriteGfxHandler;
    Sprite *sprites[6]; // 0x0D8
    u8 filler_0F0[0x10];
    MsgData *msgData; // 0x100
    int printDialogMsgState;
    int printAndFadeFullScreenTextState;
    u32 textPrinter;
    String *string; // 0x110
    UnkStruct_020163E0 *unk_114;
    MessageFormat *msgFormat;
    u8 filler_11C[0x4];
    NamingScreenArgs *namingScreenArgs_Player; // 0x120
    NamingScreenArgs *namingScreenArgs_Rival;  // 0x124
    int layerBlendState;
    int layerBlendEv1;
    int layerBlendEv2;
    u16 playerGender; // 0x134
    u16 genderSelectFrameDefaultPalette;
    u8 filler_138[0x4];
    int frameDelayCounter;
    int playerPicShrinkAnimStep;
    int playerPicShrinkAnimDelay;
    u8 filler_148[0x18];
    OakSpeechMultichoice menuData;
    int genderSelectFrameBlinkTimer;
    int lastInputWasTouch;
    int queuedMsgId;
    u16 unk_174;
    s16 unk_176;
    OakSpeechData_Sub178 *unk_178;
    int lastChosenGender; // if the player changes their mind
} OakSpeechData;          // size: 0x180

int OakSpeech_DeadstrippedFunction1(int a0);
int OakSpeech_DeadstrippedFunction2(int a0);

void ov53_021E7F24(OakSpeechData *data);
void ov53_021E7FEC(OakSpeechData *data);
void ov53_021E8014(OakSpeechData *data);
void ov53_021E80B8(OakSpeechData *data, int a1);

OakSpeechData_Sub178 *ov53_021E80F4(BgConfig *bgConfig, Sprite *a1, int a2, int a3, int a4, HeapID heapId);
void ov53_021E814C(OakSpeechData_Sub178 *a0);
void ov53_021E816C(OakSpeechData_Sub178 *a0, int a1);
void ov53_021E81F4(OakSpeechData_Sub178 *a0, int msgBank, int msgId_Yes, int msgId_No);
int ov53_021E8248(OakSpeechData_Sub178 *a0);

#endif // GUARD_POKEHEARTGOLD_OAKS_SPEECH_INTERNAL_H
