#include "battle/battle_input.h"

#include "global.h"

#include "gf_gfx_loader.h"
#include "heap.h"
#include "math_util.h"
#include "obj_char_transfer.h"
#include "overlay_06.h"
#include "palette.h"
#include "pokemon_icon_idx.h"
#include "render_text.h"
#include "render_window.h"
#include "touchscreen.h"
#include "unk_02005D10.h"
#include "unk_02013534.h"
#include "unk_02077678.h"
#include "unk_0208805C.h"

BattleInput *BattleInput_New() {
    BattleInput *input = AllocFromHeap(HEAP_ID_BATTLE, sizeof(BattleInput));
    MI_CpuFill8(input, 0, sizeof(BattleInput));

    input->curMenuId = -1;

    return input;
}

extern BgTemplate ov12_0226E5DC[4];

void ov12_0226604C(BgConfig *config) {
    for (int i = 0; i < NELEMS(ov12_0226E5DC); i++) {
        InitBgFromTemplate(config, i + GF_BG_LYR_SUB_0, &ov12_0226E5DC[i], 0);
        BgFillTilemapBufferAndCommit(config, i + GF_BG_LYR_SUB_0, 767);
        BgSetPosTextAndCommit(config, i + GF_BG_LYR_SUB_0, BG_POS_OP_SET_X, 0);
        BgSetPosTextAndCommit(config, i + GF_BG_LYR_SUB_0, BG_POS_OP_SET_Y, 0);
    }
}

void ov12_022660A8(BgConfig *config) {
    for (int i = 0; i < NELEMS(ov12_0226E5DC); i++) {
        ToggleBgLayer(i + GF_BG_LYR_SUB_0, GF_PLANE_TOGGLE_OFF);
        FreeBgTilemapBuffer(config, i + GF_BG_LYR_SUB_0);
    }
}

typedef struct NCLRIndex {
    u16 baseIndex;
    u16 animationIndex;
} NCLRIndex;

extern NCLRIndex ov12_0226E580[23];

__attribute__((aligned(4))) extern const u16 ov12_0226E298[7];

void *BattleInput_NewInit(NARC *unused, NARC *unused2, BattleSystem *battleSystem, u32 gender, u8 *a4) {
    BattleInput *battleInput;
    PaletteData *palette;
    u32 bgId;

    battleInput = BattleInput_New();
    battleInput->battleSystem = battleSystem;
    battleInput->gender = gender;
    battleInput->unk4 = a4;

    if (battleInput->unk4 != 0) {
        battleInput->keyPressed = *a4;
    }

    palette = BattleSystem_GetPaletteData(battleSystem);
    bgId = BattleSystem_GetBgId(battleSystem);

    if (bgId >= NELEMS(ov12_0226E580)) {
        bgId = 0;
        GF_ASSERT(FALSE);
    }

    battleInput->unk574 = sub_02013534(13, HEAP_ID_BATTLE);
    battleInput->unk6FC = SysTask_CreateOnMainQueue(ov12_022698C4, battleInput, 1310);

    NNSG2dScreenData *screenData;
    void *v4;
    int bottomScreenBgTilemapId;

    for (int i = 0; i < 7; i++) {
        void *buffer = AllocFromHeap(HEAP_ID_BATTLE, 0x800);
        battleInput->screenBuffer[i] = buffer;

        if (BattleSystem_IsInFrontier(battleSystem) && ov12_0226E298[i] == 43) {
            bottomScreenBgTilemapId = 174;
        } else {
            bottomScreenBgTilemapId = ov12_0226E298[i];
        }

        v4 = GfGfxLoader_GetScrnData(NARC_a_0_0_7, bottomScreenBgTilemapId, 1, &screenData, HEAP_ID_BATTLE);

        MI_CpuCopy32(screenData->rawData, battleInput->screenBuffer[i], 0x800);
        FreeToHeap(v4);
    }

    u16 *v7;
    int bottomScreenBgPaletteId = (BattleSystem_IsInFrontier(battleSystem)) ? 349 : 246;
    battleInput->paletteBuffer = AllocFromHeap(HEAP_ID_BATTLE, 0x200);

    PaletteData_LoadNarc(palette, NARC_a_0_0_7, bottomScreenBgPaletteId, HEAP_ID_BATTLE, PLTTBUF_SUB_BG, 0, 0);

    if (ov12_0226E580[bgId].baseIndex != 0xffff) {
        PaletteData_LoadNarc(palette, NARC_a_0_0_7, ov12_0226E580[bgId].baseIndex, HEAP_ID_BATTLE, PLTTBUF_SUB_BG, 32, 0);
    }

    v7 = PaletteData_GetUnfadedBuf(palette, PLTTBUF_SUB_BG);
    MI_CpuCopy16(v7, battleInput->paletteBuffer, 0x200);

    for (int i = 0; i < 4; i++) {
        MI_CpuFill8(&battleInput->unk54[i].move, 0xFF, sizeof(BattleInputMove));
    }

    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            battleInput->unk54[i].typeIcon[j] = AllocFromHeap(HEAP_ID_BATTLE, sub_0208805C(6));
        }
    }

    NNSG2dPaletteData *nnsgPalette;
    void *v14;
    u16 v15;

    battleInput->bgPalNormal = AllocFromHeap(HEAP_ID_BATTLE, 0x40);
    battleInput->bgPalTouch = AllocFromHeap(HEAP_ID_BATTLE, 0x40);

    MI_CpuCopy16(battleInput->paletteBuffer, battleInput->bgPalNormal, 0x20);
    MI_CpuCopy16(&battleInput->paletteBuffer[7 * 16], &battleInput->bgPalNormal[16], 0x20);

    if (BattleSystem_IsInFrontier(battleSystem)) {
        v15 = 0x15e;
    } else if (ov12_0226E580[bgId].animationIndex != 0xffff) {
        v15 = ov12_0226E580[bgId].animationIndex;
    } else {
        v15 = 0x10f;
    }

    v14 = GfGfxLoader_GetPlttData(NARC_a_0_0_7, v15, &nnsgPalette, HEAP_ID_BATTLE);

    if (BattleSystem_IsInFrontier(battleSystem)) {
        MI_CpuCopy16(nnsgPalette->pRawData, battleInput->bgPalTouch, 0x40);
    } else {
        MI_CpuCopy16(nnsgPalette->pRawData, battleInput->bgPalTouch, 0x20);
    }

    FreeToHeap(v14);

    TextFlags_ResetHasSpedUpInput();
    TextFlags_ResetHasContinuedInput();

    battleInput->bgTask = SysTask_CreateOnMainQueue(ov12_02269954, battleInput, 55000);

    return battleInput;
}

void BattleInput_Free(BattleInput *battleInput) {
    if (battleInput->unk4 != 0) {
        *battleInput->unk4 = battleInput->keyPressed;
    }

    ov12_02268DAC(battleInput);
    ov12_02266804(battleInput);
    ov12_02266490(battleInput);

    sub_020135AC(battleInput->unk574);
    SysTask_Destroy(battleInput->unk6FC);

    for (int i = 0; i < 7; i++) {
        FreeToHeap(battleInput->screenBuffer[i]);
    }

    FreeToHeap(battleInput->paletteBuffer);
    ov12_022687AC(battleInput);
    FreeToHeap(battleInput->bgPalNormal);
    FreeToHeap(battleInput->bgPalTouch);
    SysTask_Destroy(battleInput->bgTask);
    FreeToHeap(battleInput);
}

void ov12_02266390(BattleInput *battleInput) {
    SpriteSystem *spriteSystem = BattleSystem_GetSpriteSystem(battleInput->battleSystem);
    SpriteManager *spriteManager = BattleSystem_GetSpriteManager(battleInput->battleSystem);
    BgConfig *bgConfig = BattleSystem_GetBgConfig(battleInput->battleSystem);
    PaletteData *paletteData = BattleSystem_GetPaletteData(battleInput->battleSystem);

    int bottomScreenBgTilesId;

    if (BattleSystem_IsInFrontier(battleInput->battleSystem)) {
        bottomScreenBgTilesId = 0xad;
    } else {
        bottomScreenBgTilesId = 0x1c;
    }

    GfGfxLoader_LoadCharData(NARC_a_0_0_7, bottomScreenBgTilesId, bgConfig, GF_BG_LYR_SUB_0, 0, 0x6000, 1, HEAP_ID_BATTLE);

    sub_0207775C(spriteSystem, spriteManager, 20017, 20017);

    sub_02077720(BattleSystem_GetPaletteData(battleInput->battleSystem), 3, spriteSystem, spriteManager, 2, 20020);

    for (int i = 0; i < 4; i++) {
        sub_020776B8(spriteSystem, spriteManager, NNS_G2D_VRAM_TYPE_2DSUB, TYPE_NORMAL, 20025 + i);
    }

    if (BattleSystem_GetBattleType(battleInput->battleSystem) & (1 << 10)) {
        BattleFinger_LoadResources(spriteSystem, spriteManager, HEAP_ID_BATTLE, paletteData, 20414, 20036, 20407, 20396);
        battleInput->tutorial.finger = BattleFinger_New(spriteSystem, spriteManager, HEAP_ID_BATTLE, 20414, 20036, 20407, 20396, 10, 0);
    }
}

void ov12_02266490(BattleInput *battleInput) {
    int i;
    SpriteSystem *spriteSystem = BattleSystem_GetSpriteSystem(battleInput->battleSystem);
    SpriteManager *spriteManager = BattleSystem_GetSpriteManager(battleInput->battleSystem);

    for (i = 0; i < 4; i++) {
        sub_020777A4(spriteManager, 20025 + i);
    }

    sub_020777AC(spriteManager, 20020);
    sub_020777B4(spriteManager, 20017, 20017);

    if (BattleSystem_GetBattleType(battleInput->battleSystem) & (1 << 10)) {
        BattleFinger_Delete(battleInput->tutorial.finger);
        BattleFinger_FreeResources(spriteManager, 20414, 20036, 20407, 20396);
    }
}

typedef struct BattleMenuTemplate {
    u16 unk_00;
    u16 paletteId;
    u16 unk_04_val2[4];
    u16 priority[4];
    TouchscreenHitbox *touchscreenRect;
    const int *unk_18;
    const u8 *unk_1C;
    int (*funcCursorMove)(BattleInput *battleInput, int param1);
    void (*funcSaveCursorPos)(BattleInput *battleInput, int param1);
    void (*funcCreateMenuObjects)(BattleInput *battleInput, int param1, int param2);
    int (*unk_2C)(BattleInput *battleInput, int param1, int param2);
} BattleMenuTemplate;
extern const BattleMenuTemplate sBattleMenuTemplates[5];

void ov12_02266508(NARC *narc0, NARC *narc1, BattleInput *battleInput, int menuId, int a4, int *a5) {
    const BattleMenuTemplate *menuTemplate, *prevMenuTemplate;

    if (a5 != NULL) {
        MI_CpuCopy8(a5, &battleInput->menu, sizeof(BattleInputMenu));
    }

    battleInput->invalidTouch = FALSE;

    BgConfig *bgConfig = BattleSystem_GetBgConfig(battleInput->battleSystem);
    SpriteSystem *spriteSystem = BattleSystem_GetSpriteSystem(battleInput->battleSystem);
    SpriteManager *spriteManager = BattleSystem_GetSpriteManager(battleInput->battleSystem);

    if (battleInput->curMenuId == -1) {
        a4 = 1;
        prevMenuTemplate = NULL;
    } else {
        prevMenuTemplate = &sBattleMenuTemplates[battleInput->curMenuId];
    }

    menuTemplate = &sBattleMenuTemplates[menuId];

    PaletteData_LoadPalette(BattleSystem_GetPaletteData(battleInput->battleSystem), battleInput->paletteBuffer, PLTTBUF_SUB_BG, 0, 0x200);

    for (int i = 0; i < 4; i++) {
        if ((menuTemplate->unk_04_val2[i] != 0xffff) && ((a4 == 1) || (menuTemplate->unk_04_val2[i] != prevMenuTemplate->unk_04_val2[i]))) {
            BG_LoadScreenTilemapData(bgConfig, 4 + i, battleInput->screenBuffer[menuTemplate->unk_04_val2[i]], 0x800);
            ScheduleBgTilemapBufferTransfer(bgConfig, 4 + i);
        }
    }

    SpriteSystem_LoadPaletteBufferFromOpenNarc(BattleSystem_GetPaletteData(battleInput->battleSystem), PLTTBUF_SUB_OBJ, spriteSystem, spriteManager, narc1, 72, 0, 7, NNS_G2D_VRAM_TYPE_2DSUB, 20023);

    battleInput->curMenuId = menuId;

    G2S_SetBlendAlpha(GX_BLEND_PLANEMASK_BG1, 15, 8, 12);
    ov12_02268DAC(battleInput);

    if (menuTemplate->funcCreateMenuObjects != NULL) {
        menuTemplate->funcCreateMenuObjects(battleInput, menuId, a4);
    }

    SysTask_CreateOnVWaitQueue(ov12_02269830, battleInput, 10);
}

extern ManagedSpriteTemplate sBallGaugeTemplate;
extern ManagedSpriteTemplate sBallGaugeOpponentTemplate;
void ov12_02266644(NARC *narc, BattleInput *battleInput) {
    int i;

    GF_ASSERT(battleInput->spriteBallGauge[0] == NULL && battleInput->spriteBallGaugeOpponent[0] == NULL);

    SpriteSystem *spriteSystem = BattleSystem_GetSpriteSystem(battleInput->battleSystem);
    SpriteManager *spriteManager = BattleSystem_GetSpriteManager(battleInput->battleSystem);

    SpriteSystem_LoadCharResObjFromOpenNarc(spriteSystem, spriteManager, narc, 208, 1, NNS_G2D_VRAM_TYPE_2DSUB, 20023);
    SpriteSystem_LoadCellResObjFromOpenNarc(spriteSystem, spriteManager, narc, 207, 1, 20015);
    SpriteSystem_LoadAnimResObjFromOpenNarc(spriteSystem, spriteManager, narc, 209, 1, 20015);

    SpriteSystem_LoadCharResObjFromOpenNarc(spriteSystem, spriteManager, narc, 205, 1, NNS_G2D_VRAM_TYPE_2DSUB, 20024);
    SpriteSystem_LoadCellResObjFromOpenNarc(spriteSystem, spriteManager, narc, 204, 1, 20016);
    SpriteSystem_LoadAnimResObjFromOpenNarc(spriteSystem, spriteManager, narc, 206, 1, 20016);

    for (i = 0; i < 6; i++) {
        battleInput->spriteBallGauge[i] = SpriteSystem_NewSprite(spriteSystem, spriteManager, &sBallGaugeTemplate);
        Sprite_SetPositionXYWithSubscreenOffset(battleInput->spriteBallGauge[i]->sprite, 19 * i + 12, 13, ((192 + 80) << FX32_SHIFT));
        ManagedSprite_SetAffineOverwriteMode(battleInput->spriteBallGauge[i], 1);

        battleInput->spriteBallGaugeOpponent[i] = SpriteSystem_NewSprite(spriteSystem, spriteManager, &sBallGaugeOpponentTemplate);
        Sprite_SetPositionXYWithSubscreenOffset(battleInput->spriteBallGaugeOpponent[i]->sprite, 246 + -12 * i, 9, ((192 + 80) << FX32_SHIFT));
    }

    ov12_02266B34(battleInput);

    GF_ASSERT(battleInput->ballTask == NULL);
    battleInput->ballTask = SysTask_CreateOnMainQueue(ov12_022668D0, battleInput, 1300);

    PaletteData *palette = BattleSystem_GetPaletteData(battleInput->battleSystem);
    BattleCursor_LoadResources(spriteSystem, spriteManager, palette, HEAP_ID_BATTLE, 20413, 20035, 20406, 20395);
    battleInput->cursor = BattleCursor_New(spriteSystem, spriteManager, HEAP_ID_BATTLE, 20413, 20035, 20406, 20395, 5, 0);
}

void ov12_02266804(BattleInput *battleInput) {
    int i;
    SpriteSystem *spriteSystem;
    SpriteManager *spriteManager;

    GF_ASSERT(battleInput->spriteBallGauge[0] != NULL && battleInput->spriteBallGaugeOpponent[0] != NULL);

    spriteSystem = BattleSystem_GetSpriteSystem(battleInput->battleSystem);
    spriteManager = BattleSystem_GetSpriteManager(battleInput->battleSystem);

    SpriteManager_UnloadCharObjById(spriteManager, 20023);
    SpriteManager_UnloadCellObjById(spriteManager, 20015);
    SpriteManager_UnloadAnimObjById(spriteManager, 20015);
    SpriteManager_UnloadCharObjById(spriteManager, 20024);
    SpriteManager_UnloadCellObjById(spriteManager, 20016);
    SpriteManager_UnloadAnimObjById(spriteManager, 20016);
    SpriteManager_UnloadPlttObjById(spriteManager, 20023);

    for (i = 0; i < 6; i++) {
        Sprite_DeleteAndFreeResources(battleInput->spriteBallGauge[i]);
        battleInput->spriteBallGauge[i] = NULL;

        Sprite_DeleteAndFreeResources(battleInput->spriteBallGaugeOpponent[i]);
        battleInput->spriteBallGaugeOpponent[i] = NULL;
    }

    SysTask_Destroy(battleInput->ballTask);
    battleInput->ballTask = NULL;

    BattleCursor_FreeResources(spriteManager, 20413, 20035, 20406, 20395);
    BattleCursor_Delete(battleInput->cursor);
}

