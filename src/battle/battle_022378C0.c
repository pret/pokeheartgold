#include "battle/battle_022378C0.h"

#include "constants/game_stats.h"

#include "battle/battle_input.h"
#include "battle/battle_system.h"
#include "battle/overlay_12_02266024.h"

#include "filesystem_files_def.h"
#include "gf_gfx_planes.h"
#include "render_text.h"
#include "sound_02004A44.h"
#include "system.h"
#include "unk_02026E84.h"
#include "unk_020379A0.h"
#include "unk_02037C94.h"
#include "unk_020755E8.h"
#include "vram_transfer_manager.h"

FS_EXTERN_OVERLAY(OVY_5);
FS_EXTERN_OVERLAY(OVY_6);
FS_EXTERN_OVERLAY(OVY_7);
FS_EXTERN_OVERLAY(OVY_8);
FS_EXTERN_OVERLAY(OVY_10);

typedef enum BattleState {
    BSTATE_INIT,
    BSTATE_LINK_INIT,
    BSTATE_LINK_MAIN,
    BSTATE_UNK_A_INIT,
    BSTATE_UNK_A_MAIN,
    BSTATE_UNK_B_INIT,
    BSTATE_UNK_B_MAIN,
    BSTATE_SYNC,
    BSTATE_BATTLE_INIT,
    BSTATE_BATTLE_MAIN,
    BSTATE_END_INIT,
    BSTATE_END_MAIN,
    BSTATE_END_WAIT,
    BSTATE_EVOLUTION_INIT,
    BSTATE_EVOLUTION_MAIN,
    BSTATE_EXIT
} BattleState;

BOOL Battle_Run(OverlayManager *man, int *state) {
    BattleSetup *setup = OverlayManager_GetArgs(man);

    switch (*state) {
    case BSTATE_INIT:
        Heap_Create(HEAP_ID_3, HEAP_ID_BATTLE, 0xB0000);
        if ((setup->battleType & BATTLE_TYPE_LINK) && !(setup->battleSpecial & BATTLE_SPECIAL_RECORDING)) {
            *state = BSTATE_LINK_INIT;
        } else {
            *state = BSTATE_UNK_A_INIT;
        }
        break;
    case BSTATE_LINK_INIT:
        ov12_022399D4(man, setup);
        sub_02039F68(setup->wifiHistory);
        if (!sub_02039998()) {
            GameStats_Inc(setup->gameStats, GAME_STAT_UNK21);
            if (setup->battleType != 0x8F) {
                sub_02005BEC(1);
            }
        } else {
            GameStats_Inc(setup->gameStats, GAME_STAT_UNK26);
        }
        *state = BSTATE_LINK_MAIN;
        break;
    case BSTATE_LINK_MAIN:
        if (ov12_02239C28(man) == TRUE) {
            ov12_0223A088(man);
            *state = BSTATE_UNK_A_INIT;
        }
        break;
    case BSTATE_UNK_A_INIT:
        if (ov12_0223A0D4(man) == TRUE) {
            *state = BSTATE_UNK_A_MAIN;
        } else {
            *state = BSTATE_UNK_B_INIT;
        }
        break;
    case BSTATE_UNK_A_MAIN:
        if (ov12_0223A218(man) == TRUE) {
            *state = BSTATE_UNK_B_INIT;
        }
        break;
    case BSTATE_UNK_B_INIT:
        if (ov12_0223A260(man) == TRUE) {
            *state = BSTATE_UNK_B_MAIN;
        } else {
            *state = BSTATE_BATTLE_INIT;
        }
        break;
    case BSTATE_UNK_B_MAIN:
        if (ov12_0223A3A8(man) == TRUE) {
            UnloadOverlayByID(FS_OVERLAY_ID(OVY_5));
            *state = BSTATE_SYNC;
            sub_02037AC0(0x3D);
        }
        break;
    case BSTATE_SYNC:
        if (sub_02037B38(0x3D)) {
            *state = BSTATE_BATTLE_INIT;
        }
        break;
    case BSTATE_BATTLE_INIT:
        HandleLoadOverlay(FS_OVERLAY_ID(OVY_6), OVY_LOAD_ASYNC);
        HandleLoadOverlay(FS_OVERLAY_ID(OVY_7), OVY_LOAD_ASYNC);
        ov12_02237F18(man);
        *state = BSTATE_BATTLE_MAIN;
        break;
    case BSTATE_BATTLE_MAIN:
        if (ov12_02238358(man) == TRUE) {
            ov12_0223843C(man);
            sub_02005BEC(0);
            *state = BSTATE_END_INIT;
        }
        break;
    case BSTATE_END_INIT:
        if (ov12_0223A3F0(man) == TRUE) {
            *state = BSTATE_END_MAIN;
        } else {
            Heap_Destroy(HEAP_ID_BATTLE);
            *state = BSTATE_EVOLUTION_INIT;
        }
        break;
    case BSTATE_END_MAIN:
        if (ov12_0223A5E4(man) == TRUE) {
            UnloadOverlayByID(FS_OVERLAY_ID(OVY_5));
            Heap_Destroy(HEAP_ID_BATTLE);
            *state = BSTATE_END_WAIT;
        }
        break;
    case BSTATE_END_WAIT:
        *state = BSTATE_EXIT;
        break;
    case BSTATE_EVOLUTION_INIT: {
        int selectedMonIndex;
        int evolutionSpecies;
        int evolutionCondition;
        Pokemon *mon;

        evolutionSpecies = BattleSystem_CheckEvolution(setup, &selectedMonIndex, &evolutionCondition);

        if (evolutionSpecies) {
            Heap_Create(HEAP_ID_3, HEAP_ID_EVOLUTION, 0x30000);
            mon = Party_GetMonByIndex(setup->party[BATTLER_PLAYER], selectedMonIndex);
            setup->evolutionTaskData = sub_02075A7C(setup->party[BATTLER_PLAYER], mon, evolutionSpecies, setup->options, setup->unk_164, setup->pokedex, setup->bag, setup->gameStats, evolutionCondition, 3, HEAP_ID_EVOLUTION);
            *state = BSTATE_EVOLUTION_MAIN;
        } else {
            *state = BSTATE_EXIT;
        }
        break;
    }
    case BSTATE_EVOLUTION_MAIN: {
        void *data = setup->evolutionTaskData;
        if (sub_02075D3C(data) == TRUE) {
            sub_02075D4C(data);
            Heap_Destroy(HEAP_ID_EVOLUTION);
            *state = BSTATE_EVOLUTION_INIT;
        }
        break;
    }
    case BSTATE_EXIT:
        return TRUE;
    }
    return FALSE;
}

