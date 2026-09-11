#ifndef POKEHEARTGOLD_OVERLAY_12_0226ADE0_H
#define POKEHEARTGOLD_OVERLAY_12_0226ADE0_H

#include "battle/battle.h"

typedef struct PartyGaugeArrow {
    ManagedSprite *managedSprite;
    SysTask *task;
    u32 hideType;
    u32 side;
    u32 position;
    s32 x;
    s16 alpha;
    u8 state;
    u8 delay;
} PartyGaugeArrow;

typedef struct PartyGaugePokeballs {
    ManagedSprite *managedSprite;
    SysTask *task;
    u32 side;
    u32 position;
    u32 hideType;
    s8 *pokeballCount;
    s16 *arrowAlpha;
    s32 xStart;
    s32 xEnd;
    s32 xOverflow;
    s16 delay;
    u16 sdatID;
    u8 state;
    u8 ballSlot;
    u8 flipAnimation;
    u8 startDelay;
} PartyGaugePokeballs;

typedef struct PartyGauge {
    PartyGaugeArrow arrow;
    PartyGaugePokeballs pokeballs[6];
    s8 numBalls;
} PartyGauge;

void PartyGauge_LoadGraphics(SpriteSystem *spriteSystem, SpriteManager *spriteManager, PaletteData *paletteData);
void PartyGauge_FreeGraphics(SpriteManager *spriteManager);
PartyGauge *PartyGauge_NewAndShow(u8 *ballStatus, s32 side, s32 showType, s32 position, SpriteSystem *spriteSystem, SpriteManager *spriteManager);
BOOL PartyGauge_IsArrowTaskFinished(PartyGauge *partyGauge);
void PartyGauge_StartHideTask(PartyGauge *partyGauge, s32 hideArrowType, s32 hideGaugeType);
u32 PartyGauge_IsHideTaskFinished(PartyGauge *partyGauge);
void PartyGauge_DeleteAndFreeResources(PartyGauge *partyGauge);

#endif