void ov12_022668D0(SysTask *task, void *data) {
    BattleInput *battleInput = data;
    int i;
    BallGaugeAnimation *ballAnim;

    for (i = 0; i < 6; i++) {
        ballAnim = &battleInput->unk6E0[i];
        switch (ballAnim->state) {
        case 0:
        default:
            if (thunk_Sprite_GetDrawFlag(battleInput->spriteBallGauge[i]->sprite) == 0) {
                break;
            }

            if (ballAnim->unk3 >= 87) {
                ballAnim->animationType = 0;
                ballAnim->delay = 10;
            } else {
                break;
            }

            ballAnim->delay += LCRandom() % 8;
            ballAnim->countMax = 2;
            ballAnim->state++;
            break;
        case 1:
            if (ballAnim->delay > 0) {
                ballAnim->delay--;
                break;
            }

            ballAnim->state++;
            break;
        case 2:
        case 4:
            ManagedSprite_OffsetAffineZRotation(battleInput->spriteBallGauge[i], 0x800);
            ballAnim->xOffset += 0x180;

            ManagedSprite_SetPositionXYWithSubscreenOffset(battleInput->spriteBallGauge[i], 12 + 19 * i + ballAnim->xOffset / 0x100, 13, ((192 + 80) << FX32_SHIFT));
            ballAnim->count++;

            if (ballAnim->count >= ballAnim->countMax) {
                ballAnim->count = 0;

                if (ballAnim->state == 2) {
                    ballAnim->state++;
                } else {
                    ManagedSprite_SetAffineZRotation(battleInput->spriteBallGauge[i], 0);
                    ManagedSprite_SetPositionXYWithSubscreenOffset(battleInput->spriteBallGauge[i], 12 + 19 * i, 13, ((192 + 80) << FX32_SHIFT));

                    ballAnim->xOffset = 0;

                    if (ballAnim->loop < 1) {
                        ballAnim->loop++;

                        if (ballAnim->countMax > 1) {
                            ballAnim->countMax--;
                        }

                        ballAnim->state = 2;
                    } else {
                        ballAnim->loop = 0;
                        ballAnim->state = 0;
                    }
                }
            }

            break;
        case 3:
            ManagedSprite_OffsetAffineZRotation(battleInput->spriteBallGauge[i], -0x800);
            ballAnim->xOffset -= 0x180;

            ManagedSprite_SetPositionXYWithSubscreenOffset(battleInput->spriteBallGauge[i], 12 + 19 * i + ballAnim->xOffset / 0x100, 13, ((192 + 80) << FX32_SHIFT));
            ballAnim->count++;

            if (ballAnim->count >= ballAnim->countMax * 2) {
                ballAnim->count = 0;
                ballAnim->state++;
            }
            break;
        }
    }
}

void ov12_02266A50(BattleInput *battleInput, u8 *a1) {
    for (int i = 0; i < 6; i++) {
        battleInput->unk6E0[i].unk3 = a1[i];
    }
}

void ov12_02266A6C(BattleInput *battleInput, u8 *a1, u8 *a2) {
    for (int i = 0; i < 6; i++) {
        Sprite_SetAnimCtrlSeq(battleInput->spriteBallGauge[i]->sprite, ov12_022684F8(a1[i]));
        Sprite_TickFrame(battleInput->spriteBallGauge[i]->sprite);

        Sprite_SetAnimCtrlSeq(battleInput->spriteBallGaugeOpponent[i]->sprite, ov12_022684F8(a2[i]));
        Sprite_TickFrame(battleInput->spriteBallGaugeOpponent[i]->sprite);
    }
}

void ov12_02266AC0(BattleInput *battleInput) {
    GF_ASSERT(battleInput->spriteBallGauge[0] != NULL && battleInput->spriteBallGaugeOpponent[0] != NULL);

    int maxGauge;

    if (BattleSystem_GetBattleType(battleInput->battleSystem) & BATTLE_TYPE_BUG_CONTEST) {
        maxGauge = 1;
    } else {
        maxGauge = 6;
    }

    for (int i = 0; i < maxGauge; i++) {
        thunk_Sprite_SetDrawFlag(battleInput->spriteBallGauge[i]->sprite, 1);
    }

    if (BattleSystem_GetBattleType(battleInput->battleSystem) & BATTLE_TYPE_TRAINER) {
        for (int i = 0; i < 6; i++) {
            thunk_Sprite_SetDrawFlag(battleInput->spriteBallGaugeOpponent[i]->sprite, 1);
        }
    }
}

void ov12_02266B34(BattleInput *battleInput) {
    GF_ASSERT(battleInput->spriteBallGauge[0] != NULL && battleInput->spriteBallGaugeOpponent[0] != NULL);

    for (int i = 0; i < 6; i++) {
        thunk_Sprite_SetDrawFlag(battleInput->spriteBallGauge[i]->sprite, 0);
        thunk_Sprite_SetDrawFlag(battleInput->spriteBallGaugeOpponent[i]->sprite, 0);
    }
}

int ov12_02266B78(BattleInput *battleInput) {
    int ret, rectHit, paletteId;
    const BattleMenuTemplate *menuTemplate;
    int v5 = 0;

    GF_ASSERT(battleInput->curMenuId != -1);

    menuTemplate = &sBattleMenuTemplates[battleInput->curMenuId];

    if ((menuTemplate->touchscreenRect == NULL) || (battleInput->invalidTouch == TRUE)) {
        return -1;
    }

    GF_ASSERT(menuTemplate->unk_18 != NULL);

    if (BattleSystem_GetBattleType(battleInput->battleSystem) & BATTLE_TYPE_TUTORIAL) {
        rectHit = BattleInput_CatchingTutorialMain(battleInput);
    } else {
        rectHit = TouchscreenHitbox_FindRectAtTouchNew(menuTemplate->touchscreenRect);

        if (rectHit == -1) {
            rectHit = ov12_02269A24(battleInput);
            v5++;
        }
    }

    if (rectHit == -1) {
        ret = -1;
        paletteId = 0xff;
    } else {
        ret = menuTemplate->unk_18[rectHit];
        paletteId = menuTemplate->unk_1C[rectHit];
    }

    if (menuTemplate->unk_2C != NULL) {
        ret = menuTemplate->unk_2C(battleInput, ret, paletteId);

        if (ret != -1) {
            if (menuTemplate->funcSaveCursorPos != NULL) {
                menuTemplate->funcSaveCursorPos(battleInput, rectHit);
            }

            MI_CpuClear8(&battleInput->cursorData, sizeof(BattleInputCurosrData));
            BattleCursor_Disable(battleInput->cursor);

            if (v5 > 0) {
                battleInput->keyPressed = 1;
            } else {
                battleInput->keyPressed = 0;
            }
        }
    }

    return ret;
}

BOOL ov12_02266C64(BattleInput *battleInput) {
    if ((battleInput->unkC == NULL) && (battleInput->unk10 == NULL) && (ov12_022698B0(battleInput) == 1)) {
        return TRUE;
    }

    return FALSE;
}

int ov12_02266C84(int moveRange, int battlerId) {
    switch (moveRange) {
    case 0x0:
        return (battlerId == 4) ? 9 : 8;
    case 0x1:
    case 0x2:
    case 0x10:
        return (battlerId == 4) ? 6 : 4;
    case 0x4:
    case 0x80:
        return 1;
    case 0x8:
        return (battlerId == 4) ? 7 : 2;
    case 0x100:
        return (battlerId == 4) ? 4 : 6;
    case 0x40:
        return 3;
    case 0x200:
        return 10;
    case 0x20:
        return 5;
    case 0x400:
        return 11;
    default:
        GF_ASSERT(0);
        return 0;
    }
}

void ov12_02266D28(BattleInput *battleInput) {
    GXS_SetVisibleWnd(GX_WNDMASK_W0);
    G2S_SetWndOutsidePlane(GX_WND_PLANEMASK_BG0 | GX_WND_PLANEMASK_BG1 | GX_WND_PLANEMASK_BG2 | GX_WND_PLANEMASK_BG3 | GX_WND_PLANEMASK_OBJ, 1);
    G2S_SetWnd0InsidePlane(GX_WND_PLANEMASK_BG0 | GX_WND_PLANEMASK_BG1 | GX_WND_PLANEMASK_BG3 | GX_WND_PLANEMASK_OBJ, 1);

    int x = 255 - (battleInput->unk710 / 0x100);

    if (x < 0) {
        x = 0;
    }

    G2S_SetWnd0Position(x, 0, 255, 192);
}

void ov12_02266D98(BattleInput *battleInput, int xSpeed, int xEnd) {
    if (battleInput->unk710 == xEnd * 0x100) {
        return;
    }

    battleInput->unk714 = xSpeed;
    battleInput->unk718 = xEnd << 8;

    SysTask_CreateOnMainQueue(ov12_02266DC4, battleInput, 1200);
}

void ov12_02266DC4(SysTask *task, void *data) {
    BattleInput *battleInput = data;
    int isFinished = 0;
    BgConfig *bgConfig;

    bgConfig = BattleSystem_GetBgConfig(battleInput->battleSystem);
    battleInput->unk710 += battleInput->unk714;

    if (((battleInput->unk714 <= 0) && (battleInput->unk710 <= battleInput->unk718)) || ((battleInput->unk714 > 0) && (battleInput->unk710 >= battleInput->unk718))) {
        battleInput->unk710 = battleInput->unk718;
        isFinished = 1;
    }

    BgSetPosTextAndCommit(bgConfig, 6, BG_POS_OP_SET_X, battleInput->unk710 / 0x100);
    ov12_02266D28(battleInput);

    if (isFinished == 1) {
        BgFillTilemapBufferAndCommit(bgConfig, 7, (0x6000 / 0x20 - 1));
        ToggleBgLayer(7, 0);
        SetBgPriority(7, 0);
        GXS_SetVisibleWnd(GX_WNDMASK_NONE);
        SysTask_Destroy(task);
        return;
    }
}

void ov12_02266E6C(BattleInput *battleInput, int battlerId) {
    BOOL ret;
    BattleMenuSlideIn *menuSlideIn;

    battleInput->invalidTouch = TRUE;

    G2S_SetWndOutsidePlane(GX_WND_PLANEMASK_BG0 | GX_WND_PLANEMASK_BG1 | GX_WND_PLANEMASK_BG2 | GX_WND_PLANEMASK_BG3, 1);
    G2S_SetWnd0InsidePlane(GX_WND_PLANEMASK_BG2 | GX_WND_PLANEMASK_BG3, 1);
    G2S_SetWnd1InsidePlane(GX_WND_PLANEMASK_BG2 | GX_WND_PLANEMASK_BG3, 1);
    G2S_SetWnd0Position(0, 0, 255, (18 * 8));
    G2S_SetWnd1Position(0, (18 * 8), 255, 192);
    GXS_SetVisibleWnd(GX_WNDMASK_W0 | GX_WNDMASK_W1);

    menuSlideIn = AllocFromHeap(HEAP_ID_BATTLE, sizeof(BattleMenuSlideIn));
    MI_CpuClear8(menuSlideIn, sizeof(BattleMenuSlideIn));

    menuSlideIn->battleInput = battleInput;
    menuSlideIn->unk_12 = battlerId;
    menuSlideIn->unk_08 = -(255 * 100);
    menuSlideIn->unk_0A = (40 * 100);
    menuSlideIn->unk_0C = ((255 * 100) - menuSlideIn->unk_08) / 100;
    menuSlideIn->unk_0E = ((40 * 100) - menuSlideIn->unk_0A) / 100;

    PlaySE(1806);
    SysTask_CreateOnMainQueue(ov12_02269568, menuSlideIn, 1210);

    ret = Main_SetHBlankIntrCB(ov12_02269774, menuSlideIn);
    GF_ASSERT(ret == 1);

    menuSlideIn->unk_04 = SysTask_CreateOnVBlankQueue(ov12_02269668, menuSlideIn, 10);
}

void ov12_02266F70(BattleInput *battleInput, int a1, int a2) {
    int battlerType = battleInput->menu.main.battlerType;
    ov12_02266F84(battleInput, a1, a2);
    ov12_02266E6C(battleInput, battlerType);
}

void ov12_02266F84(BattleInput *battleInput, int a1, int a2) {
    String *strFight, *strBag, *strPokemon, *strRun;
    MsgData *msgLoader;
    int v5;
    BattleInputMainScreen *v6;

    v6 = &battleInput->menu.main;
    v5 = v6->battlerType;

    battleInput->cancelRun = v6->cancelRun;

    msgLoader = BattleSystem_GetMessageLoader(battleInput->battleSystem);

    battleInput->unk6EE = v5;

    if (BattleSystem_GetBattleType(battleInput->battleSystem) & BATTLE_TYPE_SAFARI) {
        strFight = NewString_ReadMsgData(msgLoader, 931);   // BALL
        strBag = NewString_ReadMsgData(msgLoader, 932);     // BAIT
        strPokemon = NewString_ReadMsgData(msgLoader, 933); // MUD
    } else if (BattleSystem_GetBattleType(battleInput->battleSystem) & BATTLE_TYPE_PAL_PARK) {
        strFight = NewString_ReadMsgData(msgLoader, 1223);  // BALL
        strBag = NewString_ReadMsgData(msgLoader, 932);     // BAIT
        strPokemon = NewString_ReadMsgData(msgLoader, 933); // MUD
    } else if (BattleSystem_GetBattleType(battleInput->battleSystem) & BATTLE_TYPE_BUG_CONTEST) {
        strFight = NewString_ReadMsgData(msgLoader, 924);
        strBag = NewString_ReadMsgData(msgLoader, 1270);
        strPokemon = NewString_ReadMsgData(msgLoader, 926);
    } else {
        strFight = NewString_ReadMsgData(msgLoader, 924);   // FIGHT
        strBag = NewString_ReadMsgData(msgLoader, 925);     // BAG
        strPokemon = NewString_ReadMsgData(msgLoader, 926); // POKéMON
    }

    if (battleInput->cancelRun == 1) {
        strRun = NewString_ReadMsgData(msgLoader, 928); // CANCEL
        battleInput->unk6F3 = 1;
    } else {
        strRun = NewString_ReadMsgData(msgLoader, 927); // RUN
        battleInput->unk6F3 = 0;
    }

    BattleInput_CreateTextObject(battleInput, &battleInput->textObj[0], strFight, 4, MAKE_TEXT_COLOR(1, 2, 3), 2, 20023, 128, 83, 1, NULL);
    BattleInput_CreateTextObject(battleInput, &battleInput->textObj[1], strBag, 4, MAKE_TEXT_COLOR(4, 5, 6), 2, 20023, 40, 169, 1, NULL);
    BattleInput_CreateTextObject(battleInput, &battleInput->textObj[2], strPokemon, 4, MAKE_TEXT_COLOR(7, 8, 9), 2, 20023, 216, 168, 1, NULL);
    BattleInput_CreateTextObject(battleInput, &battleInput->textObj[3], strRun, 4, MAKE_TEXT_COLOR(10, 11, 12), 2, 20023, 128, 176, 1, NULL);

    String_Delete(strFight);
    String_Delete(strBag);
    String_Delete(strPokemon);
    String_Delete(strRun);

    if ((BattleSystem_GetBattleType(battleInput->battleSystem) & (0x220)) == 0) {
        Pokemon *pokemon;
        ManagedSprite *v8;
        int v9, v10;

        pokemon = BattleSystem_GetPartyMon(battleInput->battleSystem, v6->battlerId, v6->selectedMon);
        ov12_02268194(battleInput);
        v8 = ov12_022682BC(battleInput, pokemon, v5, v6->hp, v6->maxHp, v6->unk3);

        sub_02013794(battleInput->textObj[0].unk0, &v9, &v10);

        if (v5 == 4) {
            v9 += battleInput->textObj[0].unk20 + 32 / 2;
        } else {
            v9 -= 32 / 2;
        }

        ManagedSprite_SetPositionXYWithSubscreenOffset(v8, v9, v10 - (((192 + 80) << FX32_SHIFT) >> FX32_SHIFT), ((192 + 80) << FX32_SHIFT));

        if (BattleSystem_GetBattleType(battleInput->battleSystem) & BATTLE_TYPE_BUG_CONTEST) {
            Pokemon *caughtMon;
            String *strMonGender;
            String *strFormated;
            MessageFormat *format;
            int var = 0;

            format = BattleSystem_GetMessageFormat(battleInput->battleSystem);
            strFormated = String_New(32, HEAP_ID_BATTLE);
            caughtMon = ov12_0223C134(battleInput->battleSystem);
            if (caughtMon != NULL) {
                int species = GetMonData(caughtMon, MON_DATA_SPECIES, NULL);
                if (species != SPECIES_NONE) {
                    int gender = GetMonGender(caughtMon);

                    switch (gender) {
                    case MON_MALE:
                        strMonGender = NewString_ReadMsgData(msgLoader, 0x4f8);
                        var = 0xc0d00;
                        break;
                    case MON_FEMALE:
                        strMonGender = NewString_ReadMsgData(msgLoader, 0x4f9);
                        var = 0xe0f00;
                        break;
                    default:
                        strMonGender = NULL;
                        break;
                    }

                    if (strMonGender != NULL) {
                        BattleInput_CreateTextObject(battleInput, &battleInput->textObj[4], strMonGender, 0, var, 3, 0x4e37, 0x88, 0x10, 0, 0);
                        String_Delete(strMonGender);
                    }
                    int level = GetMonData(caughtMon, MON_DATA_LEVEL, NULL);
                    BufferIntegerAsString(format, 1, level, 3, PRINTING_MODE_LEFT_ALIGN, 1);
                    String *strMonLevel = NewString_ReadMsgData(msgLoader, 0x4fa);
                    StringExpandPlaceholders(format, strFormated, strMonLevel);
                    BattleInput_CreateTextObject(battleInput, &battleInput->textObj[5], strFormated, 0, 0x90800, 3, 0x4e37, 0x90, 0x10, 0, 0);
                    String_Delete(strMonLevel);
                    ov12_02268440(battleInput, caughtMon);
                }
            }
            int ballsRemaining = BattleSystem_GetSafariBallCount(battleInput->battleSystem);
            BufferIntegerAsString(format, 0, ballsRemaining, 2, PRINTING_MODE_LEFT_ALIGN, 1);
            String *strBallsRemaining = NewString_ReadMsgData(msgLoader, 0x4f7);
            StringExpandPlaceholders(format, strFormated, strBallsRemaining);
            BattleInput_CreateTextObject(battleInput, &battleInput->textObj[6], strFormated, 0, 0x90800, 3, 0x4e37, 0xE0, 0x10, 0, 0);
            String_Delete(strBallsRemaining);
            ov12_0226AC70(battleInput);
            String_Delete(strFormated);
        }
    }
}

