#include "battle/party_gauge.h"

#include "global.h"

#include "battle/battle_system.h"

#include "unk_02005D10.h"

static PartyGauge *PartyGauge_New(void);
static void PartyGauge_Free(PartyGauge *partyGauge);
static void PartyGaugeArrow_StartShowTask(PartyGaugeArrow *arrow, u32 side, u32 position, SpriteSystem *spriteSystem, SpriteManager *spriteManager);
static void Task_ShowArrow(SysTask *task, void *data);
static void PartyGaugeArrow_StartHideTask(PartyGaugeArrow *arrow, u32 type);
static void Task_HidePartyArrow(SysTask *task, void *data);
static void PartyGaugePokeballs_StartShowTask(PartyGaugePokeballs *pokeballs, s8 *numBalls, u32 side, u32 type, u32 pos, int slot, int frame, SpriteSystem *spriteSystem, SpriteManager *spriteManager);
static void Task_ShowPokeballs_StartOfBattle(SysTask *task, void *data);
static void Task_ShowPokeballs_MidBattle(SysTask *task, void *data);
static void PartyGaugePokeballs_StartHideTask(PartyGaugePokeballs *pokeballs, int slot, u32 type, s16 *arrowAlpha);
static void Task_HidePokeballs_StartOfBattle(SysTask *task, void *data);
static void Task_HidePokeballs_MidBattle(SysTask *task, void *data);
static s32 GetPokeballsAnimationFrame(u32 status, u32 side);
static u32 GetFlippedAnimationFrame(u32 frame);

static const ManagedSpriteTemplate ov12_0226EB38 = {
    .x = 0,
    .y = 0,
    .z = 0,
    .animation = 0,
    .drawPriority = 10,
    .pal = 0,
    .vram = NNS_G2D_VRAM_TYPE_2DMAIN,
    .resIdList = {
                  20415,
                  20037,
                  20408,
                  20397,
                  -1,
                  -1,
                  },
    .bgPriority = 0,
    .vramTransfer = FALSE,
};

static const ManagedSpriteTemplate ov12_0226EB6C = {
    .x = 0,
    .y = 0,
    .z = 0,
    .animation = 0,
    .drawPriority = 8,
    .pal = 0,
    .vram = NNS_G2D_VRAM_TYPE_2DMAIN,
    .resIdList = {
                  20415,
                  20037,
                  20408,
                  20397,
                  -1,
                  -1,
                  },
    .bgPriority = 0,
    .vramTransfer = FALSE,
};

enum PartyGaugePosition {
    PARTY_GAUGE_POSITION_HIGH = 0,
    PARTY_GAUGE_POSITION_MIDDLE,
    PARTY_GAUGE_POSITION_LOW
};

#define ARROW_TASK_PRIORITY    500
#define POKEBALL_TASK_PRIORITY (ARROW_TASK_PRIORITY + 1)

#define SCREEN_EDGE_RIGHT 256
#define SCREEN_EDGE_LEFT  0

#define ARROW_X_START_OURS   (SCREEN_EDGE_RIGHT + 96) // 96 pixels off-screem
#define ARROW_X_START_THEIRS (SCREEN_EDGE_LEFT - 96)  // 96 pixels off-screen
#define ARROW_X_END_OURS     (SCREEN_EDGE_RIGHT - 32)
#define ARROW_X_END_THEIRS   (SCREEN_EDGE_LEFT + 32)
#define ARROW_Y_POS_OURS     120
#define ARROW_Y_POS_THEIRS   56

#define POKEBALL_X_START_OURS   (SCREEN_EDGE_RIGHT + 20)
#define POKEBALL_X_START_THEIRS (SCREEN_EDGE_LEFT - 20)
#define POKEBALL_X_END_OURS     (SCREEN_EDGE_RIGHT - 128 + 34)
#define POKEBALL_X_END_THEIRS   (SCREEN_EDGE_LEFT + 128 - 34)
#define POKEBALL_Y_POS_OURS     (ARROW_Y_POS_OURS - 6)
#define POKEBALL_Y_POS_THEIRS   (ARROW_Y_POS_THEIRS - 6)

