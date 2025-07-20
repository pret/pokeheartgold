#ifndef GUARD_POKEHEARTGOLD_OAKS_SPEECH_INTERNAL_H
#define GUARD_POKEHEARTGOLD_OAKS_SPEECH_INTERNAL_H

#include "bg_window.h"
#include "msgdata.h"
#include "naming_screen.h"
#include "options.h"
#include "overlay_manager.h"
#include "sprite_system.h"
#include "unk_020163E0.h"

#define GENDER_CURSOR_MALE    0
#define GENDER_CURSOR_FEMALE  1
#define GENDER_CURSOR_BOTH    2
#define GENDER_CURSOR_NEITHER 3

#define TOUCHTOADVANCE_HIDE    0
#define TOUCHTOADVANCE_SHOW    1
#define TOUCHTOADVANCE_PRESS   2
#define TOUCHTOADVANCE_RELEASE 3

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

typedef struct OakSpeechYesNo OakSpeechYesNo;

typedef struct OakSpeechData {
    HeapID heapId;
    SaveData *saveData;
    Options *options;
    int state;
    int unk_010;
    OverlayManager *overlayManager;
    BgConfig *bgConfig;
    Window fullScreenMsgWindow;
    Window dialogWindow;
    Window multichoiceMenuButtonWindows[3];
    Window controlTutorialTouchMsgWindow;
    int numMultichoiceOptions;
    int unk_080;
    u8 filler_084[0x4C];
    SpriteSystem *spriteRenderer;
    SpriteManager *spriteGfxHandler;
    Sprite *sprites[6];
    u8 filler_0F0[0x10];
    MsgData *msgData;
    int printDialogMsgState;
    int printAndFadeFullScreenTextState;
    u32 textPrinter;
    String *string;
    UnkStruct_020163E0 *unk_114;
    MessageFormat *msgFormat;
    u8 filler_11C[0x4];
    NamingScreenArgs *namingScreenArgs_Player;
    NamingScreenArgs *namingScreenArgs_Rival; // leftover from DPPt
    int layerBlendState;
    int layerBlendEv1;
    int layerBlendEv2;
    u16 playerGender;
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
    u16 oakPicHTranslateState;
    s16 oakPicHTranslatePos;
    OakSpeechYesNo *yesnoMenu;
    int lastChosenGender; // if the player changes their mind
} OakSpeechData;

int OakSpeech_DeadstrippedFunction1(int a0);
int OakSpeech_DeadstrippedFunction2(int a0);

void OakSpeech_InitSpriteEngine(OakSpeechData *data);
void OakSpeech_CleanupSpriteEngine(OakSpeechData *data);
void OakSpeech_CreateSprites(OakSpeechData *data);
void OakSpeech_SelectedGenderIndicatorSpritesAction(OakSpeechData *data, int a1);

OakSpeechYesNo *OakSpeechYesNo_Create(BgConfig *bgConfig, Sprite *sprite, int backgroundBgId, int buttonBgId, int buttonPalette, HeapID heapId);
void OakSpeechYesNo_Delete(OakSpeechYesNo *yesnoMenu);
void OakSpeechYesNo_SetBackgroundPalette(OakSpeechYesNo *yesnoMenu, int palette);
void OakSpeechYesNo_Start(OakSpeechYesNo *yesnoMenu, int msgBank, int msgId_Yes, int msgId_No);
int OakSpeechYesNo_Main(OakSpeechYesNo *yesnoMenu);

#endif // GUARD_POKEHEARTGOLD_OAKS_SPEECH_INTERNAL_H