void ov12_02267388(BattleInput *battleInput, int param1, int param2) {
    int battlerType = battleInput->menu.main.battlerType;

    ov12_0226739C(battleInput, param1, param2);
    ov12_02266E6C(battleInput, battlerType);
}

void ov12_0226739C(BattleInput *battleInput, int param1, int param2) {
    int battlerType = battleInput->menu.main.battlerType;

    ov12_02266F84(battleInput, param1, param2);

    BgConfig *bgConfig = BattleSystem_GetBgConfig(battleInput->battleSystem);

    FillBgTilemapRect(bgConfig, 4, (0x6000 / 0x20 - 1), 0, 0x10, 32, 8, 17);
    ScheduleBgTilemapBufferTransfer(bgConfig, 5);

    sub_020137C0(battleInput->textObj[1].unk0, 0);
    sub_020137C0(battleInput->textObj[2].unk0, 0);
    sub_020137C0(battleInput->textObj[3].unk0, 0);
}

void ov12_02267404(BattleInput *battleInput, int param1, int param2) {
    int battlerType = battleInput->menu.main.battlerType;

    ov12_02267418(battleInput, param1, param2);
    ov12_02266E6C(battleInput, battlerType);
}

void ov12_02267418(BattleInput *battleInput, int param1, int param2) {
    int battlerType = battleInput->menu.main.battlerType;

    ov12_02266F84(battleInput, param1, param2);

    {
        BgConfig *bgConfig = BattleSystem_GetBgConfig(battleInput->battleSystem);

        FillBgTilemapRect(bgConfig, 4, (0x6000 / 0x20 - 1), 0, 0x10, 10, 8, 17);
        FillBgTilemapRect(bgConfig, 4, (0x6000 / 0x20 - 1), 0x16, 0x10, 10, 8, 17);
        ScheduleBgTilemapBufferTransfer(bgConfig, 5);
    }

    sub_020137C0(battleInput->textObj[1].unk0, 0);
    sub_020137C0(battleInput->textObj[2].unk0, 0);
}

extern __attribute__((aligned(4))) const u16 ov12_0226E308[4][2];
extern __attribute__((aligned(4))) const u16 ov12_0226E2C8[8][2];

void ov12_0226748C(BattleInput *battleInput, int param1, int param2) {
    BattleInputFightMenu *fightMenu;
    int i;
    MsgData *msgLoader;
    BattleInput_UnkSub54 *moveDisplay;
    int ppColor;

    fightMenu = &battleInput->menu.fight;
    GF_ASSERT(fightMenu);

    battleInput->unk6EE = fightMenu->battlerType;

    msgLoader = BattleSystem_GetMessageLoader(battleInput->battleSystem);
    moveDisplay = ov12_02268798(battleInput, fightMenu->battlerType);

    ov12_02268AD0(battleInput);

    BattleInput_CreateTextObject(battleInput, &battleInput->textObj[0], NULL, 4, MAKE_TEXT_COLOR(7, 8, 9), 3, 20023, 64, 45, 1, &moveDisplay->unkMove[0]);
    BattleInput_CreateTextObject(battleInput, &battleInput->textObj[1], NULL, 4, MAKE_TEXT_COLOR(7, 8, 9), 3, 20023, 192, 44, 1, &moveDisplay->unkMove[1]);
    BattleInput_CreateTextObject(battleInput, &battleInput->textObj[2], NULL, 4, MAKE_TEXT_COLOR(7, 8, 9), 3, 20023, 64, 108, 1, &moveDisplay->unkMove[2]);
    BattleInput_CreateTextObject(battleInput, &battleInput->textObj[3], NULL, 4, MAKE_TEXT_COLOR(7, 8, 9), 3, 20023, 192, 107, 1, &moveDisplay->unkMove[3]);

    for (i = 0; i < 4; i++) {
        ppColor = ov12_02269504(fightMenu->pp[i], fightMenu->ppMax[i]);
        BattleInput_CreateTextObject(battleInput, &battleInput->textObj[9 + i], NULL, 0, ppColor, 4, 20023, ov12_0226E308[i][0], ov12_0226E308[i][1], 0, &moveDisplay->unkPp[i]);
        BattleInput_CreateTextObject(battleInput, &battleInput->textObj[5 + i], NULL, 0, ppColor, 4, 20023, ov12_0226E2C8[i][0], ov12_0226E2C8[i][1], 0, &moveDisplay->unkPpMax[i]);
    }

    String *strCancel = NewString_ReadMsgData(msgLoader, 929); // CANCEL
    BattleInput_CreateTextObject(battleInput, &battleInput->textObj[4], strCancel, 4, MAKE_TEXT_COLOR(10, 11, 12), 2, 20023, 128, 175, 1, NULL);
    String_Delete(strCancel);

    int moveType;

    for (i = 0; i < 4; i++) {
        if (fightMenu->moveNo[i] != 0) {
            moveType = GetMoveAttr(fightMenu->moveNo[i], MOVEATTR_TYPE);
            ov12_02268C30(battleInput, moveType, i);
        } else {
            ov12_02268C4C(battleInput, i);
            break;
        }
    }

    BgConfig *bgConfig = BattleSystem_GetBgConfig(battleInput->battleSystem);

    if (fightMenu->moveNo[0] == 0) {
        sub_020137C0(battleInput->textObj[0].unk0, 0);
        sub_020137C0(battleInput->textObj[5].unk0, 0);
        sub_020137C0(battleInput->textObj[9].unk0, 0);
    }

    if (fightMenu->moveNo[1] == 0) {
        sub_020137C0(battleInput->textObj[1].unk0, 0);
        sub_020137C0(battleInput->textObj[6].unk0, 0);
        sub_020137C0(battleInput->textObj[10].unk0, 0);
    }

    if (fightMenu->moveNo[2] == 0) {
        sub_020137C0(battleInput->textObj[2].unk0, 0);
        sub_020137C0(battleInput->textObj[7].unk0, 0);
        sub_020137C0(battleInput->textObj[11].unk0, 0);
    }

    if (fightMenu->moveNo[3] == 0) {
        sub_020137C0(battleInput->textObj[3].unk0, 0);
        sub_020137C0(battleInput->textObj[8].unk0, 0);
        sub_020137C0(battleInput->textObj[12].unk0, 0);
    }
}

void ov12_02267760(BattleInput *battleInput, int param1, int param2) {
    MsgData *msgLoader;
    String *strYes, *strNo;

    msgLoader = BattleSystem_GetMessageLoader(battleInput->battleSystem);
    strYes = NewString_ReadMsgData(msgLoader, 940); // Yes
    strNo = NewString_ReadMsgData(msgLoader, 941);  // No

    BattleInput_CreateTextObject(battleInput, &battleInput->textObj[0], strYes, 4, MAKE_TEXT_COLOR(1, 2, 3), 2, 20023, 128, 67, 1, NULL);
    BattleInput_CreateTextObject(battleInput, &battleInput->textObj[1], strNo, 4, MAKE_TEXT_COLOR(10, 11, 12), 2, 20023, 128, 139, 1, NULL);

    String_Delete(strYes);
    String_Delete(strNo);
}

void ov12_022677FC(BattleInput *battleInput, int param1, int param2) {
    MsgData *msgLoader;
    String *strForget, *strKeep;

    msgLoader = BattleSystem_GetMessageLoader(battleInput->battleSystem);
    strForget = NewString_ReadMsgData(msgLoader, 1181); // Forget a move!
    strKeep = NewString_ReadMsgData(msgLoader, 1182);   // Keep old moves!

    BattleInput_CreateTextObject(battleInput, &battleInput->textObj[0], strForget, 4, MAKE_TEXT_COLOR(1, 2, 3), 2, 20023, 128, 67, 1, NULL);
    BattleInput_CreateTextObject(battleInput, &battleInput->textObj[1], strKeep, 4, MAKE_TEXT_COLOR(10, 11, 12), 2, 20023, 128, 139, 1, NULL);

    String_Delete(strForget);
    String_Delete(strKeep);
}

void ov12_0226789C(BattleInput *battleInput, int param1, int param2) {
    MsgData *msgLoader;
    String *strGiveUp, *strDontGiveUp, *strGiveUpFormated, *v4;
    MessageFormat *strTemplate;
    BattleInputYesNoScreen *yesNoMenu = &battleInput->menu.yesNo;
    msgLoader = BattleSystem_GetMessageLoader(battleInput->battleSystem);
    strTemplate = BattleSystem_GetMessageFormat(battleInput->battleSystem);
    strGiveUp = NewString_ReadMsgData(msgLoader, 1186);     // Give up on {move}?
    strDontGiveUp = NewString_ReadMsgData(msgLoader, 1187); // Don't give up on {move}!
    strGiveUpFormated = String_New(100, HEAP_ID_BATTLE);
    v4 = String_New(100, HEAP_ID_BATTLE);

    BufferMoveName(strTemplate, 0, yesNoMenu->moveNo);
    StringExpandPlaceholders(strTemplate, strGiveUpFormated, strGiveUp);
    StringExpandPlaceholders(strTemplate, v4, strDontGiveUp);

    BattleInput_CreateTextObject(battleInput, &battleInput->textObj[0], strGiveUpFormated, 4, MAKE_TEXT_COLOR(1, 2, 3), 2, 20023, 128, 67, 1, NULL);
    BattleInput_CreateTextObject(battleInput, &battleInput->textObj[1], v4, 4, MAKE_TEXT_COLOR(10, 11, 12), 2, 20023, 128, 139, 1, NULL);

    String_Delete(strGiveUp);
    String_Delete(strDontGiveUp);
    String_Delete(strGiveUpFormated);
    String_Delete(v4);
}

void ov12_02267984(BattleInput *battleInput, int param1, int param2) {
    MsgData *msgLoader;
    String *strStop;

    G2S_SetBlendAlpha(2, 15, 31, 0);

    msgLoader = BattleSystem_GetMessageLoader(battleInput->battleSystem);
    strStop = NewString_ReadMsgData(msgLoader, 1260); // STOP

    BgConfig *bgConfig;
    NNSG2dScreenData *screenData;
    void *v4;

    v4 = GfGfxLoader_GetScrnData(NARC_a_0_0_7, 40, 1, &screenData, HEAP_ID_BATTLE);
    MI_CpuCopy32(screenData->rawData, battleInput->screenBuffer[6], 0x800);
    FreeToHeap(v4);

    bgConfig = BattleSystem_GetBgConfig(battleInput->battleSystem);
    BG_LoadScreenTilemapData(bgConfig, 4, battleInput->screenBuffer[6], 0x800);
    ScheduleBgTilemapBufferTransfer(bgConfig, 4);

    bgConfig = BattleSystem_GetBgConfig(battleInput->battleSystem);

    MI_CpuClear32(battleInput->screenBuffer[4], 0x800);
    BG_LoadScreenTilemapData(bgConfig, 5, battleInput->screenBuffer[4], 0x800);
    ScheduleBgTilemapBufferTransfer(bgConfig, 5);

    BattleInput_CreateTextObject(battleInput, &battleInput->textObj[0], strStop, 4, MAKE_TEXT_COLOR(1, 2, 3), 2, 20023, 128, 171, 1, NULL);
    String_Delete(strStop);
}

void ov12_02267A58(BattleInput *battleInput, int param1, int param2) {
    MsgData *msgLoader;
    String *strNextPokemon, *strFlee, *strNextPokemonFormated, *v4;
    MessageFormat *strTemplate;
    BattleInputYesNoScreen *v6;

    v6 = &battleInput->menu.yesNo;
    msgLoader = BattleSystem_GetMessageLoader(battleInput->battleSystem);
    strTemplate = BattleSystem_GetMessageFormat(battleInput->battleSystem);
    strNextPokemon = NewString_ReadMsgData(msgLoader, 1217); // Use next Pokémon
    strFlee = NewString_ReadMsgData(msgLoader, 1218);        // Flee
    strNextPokemonFormated = String_New(100, HEAP_ID_BATTLE);
    v4 = String_New(100, HEAP_ID_BATTLE);

    BufferMoveName(strTemplate, 0, v6->moveNo);
    StringExpandPlaceholders(strTemplate, strNextPokemonFormated, strNextPokemon);
    StringExpandPlaceholders(strTemplate, v4, strFlee);

    BattleInput_CreateTextObject(battleInput, &battleInput->textObj[0], strNextPokemonFormated, 4, MAKE_TEXT_COLOR(1, 2, 3), 2, 20023, 128, 67, 1, NULL);
    BattleInput_CreateTextObject(battleInput, &battleInput->textObj[1], v4, 4, MAKE_TEXT_COLOR(10, 11, 12), 2, 20023, 128, 139, 1, NULL);

    String_Delete(strNextPokemon);
    String_Delete(strFlee);
    String_Delete(strNextPokemonFormated);
    String_Delete(v4);
}

void ov12_02267B40(BattleInput *battleInput, int param1, int param2) {
    MsgData *msgLoader;
    String *strSwitchPokemon, *strKeepBattling, *strSwitchtPokemonFormated, *v4;
    MessageFormat *strTemplate;
    BattleInputYesNoScreen *v6;

    v6 = &battleInput->menu.yesNo;
    msgLoader = BattleSystem_GetMessageLoader(battleInput->battleSystem);
    strTemplate = BattleSystem_GetMessageFormat(battleInput->battleSystem);
    strSwitchPokemon = NewString_ReadMsgData(msgLoader, 1215); // Switch Pokémon
    strKeepBattling = NewString_ReadMsgData(msgLoader, 1216);  // Keep battling
    strSwitchtPokemonFormated = String_New(100, HEAP_ID_BATTLE);
    v4 = String_New(100, HEAP_ID_BATTLE);

    BufferMoveName(strTemplate, 0, v6->moveNo);
    StringExpandPlaceholders(strTemplate, strSwitchtPokemonFormated, strSwitchPokemon);
    StringExpandPlaceholders(strTemplate, v4, strKeepBattling);

    BattleInput_CreateTextObject(battleInput, &battleInput->textObj[0], strSwitchtPokemonFormated, 4, MAKE_TEXT_COLOR(1, 2, 3), 2, 20023, 128, 67, 1, NULL);
    BattleInput_CreateTextObject(battleInput, &battleInput->textObj[1], v4, 4, MAKE_TEXT_COLOR(10, 11, 12), 2, 20023, 128, 139, 1, NULL);

    String_Delete(strSwitchPokemon);
    String_Delete(strKeepBattling);
    String_Delete(strSwitchtPokemonFormated);
    String_Delete(v4);
}

// note: these two are the same array
extern __attribute__((aligned(4))) u16 ov12_0226E37C[5][2];
extern __attribute__((aligned(4))) u16 ov12_0226E370[][2];
void ov12_02267C24(BattleInput *battleInput, int param1, int param2) {
    BattleInputTargetScreen *pokemonMenu;
    int i;
    MsgData *msgLoader;
    u8 v3[4];
    String *v4, *genderMarker;
    Pokemon *pokemon;
    BoxPokemon *boxMon;
    MessageFormat *stringTemplate;
    int v9;
    u8 v10[6];
    u8 v11[6];
    int v12;

    pokemonMenu = &battleInput->menu.target;

    battleInput->unk6F0 = pokemonMenu->selectionType;
    battleInput->unk6EE = pokemonMenu->battlerType;

    msgLoader = BattleSystem_GetMessageLoader(battleInput->battleSystem);
    stringTemplate = BattleSystem_GetMessageFormat(battleInput->battleSystem);

    ov12_02268DD4(battleInput, v3, 0);
    ov12_02268194(battleInput);
    ov12_022686BC(battleInput);
    ov12_0223C1C4(battleInput->battleSystem, v10);
    ov12_0223C1A0(battleInput->battleSystem, v11);

    v4 = String_New((12 + 2 + (5 * 2)), HEAP_ID_BATTLE);

    for (i = 0; i < 4; i++) {
        v12 = v11[2 + i];

        if ((pokemonMenu->targetMons[v12].hide == 1) && (v3[i] == 1)) {
            if (pokemonMenu->targetMons[v12].gender == 0) {
                genderMarker = NewString_ReadMsgData(msgLoader, 962); // ♂
            } else if (pokemonMenu->targetMons[v12].gender == 1) {
                genderMarker = NewString_ReadMsgData(msgLoader, 963); // ♀
            } else {
                genderMarker = NewString_ReadMsgData(msgLoader, 964); //(genderless)
            }

            pokemon = BattleSystem_GetPartyMon(battleInput->battleSystem, v12, pokemonMenu->targetMons[v12].selectedMon);
            boxMon = Mon_GetBoxMon(pokemon);

            BufferBoxMonNickname(stringTemplate, 0, boxMon);
            StringExpandPlaceholders(stringTemplate, v4, genderMarker);

            if (i & 1) {
                v9 = MAKE_TEXT_COLOR(1, 2, 3);
            } else {
                v9 = MAKE_TEXT_COLOR(4, 5, 6);
            }

            BattleInput_CreateTextObject(battleInput, &battleInput->textObj[0 + i], v4, 4, v9, 6, 20023, ov12_0226E370[i][0], ov12_0226E370[i][1], 1, NULL);
            String_Delete(genderMarker);

            {
                switch (i) {
                case 1:
                    ov12_022682BC(battleInput, pokemon, 3, pokemonMenu->targetMons[v12].hp, pokemonMenu->targetMons[v12].hpMax, pokemonMenu->targetMons[v12].status);
                    break;
                case 3:
                    ov12_022682BC(battleInput, pokemon, 5, pokemonMenu->targetMons[v12].hp, pokemonMenu->targetMons[v12].hpMax, pokemonMenu->targetMons[v12].status);
                    break;
                }
            }
        } else {
            if (v3[i] == 0) {
                ov12_02268CA0(battleInput, i);
            }
        }
    }

    String_Delete(v4);

    String *strCancel = NewString_ReadMsgData(msgLoader, 930); // CANCEL
    BattleInput_CreateTextObject(battleInput, &battleInput->textObj[4], strCancel, 4, MAKE_TEXT_COLOR(10, 11, 12), 2, 20023, ov12_0226E37C[1][0], ov12_0226E37C[1][1], 1, NULL);
    String_Delete(strCancel);
}