#define POKEBALL_SPACING          16
#define POKEBALL_OVERFLOW_SPACING 15
#define POKEBALL_OVERFLOW_LEN     6

#define ARROW_IN_SPEED   (18 << 8)
#define ARROW_OUT_SPEED  (4 << 8)
#define ARROW_FADE_SPEED (1 << 8)

#define POKEBALL_IN_SPEED      (18 << 8)
#define POKEBALL_IN_SPEED_SLOW (6 << 8)
#define POKEBALL_OUT_SPEED     (12 << 8)

#define POKEBALL_SLOT_SHOW_DELAY 3
#define POKEBALL_FLAT_SHOW_DELAY 5

#define HIGH_LOW_Y_POS_DIFF 36

__attribute__((aligned(4))) static const u16 ov12_0226EB28[] = {
    [PARTY_GAUGE_POSITION_HIGH] = ARROW_Y_POS_OURS - HIGH_LOW_Y_POS_DIFF,
    [PARTY_GAUGE_POSITION_MIDDLE] = ARROW_Y_POS_OURS,
    [PARTY_GAUGE_POSITION_LOW] = ARROW_Y_POS_OURS
};

__attribute__((aligned(4))) static const u16 ov12_0226EB20[] = {
    [PARTY_GAUGE_POSITION_HIGH] = ARROW_Y_POS_THEIRS - HIGH_LOW_Y_POS_DIFF,
    [PARTY_GAUGE_POSITION_MIDDLE] = ARROW_Y_POS_THEIRS,
    [PARTY_GAUGE_POSITION_LOW] = ARROW_Y_POS_THEIRS
};

__attribute__((aligned(4))) static const u16 ov12_0226EB30[] = {
    [PARTY_GAUGE_POSITION_HIGH] = POKEBALL_Y_POS_OURS - HIGH_LOW_Y_POS_DIFF,
    [PARTY_GAUGE_POSITION_MIDDLE] = POKEBALL_Y_POS_OURS,
    [PARTY_GAUGE_POSITION_LOW] = POKEBALL_Y_POS_OURS
};

__attribute__((aligned(4))) static const u16 ov12_0226EB18[] = {
    [PARTY_GAUGE_POSITION_HIGH] = POKEBALL_Y_POS_THEIRS - HIGH_LOW_Y_POS_DIFF,
    [PARTY_GAUGE_POSITION_MIDDLE] = POKEBALL_Y_POS_THEIRS,
    [PARTY_GAUGE_POSITION_LOW] = POKEBALL_Y_POS_THEIRS
};

void PartyGauge_LoadGraphics(SpriteSystem *spriteSystem, SpriteManager *spriteManager, PaletteData *paletteData) {
    NARC *narc = NARC_New(NARC_a_0_0_8, HEAP_ID_BATTLE);
    SpriteSystem_LoadPaletteBufferFromOpenNarc(paletteData, PLTTBUF_MAIN_OBJ, spriteSystem, spriteManager, narc, 0x6E, FALSE, 1, NNS_G2D_VRAM_TYPE_2DMAIN, 20037);
    SpriteSystem_LoadCharResObjFromOpenNarc(spriteSystem, spriteManager, narc, 0x154, TRUE, NNS_G2D_VRAM_TYPE_2DMAIN, 20415);
    SpriteSystem_LoadCellResObjFromOpenNarc(spriteSystem, spriteManager, narc, 0x155, TRUE, 20408);
    SpriteSystem_LoadAnimResObjFromOpenNarc(spriteSystem, spriteManager, narc, 0x156, TRUE, 20397);
    NARC_Delete(narc);
}

