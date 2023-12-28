#ifndef POKEHEARTGOLD_YES_NO_PROMPT_H
#define POKEHEARTGOLD_YES_NO_PROMPT_H

#include "heap.h"
#include "bg_window.h"
#include "palette.h"
#include "unk_02026C44.h"

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

typedef struct YesNoPromptState {
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
} YesNoPromptState;

YesNoPromptState *YesNoPrompt_Create(HeapID);
void YesNoPrompt_Destroy(YesNoPromptState *);
void YesNoPrompt_Reset(YesNoPromptState *);
void YesNoPrompt_InitFromTemplate(YesNoPromptState *, const YesNoPromptTemplate *);
void YesNoPrompt_InitFromTemplateWithPalette(YesNoPromptState *, const YesNoPromptTemplate *, PaletteData *);
YesNoResponse YesNoPrompt_HandleInputForSave(YesNoPromptState *);
YesNoResponse YesNoPrompt_HandleInput(YesNoPromptState *);
int YesNoPrompt_IsInTouchMode(YesNoPromptState *);
void YesNoPrompt_SetIgnoreTouch(YesNoPromptState *yesno, int a1);

#endif //POKEHEARTGOLD_YES_NO_PROMPT_H