extern __attribute__((aligned(4))) s16 ov12_0226E3D8[][3];
extern __attribute__((aligned(4))) u8 ov12_0226E318[][4];
extern __attribute__((aligned(4))) S16Pos ov12_0226E2D8[];
int ov12_02267E14(BattleInput *battleInput, int param1, int param2) {
    int textObjId, frameType, battler;

    battler = 0xff;

    switch (param1) {
    case 0xffffffff:
    default:
        return param1;
    case 1:
        textObjId = 0;
        frameType = 0;

        switch (battleInput->unk6EE) {
        case 0:
            battler = battleInput->unk6EE;
            break;
        case 2:
        case 4:
            battler = battleInput->unk6EE - 2;
            break;
        }
        break;
    case 2:
        textObjId = 1;
        frameType = 1;
        break;
    case 3:
        textObjId = 2;
        frameType = 1;
        break;
    case 4:
        textObjId = 3;
        frameType = 1;
        break;
    }

    ov12_02268EE0(battleInput, param2);
    ov12_02268E84(ov12_02268F58, battleInput);

    battleInput->unk700.unk.unk4 = ov12_0226E3D8[param1 - 1];
    battleInput->unk700.unk.unk8 = &ov12_0226E318[param1 - 1];
    battleInput->unk700.unk.unk10 = 1;
    battleInput->unk700.unk.ret = param1;
    battleInput->unk700.unk.unk11 = textObjId;
    battleInput->unk700.unk.unk12 = battler;
    battleInput->unk700.unk.unk13 = frameType;
    battleInput->unk700.unk.pos = ov12_0226E2D8[param1 - 1];
    battleInput->unk700.unk.unk14 = 1;

    return param1;
}

extern __attribute__((aligned(4))) s16 ov12_0226E428[5][3];
extern __attribute__((aligned(4))) const TouchscreenHitbox ov12_0226E398[5];

int ov12_02267EF0(BattleInput *battleInput, int param1, int param2) {
    BattleInputFightMenu *moveMenu;
    u32 v2;
    s16 *offsets;
    const void *touchscreenRect;

    if (param1 == 0xffffffff) {
        return param1;
    }

    moveMenu = &battleInput->menu.fight;

    if ((param1 >= 1) && (param1 <= 4)) {
        if (moveMenu->moveNo[param1 - 1] == 0) {
            return 0xffffffff;
        }
    }

    v2 = param1 - 1;

    switch (param1) {
    case 0xffffffff:
    default:
        return 0xffffffff;
    case 1:
    case 2:
    case 3:
    case 4:
        offsets = ov12_0226E428[param1 - 1];
        touchscreenRect = &ov12_0226E398[param1 - 1];
        break;
    case 0xff:
        offsets = ov12_0226E428[4];
        touchscreenRect = &ov12_0226E398[4];
        break;
    }

    ov12_02268EE0(battleInput, param2);
    ov12_02268E84(ov12_022690A8, battleInput);

    battleInput->unk700.unk.unk4 = offsets;
    battleInput->unk700.unk.unk8 = touchscreenRect;
    battleInput->unk700.unk.unk10 = 3;
    battleInput->unk700.unk.ret = param1;
    battleInput->unk700.unk.unk14 = 1;

    return param1;
}

extern __attribute__((aligned(4))) s16 ov12_0226E286[2][3];
extern __attribute__((aligned(4))) u8 ov12_0226E24C[2][4];

int ov12_02267FA0(BattleInput *battleInput, int param1, int param2) {
    int textObjId;

    switch (param1) {
    case 0xffffffff:
    default:
        return param1;
    case 1:
        textObjId = 0;
        break;
    case 0xff:
        textObjId = 1;
        break;
    }

    ov12_02268EE0(battleInput, param2);
    ov12_02268E84(ov12_02268F58, battleInput);

    if (param1 == 1) {
        battleInput->unk700.unk.unk4 = ov12_0226E286[1];
        battleInput->unk700.unk.unk8 = &ov12_0226E24C[1];
    } else {
        battleInput->unk700.unk.unk4 = ov12_0226E286[0];
        battleInput->unk700.unk.unk8 = &ov12_0226E24C[0];
    }

    battleInput->unk700.unk.unk10 = 6;
    battleInput->unk700.unk.ret = param1;
    battleInput->unk700.unk.unk11 = textObjId;
    battleInput->unk700.unk.unk13 = 3;
    battleInput->unk700.unk.unk14 = 1;

    return param1;
}

extern __attribute__((aligned(4))) s16 ov12_0226E408[][3];
extern TouchscreenHitbox ov12_0226E348[];

int ov12_02268024(BattleInput *battleInput, int param1, int param2) {
    BattleInputTargetScreen *pokemonMenu;
    u8 moveRange[4];

    pokemonMenu = &battleInput->menu.target;

    ov12_02268DD4(battleInput, moveRange, 1);

    switch (param1) {
    case -1:
    default:
        return param1;
    case 1:
        if (moveRange[2 - 2] == 0) {
            return -1;
        }
        break;
    case 2:
        if (moveRange[3 - 2] == 0) {
            return -1;
        }
        break;
    case 3:
        if (moveRange[4 - 2] == 0) {
            return -1;
        }
        break;
    case 4:
        if (moveRange[5 - 2] == 0) {
            return -1;
        }
        break;
    case 0xff:
        ov12_02268EE0(battleInput, 4);
        ov12_02268E84(ov12_02268F58, battleInput);

        battleInput->unk700.unk.unk4 = ov12_0226E408[4];
        battleInput->unk700.unk.unk8 = &ov12_0226E348[4];
        battleInput->unk700.unk.unk10 = 4;
        battleInput->unk700.unk.ret = param1;
        battleInput->unk700.unk.unk11 = 4;
        battleInput->unk700.unk.unk13 = 3;
        battleInput->unk700.unk.unk14 = 1;

        return param1;
    }

    {
        BgConfig *bgConfig;

        bgConfig = BattleSystem_GetBgConfig(battleInput->battleSystem);
        BgFillTilemapBufferAndCommit(bgConfig, 5, (0x6000 / 0x20 - 1));
        ScheduleBgTilemapBufferTransfer(bgConfig, 5);
    }

    ov12_02268EDC(battleInput, param1);
    ov12_02268E84(ov12_02269360, battleInput);

    battleInput->unk700.monSelect.ret = param1;

    return param1;
}

extern s16 ov12_0226E228[];
extern TouchscreenHitbox ov12_0226E20C[];

int ov12_02268130(BattleInput *battleInput, int param1, int param2) {
    switch (param1) {
    case 0xffffffff:
    default:
        return param1;
    case 1:
        break;
    }

    ov12_02268EE0(battleInput, param2);
    ov12_02268E84(ov12_02268F58, battleInput);

    battleInput->unk700.unk.unk4 = ov12_0226E228;
    battleInput->unk700.unk.unk8 = &ov12_0226E20C[0];
    battleInput->unk700.unk.unk10 = 6;
    battleInput->unk700.unk.ret = param1;
    battleInput->unk700.unk.unk11 = 0;
    battleInput->unk700.unk.unk13 = 3;
    battleInput->unk700.unk.unk14 = 0;

    return param1;
}

void ov12_02268194(BattleInput *battleInput) {
    SpriteSystem *spriteSystem;
    SpriteManager *spriteManager;
    PaletteData *palette;

    spriteSystem = BattleSystem_GetSpriteSystem(battleInput->battleSystem);
    spriteManager = BattleSystem_GetSpriteManager(battleInput->battleSystem);
    palette = BattleSystem_GetPaletteData(battleInput->battleSystem);

    SpriteSystem_LoadPaletteBuffer(palette, PLTTBUF_SUB_OBJ, spriteSystem, spriteManager, NARC_poketool_icongra_poke_icon, sub_02074490(), 0, 3, NNS_G2D_VRAM_TYPE_2DSUB, 20022);
    SpriteSystem_LoadCellResObj(spriteSystem, spriteManager, NARC_poketool_icongra_poke_icon, sub_02074498(), 0, 20021);
    SpriteSystem_LoadAnimResObj(spriteSystem, spriteManager, NARC_poketool_icongra_poke_icon, sub_020744A4(), 0, 20021);
}

void ov12_02268214(BattleInput *battleInput) {
    SpriteManager *spriteManager = BattleSystem_GetSpriteManager(battleInput->battleSystem);

    SpriteManager_UnloadCharObjById(spriteManager, 20036);
    SpriteManager_UnloadCharObjById(spriteManager, 20037);
    SpriteManager_UnloadCharObjById(spriteManager, 20038);
    SpriteManager_UnloadCellObjById(spriteManager, 20021);
    SpriteManager_UnloadAnimObjById(spriteManager, 20021);
    SpriteManager_UnloadPlttObjById(spriteManager, 20022);
}

void ov12_02268264(BattleInput *battleInput) {
    int i;

    for (i = 0; i < 4; i++) {
        if (battleInput->unk6C0[i] != NULL) {
            Sprite_DeleteAndFreeResources(battleInput->unk6C0[i]);
            battleInput->unk6C0[i] = NULL;
        }

        if (battleInput->unk6D0[i] != NULL) {
            SysTask_Destroy(battleInput->unk6D0[i]);
            battleInput->unk6D0[i] = NULL;
        }
    }

    if (battleInput->unk_6EC != NULL) {
        Sprite_DeleteAndFreeResources(battleInput->unk_6EC);
        battleInput->unk_6EC = NULL;
    }
}

extern ManagedSpriteTemplate ov12_0226E4E4;
extern __attribute__((aligned(4))) u16 ov12_0226E328[][2];

ManagedSprite *ov12_022682BC(BattleInput *battleInput, Pokemon *pokemon, int battlerType, int hp, int maxHp, int status) {
    SpriteSystem *spriteSystem;
    SpriteManager *spriteManager;
    u32 v2;
    ManagedSpriteTemplate spriteTemplate;
    ManagedSprite *sprite;
    int battler;

    if (battlerType >= 2) {
        battler = battlerType - 2;
    } else {
        battler = battlerType;
    }

    GF_ASSERT(battleInput->unk6C0[battler] == 0);
    GF_ASSERT(battleInput->unk6D0[battler] == 0);

    switch (battlerType) {
    case BATTLER_TYPE_SOLO_PLAYER:
    case BATTLER_TYPE_PLAYER_SIDE_SLOT_1:
    case BATTLER_TYPE_PLAYER_SIDE_SLOT_2:
        v2 = 20036;
        break;
    case BATTLER_TYPE_ENEMY_SIDE_SLOT_1:
        v2 = 20037;
        break;
    case BATTLER_TYPE_ENEMY_SIDE_SLOT_2:
        v2 = 20038;
        break;
    default:
        GF_ASSERT(0);
        return NULL;
    }

    spriteSystem = BattleSystem_GetSpriteSystem(battleInput->battleSystem);
    spriteManager = BattleSystem_GetSpriteManager(battleInput->battleSystem);

    SpriteSystem_LoadCharResObj(spriteSystem, spriteManager, NARC_poketool_icongra_poke_icon, Pokemon_GetIconNaix(pokemon), 0, NNS_G2D_VRAM_TYPE_2DSUB, v2);

    spriteTemplate = ov12_0226E4E4;
    spriteTemplate.resIdList[0] = v2;
    spriteTemplate.x = ov12_0226E328[battler][0];
    spriteTemplate.y = ov12_0226E328[battler][1];
    sprite = SpriteSystem_NewSprite(spriteSystem, spriteManager, &spriteTemplate);

    ManagedSprite_SetPositionXYWithSubscreenOffset(sprite, spriteTemplate.x, spriteTemplate.y, ((192 + 80) << FX32_SHIFT));
    Sprite_SetPalOffsetRespectVramOffset(sprite->sprite, Pokemon_GetIconPalette(pokemon));

    {
        int v6 = 0;

        if ((hp == 0) || (status == 2)) {
            v6 = 0;
        } else if (status == 3) {
            v6 = 5;
        } else {
            switch (CalculateHpBarColor(hp, maxHp, (8 * 6))) {
            case 4:
                v6 = 1;
                break;
            case 3:
                v6 = 2;
                break;
            case 2:
                v6 = 3;
                break;
            case 1:
                v6 = 4;
                break;
            }

            ManagedSprite_SetAnim(sprite, v6);
        }
    }

    ManagedSprite_TickFrame(sprite);

    battleInput->unk6C0[battler] = sprite;
    battleInput->unk6D0[battler] = SysTask_CreateOnMainQueue(ov12_022684EC, sprite, 1300);

    return sprite;
}

ManagedSprite *ov12_02268440(BattleInput *battleInput, Pokemon *pokemon) {
    GF_ASSERT(battleInput->unk_6EC == 0);

    SpriteSystem *spriteSystem = BattleSystem_GetSpriteSystem(battleInput->battleSystem);
    SpriteManager *spriteManager = BattleSystem_GetSpriteManager(battleInput->battleSystem);

    SpriteSystem_LoadCharResObj(spriteSystem, spriteManager, NARC_poketool_icongra_poke_icon, Pokemon_GetIconNaix(pokemon), 0, NNS_G2D_VRAM_TYPE_2DSUB, 20039);

    ManagedSpriteTemplate spriteTemplate = ov12_0226E4E4;
    spriteTemplate.resIdList[0] = 20039;
    spriteTemplate.x = 0x78;
    spriteTemplate.y = 8;
    ManagedSprite *sprite = SpriteSystem_NewSprite(spriteSystem, spriteManager, &spriteTemplate);

    ManagedSprite_SetPositionXYWithSubscreenOffset(sprite, spriteTemplate.x, spriteTemplate.y, 0x110000);

    Sprite_SetPalOffsetRespectVramOffset(sprite->sprite, Pokemon_GetIconPalette(pokemon));

    ManagedSprite_TickFrame(sprite);

    battleInput->unk_6EC = sprite;
    return sprite;
}

void ov12_022684EC(SysTask *task, void *data) {
    ManagedSprite_TickFrame((ManagedSprite *)data);
}

int ov12_022684F8(u8 task) {
    int animationState;

    switch (task) {
    case 0:
    default:
        animationState = 0;
        break;
    case 1:
        animationState = 1;
        break;
    case 2:
        animationState = 3;
        break;
    case 3:
        animationState = 2;
        break;
    }

    return animationState;
}

void ov12_02268520(String *str, u32 fontId, int *widthOut, int *charWidthOut) {
    int width, charWidth;

    width = FontID_String_GetWidth(fontId, str, 0);
    charWidth = width / 8;

    if (FX_ModS32(width, 8) != 0) {
        charWidth++;
    }

    *widthOut = width;
    *charWidthOut = charWidth;
}

void BattleInput_CreateTextObject(BattleInput *battleInput, BattleInputTextObject *textObj, String *str, u32 fontId, int textColor, int param5, int param6, int x, int y, int param9, BattleInput_UnkSub54_Unk28 *param10) {
    FontOAMInitData fontInit;
    Window window;
    UnkStruct_02021AC8 charTransferAlloc;
    int size;
    FontOAM *fontOAM;
    BgConfig *bgConfig;
    SpriteManager *spriteManager;
    int v7, v8;

    GF_ASSERT(textObj->unk0 == NULL);

    spriteManager = BattleSystem_GetSpriteManager(battleInput->battleSystem);
    bgConfig = BattleSystem_GetBgConfig(battleInput->battleSystem);

    if (param10 == NULL) {
        ov12_02268520(str, fontId, &v7, &v8);
    } else {
        v7 = param10->unkE;
        v8 = param10->unkC;
    }

    if (param10 == NULL) {
        InitWindow(&window);
        AddTextWindowTopLeftCorner(bgConfig, &window, v8, 16 / 8, 0, 0);
        AddTextPrinterParameterizedWithColorAndSpacing(&window, fontId, str, 0, 0, 0xFF, textColor, 0, 0, NULL);
    } else {
        window = param10->window;
    }

    size = sub_02013688(&window, NNS_G2D_VRAM_TYPE_2DSUB, 5);
    sub_02021AC8(size, 1, NNS_G2D_VRAM_TYPE_2DSUB, &charTransferAlloc);

    if (param9 == 1) {
        x -= v7 / 2;
    }

    y += (((192 + 80) << FX32_SHIFT) >> FX32_SHIFT) - 8;

    fontInit.unk_00 = battleInput->unk574;
    fontInit.unk_04 = &window;
    fontInit.unk_08 = SpriteManager_GetSpriteList(spriteManager);
    fontInit.unk_0C = SpriteManager_FindPlttResourceProxy(spriteManager, param6);
    fontInit.unk_10 = NULL;
    fontInit.unk_14 = charTransferAlloc.offset;
    fontInit.unk_18 = x;
    fontInit.unk_1C = y;
    fontInit.unk_20 = 0;
    fontInit.unk_24 = 100;
    fontInit.unk_28 = NNS_G2D_VRAM_TYPE_2DSUB;
    fontInit.unk_2C = 5;

    fontOAM = sub_020135D8(&fontInit);

    sub_020138E0(fontOAM, param5);
    sub_020136B4(fontOAM, x, y);

    if (param10 == NULL) {
        RemoveWindow(&window);
    }

    textObj->unk0 = fontOAM;
    textObj->unk4 = charTransferAlloc;
    textObj->unk20 = v7;
}

void ov12_02268684(BattleInput *battleInput) {
    for (int i = 0; i < 13; i++) {
        if (battleInput->textObj[i].unk0 != NULL) {
            sub_02013660(battleInput->textObj[i].unk0);
            sub_02021B5C(&battleInput->textObj[i].unk4);
            battleInput->textObj[i].unk0 = NULL;
        }
    }
}