void PartyGauge_FreeGraphics(SpriteManager *spriteManager) {
    SpriteManager_UnloadCharObjById(spriteManager, 20415);
    SpriteManager_UnloadPlttObjById(spriteManager, 20037);
    SpriteManager_UnloadCellObjById(spriteManager, 20408);
    SpriteManager_UnloadAnimObjById(spriteManager, 20397);
}

static PartyGauge *PartyGauge_New(void) {
    PartyGauge *partyGauge = Heap_Alloc(HEAP_ID_BATTLE, sizeof(PartyGauge));
    MI_CpuFill8(partyGauge, 0, sizeof(PartyGauge));
    return partyGauge;
}

static void PartyGauge_Free(PartyGauge *partyGauge) {
    GF_ASSERT(partyGauge->arrow.task == 0);
    Heap_Free(partyGauge);
}

PartyGauge *PartyGauge_NewAndShow(u8 *ballStatus, s32 side, s32 showType, s32 position, SpriteSystem *spriteSystem, SpriteManager *spriteManager) {

    PartyGauge *partyGauge = PartyGauge_New();

    PartyGaugeArrow_StartShowTask(&partyGauge->arrow, side, position, spriteSystem, spriteManager);
    for (int i = 0; i < 6; i++) {
        PartyGaugePokeballs_StartShowTask(&partyGauge->pokeballs[i], &partyGauge->numBalls, side, showType, position, i, GetPokeballsAnimationFrame(ballStatus[i], side), spriteSystem, spriteManager);
    }
    return partyGauge;
}

BOOL PartyGauge_IsArrowTaskFinished(PartyGauge *partyGauge) {
    int i;
    if (partyGauge->arrow.task == 0) {
        for (i = 0; i < 6; i++) {
            if (partyGauge->pokeballs[i].task != 0) {
                break;
            }
        }
        if (i == 6) {
            return TRUE;
        }
    }
    return FALSE;
}

void PartyGauge_StartHideTask(PartyGauge *partyGauge, s32 hideArrowType, s32 hideGaugeType) {
    GF_ASSERT(partyGauge != NULL);

    PartyGaugeArrow_StartHideTask(&partyGauge->arrow, hideArrowType);

    for (int i = 0; i < 6; i++) {
        PartyGaugePokeballs_StartHideTask(&partyGauge->pokeballs[i], i, hideGaugeType, &partyGauge->arrow.alpha);
    }
}

u32 PartyGauge_IsHideTaskFinished(PartyGauge *partyGauge) {
    int i;
    if (partyGauge->arrow.task == 0) {
        for (i = 0; i < 6; i++) {
            if (partyGauge->pokeballs[i].task) {
                break;
            }
        }
        if (i == 6) {
            return TRUE;
        }
    }
    return FALSE;
}

void PartyGauge_DeleteAndFreeResources(PartyGauge *partyGauge) {
    Sprite_DeleteAndFreeResources(partyGauge->arrow.managedSprite);
    for (int i = 0; i < 6; i++) {
        Sprite_DeleteAndFreeResources(partyGauge->pokeballs[i].managedSprite);
    }
    PartyGauge_Free(partyGauge);
}

static void PartyGaugeArrow_StartShowTask(PartyGaugeArrow *arrow, u32 side, u32 position, SpriteSystem *spriteSystem, SpriteManager *spriteManager) {

    GF_ASSERT(!arrow->managedSprite && !arrow->task);

    MI_CpuClear8(arrow, sizeof(PartyGaugeArrow));

    arrow->managedSprite = SpriteSystem_NewSprite(spriteSystem, spriteManager, &ov12_0226EB38);

    if (side == 0) {
        ManagedSprite_SetPositionXY(arrow->managedSprite, ARROW_X_START_OURS, ov12_0226EB28[position]);
        Sprite_SetAnimCtrlSeq(arrow->managedSprite->sprite, 8);
    } else {
        ManagedSprite_SetPositionXY(arrow->managedSprite, ARROW_X_START_THEIRS, ov12_0226EB20[position]);
        Sprite_SetAnimCtrlSeq(arrow->managedSprite->sprite, 7);
    }

    Sprite_TickFrame(arrow->managedSprite->sprite);

    arrow->side = side;
    arrow->position = position;
    arrow->state = 0;
    arrow->task = SysTask_CreateOnMainQueue(Task_ShowArrow, arrow, ARROW_TASK_PRIORITY);

    PlaySE(SEQ_SE_DP_TB_START);
}

