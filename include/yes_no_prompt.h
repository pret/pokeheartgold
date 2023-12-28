#ifndef POKEHEARTGOLD_YES_NO_PROMPT_H
#define POKEHEARTGOLD_YES_NO_PROMPT_H

#include "heap.h"
#include "bg_window.h"
#include "palette.h"
#include "unk_02026C44.h"

typedef struct YesNoPromptTemplate {
    BgConfig *bgConfig;
    int unk4;
    int tileStart;
    u32 plttSlot;
    u8 unk10;
    u8 unk11;
    u8 unk12_0 : 4;
    u8 unk12_4 : 4;
    u8 unk13;
} YesNoPromptTemplate;

struct YesNoPromptSubstruct00_18 {
    fx32 *unk0;
    int unk4;
    int unk8;
};

typedef struct YesNoPromptSubstruct00 {
    BgConfig *bgConfig;
    int bgId;
    void *unk08[2];
    NNSG2dScreenData *screenDataPtrs[2];
    struct YesNoPromptSubstruct00_18 unk18;
    u8 x;
    u8 y;
    u8 unk26;
} YesNoPromptSubstruct00;

typedef struct YesNoPromptState {
    UnkStruct_02026C44 *unk00;
    TouchscreenHitbox unk04[2];
    YesNoPromptSubstruct00 unk0C[2];
    BgConfig *bgConfig;
    u32 bgId;
    HeapID heapId;
    fx32 unk68[2];
    u8 x;
    u8 y;
    u8 width;
    u8 height;
    u8 unk74_0 : 1;
    u8 unk74_1 : 1;
    u8 unk74_2 : 6;
    u8 cursorPos;
    u8 result : 4;
    u8 unk76_4 : 4;
    u8 unk77_0 : 4;
    u8 unk77_4 : 4;
} YesNoPromptState;

YesNoPromptState *YesNoPrompt_Create(HeapID);
void YesNoPrompt_Destroy(YesNoPromptState *);
void sub_020169CC(YesNoPromptState *);
void YesNoPrompt_InitFromTemplate(YesNoPromptState *, const YesNoPromptTemplate *);
void YesNoPrompt_InitFromTemplateWithPalette(YesNoPromptState *, const YesNoPromptTemplate *, PaletteData *);
u32 sub_02016748(YesNoPromptState *);
int YesNoPrompt_HandleInput(YesNoPromptState *);
int sub_020169C0(YesNoPromptState *);
void sub_020169F4(YesNoPromptState *yesno, int a1);

#endif //POKEHEARTGOLD_YES_NO_PROMPT_H