void ov12_022686BC(BattleInput *battleInput) {
    u8 moveRange[4], hitsMultiple[4];
    int j, i;
    u16 *src, *v5;
    BgConfig *bgConfig;

    bgConfig = BattleSystem_GetBgConfig(battleInput->battleSystem);
    src = GetBgTilemapBuffer(bgConfig, 5);

    ov12_02268DD4(battleInput, moveRange, 0);

    if (moveRange[0] == 1) {
        ov12_02268E2C(battleInput, 1, hitsMultiple, 0);

        if (hitsMultiple[3 - 1] == 1) {
            for (i = 12; i <= 16; i++) {
                v5 = &src[i * 32];

                for (j = 0xf; j <= 0x10; j++) {
                    v5[j] = 0x2a4;
                }
            }
        }

        if (hitsMultiple[4 - 1] == 1) {
            for (i = 10; i <= 10; i++) {
                v5 = &src[i * 32];

                for (j = 2; j <= 12; j++) {
                    v5[j] = 0x2a4;
                }
            }
        }
    }

    if (moveRange[1] == 1) {
        ov12_02268E2C(battleInput, 2, hitsMultiple, 0);

        if (hitsMultiple[3 - 1] == 1) {
            for (i = 10; i <= 10; i++) {
                v5 = &src[i * 32];

                for (j = 0x13; j <= 0x1d; j++) {
                    v5[j] = 0x2a4;
                }
            }
        }

        if (hitsMultiple[4 - 1] == 1) {
            for (i = 3; i <= 7; i++) {
                v5 = &src[i * 32];

                for (j = 0xf; j <= 0x10; j++) {
                    v5[j] = 0x2a4;
                }
            }
        }
    }
}

BattleInput_UnkSub54 *ov12_02268798(BattleInput *battleInput, int battlerId) {
    if (battlerId >= 2) {
        battlerId -= 2;
    }

    return &battleInput->unk54[battlerId];
}

void ov12_022687AC(BattleInput *battleInput) {
    int j, i;

    for (i = 0; i < 4; i++) {
        for (j = 0; j < 4; j++) {
            FreeToHeap(battleInput->unk54[i].typeIcon[j]);

            if (battleInput->unk54[i].unkMove[j].window.pixelBuffer != NULL) {
                RemoveWindow(&battleInput->unk54[i].unkMove[j].window);
            }

            if (battleInput->unk54[i].unkPp[j].window.pixelBuffer != NULL) {
                RemoveWindow(&battleInput->unk54[i].unkPp[j].window);
            }

            if (battleInput->unk54[i].unkPpMax[j].window.pixelBuffer != NULL) {
                RemoveWindow(&battleInput->unk54[i].unkPpMax[j].window);
            }
        }
    }
}

void ov12_0226885C(BattleInput *battleInput, int battlerId, const BattleInputMove *moveDisplay) {
    BattleInput_UnkSub54 *moveDisplayObj;
    void *charData;
    NNSG2dCharacterData *charDataNNS;
    int i, v3, moveType;
    String *moveName;
    String *v7;
    String *v8;
    String *v9;
    void *v10;
    int ppColor;
    MsgData *v12;

    v12 = BattleSystem_GetMessageLoader(battleInput->battleSystem);
    moveDisplayObj = ov12_02268798(battleInput, battlerId);
    v3 = sub_0208805C(6);
    v9 = NewString_ReadMsgData(v12, 938); // PP
    v10 = BattleSystem_GetMessageFormat(battleInput->battleSystem);
    v7 = String_New(((2 + 2 + 1 + 2) * 2 + 2), HEAP_ID_BATTLE);
    v8 = NewString_ReadMsgData(v12, 937); // '/'

    for (i = 0; i < 4; i++) {
        if ((moveDisplay->moveNo[i] != moveDisplayObj->move.moveNo[i]) && (moveDisplay->moveNo[i] != 0)) {
            moveType = GetMoveAttr(moveDisplay->moveNo[i], MOVEATTR_TYPE);
            charData = GfGfxLoader_GetCharData(sub_020776B4(), sub_02077678(moveType), 1, &charDataNNS, HEAP_ID_BATTLE);
            MI_CpuCopy32(charDataNNS->pRawData, moveDisplayObj->typeIcon[i], v3);
            FreeToHeap(charData);
        }

        if ((moveDisplayObj->unkMove[i].window.pixelBuffer == NULL) || ((moveDisplay->moveNo[i] != moveDisplayObj->move.moveNo[i]) && (moveDisplay->moveNo[i] != 0))) {
            moveName = GetMoveName(moveDisplay->moveNo[i], HEAP_ID_BATTLE);
            ov12_02268A64(battleInput, moveName, 4, &moveDisplayObj->unkMove[i], MAKE_TEXT_COLOR(7, 8, 9));
            String_Delete(moveName);
        }

        if ((moveDisplayObj->unkPp[i].window.pixelBuffer == NULL) || (moveDisplayObj->unkPpMax[i].window.pixelBuffer == NULL) || (moveDisplay->moveNo[i] != 0) || (moveDisplay->moveNo[i] != moveDisplayObj->move.moveNo[i]) || (moveDisplay->pp[i] != moveDisplayObj->move.pp[i]) || (moveDisplay->ppMax[i] != moveDisplayObj->move.ppMax[i])) {
            BufferIntegerAsString(v10, 0, moveDisplay->pp[i], 2, PRINTING_MODE_RIGHT_ALIGN, 0);
            BufferIntegerAsString(v10, 1, moveDisplay->ppMax[i], 2, PRINTING_MODE_RIGHT_ALIGN, 0);
            StringExpandPlaceholders(v10, v7, v8);

            ppColor = ov12_02269504(moveDisplay->pp[i], moveDisplay->ppMax[i]);

            if ((moveDisplayObj->unkPp[i].window.pixelBuffer == NULL) || (moveDisplay->moveNo[i] != moveDisplayObj->move.moveNo[i]) || (moveDisplay->pp[i] != moveDisplayObj->move.pp[i])) {
                ov12_02268A64(battleInput, v7, 0, &moveDisplayObj->unkPp[i], ppColor);
            }

            if ((moveDisplayObj->unkPpMax[i].window.pixelBuffer == NULL) || (moveDisplay->moveNo[i] != moveDisplayObj->move.moveNo[i]) || (moveDisplay->pp[i] != moveDisplayObj->move.pp[i])) {
                ov12_02268A64(battleInput, v9, 0, &moveDisplayObj->unkPpMax[i], ppColor);
            }
        }
    }

    String_Delete(v9);
    String_Delete(v8);
    String_Delete(v7);

    moveDisplayObj->move = *moveDisplay;
}

void ov12_02268A64(BattleInput *battleInput, String *moveName, u32 param2, BattleInput_UnkSub54_Unk28 *param3, int textColor) {
    int length, charLength;

    ov12_02268520(moveName, param2, &length, &charLength);

    param3->unkE = length;
    param3->unkC = charLength;

    if (param3->window.pixelBuffer != NULL) {
        RemoveWindow(&param3->window);
    }

    InitWindow(&param3->window);
    AddTextWindowTopLeftCorner(BattleSystem_GetBgConfig(battleInput->battleSystem), &param3->window, charLength, 16 / 8, 0, 0);
    AddTextPrinterParameterizedWithColorAndSpacing(&param3->window, param2, moveName, 0, 0, 0xFF, textColor, 0, 0, NULL);
}

extern ManagedSpriteTemplate ov12_0226E4B0;
extern __attribute__((aligned(4))) u16 ov12_0226E2B8[][2];
void ov12_02268AD0(BattleInput *battleInput) {
    int i;
    SpriteSystem *renderer;
    SpriteManager *spriteManager;
    ManagedSpriteTemplate typeIconTemplate;
    BattleInputFightMenu *moveMenu;
    int type;
    BattleInput_UnkSub54 *moveDisplayObj;

    moveMenu = &battleInput->menu.fight;
    renderer = BattleSystem_GetSpriteSystem(battleInput->battleSystem);
    spriteManager = BattleSystem_GetSpriteManager(battleInput->battleSystem);
    moveDisplayObj = ov12_02268798(battleInput, battleInput->unk6EE);
    typeIconTemplate = ov12_0226E4B0;

    for (i = 0; i < 4; i++) {
        GF_ASSERT(battleInput->unk6A0[i] == 0);

        if (moveMenu->moveNo[i] != 0) {
            type = GetMoveAttr(moveMenu->moveNo[i], MOVEATTR_TYPE);
            typeIconTemplate.resIdList[0] = 20025 + i;
            typeIconTemplate.x = ov12_0226E2B8[i][0];
            typeIconTemplate.y = ov12_0226E2B8[i][1];

            battleInput->unk6A0[i] = sub_020777C8(renderer, spriteManager, type, &typeIconTemplate);

            ManagedSprite_SetPositionXYWithSubscreenOffset(battleInput->unk6A0[i], typeIconTemplate.x, typeIconTemplate.y, ((192 + 80) << FX32_SHIFT));

            NNSG2dImageProxy *proxy = Sprite_GetImageProxy(battleInput->unk6A0[i]->sprite);

            MI_CpuCopy16(moveDisplayObj->typeIcon[i], (void *)(G2S_GetOBJCharPtr() + (u32)proxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DSUB]), sub_0208805C(6));
        }
    }
}

void ov12_02268BB8(BattleInput *battleInput) {
    int i;
    SpriteSystem *renderer;
    SpriteManager *spriteManager;

    renderer = BattleSystem_GetSpriteSystem(battleInput->battleSystem);
    spriteManager = BattleSystem_GetSpriteManager(battleInput->battleSystem);

    for (i = 0; i < 4; i++) {
        if (battleInput->unk6A0[i] != NULL) {
            sub_020777F8(battleInput->unk6A0[i]);
            battleInput->unk6A0[i] = NULL;
        }
    }
}

void ov12_02268BEC(BattleInput *battleInput) {
    int i;
    SpriteSystem *renderer;
    SpriteManager *spriteManager;

    renderer = BattleSystem_GetSpriteSystem(battleInput->battleSystem);
    spriteManager = BattleSystem_GetSpriteManager(battleInput->battleSystem);

    for (i = 0; i < 4; i++) {
        if (battleInput->unk6B0[i] != NULL) {
            sub_02077870(battleInput->unk6B0[i]);
            sub_02077868(spriteManager, 20029 + i);
            battleInput->unk6B0[i] = NULL;
        }
    }
}

void ov12_02268C30(BattleInput *battleInput, int moveType, int movePos) {
    ov06_0221BA1C(BattleSystem_GetPaletteData(battleInput->battleSystem), moveType, HEAP_ID_BATTLE, PLTTBUF_SUB_BG, 8 + movePos);
}

extern __attribute__((aligned(4))) s16 ov12_0226E258[];
extern TouchscreenHitbox ov12_0226E2A8[];
void ov12_02268C4C(BattleInput *battleInput, int movePos) {
    PaletteData *palette;
    int i;

    palette = BattleSystem_GetPaletteData(battleInput->battleSystem);

    for (i = movePos; i < 4; i++) {
        ov12_02268EE4(battleInput, &ov12_0226E258[i], &ov12_0226E2A8[i], 3, 0);
        PaletteData_LoadPalette(palette, &battleInput->paletteBuffer[0xe * 16], PLTTBUF_SUB_BG, (8 + i) * 16, 0x20);
    }
}

// Temporary for decomp purposes
typedef struct TempBattleInputStruct {
    u8 unk_00[2][1];
    u8 unk_02[4];
    u8 unk_06[4];
} TempBattleInputStruct;

extern __attribute__((aligned(4))) TempBattleInputStruct ov12_0226E1FC;
extern __attribute__((aligned(4))) s16 ov12_0226E238[];
extern TouchscreenHitbox ov12_0226E2F8[];
void ov12_02268CA0(BattleInput *battleInput, int param1) {
    PaletteData *palette;
    u8 paletteNo[4]; // ={ 6, 12, 13, 5 };

    // Temporary for decomp purposes
    u8 tmp1, tmp2;
    paletteNo[0] = ov12_0226E1FC.unk_06[0];
    paletteNo[1] = ov12_0226E1FC.unk_06[1];
    tmp1 = ov12_0226E1FC.unk_06[2];
    tmp2 = ov12_0226E1FC.unk_06[3];
    paletteNo[2] = tmp1;
    paletteNo[3] = tmp2;
    //

    BgConfig *bgConfig = BattleSystem_GetBgConfig(battleInput->battleSystem);
    palette = BattleSystem_GetPaletteData(battleInput->battleSystem);

    ov12_02268EE4(battleInput, &ov12_0226E238[param1], &ov12_0226E2F8[param1], 4, 0);

    PaletteData_LoadPalette(palette, &battleInput->paletteBuffer[0xe * 16], PLTTBUF_SUB_BG, paletteNo[param1] * 16, 0x20);
    ScheduleBgTilemapBufferTransfer(bgConfig, 4);
    FillBgTilemapRect(bgConfig, 5, (0x6000 / 0x20 - 1), ov12_0226E2F8[param1].rect.left, ov12_0226E2F8[param1].rect.top, ov12_0226E2F8[param1].rect.right - ov12_0226E2F8[param1].rect.left + 1, ov12_0226E2F8[param1].rect.bottom - ov12_0226E2F8[param1].rect.top + 1, 17);
    ScheduleBgTilemapBufferTransfer(bgConfig, 5);
}

void ov12_02268D5C(void) {
    for (int i = 0; i < 4; i++) {
        if (4 + i != 6) {
            ToggleBgLayer(4 + i, 0);
        } else {
            ToggleBgLayer(4 + i, 1);
        }
    }
}

void ov12_02268D88(BattleInput *battleInput, int param1, int param2) {
    if (param1 == 1) {
        ov12_02268DAC(battleInput);
    }

    if (param2 == 1) {
        SysTask_CreateOnVWaitQueue(ov12_0226989C, battleInput, 10);
    }
}

void ov12_02268DAC(BattleInput *battleInput) {
    ov12_02268BB8(battleInput);
    ov12_02268BEC(battleInput);
    ov12_02268684(battleInput);
    ov12_02268214(battleInput);
    ov12_02268264(battleInput);
    ov12_0226AD60(battleInput);
}

__attribute__((aligned(4))) extern int ov12_0226E64C[][4];
void ov12_02268DD4(BattleInput *battleInput, u8 *param1, int param2) {
    BattleInputTargetScreen *pokemonMenu;
    int i;
    u8 battlerIdBuffer[6];
    int v3;

    pokemonMenu = &battleInput->menu.target;
    ov12_0223C1A0(battleInput->battleSystem, battlerIdBuffer);

    for (i = 0; i < 4; i++) {
        v3 = battlerIdBuffer[2 + i];

        if ((param2 == 1) && (pokemonMenu->targetMons[v3].hide == 0)) {
            param1[i] = 0;
        } else {
            param1[i] = ov12_0226E64C[battleInput->unk6F0][i];
        }
    }
}

void ov12_02268E2C(BattleInput *battleInput, int param1, u8 *param2, int param3) {
    BattleInputTargetScreen *pokemonMenu;
    int i;

    pokemonMenu = &battleInput->menu.target;

    switch (battleInput->unk6F0) {
    case 0:
    case 8:
    case 9:
    case 10:
    case 11:
        for (i = 0; i < 4; i++) {
            if (i == param1 - 1) {
                param2[i] = 1;
            } else {
                param2[i] = 0;
            }
        }
        break;
    default:
        ov12_02268DD4(battleInput, param2, param3);
        break;
    }
}

void ov12_02268E84(SysTaskFunc task, BattleInput *battleInput) {
    GF_ASSERT(battleInput->unkC == NULL);

    MI_CpuClear8(&battleInput->unk700, sizeof(BattleInputEffect));
    battleInput->unkC = SysTask_CreateOnMainQueue(task, battleInput, 1300);
}

void ov12_02268EB8(BattleInput *battleInput) {
    if (battleInput->unkC != NULL) {
        SysTask_Destroy(battleInput->unkC);
        battleInput->unkC = NULL;
        MI_CpuClear8(&battleInput->unk700, sizeof(BattleInputEffect));
    }
}

void ov12_02268EDC(BattleInput *battleInput, int a1) {
}

void ov12_02268EE0(BattleInput *battleInput, int a1) {
}

void ov12_02268EE4(BattleInput *battleInput, s16 *param1, TouchscreenHitbox *hitbox, int param3, int param4) {
    int j, i;
    BgConfig *bgConfig;
    u16 *src, *v4;
    u16 *v5, *v6;
    int v7;

    bgConfig = BattleSystem_GetBgConfig(battleInput->battleSystem);
    src = GetBgTilemapBuffer(bgConfig, 4);
    v5 = battleInput->screenBuffer[param3];
    v7 = param1[param4];

    for (i = hitbox->rect.top; i <= hitbox->rect.bottom; i++) {
        v4 = &src[i * 32];
        v6 = &v5[i * 32];

        for (j = hitbox->rect.left; j <= hitbox->rect.right; j++) {
            v4[j] = v6[j] + v7;
        }
    }

    ScheduleBgTilemapBufferTransfer(bgConfig, 4);
}