static void Task_ShowArrow(SysTask *task, void *data) {
    PartyGaugeArrow *arrow = data;

    switch (arrow->state) {
    case 0:
        s16 x, y;
        ManagedSprite_GetPositionXY(arrow->managedSprite, &x, &y);
        arrow->x = x << 8;
        arrow->state++;
        // fall-through
    case 1:
        if (arrow->side == 0) {
            arrow->x -= 0x12 << 8;
            if (arrow->x <= 0xE0 << 8) {
                arrow->x = 0xE0 << 8;
                arrow->state++;
            }

            ManagedSprite_SetPositionXY(arrow->managedSprite, arrow->x >> 8, ov12_0226EB28[arrow->position]);
        } else {
            arrow->x += 0x12 << 8;
            if (arrow->x >= 0x20 << 8) {
                arrow->x = 0x20 << 8;
                arrow->state++;
            }

            ManagedSprite_SetPositionXY(arrow->managedSprite, arrow->x >> 8, ov12_0226EB20[arrow->position]);
        }
        break;

    default:
        SysTask_Destroy(task);
        arrow->task = NULL;
    }
}

static void PartyGaugeArrow_StartHideTask(PartyGaugeArrow *arrow, u32 type) {
    GF_ASSERT(arrow->managedSprite != NULL && arrow->task == NULL);

    arrow->state = 0;
    arrow->hideType = type;

    if (type == 0) {
        arrow->delay = 4;
    } else {
        arrow->delay = 0;
    }

    arrow->task = SysTask_CreateOnMainQueue(Task_HidePartyArrow, arrow, 500);
}

static void Task_HidePartyArrow(SysTask *task, void *data) {
    PartyGaugeArrow *arrow = data;

    switch (arrow->state) {
    case 0:
        s16 x, y;

        ManagedSprite_GetPositionXY(arrow->managedSprite, &x, &y);
        arrow->x = x << 8;

        arrow->alpha = 16 << 8;

        G2_SetBlendAlpha(GX_BLEND_PLANEMASK_NONE, GX_BLEND_PLANEMASK_BG0 | GX_BLEND_PLANEMASK_BG1 | GX_BLEND_PLANEMASK_BG2 | GX_BLEND_PLANEMASK_BG3 | GX_BLEND_PLANEMASK_OBJ | GX_BLEND_PLANEMASK_BD, (arrow->alpha >> 8), 16 - (arrow->alpha >> 8));
        arrow->state++;
        // fall-through
    case 1:
        if (arrow->delay > 0) {
            arrow->delay--;
            break;
        }
        reg_G2_BLDALPHA = (arrow->alpha >> 8) | ((16 - (arrow->alpha >> 8)) << 8);
        ManagedSprite_SetOamMode(arrow->managedSprite, GX_OAM_MODE_XLU);
        arrow->state++;
        // fall-through
    case 2:
        if (arrow->hideType == 0) {
            if (arrow->side == 0) {
                arrow->x -= 0x400;
                ManagedSprite_SetPositionXY(arrow->managedSprite, arrow->x >> 8, ov12_0226EB28[arrow->position]);
            } else {
                arrow->x += 0x400;
                ManagedSprite_SetPositionXY(arrow->managedSprite, arrow->x >> 8, ov12_0226EB20[arrow->position]);
            }
        }

        arrow->alpha -= 0x100;

        if (arrow->alpha <= 0) {
            arrow->alpha = 0;
            thunk_Sprite_SetDrawFlag(arrow->managedSprite->sprite, 0);
            arrow->state++;
        }

        reg_G2_BLDALPHA = (arrow->alpha >> 8) | ((16 - (arrow->alpha >> 8)) << 8);
        break;

    default:
        BattleSystem_SetDefaultBlend();
        SysTask_Destroy(task);
        arrow->task = NULL;
    }
}