void ov12_02237B0C(BattleSystem *bsys) {
    ov12_0226631C(bsys->unk19C);
    ov12_022660A8(bsys->bgConfig);
    bsys->unk240E_F = 1;
    FontID_Release(4);
    ov12_0223BBF0(bsys, 3);

    if (bsys->unk2445 == 0) {
        UnloadOverlayByID(FS_OVERLAY_ID(OVY_7));
    } else {
        UnloadOverlayByID(FS_OVERLAY_ID(OVY_10));
    }
    HandleLoadOverlay(FS_OVERLAY_ID(OVY_8), OVY_LOAD_ASYNC);
}

void ov12_02237B6C(BattleSystem *bsys) {
    Main_SetVBlankIntrCB(NULL, NULL);
    ov12_0226631C(bsys->unk19C);
    RemoveWindow(bsys->window);
    ov12_02238A30(bsys->bgConfig);
    ov12_02238A64(bsys);
    SpriteSystem_FreeResourcesAndManager(bsys->spriteRenderer, bsys->gfxHandler);
    SpriteSystem_Free(bsys->spriteRenderer);
    GF_DestroyVramTransferManager();
    FontID_Release(4);
}

void ov12_02237BB8(BattleSystem *bsys) {
    UnloadOverlayByID(FS_OVERLAY_ID(OVY_8));

    if (bsys->unk2445 == 0) {
        HandleLoadOverlay(FS_OVERLAY_ID(OVY_7), OVY_LOAD_ASYNC);
    } else {
        HandleLoadOverlay(FS_OVERLAY_ID(OVY_10), OVY_LOAD_ASYNC);
    }

    ov12_0223BBF0(bsys, 0);

    int size = sub_02026E9C();
    void *data = GetSubBgPlttAddr();
    MIi_CpuClear16(0, data, size);

    NARC *unkNarcA = NARC_New(NARC_a_0_0_7, HEAP_ID_BATTLE);
    NARC *unkNarcB = NARC_New(NARC_a_0_0_8, HEAP_ID_BATTLE);

    bsys->unk19C = ov12_022660D0(unkNarcA, unkNarcB, bsys, BattleSystem_GetTrainerGender(bsys, ov12_0223BFC0(bsys)), bsys->unk1C0);

    FontID_Alloc(4, HEAP_ID_BATTLE);

    bsys->unk240F_1 = 1;

    ov12_0226604C(bsys->bgConfig);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
    ov12_02266390(bsys->unk19C);
    ov12_02266508(unkNarcA, unkNarcB, bsys->unk19C, 0, TRUE, NULL);
    ov12_02266644(unkNarcB, bsys->unk19C);

    NARC_Delete(unkNarcA);
    NARC_Delete(unkNarcB);

    TextPrinter_SetDownArrowBaseTile(1);
    ov12_0223A620(bsys);

    G2dRenderer_SetSubSurfaceCoords(SpriteSystem_GetRenderer(bsys->spriteRenderer), 0, FX32_CONST(272));
}

void ov12_02237CC4(BattleSystem *bsys) {
    RemoveWindow(bsys->window);

    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_OFF);
    FreeBgTilemapBuffer(bsys->bgConfig, GF_BG_LYR_MAIN_1);
    FreeBgTilemapBuffer(bsys->bgConfig, GF_BG_LYR_MAIN_2);
    FreeBgTilemapBuffer(bsys->bgConfig, GF_BG_LYR_MAIN_3);
    BattleSystem_SetHpBarDisabled(bsys);
}