void ov12_02268F58(SysTask *task, void *data) {
    BattleInput *battleInput = data;
    BgConfig *bgConfig = BattleSystem_GetBgConfig(battleInput->battleSystem);
    int x, y;

    switch (battleInput->unk700.state) {
    case 0:
        ov12_02268EE4(battleInput, battleInput->unk700.unk.unk4, battleInput->unk700.unk.unk8, battleInput->unk700.unk.unk10, 2);
        sub_02013794(battleInput->textObj[battleInput->unk700.unk.unk11].unk0, &x, &y);
        sub_020136B4(battleInput->textObj[battleInput->unk700.unk.unk11].unk0, x, y + -2);

        if ((battleInput->unk700.unk.unk12 != 0xff) && (battleInput->unk6C0[battleInput->unk700.unk.unk12] != NULL)) {
            ManagedSprite_OffsetPositionXY(battleInput->unk6C0[battleInput->unk700.unk.unk12], 0, -2);
        }

        battleInput->unk700.state++;
        break;
    case 1:
        battleInput->unk700.delay++;

        if (battleInput->unk700.delay <= 0) {
            break;
        }

        battleInput->unk700.delay = 0;
        battleInput->unk700.state++;
    case 2:
        ov12_02268EE4(battleInput, battleInput->unk700.unk.unk4, battleInput->unk700.unk.unk8, battleInput->unk700.unk.unk10, 1);
        sub_02013794(battleInput->textObj[battleInput->unk700.unk.unk11].unk0, &x, &y);
        sub_020136B4(battleInput->textObj[battleInput->unk700.unk.unk11].unk0, x, y + 1);

        if ((battleInput->unk700.unk.unk12 != 0xff) && (battleInput->unk6C0[battleInput->unk700.unk.unk12] != NULL)) {
            ManagedSprite_OffsetPositionXY(battleInput->unk6C0[battleInput->unk700.unk.unk12], 0, 1);
        }

        battleInput->unk700.state++;
        break;
    default:
        battleInput->unk700.delay++;

        if (battleInput->unk700.delay > 0) {
            ov12_02268D88(battleInput, battleInput->unk700.unk.unk14, 0);
            ov12_02268EB8(battleInput);
            return;
        }
        break;
    }
}

void ov12_022690A8(SysTask *task, void *data) {
    BattleInput *battleInput = data;
    BgConfig *bgConfig;
    int x, y;
    int v4, v5, v6;
    int v7, v8, moveNo;
    BattleInputFightMenu *v10;

    bgConfig = BattleSystem_GetBgConfig(battleInput->battleSystem);
    v10 = &battleInput->menu.fight;

    switch (battleInput->unk700.unk.ret) {
    case 1:
        v4 = 0;
        v5 = 9;
        v6 = 5;
        v7 = 0;
        v8 = 0;
        moveNo = v10->moveNo[0];
        break;
    case 2:
        v4 = 1;
        v5 = 10;
        v6 = 6;
        v7 = 1;
        v8 = 1;
        moveNo = v10->moveNo[1];
        break;
    case 3:
        v4 = 2;
        v5 = 11;
        v6 = 7;
        v7 = 2;
        v8 = 2;
        moveNo = v10->moveNo[2];
        break;
    case 4:
        v4 = 3;
        v5 = 12;
        v6 = 8;
        v7 = 3;
        v8 = 3;
        moveNo = v10->moveNo[3];
        break;
    case 0xff:
    default:
        v4 = 0;
        v5 = 0;
        v6 = 0;
        v7 = 0;
        v8 = 0;
        moveNo = 0;
        break;
    }

    switch (battleInput->unk700.state) {
    case 0:
        ov12_02268EE4(battleInput, battleInput->unk700.unk.unk4, battleInput->unk700.unk.unk8, battleInput->unk700.unk.unk10, 2);

        if (battleInput->unk700.unk.ret != 0xff) {
            sub_02013794(battleInput->textObj[v4].unk0, &x, &y);
            sub_020136B4(battleInput->textObj[v4].unk0, x, y + -2);
            sub_02013794(battleInput->textObj[v5].unk0, &x, &y);
            sub_020136B4(battleInput->textObj[v5].unk0, x, y + -2);
            sub_02013794(battleInput->textObj[v6].unk0, &x, &y);
            sub_020136B4(battleInput->textObj[v6].unk0, x, y + -2);

            if (moveNo != 0) {
                Sprite_OffsetPositionXY(battleInput->unk6A0[v7]->sprite, 0, -2);

                if (battleInput->unk6B0[v7] != NULL) {
                    Sprite_OffsetPositionXY(battleInput->unk6B0[v7]->sprite, 0, -2);
                }
            }
        } else {
            sub_02013794(battleInput->textObj[4].unk0, &x, &y);
            sub_020136B4(battleInput->textObj[4].unk0, x, y + -2);
        }

        battleInput->unk700.state++;
        break;
    case 1:
        battleInput->unk700.delay++;

        if (battleInput->unk700.delay <= 0) {
            break;
        }

        battleInput->unk700.delay = 0;
        battleInput->unk700.state++;
    case 2:
        ov12_02268EE4(battleInput, battleInput->unk700.unk.unk4, battleInput->unk700.unk.unk8, battleInput->unk700.unk.unk10, 1);

        if (battleInput->unk700.unk.ret != 0xff) {
            sub_02013794(battleInput->textObj[v4].unk0, &x, &y);
            sub_020136B4(battleInput->textObj[v4].unk0, x, y + 1);
            sub_02013794(battleInput->textObj[v5].unk0, &x, &y);
            sub_020136B4(battleInput->textObj[v5].unk0, x, y + 1);
            sub_02013794(battleInput->textObj[v6].unk0, &x, &y);
            sub_020136B4(battleInput->textObj[v6].unk0, x, y + 1);

            if (moveNo != 0) {
                Sprite_OffsetPositionXY(battleInput->unk6A0[v7]->sprite, 0, 1);

                if (battleInput->unk6B0[v7] != NULL) {
                    Sprite_OffsetPositionXY(battleInput->unk6B0[v7]->sprite, 0, 1);
                }
            }
        } else {
            sub_02013794(battleInput->textObj[4].unk0, &x, &y);
            sub_020136B4(battleInput->textObj[4].unk0, x, y + 1);
        }

        battleInput->unk700.state++;
        break;
    default:
        battleInput->unk700.delay++;

        if (battleInput->unk700.delay > 0) {
            ov12_02268EE4(battleInput, battleInput->unk700.unkBugContest.unk4, battleInput->unk700.unkBugContest.unk8, battleInput->unk700.unk.unk10, 0);
            ov12_02268D88(battleInput, 1, 1);
            ov12_02268EB8(battleInput);
            return;
        }
        break;
    }
}

void ov12_02269360(SysTask *task, void *data) {
    BattleInput *battleInput = data;
    BgConfig *bgConfig;
    int i, x, y;
    u8 v4[4];

    bgConfig = BattleSystem_GetBgConfig(battleInput->battleSystem);

    switch (battleInput->unk700.state) {
    case 0:
        ov12_02268E2C(battleInput, battleInput->unk700.monSelect.ret, v4, 1);

        for (i = 0; i < 4; i++) {
            if (v4[i] == 1) {
                ov12_02268EE4(battleInput, ov12_0226E408[i], &ov12_0226E348[i], 4, 2);

                if (battleInput->textObj[0 + i].unk0 != 0) {
                    sub_02013794(battleInput->textObj[0 + i].unk0, &x, &y);
                    sub_020136B4(battleInput->textObj[0 + i].unk0, x, y + -2);
                }

                if (battleInput->unk6C0[i] != 0) {
                    ManagedSprite_OffsetPositionXY(battleInput->unk6C0[i], 0, -2);
                }
            }
        }

        battleInput->unk700.state++;
        break;
    case 1:
        battleInput->unk700.delay++;

        if (battleInput->unk700.delay <= 0) {
            break;
        }

        battleInput->unk700.delay = 0;
        battleInput->unk700.state++;
    case 2:
        ov12_02268E2C(battleInput, battleInput->unk700.monSelect.ret, v4, 1);

        for (i = 0; i < 4; i++) {
            if (v4[i] == 1) {
                ov12_02268EE4(battleInput, ov12_0226E408[i], &ov12_0226E348[i], 4, 1);

                if (battleInput->textObj[0 + i].unk0 != 0) {
                    sub_02013794(battleInput->textObj[0 + i].unk0, &x, &y);
                    sub_020136B4(battleInput->textObj[0 + i].unk0, x, y + 1);
                }

                if (battleInput->unk6C0[i] != 0) {
                    ManagedSprite_OffsetPositionXY(battleInput->unk6C0[i], 0, 1);
                }
            }
        }

        battleInput->unk700.state++;
        break;
    case 3:
        battleInput->unk700.delay++;

        if (battleInput->unk700.delay > 0) {
            battleInput->unk700.delay = 0;
            battleInput->unk700.state++;
        }
        break;
    default:
        ov12_02268D88(battleInput, 1, 1);
        ov12_02268EB8(battleInput);
        return;
    }
}

int ov12_02269504(int pp, int maxPp) {
    if (pp == 0) {
        return MAKE_TEXT_COLOR(7, 8, 0);
    }

    if (maxPp == pp) {
        return MAKE_TEXT_COLOR(1, 2, 0);
    }

    if (maxPp <= 2) {
        if (pp == 1) {
            return MAKE_TEXT_COLOR(5, 6, 0);
        }
    } else if (maxPp <= 7) {
        switch (pp) {
        case 1:
            return MAKE_TEXT_COLOR(5, 6, 0);
        case 2:
            return MAKE_TEXT_COLOR(3, 4, 0);
        }
    } else {
        if (pp <= maxPp / 4) {
            return MAKE_TEXT_COLOR(5, 6, 0);
        }

        if (pp <= maxPp / 2) {
            return MAKE_TEXT_COLOR(3, 4, 0);
        }
    }

    return MAKE_TEXT_COLOR(1, 2, 0);
}

void ov12_02269568(SysTask *task, void *data) {
    BattleMenuSlideIn *menuSlideIn = data;
    BgConfig *bgConfig = BattleSystem_GetBgConfig(menuSlideIn->battleInput->battleSystem);

    switch (menuSlideIn->state) {
    case 0:
        menuSlideIn->unk_08 += ((255 * 100) / 4);
        menuSlideIn->unk_0A -= ((40 * 100) / 4);
        menuSlideIn->unk_0C = ((255 * 100) - menuSlideIn->unk_08) / 100;
        menuSlideIn->unk_0E = -menuSlideIn->unk_0A / 100;

        if ((menuSlideIn->unk_08 >= 0) || (menuSlideIn->unk_0A <= 0)) {
            menuSlideIn->unk_08 = 0;
            menuSlideIn->unk_0A = (18 * 8);
            menuSlideIn->unk_0C = 0 / 100;
            menuSlideIn->unk_0E = 0 / 100;
            menuSlideIn->state++;
        }
        break;
    case 1:
        menuSlideIn->battleInput->invalidTouch = FALSE;
        SysTask_Destroy(menuSlideIn->unk_04);
        HBlankInterruptDisable();
        GXS_SetVisibleWnd(GX_WNDMASK_NONE);
        ov12_022698AC(menuSlideIn->battleInput, 1);
        menuSlideIn->state++;
        break;
    default:
        if (ov12_022698B0(menuSlideIn->battleInput) == 0) {
            break;
        }

        BgSetPosTextAndCommit(bgConfig, 4, BG_POS_OP_SET_X, 0);
        BgSetPosTextAndCommit(bgConfig, 4, BG_POS_OP_SET_Y, 0);
        BgSetPosTextAndCommit(bgConfig, 5, BG_POS_OP_SET_X, 0);
        BgSetPosTextAndCommit(bgConfig, 5, BG_POS_OP_SET_Y, 0);
        ov12_0223BB64(menuSlideIn->battleInput->battleSystem, 1);
        FreeToHeap(data);
        SysTask_Destroy(task);

        return;
    }
}

void ov12_02269668(SysTask *task, void *data) {
    BattleMenuSlideIn *menuSlideIn = data;
    s32 v2, v3, v4;

    BgConfig *bgConfig = BattleSystem_GetBgConfig(menuSlideIn->battleInput->battleSystem);

    if (menuSlideIn->unk_12 == 4) {
        v4 = 255 - menuSlideIn->unk_0C;

        if (v4 > 0) {
            v4 = 0;
        }

        BgSetPosTextAndCommit(bgConfig, 4, BG_POS_OP_SET_X, v4);
        BgSetPosTextAndCommit(bgConfig, 5, BG_POS_OP_SET_X, 255 - menuSlideIn->unk_0C);
        v2 = -menuSlideIn->unk_08 / 100;
    } else {
        v4 = menuSlideIn->unk_0C;

        if (v4 < 0) {
            v4 = 0;
        }

        BgSetPosTextAndCommit(bgConfig, 4, BG_POS_OP_SET_X, v4);
        BgSetPosTextAndCommit(bgConfig, 5, BG_POS_OP_SET_X, menuSlideIn->unk_0C);

        v2 = 255 + menuSlideIn->unk_08 / 100;
    }

    BgSetPosTextAndCommit(bgConfig, 4, BG_POS_OP_SET_Y, 0);
    BgSetPosTextAndCommit(bgConfig, 5, BG_POS_OP_SET_Y, 0);

    v3 = (18 * 8) + (menuSlideIn->unk_0A) / 100;

    if (v2 < 0) {
        v2 = 0;
    } else if (v2 > 255) {
        v2 = 255;
    }

    if (v3 > 192) {
        v3 = 192;
    } else if (v3 < 0) {
        v3 = 0;
    }

    if (menuSlideIn->unk_12 == 4) {
        G2S_SetWnd0Position(0, 0, v2, (18 * 8));
    } else {
        if (v2 == 0) {
            v2 = 1;
        }

        G2S_SetWnd0Position(v2, 0, 0, (18 * 8));
    }

    G2S_SetWnd1Position(0, (18 * 8), 255, v3);
    menuSlideIn->unk_10 = menuSlideIn->unk_0E;
}

void ov12_02269774(void *data) {
    BattleMenuSlideIn *menuSlideIn = data;
    s32 vCnt, v2;

    vCnt = GX_GetVCount();

    if (vCnt == (18 * 8)) {
        BgConfig *v3 = BattleSystem_GetBgConfig(menuSlideIn->battleInput->battleSystem);

        BgSetPosTextAndCommit(v3, 4, BG_POS_OP_SET_X, 0);
        BgSetPosTextAndCommit(v3, 4, BG_POS_OP_SET_Y, menuSlideIn->unk_10);
        BgSetPosTextAndCommit(v3, 5, BG_POS_OP_SET_X, 0);
        BgSetPosTextAndCommit(v3, 5, BG_POS_OP_SET_Y, menuSlideIn->unk_10);
    } else if (vCnt > 192) {
        BgConfig *bgConfig = BattleSystem_GetBgConfig(menuSlideIn->battleInput->battleSystem);

        if (menuSlideIn->unk_12 == 4) {
            v2 = 255 - menuSlideIn->unk_0C;

            if (v2 > 0) {
                v2 = 0;
            }

            BgSetPosTextAndCommit(bgConfig, 4, BG_POS_OP_SET_X, 255 - menuSlideIn->unk_0C);
            BgSetPosTextAndCommit(bgConfig, 5, BG_POS_OP_SET_X, 255 - menuSlideIn->unk_0C);
        } else {
            v2 = menuSlideIn->unk_0C;

            if (v2 < 0) {
                v2 = 0;
            }

            BgSetPosTextAndCommit(bgConfig, 4, BG_POS_OP_SET_X, menuSlideIn->unk_0C);
            BgSetPosTextAndCommit(bgConfig, 5, BG_POS_OP_SET_X, menuSlideIn->unk_0C);
        }

        BgSetPosTextAndCommit(bgConfig, 4, BG_POS_OP_SET_Y, 0);
        BgSetPosTextAndCommit(bgConfig, 5, BG_POS_OP_SET_Y, 0);
    }
}

void ov12_02269830(SysTask *task, void *data) {
    BattleInput *battleInput = data;
    const BattleMenuTemplate *menu;
    int i;

    menu = &sBattleMenuTemplates[battleInput->curMenuId];

    for (i = 0; i < 4; i++) {
        if (menu->unk_04_val2[i] == 0xffff) {
            ToggleBgLayer(4 + i, 0);
        } else {
            ToggleBgLayer(4 + i, 1);
        }
    }

    for (i = 0; i < 4; i++) {
        SetBgPriority(4 + i, (u8)menu->priority[i]);
    }

    SysTask_Destroy(task);
}

void ov12_0226989C(SysTask *task, void *data) {
    ov12_02268D5C();
    SysTask_Destroy(task);
}

void ov12_022698AC(BattleInput *battleInput, int a1) {
}

int ov12_022698B0(BattleInput *battleInput) {
    if (battleInput->unk6E8 == NULL) {
        return 1;
    }

    return 0;
}

void ov12_022698C4(SysTask *task, void *data) {
    BattleInput *battleInput = data;
    PaletteData *palette = BattleSystem_GetPaletteData(battleInput->battleSystem);

    if (PaletteData_GetSelectedBuffersBitmask(palette) != 0) {
        return;
    }

    PaletteData_BlendPalette(palette, PLTTBUF_SUB_BG, 16 * 0 + 1, 1, battleInput->unk6F8 >> 8, 0x7e37);

    if (battleInput->unk6F7 == 0) {
        battleInput->unk6F8 += 0x200;
    } else {
        battleInput->unk6F8 -= 0x200;
    }

    if (battleInput->unk6F8 >= (16 + 1) << 8) {
        battleInput->unk6F8 = (16 - 1) << 8;
        battleInput->unk6F7 = 1;
    } else if (battleInput->unk6F8 <= 0) {
        battleInput->unk6F8 = 1 << 8;
        battleInput->unk6F7 = 0;
    }
}

void ov12_02269954(SysTask *task, void *data) {
    BattleInput *battleInput = data;
    PaletteData *palette;
    u16 *v2;
    int v3;
    int v4, v5;

    v4 = TextFlags_GetHasSpedUpInput();
    v5 = TextFlags_GetHasContinuedInput();

    TextFlags_ResetHasSpedUpInput();
    TextFlags_ResetHasContinuedInput();

    palette = BattleSystem_GetPaletteData(battleInput->battleSystem);

    if (PaletteData_GetSelectedBuffersBitmask(palette) != 0) {
        return;
    }

    v2 = PaletteData_GetFadedBuf(palette, PLTTBUF_SUB_BG);
    v3 = (16 - 8) * 2;

    if (gSystem.touchHeld && ((v4 == 1) || (v5 == 1))) {
        if (memcmp(&v2[8], &battleInput->bgPalNormal[8], v3) == 0) {
            if (BattleSystem_IsInFrontier(battleInput->battleSystem)) {
                MI_CpuCopy16(&battleInput->bgPalTouch[0], &v2[0], 0x20);
                MI_CpuCopy16(&battleInput->bgPalTouch[16], &v2[7 * 16], 0x20);
            } else {
                MI_CpuCopy16(&battleInput->bgPalTouch[8], &v2[8], v3);
            }
        }
    } else {
        if (memcmp(&v2[8], &battleInput->bgPalTouch[8], v3) == 0) {
            if (BattleSystem_IsInFrontier(battleInput->battleSystem)) {
                MI_CpuCopy16(&battleInput->bgPalNormal[0], &v2[0], 0x20);
                MI_CpuCopy16(&battleInput->bgPalNormal[16], &v2[7 * 16], 0x20);
            } else {
                MI_CpuCopy16(&battleInput->bgPalNormal[8], &v2[8], v3);
            }
        }
    }
}

