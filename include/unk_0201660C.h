#ifndef POKEHEARTGOLD_UNK_0201660C_H
#define POKEHEARTGOLD_UNK_0201660C_H

#include "heap.h"
#include "bg_window.h"
#include "palette.h"

typedef struct YesNoPromptTemplate {
    BgConfig *bgConfig;
    int unk4;
    int unk8;
    int unkC;
    u8 unk10;
    u8 unk11;
    u8 unk12_0 : 4;
    u8 unk12_4 : 4;
    u8 unk13;
} YesNoPromptTemplate;

typedef struct YesNoPromptSubstruct00 {
    u8 filler_00[40];
} YesNoPromptSubstruct00;

typedef struct YesNoPromptState {
    u8 filler_00[12];
    YesNoPromptSubstruct00 unk_0C[2];
    int unk5C;
    int unk60;
    int unk64;
    u8 filler_68[8];
    u8 unk70;
    u8 unk71;
    u8 unk72;
    u8 unk73;
    u8 unk74_0 : 1;
    u8 unk74_1 : 1;
    u8 unk74_2 : 6;
    u8 unk75;
    u8 unk76_0 : 4;
    u8 unk76_4 : 4;
    u8 unk77_0 : 4;
    u8 unk77_4 : 4;
} YesNoPrompt;

YesNoPrompt *YesNoPrompt_Create(HeapID);
void YesNoPrompt_Destroy(YesNoPrompt *);
void sub_020169CC(YesNoPrompt *);
void YesNoPrompt_InitFromTemplate(YesNoPrompt *, const YesNoPromptTemplate *);
void YesNoPrompt_InitFromTemplateWithPalette(YesNoPrompt *, const YesNoPromptTemplate *, PaletteData *);
u32 sub_02016748(YesNoPrompt *);
int YesNoPrompt_HandleInput(YesNoPrompt *);
int sub_020169C0(YesNoPrompt *);

#endif //POKEHEARTGOLD_UNK_0201660C_H