static void PartyGaugePokeballs_StartShowTask(PartyGaugePokeballs *pokeballs, s8 *numBalls, u32 side, u32 type, u32 pos, int slot, int frame, SpriteSystem *spriteSystem, SpriteManager *spriteManager) {
    GF_ASSERT(!pokeballs->managedSprite && !pokeballs->task);

    MI_CpuClear8(pokeballs, sizeof(PartyGaugePokeballs));
    pokeballs->managedSprite = SpriteSystem_NewSprite(spriteSystem, spriteManager, &ov12_0226EB6C);

    if (side == 0) {
        ManagedSprite_SetPositionXY(pokeballs->managedSprite, 0x114, ov12_0226EB30[pos]);
    } else {
        ManagedSprite_SetPositionXY(pokeballs->managedSprite, -0x14, ov12_0226EB18[pos]);
    }

    Sprite_SetAnimCtrlSeq(pokeballs->managedSprite->sprite, frame);
    Sprite_TickFrame(pokeballs->managedSprite->sprite);

    pokeballs->side = side;
    pokeballs->ballSlot = slot;
    pokeballs->position = pos;
    pokeballs->flipAnimation = GetFlippedAnimationFrame(frame);
    pokeballs->pokeballCount = numBalls;
    pokeballs->sdatID = frame == 6 ? 0x713 : 0x712;

    if (side == 0) {
        pokeballs->xEnd = 0xA2 + slot * 16;
        pokeballs->xOverflow = 0x9C + slot * 15;
    } else {
        pokeballs->xEnd = 0x5E - slot * 16;
        pokeballs->xOverflow = 0x64 - slot * 15;
    }

    pokeballs->state = 0;

    if (type == 0) {
        pokeballs->delay = 2 * slot + slot + 5;
        pokeballs->task = SysTask_CreateOnMainQueue(Task_ShowPokeballs_StartOfBattle, pokeballs, 0x1F5);
    } else {
        pokeballs->delay = 0;
        pokeballs->task = SysTask_CreateOnMainQueue(Task_ShowPokeballs_MidBattle, pokeballs, 0x1F5);
    }
}