int ov12_02269A24(BattleInput *battleInput) {
    BattleInputCurosrData *cursorMove;
    const BattleMenuTemplate *menu;

    cursorMove = &battleInput->cursorData;
    menu = &sBattleMenuTemplates[battleInput->curMenuId];

    if (menu->funcCursorMove == NULL) {
        return 0xffffffff;
    }

    if (cursorMove->enabled == 0) {
        if ((battleInput->keyPressed == 1) || (gSystem.newKeys & (PAD_BUTTON_A | PAD_BUTTON_B | PAD_BUTTON_X | PAD_BUTTON_Y | PAD_KEY_RIGHT | PAD_KEY_LEFT | PAD_KEY_UP | PAD_KEY_DOWN))) {
            if (battleInput->keyPressed == 0) {
                PlaySE(1500);
            }

            cursorMove->enabled = 1;
            battleInput->keyPressed = 0;
            menu->funcCursorMove(battleInput, 1);
        }

        return 0xffffffff;
    }

    return menu->funcCursorMove(battleInput, 0);
}

extern __attribute__((aligned(4))) u8 ov12_0226E220[2][3];

int ov12_02269A9C(BattleInput *battleInput, int param1) {
    BattleInputCurosrData *cursorMove;
    u32 key;
    const BattleMenuTemplate *v2;
    int i, v4, v5;
    BattleCursorPosition *v6;

    cursorMove = &battleInput->cursorData;
    v2 = &sBattleMenuTemplates[battleInput->curMenuId];
    v5 = ov12_0223AAD8(battleInput->battleSystem, battleInput->unk6EE);
    v6 = ov12_02261280(BattleSystem_GetOpponentData(battleInput->battleSystem, v5));

    if (param1 == 1) {
        cursorMove->menuX = v6->commandX;
        cursorMove->menuY = v6->commandY;
        v4 = ov12_0226E220[cursorMove->menuY][cursorMove->menuX];
        ov12_0226BB1C(battleInput->cursor, v2->touchscreenRect[v4].rect.left + 8, v2->touchscreenRect[v4].rect.right - 8, v2->touchscreenRect[v4].rect.top + 8, v2->touchscreenRect[v4].rect.bottom - 8, ((192 + 80) << FX32_SHIFT));
        return -1;
    }

    switch (battleInput->curMenuId) {
    case 6:
    case 5:
        key = ov12_0226A6EC(cursorMove, 1, 1, ov12_0226E220[0]);
        break;
    default:
        v4 = ov12_0226E220[cursorMove->menuY][cursorMove->menuX];

        if ((v4 == 3) && (gSystem.newKeys & PAD_KEY_UP)) {

        } else {
            key = ov12_0226A6EC(cursorMove, 3, 2, ov12_0226E220[0]);

            if ((key == 0) && (v4 == 0)) {
                if (gSystem.newKeys & PAD_KEY_LEFT) {
                    cursorMove->menuX = 0;
                    cursorMove->menuY = 1;
                    PlaySE(1500);
                    key = PAD_KEY_LEFT;
                } else if (gSystem.newKeys & PAD_KEY_RIGHT) {
                    cursorMove->menuX = 2;
                    cursorMove->menuY = 1;
                    PlaySE(1500);
                    key = PAD_KEY_RIGHT;
                }
            }
        }
        break;
    }

    switch (key) {
    case PAD_KEY_UP:
    case PAD_KEY_DOWN:
    case PAD_KEY_LEFT:
    case PAD_KEY_RIGHT:
        v4 = ov12_0226E220[cursorMove->menuY][cursorMove->menuX];
        ov12_0226BB1C(battleInput->cursor, v2->touchscreenRect[v4].rect.left + 8, v2->touchscreenRect[v4].rect.right - 8, v2->touchscreenRect[v4].rect.top + 8, v2->touchscreenRect[v4].rect.bottom - 8, ((192 + 80) << FX32_SHIFT));
        break;
    case PAD_BUTTON_A:
        return ov12_0226E220[cursorMove->menuY][cursorMove->menuX];
    case PAD_BUTTON_B:
        if (battleInput->unk6F3 == 1) {
            for (i = 0; i < v2->touchscreenRect[i].rect.top != 0xff; i++) {
                if (4 == v2->unk_18[i]) {
                    return i;
                }
            }
        }
        break;
    }

    return -1;
}

void ov12_02269C7C(BattleInput *battleInput, int param1) {
    BattleCursorPosition *cursor;
    int battler, j, i;

    battler = ov12_0223AAD8(battleInput->battleSystem, battleInput->unk6EE);

    if ((param1 != 3) || (battleInput->cancelRun == 0)) {
        cursor = ov12_02261280(BattleSystem_GetOpponentData(battleInput->battleSystem, battler));

        for (i = 0; i < 2; i++) {
            for (j = 0; j < 3; j++) {
                if (param1 == ov12_0226E220[i][j]) {
                    cursor->commandX = j;
                    cursor->commandY = i;

                    return;
                }
            }
        }
    }
}

int ov12_02269CDC(BattleInput *battleInput, int param1) {
    BattleInputCurosrData *cursorMove;
    u32 key;
    const BattleMenuTemplate *menu;
    int v4;

    cursorMove = &battleInput->cursorData;
    menu = &sBattleMenuTemplates[battleInput->curMenuId];

    if (param1 == 1) {
        cursorMove->menuX = 0;
        cursorMove->menuY = 0;
        v4 = ov12_0226E1FC.unk_00[cursorMove->menuY][cursorMove->menuX];
        ov12_0226BB1C(battleInput->cursor, menu->touchscreenRect[v4].rect.left + 8, menu->touchscreenRect[v4].rect.right - 8, menu->touchscreenRect[v4].rect.top + 8, menu->touchscreenRect[v4].rect.bottom - 8, ((192 + 80) << FX32_SHIFT));
        return 0xffffffff;
    }

    key = ov12_0226A6EC(cursorMove, 1, 2, ov12_0226E1FC.unk_00[0]);

    switch (key) {
    case PAD_KEY_UP:
    case PAD_KEY_DOWN:
    case PAD_KEY_LEFT:
    case PAD_KEY_RIGHT:
        v4 = ov12_0226E1FC.unk_00[cursorMove->menuY][cursorMove->menuX];
        ov12_0226BB1C(battleInput->cursor, menu->touchscreenRect[v4].rect.left + 8, menu->touchscreenRect[v4].rect.right - 8, menu->touchscreenRect[v4].rect.top + 8, menu->touchscreenRect[v4].rect.bottom - 8, ((192 + 80) << FX32_SHIFT));
        break;
    case PAD_BUTTON_A:
        return ov12_0226E1FC.unk_00[cursorMove->menuY][cursorMove->menuX];
    case PAD_BUTTON_B:
        break;
    }

    return 0xffffffff;
}

extern __attribute__((aligned(4))) u8 ov12_0226E218[3][2];

int ov12_02269DD4(BattleInput *battleInput, int param1) {
    BattleInputCurosrData *cursorMove;
    u32 keyPressed;
    const BattleMenuTemplate *menu;
    int index, i;
    u8 v5[3][2];
    BattleInputFightMenu *moveMenu;
    BattleCursorPosition *cursorPos;

    cursorPos = ov12_02261280(BattleSystem_GetOpponentData(battleInput->battleSystem, ov12_0223AAD8(battleInput->battleSystem, battleInput->unk6EE)));
    cursorMove = &battleInput->cursorData;
    menu = &sBattleMenuTemplates[battleInput->curMenuId];
    moveMenu = &battleInput->menu.fight;

    if (param1 == 1) {
        cursorMove->menuX = cursorPos->moveX;
        cursorMove->menuY = cursorPos->moveY;
        index = ov12_0226E218[cursorMove->menuY][cursorMove->menuX];

        if ((index != 0) && (moveMenu->moveNo[index - 1] == 0)) {
            cursorPos->moveX = 0;
            cursorPos->moveY = 0;
            cursorMove->menuX = 0;
            cursorMove->menuY = 0;
            index = ov12_0226E218[cursorMove->menuY][cursorMove->menuX];
        }

        ov12_0226BB1C(battleInput->cursor, menu->touchscreenRect[index].rect.left + 8, menu->touchscreenRect[index].rect.right - 8, menu->touchscreenRect[index].rect.top + 8, menu->touchscreenRect[index].rect.bottom - 8, ((192 + 80) << FX32_SHIFT));
        return 0xffffffff;
    }

    MI_CpuCopy8(ov12_0226E218, v5, 3 * 2);
    keyPressed = ov12_0226A6EC(cursorMove, 2, 3, v5[0]);

    switch (keyPressed) {
    case PAD_KEY_UP:
    case PAD_KEY_DOWN:
    case PAD_KEY_LEFT:
    case PAD_KEY_RIGHT:
        index = ov12_0226E218[cursorMove->menuY][cursorMove->menuX];
        ov12_0226BB1C(battleInput->cursor, menu->touchscreenRect[index].rect.left + 8, menu->touchscreenRect[index].rect.right - 8, menu->touchscreenRect[index].rect.top + 8, menu->touchscreenRect[index].rect.bottom - 8, ((192 + 80) << FX32_SHIFT));
        break;
    case PAD_BUTTON_A:
        return ov12_0226E218[cursorMove->menuY][cursorMove->menuX];
    case PAD_BUTTON_B:
        for (i = 0; i < menu->touchscreenRect[i].rect.top != 0xff; i++) {
            if (0xff == menu->unk_18[i]) {
                return i;
            }
        }

        break;
    }

    return 0xffffffff;
}

void ov12_02269F54(BattleInput *battleInput, int param1) {
    BattleCursorPosition *cursorPos;
    int battler, j, i;

    if (param1 == 0) {
        return;
    }

    battler = ov12_0223AAD8(battleInput->battleSystem, battleInput->unk6EE);
    cursorPos = ov12_02261280(BattleSystem_GetOpponentData(battleInput->battleSystem, battler));

    for (i = 0; i < 3; i++) {
        for (j = 0; j < 2; j++) {
            if (param1 == ov12_0226E218[i][j]) {
                cursorPos->moveX = j;
                cursorPos->moveY = i;
                return;
            }
        }
    }
}

extern const __attribute__((aligned(4))) u8 ov12_0226E210[3][2];

int ov12_02269FA4(BattleInput *battleInput, int param1) {
    BattleInputCurosrData *cursorMove;
    u32 keyPressed;
    const BattleMenuTemplate *menu;
    int v3, v4;
    int v5 = 0;
    u8 v6[4], v7[4];
    u8 v8[3][2];
    int i, j, v11, v12;
    int v13, v14, v15, v16, v17, v18;
    int v19, v20, v21, v22;
    int v23, v24, v25, v26;
    int v27, v28;
    int v29;
    BattleCursorPosition *v30;

    v30 = ov12_02261280(BattleSystem_GetOpponentData(battleInput->battleSystem, ov12_0223AAD8(battleInput->battleSystem, battleInput->unk6EE)));
    cursorMove = &battleInput->cursorData;
    menu = &sBattleMenuTemplates[battleInput->curMenuId];

    MI_CpuCopy8(ov12_0226E210, v8, 3 * 2);

    ov12_02268DD4(battleInput, v6, 1);
    ov12_02268DD4(battleInput, v7, 0);

    for (i = 0; i < 2; i++) {
        for (j = 0; j < 2; j++) {
            if (v7[v8[i][j]] == 0) {
                v8[i][j] = 0xff;
            }
        }
    }

    switch (battleInput->unk6F0) {
    default:
    case 0:
    case 4:
    case 6:
    case 8:
    case 9:
    case 10:
    case 11:
        v11 = 2;
        v12 = 3;
        break;
    case 1:
    case 2:
    case 3:
    case 5:
    case 7:
        v5 = 1;
        v11 = 1;
        v12 = 2;

        if ((v7[5 - 2] == 1) && (v7[3 - 2] == 1)) {
            v21 = menu->touchscreenRect[3].rect.left + 8;
            v22 = menu->touchscreenRect[1].rect.right - 8;
            v19 = menu->touchscreenRect[3].rect.top + 8;
            v20 = menu->touchscreenRect[3].rect.bottom - 8;
        } else if ((v7[5 - 2] == 1) && (v7[3 - 2] == 0)) {
            v21 = menu->touchscreenRect[3].rect.left + 8;
            v22 = menu->touchscreenRect[3].rect.right - 8;
            v19 = menu->touchscreenRect[3].rect.top + 8;
            v20 = menu->touchscreenRect[3].rect.bottom - 8;
        } else if ((v7[5 - 2] == 0) && (v7[3 - 2] == 1)) {
            v21 = menu->touchscreenRect[1].rect.left + 8;
            v22 = menu->touchscreenRect[1].rect.right - 8;
            v19 = menu->touchscreenRect[1].rect.top + 8;
            v20 = menu->touchscreenRect[1].rect.bottom - 8;
        } else {
            v21 = -1;
            v22 = -1;
            v19 = -1;
            v20 = -1;
        }

        if ((v7[2 - 2] == 1) && (v7[4 - 2] == 1)) {
            v25 = menu->touchscreenRect[0].rect.left + 8;
            v26 = menu->touchscreenRect[2].rect.right - 8;
            v23 = menu->touchscreenRect[0].rect.top + 8;
            v24 = menu->touchscreenRect[0].rect.bottom - 8;
        } else if ((v7[2 - 2] == 1) && (v7[4 - 2] == 0)) {
            v25 = menu->touchscreenRect[0].rect.left + 8;
            v26 = menu->touchscreenRect[0].rect.right - 8;
            v23 = menu->touchscreenRect[0].rect.top + 8;
            v24 = menu->touchscreenRect[0].rect.bottom - 8;
        } else if ((v7[2 - 2] == 0) && (v7[4 - 2] == 1)) {
            v25 = menu->touchscreenRect[2].rect.left + 8;
            v26 = menu->touchscreenRect[2].rect.right - 8;
            v23 = menu->touchscreenRect[2].rect.top + 8;
            v24 = menu->touchscreenRect[2].rect.bottom - 8;
        } else {
            v25 = -1;
            v26 = -1;
            v23 = -1;
            v24 = -1;
        }

        v17 = -1;
        v18 = -1;
        v27 = -1;
        v28 = -1;

        if (v21 == v25) {
            v13 = v21;
        } else if ((v21 != -1) && (v25 == -1)) {
            v13 = v21;
        } else if ((v21 == -1) && (v25 != -1)) {
            v13 = v25;
        } else {
            v13 = v21;
            v17 = v25;
            v29 = 2;
        }

        if (v22 == v26) {
            v14 = v22;
        } else if ((v22 != -1) && (v26 == -1)) {
            v14 = v22;
        } else if ((v22 == -1) && (v26 != -1)) {
            v14 = v26;
        } else {
            v14 = v22;
            v17 = v26;
            v29 = 3;
        }

        if ((v19 != -1) && (v23 == -1)) {
            v15 = v19;
        } else if ((v19 == -1) && (v23 != -1)) {
            v15 = v23;
        } else {
            v15 = v19;
            v18 = v20;
        }

        if ((v20 != -1) && (v24 == -1)) {
            v16 = v20;
        } else if ((v20 == -1) && (v24 != -1)) {
            v16 = v24;
        } else {
            v16 = v24;
            v18 = v24;

            if (v29 == 2) {
                v28 = v20;
            } else {
                v27 = v20;
            }
        }

        break;
    }

    if (param1 == 1) {
        if (v5 == 0) {
            if (v30->unk_06 == battleInput->unk6F0) {
                cursorMove->menuX = v30->unk_04;
                cursorMove->menuY = v30->unk_05;
            } else if (v6[5 - 2] == 1) {
                cursorMove->menuX = 0;
                cursorMove->menuY = 0;
            } else if (v6[3 - 2] == 1) {
                cursorMove->menuX = 1;
                cursorMove->menuY = 0;
            } else if (v6[2 - 2] == 1) {
                cursorMove->menuX = 0;
                cursorMove->menuY = 1;
            } else {
                cursorMove->menuX = 1;
                cursorMove->menuY = 1;
            }

            v4 = ov12_0226E210[cursorMove->menuY][cursorMove->menuX];
            ov12_0226BB1C(battleInput->cursor, menu->touchscreenRect[v4].rect.left + 8, menu->touchscreenRect[v4].rect.right - 8, menu->touchscreenRect[v4].rect.top + 8, menu->touchscreenRect[v4].rect.bottom - 8, ((192 + 80) << FX32_SHIFT));
        } else {
            cursorMove->menuX = 0;
            cursorMove->menuY = 0;

            if (((v28 == -1) && (v27 == -1)) || (v17 == -1)) {
                ov12_0226BB1C(battleInput->cursor, v13, v14, v15, v16, ((192 + 80) << FX32_SHIFT));
            } else if ((v28 != -1) && (v27 == -1)) {
                ov12_0226BA4C(battleInput->cursor, v13, v15, v14, v15, v13, v28, v14, v16, ((192 + 80) << FX32_SHIFT));
            } else {
                ov12_0226BA4C(battleInput->cursor, v13, v15, v14, v15, v13, v16, v14, v27, ((192 + 80) << FX32_SHIFT));
            }

            if (v17 != -1) {
                ov12_0226BB40(battleInput->cursor, v17, v18, v29, ((192 + 80) << FX32_SHIFT));
            }
        }

        return 0xffffffff;
    }

    if (v5 == 0) {
        keyPressed = ov12_0226A6EC(cursorMove, v11, v12, v8[0]);
    } else {
        keyPressed = ov12_0226A6EC(cursorMove, v11, v12, NULL);
    }

    switch (keyPressed) {
    case PAD_KEY_UP:
    case PAD_KEY_DOWN:
    case PAD_KEY_LEFT:
    case PAD_KEY_RIGHT:
        if (v5 == 0) {
            v4 = ov12_0226E210[cursorMove->menuY][cursorMove->menuX];
            ov12_0226BB1C(battleInput->cursor, menu->touchscreenRect[v4].rect.left + 8, menu->touchscreenRect[v4].rect.right - 8, menu->touchscreenRect[v4].rect.top + 8, menu->touchscreenRect[v4].rect.bottom - 8, ((192 + 80) << FX32_SHIFT));
        } else {
            if (cursorMove->menuY == 0) {
                if (((v27 == -1) && (v28 == -1)) || (v17 == -1)) {
                    ov12_0226BB1C(battleInput->cursor, v13, v14, v15, v16, ((192 + 80) << FX32_SHIFT));
                } else if ((v28 != -1) && (v27 == -1)) {
                    ov12_0226BA4C(battleInput->cursor, v13, v15, v14, v15, v13, v28, v14, v16, ((192 + 80) << FX32_SHIFT));
                } else {
                    ov12_0226BA4C(battleInput->cursor, v13, v15, v14, v15, v13, v16, v14, v27, ((192 + 80) << FX32_SHIFT));
                }

                if (v17 != -1) {
                    ov12_0226BB40(battleInput->cursor, v17, v18, v29, ((192 + 80) << FX32_SHIFT));
                } else {
                    ov12_0226BB84(battleInput->cursor);
                }
            } else {
                ov12_0226BB1C(battleInput->cursor, menu->touchscreenRect[4].rect.left + 8, menu->touchscreenRect[4].rect.right - 8, menu->touchscreenRect[4].rect.top + 8, menu->touchscreenRect[4].rect.bottom - 8, ((192 + 80) << FX32_SHIFT));
                ov12_0226BB84(battleInput->cursor);
            }
        }
        break;
    case PAD_BUTTON_A:
        if (v5 == 1) {
            if (cursorMove->menuY > 0) {
                return 4;
            } else {
                for (v3 = 0; v3 < 4; v3++) {
                    if (v6[v3] == 1) {
                        return 0 + v3;
                    }
                }
            }
        } else {
            v4 = ov12_0226E210[cursorMove->menuY][cursorMove->menuX];

            if ((v4 == 4) || (v6[v4 - 0] == 1)) {
                return v4;
            }
        }
        break;
    case PAD_BUTTON_B:
        return 4;
    }

    return 0xffffffff;
}

