#ifndef POKEHEARTGOLD_YES_NO_PROMPT_H
#define POKEHEARTGOLD_YES_NO_PROMPT_H

#include "bg_window.h"
#include "heap.h"
#include "menu_input_state.h"
#include "palette.h"
#include "touch_hitbox_controller.h"

typedef enum YesNoResponse {
    YESNORESPONSE_WAIT = 0,
    YESNORESPONSE_YES,
    YESNORESPONSE_NO,
    YESNORESPONSE_YES_TOUCH,
    YESNORESPONSE_NO_TOUCH,
} YesNoResponse;

typedef struct YesNoPromptTemplate {
    BgConfig *bgConfig;
    int bgId;
    int tileStart;
    u32 plttSlot;
    u8 x;
    u8 y;
    u8 ignoreTouchFlag : 4;
    u8 initialCursorPos : 4;
    u8 shapeParam;
} YesNoPromptTemplate;

struct YesNoPromptSubstruct00_18 {
    fx32 *unk0;
    int unk4;
    int unk8;
};

typedef struct YesNoPromptButton {
    BgConfig *bgConfig;
    int bgId;
    void *scrnDataRaw[2];
    NNSG2dScreenData *screenDataPtrs[2];
    struct YesNoPromptSubstruct00_18 unk18;
    u8 x;
    u8 y;
    u8 unk26;
} YesNoPromptButton;

typedef struct YesNoPrompt {
    TouchHitboxController *touchHitboxController;
    TouchscreenHitbox hitboxes[2];
    YesNoPromptButton buttons[2];
    BgConfig *bgConfig;
    u32 bgId;
    HeapID heapId;
    fx32 unk68[2];
    u8 x;
    u8 y;
    u8 width;
    u8 height;
    u8 inTouchMode : 1;
    u8 unused_74_1 : 1;
    u8 confirmSelectionTimer : 6;
    u8 cursorPos;
    u8 result : 4;
    u8 ignoreTouch : 4;
    u8 buttonsAreInit : 4;
    u8 lastTouchEvent : 4;
} YesNoPrompt;

YesNoPrompt *YesNoPrompt_Create(HeapID);
void YesNoPrompt_Destroy(YesNoPrompt *);
void YesNoPrompt_Reset(YesNoPrompt *);
void YesNoPrompt_InitFromTemplate(YesNoPrompt *, const YesNoPromptTemplate *);
void YesNoPrompt_InitFromTemplateWithPalette(YesNoPrompt *, const YesNoPromptTemplate *, PaletteData *);
YesNoResponse YesNoPrompt_HandleInputForSave(YesNoPrompt *);
YesNoResponse YesNoPrompt_HandleInput(YesNoPrompt *);
MenuInputState YesNoPrompt_IsInTouchMode(YesNoPrompt *);
void YesNoPrompt_SetIgnoreTouch(YesNoPrompt *yesno, int a1);

#endif // POKEHEARTGOLD_YES_NO_PROMPT_H