static void Task_ShowPokeballs_StartOfBattle(SysTask *task, void *data) {
    PartyGaugePokeballs *pokeballs = data;

    switch (pokeballs->state) {
    case 0:
        s16 x, y;
        ManagedSprite_GetPositionXY(pokeballs->managedSprite, &x, &y);
        pokeballs->xStart = x << 8;

        pokeballs->state++;
        // fall-through
    case 1:
        if (pokeballs->delay > 0) {
            pokeballs->delay--;
            break;
        }
        // fall-through
    case 2:
        if (pokeballs->side == 0) {
            pokeballs->xStart -= 0x1200;

            if (pokeballs->xStart <= pokeballs->xOverflow << 8) {
                pokeballs->xStart = pokeballs->xOverflow << 8;
                PlaySE(pokeballs->sdatID);
                pokeballs->state++;
            }

            ManagedSprite_SetPositionXY(pokeballs->managedSprite, pokeballs->xStart >> 8, ov12_0226EB30[pokeballs->position]);
        } else {
            pokeballs->xStart += 0x1200;

            if (pokeballs->xStart >= pokeballs->xOverflow << 8) {
                pokeballs->xStart = pokeballs->xOverflow << 8;
                pokeballs->state++;
            }

            ManagedSprite_SetPositionXY(pokeballs->managedSprite, pokeballs->xStart >> 8, ov12_0226EB18[pokeballs->position]);
        }

        Sprite_TickFrame(pokeballs->managedSprite->sprite);
        break;

    case 3:
        (*(pokeballs->pokeballCount))++;
        pokeballs->state++;
        // fall-through
    case 4:
        if (*(pokeballs->pokeballCount) != 6) {
            Sprite_TickFrame(pokeballs->managedSprite->sprite);
            break;
        }

        if (pokeballs->side == 0) {
            Sprite_SetAnimationFrame(pokeballs->managedSprite->sprite, 1);
        } else {
            Sprite_SetAnimationFrame(pokeballs->managedSprite->sprite, 1);
        }

        pokeballs->delay = 0;
        pokeballs->state++;
        // fall-through
    case 5:
        pokeballs->delay++;

        if (pokeballs->delay < 0) {
            break;
        }

        Sprite_SetAnimCtrlSeq(pokeballs->managedSprite->sprite, pokeballs->flipAnimation);
        pokeballs->delay = 0;
        pokeballs->state++;
        // fall-through
    case 6:
        if (pokeballs->side == 0) {
            pokeballs->xStart += 0x600; // need more dissection on what exactly this is for

            if (pokeballs->xStart >= pokeballs->xEnd << 8) {
                pokeballs->xStart = pokeballs->xEnd << 8;
                pokeballs->state++;
            }

            ManagedSprite_SetPositionXY(pokeballs->managedSprite, pokeballs->xStart >> 8, ov12_0226EB30[pokeballs->position]);
        } else {
            pokeballs->xStart -= 0x600;

            if (pokeballs->xStart <= pokeballs->xEnd << 8) {
                pokeballs->xStart = pokeballs->xEnd << 8;
                pokeballs->state++;
            }

            ManagedSprite_SetPositionXY(pokeballs->managedSprite, pokeballs->xStart >> 8, ov12_0226EB18[pokeballs->position]);
        }

        Sprite_TickFrame(pokeballs->managedSprite->sprite);
        break;

    default:
        Sprite_SetAnimationFrame(pokeballs->managedSprite->sprite, 0);
        SysTask_Destroy(task);
        pokeballs->task = NULL;
    }
}

static void Task_ShowPokeballs_MidBattle(SysTask *task, void *data) {
    PartyGaugePokeballs *pokeballs = data;

    switch (pokeballs->state) {
    case 0:
        s16 x, y;
        ManagedSprite_GetPositionXY(pokeballs->managedSprite, &x, &y);
        pokeballs->xStart = x << 8;

        Sprite_SetAnimationFrame(pokeballs->managedSprite->sprite, 0);
        pokeballs->state++;
        // fall-through
    case 1:
        if (pokeballs->delay > 0) {
            pokeballs->delay--;
            break;
        }
        // fall-through
    case 2:
        if (pokeballs->side == 0) {
            pokeballs->xStart -= 0x1200;

            if (pokeballs->xStart <= pokeballs->xEnd << 8) {
                pokeballs->xStart = pokeballs->xEnd << 8;
                pokeballs->state++;
            }

            ManagedSprite_SetPositionXY(pokeballs->managedSprite, pokeballs->xStart >> 8, ov12_0226EB30[pokeballs->position]);
        } else {
            pokeballs->xStart += 0x1200;

            if (pokeballs->xStart >= pokeballs->xEnd << 8) {
                pokeballs->xStart = pokeballs->xEnd << 8;
                pokeballs->state++;
            }

            ManagedSprite_SetPositionXY(pokeballs->managedSprite, pokeballs->xStart >> 8, ov12_0226EB18[pokeballs->position]);
        }
        break;

    default:
        SysTask_Destroy(task);
        pokeballs->task = NULL;
    }
}

static void PartyGaugePokeballs_StartHideTask(PartyGaugePokeballs *pokeballs, int slot, u32 type, s16 *arrowAlpha) {
    GF_ASSERT(pokeballs->managedSprite != NULL && pokeballs->task == NULL);

    pokeballs->state = 0;

    if (type == 0) {
        pokeballs->arrowAlpha = arrowAlpha;
        pokeballs->delay = 3 * slot;
        pokeballs->startDelay = 4;
        pokeballs->task = SysTask_CreateOnMainQueue(Task_HidePokeballs_StartOfBattle, pokeballs, POKEBALL_TASK_PRIORITY);
    } else {
        pokeballs->arrowAlpha = arrowAlpha;
        pokeballs->delay = 0;
        pokeballs->startDelay = 0;
        pokeballs->task = SysTask_CreateOnMainQueue(Task_HidePokeballs_MidBattle, pokeballs, POKEBALL_TASK_PRIORITY);
    }
}