void ov12_0226A594(BattleInput *battleInput, int param1) {
    BattleCursorPosition *cursorPos;
    int battler, j, i;

    if (param1 == 4) {
        return;
    }

    battler = ov12_0223AAD8(battleInput->battleSystem, battleInput->unk6EE);
    cursorPos = ov12_02261280(BattleSystem_GetOpponentData(battleInput->battleSystem, battler));

    cursorPos->unk_06 = battleInput->unk6F0;

    for (i = 0; i < 3; i++) {
        for (j = 0; j < 2; j++) {
            if (param1 == ov12_0226E210[i][j]) {
                cursorPos->unk_04 = j;
                cursorPos->unk_05 = i;

                return;
            }
        }
    }
}

extern __attribute__((aligned(4))) u8 ov12_0226E200[2][1];

int ov12_0226A5F0(BattleInput *battleInput, int param1) {
    BattleInputCurosrData *cursorMove;
    u32 keyPressed;
    const BattleMenuTemplate *menu;
    int index;

    cursorMove = &battleInput->cursorData;
    menu = &sBattleMenuTemplates[battleInput->curMenuId];

    if (param1 == 1) {
        index = ov12_0226E200[cursorMove->menuY][cursorMove->menuX];
        ov12_0226BB1C(battleInput->cursor, menu->touchscreenRect[index].rect.left + 8, menu->touchscreenRect[index].rect.right - 8, menu->touchscreenRect[index].rect.top + 8, menu->touchscreenRect[index].rect.bottom - 8, ((192 + 80) << FX32_SHIFT));
        return 0xffffffff;
    }

    keyPressed = ov12_0226A6EC(cursorMove, 1, 2, ov12_0226E200[0]);

    switch (keyPressed) {
    case PAD_KEY_UP:
    case PAD_KEY_DOWN:
    case PAD_KEY_LEFT:
    case PAD_KEY_RIGHT:
        index = ov12_0226E200[cursorMove->menuY][cursorMove->menuX];
        ov12_0226BB1C(battleInput->cursor, menu->touchscreenRect[index].rect.left + 8, menu->touchscreenRect[index].rect.right - 8, menu->touchscreenRect[index].rect.top + 8, menu->touchscreenRect[index].rect.bottom - 8, ((192 + 80) << FX32_SHIFT));
        break;
    case PAD_BUTTON_A:
        index = ov12_0226E200[cursorMove->menuY][cursorMove->menuX];
        return index;
    case PAD_BUTTON_B:
        return 1;
    }

    return 0xffffffff;
}

u32 ov12_0226A6EC(BattleInputCurosrData *cursorMove, int xMax, int yMax, u8 *moveData) {
    int y, x;
    u32 key;

    if (cursorMove->menuX >= xMax) {
        cursorMove->menuX = xMax - 1;
    }

    if (cursorMove->menuY >= yMax) {
        cursorMove->menuY = yMax - 1;
    }

    x = cursorMove->menuX;
    y = cursorMove->menuY;

    if (gSystem.newKeys & PAD_KEY_UP) {
        cursorMove->menuY--;

        if (cursorMove->menuY < 0) {
            cursorMove->menuY = 0;
        }

        if (moveData != NULL) {
            while (moveData[xMax * cursorMove->menuY + cursorMove->menuX] == 0xff) {
                cursorMove->menuY--;

                if (cursorMove->menuY < 0) {
                    cursorMove->menuY = y;
                    break;
                }
            }
        }

        key = PAD_KEY_UP;
    } else if (gSystem.newKeys & PAD_KEY_DOWN) {
        cursorMove->menuY++;

        if (cursorMove->menuY >= yMax) {
            cursorMove->menuY = yMax - 1;
        }

        if (moveData != NULL) {
            while (moveData[xMax * cursorMove->menuY + cursorMove->menuX] == 0xff) {
                cursorMove->menuY++;

                if (cursorMove->menuY >= yMax) {
                    cursorMove->menuY = y;
                    break;
                }
            }
        }

        key = PAD_KEY_DOWN;
    } else if (gSystem.newKeys & PAD_KEY_LEFT) {
        cursorMove->menuX--;

        if (cursorMove->menuX < 0) {
            cursorMove->menuX = 0;
        }

        if (moveData != NULL) {
            while (moveData[xMax * cursorMove->menuY + cursorMove->menuX] == 0xff) {
                cursorMove->menuX--;

                if (cursorMove->menuX < 0) {
                    cursorMove->menuX = x;
                    break;
                }
            }
        }

        key = PAD_KEY_LEFT;
    } else if (gSystem.newKeys & PAD_KEY_RIGHT) {
        cursorMove->menuX++;

        if (cursorMove->menuX >= xMax) {
            cursorMove->menuX = xMax - 1;
        }

        if (moveData != NULL) {
            while (moveData[xMax * cursorMove->menuY + cursorMove->menuX] == 0xff) {
                cursorMove->menuX++;

                if (cursorMove->menuX >= xMax) {
                    cursorMove->menuX = x;
                    break;
                }
            }
        }

        key = PAD_KEY_RIGHT;
    } else if (gSystem.newKeys & PAD_BUTTON_A) {
        key = PAD_BUTTON_A;
    } else if (gSystem.newKeys & PAD_BUTTON_B) {
        key = PAD_BUTTON_B;
    } else {
        return 0;
    }

    if (moveData != NULL) {
        int prevIndex, index;

        prevIndex = moveData[xMax * y + x];
        index = moveData[xMax * cursorMove->menuY + cursorMove->menuX];

        if (prevIndex == index) {
            cursorMove->menuX = x;
            cursorMove->menuY = y;
        }
    }

    if ((cursorMove->menuX != x) || (cursorMove->menuY != y)) {
        PlaySE(1500);
    } else if (key & 0xF0) {
        return 0;
    }

    return key;
}

int ov12_0226A8E4(BattleInput *battleInput) {
    return battleInput->keyPressed;
}

void ov12_0226A8EC(BattleInput *battleInput, int key) {
    battleInput->keyPressed = key;
}

extern int (*const ov12_0226E260[2])(BattleInput *);
int BattleInput_CatchingTutorialMain(BattleInput *battleInput) {
    SpriteSystem *spriteSystem = BattleSystem_GetSpriteSystem(battleInput->battleSystem);
    SpriteManager *spriteManager = BattleSystem_GetSpriteManager(battleInput->battleSystem);
    PaletteData *palette = BattleSystem_GetPaletteData(battleInput->battleSystem);
    int ret = 0xffffffff;

    if (ov12_0223BB04(battleInput->battleSystem) == 0) {
        GF_ASSERT(battleInput->tutorial.state < NELEMS(ov12_0226E260));
        ret = ov12_0226E260[battleInput->tutorial.state](battleInput);
    } else {
        ret = ov12_0226AA10(battleInput);
    }

    if (ret != 0xffffffff) {
        battleInput->tutorial.substate = 0;
        battleInput->tutorial.delay = 0;
        battleInput->tutorial.state++;
    }

    return ret;
}

int ov12_0226A960(BattleInput *battleInput) {
    switch (battleInput->tutorial.substate) {
    case 0:
        ov12_0226BCFC(battleInput->tutorial.finger, 128, 84 - 25, ((192 + 80) << FX32_SHIFT));
        ov12_0226BD4C(battleInput->tutorial.finger, 60);
        battleInput->tutorial.substate++;
        break;
    default:
        if (ov12_0226BD50(battleInput->tutorial.finger) == TRUE) {
            battleInput->tutorial.substate++;
            return 0;
        }

        break;
    }

    return 0xffffffff;
}

int ov12_0226A9B8(BattleInput *battleInput) {
    switch (battleInput->tutorial.substate) {
    case 0:
        ov12_0226BCFC(battleInput->tutorial.finger, 64, 46 - 25, ((192 + 80) << FX32_SHIFT));
        ov12_0226BD4C(battleInput->tutorial.finger, 60);
        battleInput->tutorial.substate++;
        break;
    default:
        if (ov12_0226BD50(battleInput->tutorial.finger) == TRUE) {
            battleInput->tutorial.substate++;
            return 1;
        }
        break;
    }

    return 0xffffffff;
}

int ov12_0226AA10(BattleInput *battleInput) {
    switch (battleInput->tutorial.substate) {
    case 0:
        battleInput->tutorial.delay++;

        if (battleInput->tutorial.delay > 60) {
            battleInput->tutorial.delay = 0;
            battleInput->tutorial.substate++;
        }
        break;
    case 1:
        ov12_0226BCFC(battleInput->tutorial.finger, 40, 170 - 25, ((192 + 80) << FX32_SHIFT));
        ov12_0226BD4C(battleInput->tutorial.finger, 60);
        battleInput->tutorial.substate++;
        break;
    default:
        if (ov12_0226BD50(battleInput->tutorial.finger) == 1) {
            battleInput->tutorial.substate++;
            return 1;
        }
        break;
    }

    return 0xffffffff;
}

typedef struct TempStruct_0226E23C {
    u8 padding[0x2c];
    u16 data[3][2];
} TempStruct_0226E23C;
extern const TempStruct_0226E23C ov12_0226E23C;
void ov12_0226AA8C(BattleInput *battleInput, int index) {
    BgConfig *bgConfig = BattleSystem_GetBgConfig(battleInput->battleSystem);
    PaletteData *palette = BattleSystem_GetPaletteData(battleInput->battleSystem);

    GF_ASSERT(battleInput->curMenuId == 18);

    LoadUserFrameGfx1(bgConfig, GF_BG_LYR_SUB_1, 0x20, 1, 0, HEAP_ID_BATTLE);
    PaletteData_LoadPaletteSlotFromHardware(palette, PLTTBUF_SUB_BG, 1 * 16, 0x20);

    int fillVal = 0x20, paletteNo = 1;
    int v4, v5, v6, v7;

    v4 = 1;
    v5 = 6;
    v6 = 30;
    v7 = 6;

    FillBgTilemapRect(bgConfig, 5, fillVal, v4, v5, 1, 1, paletteNo);
    FillBgTilemapRect(bgConfig, 5, fillVal + 1, v4 + 1, v5, v6 - 2, 1, paletteNo);
    FillBgTilemapRect(bgConfig, 5, fillVal + 2, v4 + v6 - 1, v5, 1, 1, paletteNo);
    FillBgTilemapRect(bgConfig, 5, fillVal + 3, v4, v5 + 1, 1, v7 - 2, paletteNo);
    FillBgTilemapRect(bgConfig, 5, fillVal + 5, v4 + v6 - 1, v5 + 1, 1, v7 - 2, paletteNo);
    FillBgTilemapRect(bgConfig, 5, fillVal + 6, v4, v5 + v7 - 1, 1, 1, paletteNo);
    FillBgTilemapRect(bgConfig, 5, fillVal + 7, v4 + 1, v5 + v7 - 1, v6 - 2, 1, paletteNo);
    FillBgTilemapRect(bgConfig, 5, fillVal + 8, v4 + v6 - 1, v5 + v7 - 1, 1, 1, paletteNo);
    FillBgTilemapRect(bgConfig, 5, fillVal + 4, v4 + 1, v5 + 1, v6 - 2, v7 - 2, paletteNo);
    ScheduleBgTilemapBufferTransfer(bgConfig, 5);

    String *src;
    MsgData *msgLoader = BattleSystem_GetMessageLoader(battleInput->battleSystem);
    int i;
    u16 stopMsgId[3][2];
    stopMsgId = ov12_0226E23C.data;
    /*const u16 stopMsgId[][2] = {
        // Playback paused
        // Please wait
        { pl_msg_00000368_01261, pl_msg_00000368_01262 },
        // Data is corrupted
        // Playback canceled
        { pl_msg_00000368_01263, pl_msg_00000368_01264 },
        // Battle is too long
        // Playback canceled
        { pl_msg_00000368_01265, pl_msg_00000368_01266 },
    };
*/
    for (i = 0; i < 2; i++) {
        if (battleInput->textObj[1 + i].unk0 != NULL) {
            GF_ASSERT(0);
            return;
        }

        src = NewString_ReadMsgData(msgLoader, stopMsgId[index][i]);

        BattleInput_CreateTextObject(battleInput, &battleInput->textObj[1 + i], src, 0, MAKE_TEXT_COLOR(1, 2, 0), 4, 20023, 1 * 8 + 8, 6 * 8 + 16 + 16 * i, 0, NULL);
        String_Delete(src);
    }
}

u8 ov12_0226AC64(BattleInput *battleInput) {
    return battleInput->cancelRun;
}

extern ManagedSpriteTemplate ov12_0226E54C;
extern ManagedSpriteTemplate ov12_0226E518;
void ov12_0226AC70(BattleInput *battleInput) {
    GF_ASSERT(battleInput->unk_6F0 == NULL);

    SpriteSystem *spriteSystem = BattleSystem_GetSpriteSystem(battleInput->battleSystem);
    SpriteManager *spriteManager = BattleSystem_GetSpriteManager(battleInput->battleSystem);
    NARC *narc = NARC_New(NARC_a_0_0_8, HEAP_ID_BATTLE);

    SpriteSystem_LoadCharResObjFromOpenNarc(spriteSystem, spriteManager, narc, 0x157, 1, NNS_G2D_VRAM_TYPE_2DSUB, 0x4e48);
    SpriteSystem_LoadCellResObjFromOpenNarc(spriteSystem, spriteManager, narc, 0x158, 1, 0x4e36);
    SpriteSystem_LoadAnimResObjFromOpenNarc(spriteSystem, spriteManager, narc, 0x159, 1, 0x4e36);

    NARC_Delete(narc);

    battleInput->unk_6F4 = SpriteSystem_NewSprite(spriteSystem, spriteManager, &ov12_0226E54C);
    ManagedSprite_SetPositionXYWithSubscreenOffset(battleInput->unk_6F4, 0xd0, 16, 0x110000);
    ManagedSprite_TickFrame(battleInput->unk_6F4);

    battleInput->unk_6F0 = SpriteSystem_NewSprite(spriteSystem, spriteManager, &ov12_0226E518);
    Sprite_SetAnimCtrlSeq(battleInput->unk_6F0->sprite, 1);
    ManagedSprite_SetPositionXYWithSubscreenOffset(battleInput->unk_6F0, 0x58, 8, 0x110000);
    ManagedSprite_TickFrame(battleInput->unk_6F0);
}

void ov12_0226AD60(BattleInput *battleInput) {
    if (battleInput->unk_6F0 == NULL || battleInput->unk_6F4 == NULL) {
        return;
    }

    SpriteManager *spriteManager = BattleSystem_GetSpriteManager(battleInput->battleSystem);

    Sprite_DeleteAndFreeResources(battleInput->unk_6F0);
    Sprite_DeleteAndFreeResources(battleInput->unk_6F4);

    battleInput->unk_6F0 = NULL;
    battleInput->unk_6F4 = NULL;

    SpriteManager_UnloadCharObjById(spriteManager, 0x4e48);
    SpriteManager_UnloadCellObjById(spriteManager, 0x4e36);
    SpriteManager_UnloadAnimObjById(spriteManager, 0x4e36);
}

BOOL BattleSystem_IsInFrontier(BattleSystem *battleSystem) {
    int battleType = BattleSystem_GetBattleType(battleSystem);
    return (battleType & BATTLE_TYPE_FRONTIER) && !(battleType & BATTLE_TYPE_13);
}