static void Task_HidePokeballs_StartOfBattle(SysTask *task, void *data) {
    PartyGaugePokeballs *pokeballs = data;

    if (*(pokeballs->arrowAlpha) == 0) {
        pokeballs->state = 100;
    } else if (*(pokeballs->arrowAlpha) < 0x1000 && pokeballs->state != 0 && pokeballs->managedSprite && ManagedSprite_GetOamMode(pokeballs->managedSprite) != GX_OAM_MODE_XLU) {
        ManagedSprite_SetOamMode(pokeballs->managedSprite, GX_OAM_MODE_XLU);
    }

    switch (pokeballs->state) {
    case 0:
        s16 x, y;

        ManagedSprite_GetPositionXY(pokeballs->managedSprite, &x, &y);
        pokeballs->xStart = x << 8;
        pokeballs->state++;
        // fall-through
    case 1:
        if (pokeballs->startDelay > 0) {
            pokeballs->startDelay--;
            break;
        }

        if (pokeballs->delay > 0) {
            pokeballs->delay--;
            break;
        }
        // fall-through
    case 2:
        if (pokeballs->side == 0) {
            pokeballs->xStart -= 0xC00;
            ManagedSprite_SetPositionXY(pokeballs->managedSprite, pokeballs->xStart >> 8, ov12_0226EB30[pokeballs->position]);
        } else {
            pokeballs->xStart += 0xC00;
            ManagedSprite_SetPositionXY(pokeballs->managedSprite, pokeballs->xStart >> 8, ov12_0226EB18[pokeballs->position]);
        }

        // Need some more documentation on this one
        if (pokeballs->xStart < -16 * 0x100 || pokeballs->xStart > ((256 + 16) << 8)) {
            pokeballs->state++;
        }

        Sprite_TickFrame(pokeballs->managedSprite->sprite);
        break;

    case 100:
    default:
        thunk_Sprite_SetDrawFlag(pokeballs->managedSprite->sprite, 0);
        SysTask_Destroy(task);
        pokeballs->task = NULL;
    }
}

static void Task_HidePokeballs_MidBattle(SysTask *task, void *data) {
    PartyGaugePokeballs *pokeballs = data;

    if (*(pokeballs->arrowAlpha) == 0) {
        pokeballs->state = 100;
    }

    switch (pokeballs->state) {
    case 0:
        ManagedSprite_SetOamMode(pokeballs->managedSprite, GX_OAM_MODE_XLU);
        pokeballs->state++;
        // fall-through
    case 1:
        // let the pokeballs fade out alongside the arrow
        break;

    case 100:
    default:
        thunk_Sprite_SetDrawFlag(pokeballs->managedSprite->sprite, 0);
        SysTask_Destroy(task);
        pokeballs->task = NULL;
    }
}

static s32 GetPokeballsAnimationFrame(u32 status, u32 side) {
    switch (status) {
    default:
    case 0:
        return 6;
    case 1:
        if (side == 0) {
            return 3;
        }
        return 0;
    case 2:
        if (side == 0) {
            return 5;
        }
        return 2;
    case 3:
        if (side == 0) {
            return 4;
        }
        return 1;
    }
}

static u32 GetFlippedAnimationFrame(u32 frame) {
    switch (frame) {
    case 6:
    default:
        return frame;
    case 3:
        return 0;
    case 0:
        return 3;

    case 5:
        return 2;
    case 2:
        return 5;

    case 4:
        return 1;
    case 1:
        return 4;
    }
}
