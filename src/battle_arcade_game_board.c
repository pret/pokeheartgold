#include "global.h"
#include "battle_arcade_game_board.h"
#include "filesystem.h"
#include "font.h"
#include "gf_gfx_loader.h"
#include "gx_layers.h"
#include "math_util.h"
#include "overlay_80.h"
#include "palette.h"
#include "party.h"
#include "system.h"
#include "constants/sndseq.h"
#include "unk_02030A98.h"
#include "unk_02096910.h"
#include "unk_020379A0.h"
#include "unk_0200FA24.h"
#include "unk_02035900.h"
#include "unk_02009D48.h"
#include "unk_0203A3B0.h"
#include "unk_02035900.h"
#include "unk_02005D10.h"
#include "unk_02025154.h"
#include "unk_02022588.h"
#include "unk_020215A0.h"
#include "unk_0200A090.h"
#include "unk_02078E30.h"
#include "vram_transfer_manager.h"
#include "unk_0200B150.h"
#include "pokemon.h"
#include "unk_0200ACF0.h"
#include "pokemon_icon_idx.h"

#include "msgdata/msg.naix"

FS_EXTERN_OVERLAY(OVY_80);

static u8 s_0223FA20[2];

static BOOL BattleArcadeGameBoard_Init(GAME_BOARD_WORK *work);
static BOOL BattleArcadeGameBoard_MoveCursor(GAME_BOARD_WORK *work);
static BOOL ov84_0223E384(GAME_BOARD_WORK *work);
static void BattleArcadeGameBoard_Delete(GAME_BOARD_WORK *work);
static void BattleArcadeGameBoard_InitSub();
static void BattleArcadeGameBoard_InitObjects(GAME_BOARD_WORK *work);
static void ov84_0223E8DC(GAME_BOARD_WORK *work);
static void ov84_0223E934(GAME_BOARD_WORK *work);
static void ov84_0223E958(BgConfig *config);
static void BattleArcade_VBlank(void *work);
static void BattleArcade_SetVramBanks(void);
static void ov84_0223E9E4(BgConfig *config) ;
static void ov84_0223EAAC(GAME_BOARD_WORK *work, enum GFBgLayer layer);
static void ov84_0223EB08(GAME_BOARD_WORK *work, enum GFBgLayer layer);
static void ov84_0223EB44(void);
static void ov84_0223EB78(GAME_BOARD_WORK *work, enum GFBgLayer layer);
static void BattleArcadeGameBoard_SetState(GAME_BOARD_WORK *work, int *state, int a2);
static void ov84_0223EBE8(GAME_BOARD_WORK *work, int key);
static void BattleArcadeGameBoard_SetCursorPos(GAME_BOARD_WORK *work, u8 cursorPos);
static void BattleArcadeGameBoard_StartCursorSlowdown(GAME_BOARD_WORK *work);
static u8 ov84_0223EC88(u8 area, u8 a2);
static u16 BattleArcade_GetWinstreak(GAME_BOARD_WORK *work);
static BOOL ov84_0223ECBC(GAME_BOARD_WORK *work, u16 type, u16 a2);
static void ov84_0223ED00(GAME_BOARD_WORK *work, u16 type);
static void ov84_0223ED6C(GAME_BOARD_WORK *work, u16 type, u16 a2);
static u16 BattleArcade_Random(GAME_BOARD_WORK *work);
static void ov84_0223EDF8(GAME_BOARD_WORK *work, u16 type);
static void BattleArcadeGameBoard_StopCursor(GAME_BOARD_WORK *work, u8 type);
static void ov84_0223EE74(GAME_BOARD_WORK *work);
static void ov84_0223EFE0(GAME_BOARD_WORK *work);
static void ov84_0223F094(GAME_BOARD_WORK *work);
static u8 ov84_0223F178(GAME_BOARD_WORK*, u8);
static void ov84_0223F1BC(GAME_BOARD_WORK *work);
static BOOL BattleArcadeGameBoard_CheckButtonPress(GAME_BOARD_WORK *work);
static void ov84_0223F28C(GAME_BOARD_WORK *work);
static void ov84_0223F2B4(GAME_BOARD_SUB_3E8 *work, Party *playerParty, Party *opponentParty, u8 type);
static Sprite *ov84_0223F374(GAME_BOARD_SUB_3E8 *work, u32 chara, u32 pal, u32 cell, u32 anim, u32 prio, int bgPrio, u8 display);
static void ov84_0223F418(GAME_BOARD_SUB_3E8 *work);
static void ov84_0223F480(void);
static void ov84_0223F4B4(GAME_BOARD_SUB_3E8 *work);
static void ov84_0223F538(GAME_BOARD_SUB_3E8 *work);
static void ov84_0223F5E4(GAME_BOARD_SUB_3E8 *work, Party *playerParty, Party *opponentParty, u8 type);
static void ov84_0223F714(GAME_BOARD_SUB_3E8 *work);
static BATTLE_ARCADE_OBJECT *BattleArcadeObject_Create(GAME_BOARD_SUB_3E8 *work, u32 chara, u32 pal, u32 cell, u32 anim, u16 x, u16 y, u32 priority, int bgPrio, u8 display);
static void *BattleArcadeObj_Delete(BATTLE_ARCADE_OBJECT *obj);
static void BattleArcadeObj_SetVisible(BATTLE_ARCADE_OBJECT *obj, int flag);
static void BattleArcadeObj_SetPos(BATTLE_ARCADE_OBJECT *obj, u16 x, u16 y);
static void BattleArcadeObj_SetAnimation(BATTLE_ARCADE_OBJECT *obj, u32 val);
static void ov84_0223F894(BATTLE_ARCADE_OBJECT *obj, Pokemon *mon);
static void ov84_0223F8A8(BATTLE_ARCADE_OBJECT *obj, int flag);
static void ov84_0223F8B4(BgConfig *config, Window *window);
static void ov84_0223F8E4(Window *window);
static BOOL BattleArcadeGameBoard_EndMulti(GAME_BOARD_WORK *work);
static BOOL BattleArcadeGameBoard_End(GAME_BOARD_WORK *work);

BOOL BattleArcadeGameBoard_InitOverlay(OVY_MANAGER *man, int *state) {
    int i;
    GAME_BOARD_WORK *work;
    GAME_BOARD_ARGS *args;

    HandleLoadOverlay(FS_OVERLAY_ID(OVY_80), OVY_LOAD_ASYNC);
    BattleArcadeGameBoard_InitSub();
    CreateHeap(3, HEAP_ID_GAME_BOARD, 0x20000);
    work = OverlayManager_CreateAndGetData(man, sizeof(GAME_BOARD_WORK), HEAP_ID_GAME_BOARD);
    memset(work, 0, sizeof(GAME_BOARD_WORK));

    work->bgConfig = BgConfig_Alloc(HEAP_ID_GAME_BOARD);
    work->man = man;
    args = (GAME_BOARD_ARGS *) OverlayManager_GetArgs(man);
    work->saveData = args->saveData;
    work->arcadeSaveData = sub_02030E88(work->saveData);
    work->arcadeScoreSaveData = sub_02030FA0(work->saveData);
    work->type = args->type;
    work->unk2A = args->unk1E;
    work->winstreak = args->winstreak;
    work->multiWinstreak = args->multiWinstreak;
    work->unk12 = args->unk7;
    work->returnWork = &args->returnWork;
    work->options = Save_PlayerData_GetOptionsAddr(work->saveData);
    work->playerParty = args->playerParty;
    work->opponentParty = args->opponentParty;
    work->unkE = 0xff;
    work->frontierSaveData = sub_0203107C(work->saveData);
    work->weather = args->weather;
    work->cursorSpeed = args->cursorSpeed;
    work->unk20 = args->unk10;
    work->unk24 = args->unk14;
    work->unk18 = 900;
    work->randomFlag = args->randomFlag;

    for (i = 0; i < 32; i++) {
        work->unk44[i] = 32;
    }

    work->boardHeight = 4;
    work->boardWidth = 4;
    work->boardArea = 16;

    work->multiCursorPos = 0;

    *work->unk24 = BattleArcade_Random(work);
    work->cursorPosStart = LCRandom() % 16;

    BattleArcadeGameBoard_InitObjects(work);

    if (BattleArcade_MultiplayerCheck(work->type) == TRUE) {
        sub_02096910(work);
    }

    *state = 0;
    s_0223FA20[0] = 0;
    s_0223FA20[1] = 0;

    return TRUE;
}

BOOL BattleArcadeGameBoard_Main(OVY_MANAGER *man, int *state) {
    GAME_BOARD_WORK *work = OverlayManager_GetData(man);

    if (work->unkE != 0xff && *state == 1) {
        ov84_0223F28C(work);
        work->unk14 = ov84_0223EC88(work->boardArea, work->unkE);
        BattleArcadeGameBoard_SetState(work, state, 2);
    }

    switch (*state) {
    case 0:
        if (BattleArcadeGameBoard_Init(work) == TRUE) {
            BattleArcadeGameBoard_SetState(work, state, 1);
        }
        break;
    case 1:
        if (BattleArcadeGameBoard_MoveCursor(work) == TRUE) {
            if (work->unk2F_1 == 1) {
                BattleArcadeGameBoard_SetState(work, state, 2);
            } else if (BattleArcade_MultiplayerCheck(work->type) == TRUE) {
                BattleArcadeGameBoard_SetState(work, state, 3);
            } else {
                BattleArcadeGameBoard_SetState(work, state, 4);
            }
        }
        break;
    case 2:
        if (ov84_0223E384(work) == TRUE) {
            BattleArcadeGameBoard_SetState(work, state, 3);
        }
        break;
    case 3:
        if (BattleArcadeGameBoard_EndMulti(work) == TRUE) {
            BattleArcadeGameBoard_SetState(work, state, 4);
        }
        break;
    case 4:
        if (BattleArcadeGameBoard_End(work) == TRUE) {
            return TRUE;
        }
        break;
    }

    work->unk13_1++;
    if (work->unk13_1 >= 4) {
        work->unk13_1 = 0;
        work->unk13_0 ^= 1;
    }

    sub_0202457C(work->unk3E8.spriteList);

    return FALSE;
}

BOOL ov84_0223DFF0(OVY_MANAGER *man, int *state) {
    GAME_BOARD_WORK *work = OverlayManager_GetData(man);

    *work->returnWork = work->cursorPos;

    GF_DestroyVramTransferManager();

    BattleArcadeGameBoard_Delete(work);

    OverlayManager_FreeData(man);

    Main_SetVBlankIntrCB(NULL, NULL);
    DestroyHeap(HEAP_ID_GAME_BOARD);
    UnloadOverlayByID(FS_OVERLAY_ID(OVY_80));

    return TRUE;
}

static BOOL BattleArcadeGameBoard_Init(GAME_BOARD_WORK *work) {
    switch (work->substate) {
    case 0:
        if (BattleArcade_MultiplayerCheck(work->type) == TRUE) {
            sub_02037BEC();
            sub_02037AC0(199);
            work->substate++;
        } else {
            work->substate++;
        }
        break;
    case 1:
        if (BattleArcade_MultiplayerCheck(work->type) == TRUE) {
            if (sub_02037B38(199) == TRUE) {
                sub_02037BEC();
                work->substate++;
            }
        } else {
            work->substate++;
        }
        break;
    case 2:
        ov84_0223EE74(work);
        work->substate++;
        break;
    case 3:
        ov84_0223EFE0(work);
        work->substate++;
        break;
    case 4:
        ov84_0223F094(work);
        work->substate++;
        break;
    case 5:
        if (BattleArcade_MultiplayerCheck(work->type) == TRUE) {
            sub_02037BEC();
            sub_02037AC0(201);
            work->substate++;
        } else {
            work->substate++;
        }
        break;
    case 6:
        if (BattleArcade_MultiplayerCheck(work->type) == TRUE) {
            if (sub_02037B38(201) == TRUE) {
                sub_02037BEC();
                work->substate++;
            }
        } else {
            work->substate++;
        }
        break;
    case 7:
        if (BattleArcade_MultiplayerCheck(work->type) == TRUE) {
            if (ov84_0223ECBC(work, 30, 0) == TRUE) {
                work->substate++;
            }
        } else {
            BeginNormalPaletteFade(0, 1, 1, 0, 6, 3, HEAP_ID_GAME_BOARD);
            work->substate++;
        }
        break;
    case 8:
        if (BattleArcade_MultiplayerCheck(work->type) == TRUE) {
            if (work->unkF >= 2) {
                work->unkF = 0;
                BeginNormalPaletteFade(0, 1, 1, 0, 6, 3, HEAP_ID_GAME_BOARD);
                work->substate++;
            }
        } else {
            work->substate++;
        }
        break;
    case 9:
        if (IsPaletteFadeFinished() == TRUE) {
            return TRUE;
        }
        break;
    }
    return FALSE;
}

static BOOL BattleArcadeGameBoard_MoveCursor(GAME_BOARD_WORK *work) {
    int i;
    switch (work->substate) {
    case 0:
        work->wait = 0;
        work->cursorPos = work->cursorPosStart;
        BattleArcadeGameBoard_SetCursorPos(work, work->cursorPos);
        work->substate = 1;
        break;
    case 1:
        work->wait++;
        if (work->wait >= 10) {
            work->wait = 0;
            work->substate = 2;
        }
        break;
    case 2:
        for (i = 0; i < 16; i++) {
            if (work->panel[i] != NULL) {
                BattleArcadeObj_SetAnimation(work->panel[i], 32);
                BattleArcadeObj_SetVisible(work->panel[i], 1);
            }
        }
        ov84_0223EB08(work, GF_BG_LYR_MAIN_3);
        PlaySE(SEQ_SE_DP_WIN_OPEN2);
        work->wait = 24;
        work->substate = 3;
        break;
    case 3:
        work->wait--;
        if (work->wait > 0) {
            break;
        }
        for (i = 0; i < 16; i++) {
            if (work->panel[i] != NULL) {
                BattleArcadeObj_SetAnimation(work->panel[i], 33);
            }
        }
        PlaySE(SEQ_SE_DP_WIN_OPEN2);
        work->wait = 24;
        work->substate = 4;
        break;
    case 4:
        work->wait--;
        if (work->wait > 0) {
            break;
        }
        for (i = 0; i < 16; i++) {
            if (work->panel[i] != NULL) {
                BattleArcadeObj_SetAnimation(work->panel[i], 34);
            }
        }
        PlaySE(SEQ_SE_DP_WIN_OPEN2);
        work->wait = 24;
        work->substate = 5;
        break;
    case 5:
        work->wait--;
        if (work->wait > 0) {
            break;
        }
        for (i = 0; i < 16; i++) {
            if (work->panel[i] != NULL) {
                BattleArcadeObj_SetAnimation(work->panel[i], work->unk34[i]);
            }
        }
        BattleArcadeObj_SetVisible(work->cursor, 1);
        PlaySE(SEQ_SE_DP_UG_020);
        BattleArcadeObj_SetAnimation(work->button, 0);
        work->substate = 6;
        break;
    case 6:
        ov84_0223EBE8(work, gSystem.newKeys);
        if (sub_0203769C() == 0) {
            if (work->unk18 > 0) {
                work->unk18--;
            }
        }
        if (BattleArcadeGameBoard_CheckButtonPress(work) == TRUE || work->unk18 ==0) {
            BattleArcadeGameBoard_StartCursorSlowdown(work);
            if (BattleArcade_MultiplayerCheck(work->type) == FALSE) {
                work->substate = 7;
            } else {
                work->unk2F_1 = 1;
                return TRUE;
            }
        }
        break;
    case 7:
        BattleArcadeGameBoard_StopCursor(work, work->cursorPos);
        work->wait = 30;
        work->substate = 8;
        break;
    case 8:
        work->wait--;
        if (work->wait == 0) {
            return TRUE;
        }
        break;
    }
    return FALSE;
}

static BOOL ov84_0223E384(GAME_BOARD_WORK *work) {
    switch (work->substate) {
    case 0:
        if (ov84_0223ECBC(work, 31, work->unk14) == TRUE) {
            work->unk2F_1 = 0;
            work->substate++;
        }
        break;
    case 1:
        work->substate++;
        break;
    case 2:
        if (work->unkE != 255) {
            work->unkF = 0;
            BattleArcadeGameBoard_StopCursor(work, work->unkE);
            work->substate++;
        }
        break;
    case 3:
        sub_02037BEC();
        sub_02037AC0(151);
        work->substate++;
        break;
    case 4:
        if (sub_02037B38(151) == TRUE) {
            sub_02037BEC();
            sub_020379A0(HEAP_ID_GAME_BOARD);
            work->unkE = 255;
            return TRUE;
        }
        break;
    }
    return FALSE;
}

static BOOL BattleArcadeGameBoard_EndMulti(GAME_BOARD_WORK *work) {
    switch (work->substate) {
    case 0:
        work->wait = 15;
        work->substate++;
        break;
    case 1:
        if (work->wait > 0) {
            work->wait--;
        }
        if (work->wait == 0) {
            sub_02037BEC();
            sub_02037AC0(152);
            work->substate++;
        }
        break;
    case 2:
        if (sub_02037B38(152) == TRUE) {
            sub_02037BEC();
            return TRUE;
        }
        break;
    }
    return FALSE;
}

static BOOL BattleArcadeGameBoard_End(GAME_BOARD_WORK *work) {
    switch (work->substate) {
    case 0:
        BeginNormalPaletteFade(0, 0, 0, 0, 6, 1, HEAP_ID_GAME_BOARD);
        work->substate++;
        break;
    case 1:
        if (IsPaletteFadeFinished() == TRUE) {
            return TRUE;
        }
        break;
    }
    return FALSE;
}

static void BattleArcadeGameBoard_Delete(GAME_BOARD_WORK *work) {
    u8 max;
    int i;
    if (work->cursor != NULL) {
        BattleArcadeObj_Delete(work->cursor);
    }
    if (work->button != NULL) {
        BattleArcadeObj_Delete(work->button);
    }

    for (i = 0; i < 16; i++) {
        if (work->panel[i] != NULL) {
            BattleArcadeObj_Delete(work->panel[i]);
        }
    }

    max = BattleArcade_GetMonCount(work->type, 1);
    for (i = 0; i < max; i++) {
        if (work->iconA[i] != NULL) {
            BattleArcadeObj_Delete(work->iconA[i]);
        }
        if (work->iconB[i] != NULL) {
            BattleArcadeObj_Delete(work->iconB[i]);
        }
        if (work->itemA[i] != NULL) {
            BattleArcadeObj_Delete(work->itemA[i]);
        }
        if (work->itemB[i] != NULL) {
            BattleArcadeObj_Delete(work->itemB[i]);
        }
    }

    sub_0203A914();

    PaletteData_FreeBuffers(work->unk3D4, 2);
    PaletteData_FreeBuffers(work->unk3D4, 0);

    PaletteData_Free(work->unk3D4);
    work->unk3D4 = NULL;

    ov84_0223F418(&work->unk3E8);

    DestroyMsgData(work->msgData);
    MessageFormat_Delete(work->msgFmt);
    String_Delete(work->unk70);
    String_Delete(work->unk74);

    for (i = 0; i < 2; i++) {
        String_Delete(work->unk78[i]);
    }

    ov84_0223F8E4(work->window);
    ov84_0223E958(work->bgConfig);
    NARC_Delete(work->narc);
}

static void BattleArcadeGameBoard_InitSub() {
    Main_SetVBlankIntrCB(NULL, NULL);
    Main_SetHBlankIntrCB(NULL, NULL);
    GX_DisableEngineALayers();
    GX_DisableEngineBLayers();
    GX_SetVisiblePlane(0);
    GXS_SetVisiblePlane(0);
}

static void BattleArcadeGameBoard_InitObjects(GAME_BOARD_WORK *work) {
    u8 max;
    u16 yOffset, yOffset2;
    int i;

    work->narc = NARC_New(NARC_a_1_8_3, HEAP_ID_GAME_BOARD);
    ov84_0223E8DC(work);
    ov84_0223E934(work);

    work->msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0425_bin, HEAP_ID_GAME_BOARD);
    work->msgFmt = MessageFormat_New(HEAP_ID_GAME_BOARD);
    work->unk70 = String_New(600, HEAP_ID_GAME_BOARD);
    work->unk74 = String_New(600, HEAP_ID_GAME_BOARD);

    for (i = 0; i < 2; i++) {
        work->unk78[i] = String_New(32, HEAP_ID_GAME_BOARD);
    }

    LoadFontPal0(GF_BG_LYR_MAIN_0, 416, HEAP_ID_GAME_BOARD);
    LoadFontPal1(GF_BG_LYR_MAIN_0, 384, HEAP_ID_GAME_BOARD);
    ov84_0223F8B4(work->bgConfig, work->window);
    work->cursor = BattleArcadeObject_Create(&work->unk3E8, 1, 1, 1, 35, 68, 36, 0, 2, 0);
    BattleArcadeObj_SetVisible(work->cursor, 0);

    for (i = 0; i < 16; i++) {
        work->panel[i] = BattleArcadeObject_Create(&work->unk3E8, 1, 1, 1, 32, 68 + 40*(i%4), 36 + 40*(i/4), 1, 2, 0);
        BattleArcadeObj_SetVisible(work->panel[i], 0);
    }

    max = BattleArcade_GetMonCount(work->type, 1);

    if (BattleArcade_MultiplayerCheck(work->type) == FALSE) {
        yOffset = 46;
        yOffset2 = 50;
    } else {
        yOffset = 22;
        yOffset2 = 26;
    }

    for (i = 0; i < max; i++) {
        work->itemA[i] = BattleArcadeObject_Create(&work->unk3E8, 2, 2, 2, 0, 24, yOffset2 + i*40, 0, 2, 0);
        work->itemB[i] = BattleArcadeObject_Create(&work->unk3E8, 2, 2, 2, 0, 246, yOffset2 + i*40, 0, 2, 0);
        work->iconA[i] = BattleArcadeObject_Create(&work->unk3E8, 3 + i, 3, 3, 1, 16, yOffset + i*40, 1, 2, 0);
        work->iconB[i] = BattleArcadeObject_Create(&work->unk3E8, 7 + i, 3, 3, 1, 238, yOffset + i*40, 1, 2, 0);
        ov84_0223F894(work->iconA[i], Party_GetMonByIndex(work->playerParty, i));
        ov84_0223F894(work->iconB[i], Party_GetMonByIndex(work->opponentParty, i));
        ov84_0223F8A8(work->iconA[i], 0);
        ov84_0223F8A8(work->iconB[i], 0);
    }

    ov84_0223F1BC(work);

    work->button = BattleArcadeObject_Create(&work->unk3E8, 0, 0, 0, 2, 128, 96, 0, 0, 1);

    if (sub_02037474()) {
        sub_02009FE8(1, GX_OBJVRAMMODE_CHAR_1D_32K);
        sub_0200A080(1);
        sub_0203A880();
    }

    Main_SetVBlankIntrCB(BattleArcade_VBlank, work);
}

static void ov84_0223E8DC(GAME_BOARD_WORK *work) {
    BattleArcade_SetVramBanks();
    ov84_0223E9E4(work->bgConfig);

    work->unk3D4 = PaletteData_Init(HEAP_ID_GAME_BOARD);

    PaletteData_AllocBuffers(work->unk3D4, 2, 0x200, HEAP_ID_GAME_BOARD);
    PaletteData_AllocBuffers(work->unk3D4, 0, 0x200, HEAP_ID_GAME_BOARD);

    ov84_0223EAAC(work, GF_BG_LYR_MAIN_3);
    ov84_0223EB44();
    ov84_0223EB78(work, GF_BG_LYR_SUB_0);
}

static void ov84_0223E934(GAME_BOARD_WORK *work) {
    ov84_0223F2B4(&work->unk3E8, work->playerParty, work->opponentParty, BattleArcade_MultiplayerCheck(work->type));
}

static void ov84_0223E958(BgConfig *config) {
    GX_EngineAToggleLayers(31, GX_LAYER_TOGGLE_OFF);
    GX_EngineBToggleLayers(31, GX_LAYER_TOGGLE_OFF);
    FreeBgTilemapBuffer(config, 3);
    FreeBgTilemapBuffer(config, 1);
    FreeBgTilemapBuffer(config, 4);
    FreeToHeap(config);
}

static void BattleArcade_VBlank(void *_work) {
    GAME_BOARD_WORK *work = _work;

    if (work->unk3D4 != NULL) {
        sub_0200398C(work->unk3D4);
    }

    DoScheduledBgGpuUpdates(work->bgConfig);
    GF_RunVramTransferTasks();
    OamManager_ApplyAndResetBuffers();
    OS_SetIrqCheckFlag(OS_IE_V_BLANK);
}

extern GraphicsBanks ov84_0223F9BC;

static void BattleArcade_SetVramBanks() {
    GraphicsBanks config = ov84_0223F9BC;
    GX_SetBanks(&config);
}

extern GraphicsModes ov84_0223F924;
extern BgTemplate ov84_0223F964;
extern BgTemplate ov84_0223F980;
extern BgTemplate ov84_0223F948;

static void ov84_0223E9E4(BgConfig *config) {
    GraphicsModes bgModeSet = ov84_0223F924;
    SetBothScreensModesAndDisable(&bgModeSet);

    BgTemplate template = ov84_0223F964;
    InitBgFromTemplate(config, 1, &template, 0);
    BG_ClearCharDataRange(1, 32, 0, HEAP_ID_GAME_BOARD);
    BgClearTilemapBufferAndCommit(config, 1);

    BgTemplate template2 = ov84_0223F980;
    InitBgFromTemplate(config, 3, &template2, 0);
    BgClearTilemapBufferAndCommit(config, 3);

    BgTemplate template3 = ov84_0223F948;
    InitBgFromTemplate(config, 4, &template3, 0);
    BgClearTilemapBufferAndCommit(config, 4);

    G2_SetBG0Priority(0);

    GX_EngineAToggleLayers(1, GX_LAYER_TOGGLE_OFF);
}

static void ov84_0223EAAC(GAME_BOARD_WORK *work, enum GFBgLayer layer) {
    u32 var;

    GfGfxLoader_LoadCharDataFromOpenNarc(work->narc, 124, work->bgConfig, layer, 0, 0, 1, HEAP_ID_GAME_BOARD);

    if (BattleArcade_MultiplayerCheck(work->type) == FALSE) {
        var = 120;
    } else {
        var = 122;
    }

    GfGfxLoader_LoadScrnDataFromOpenNarc(work->narc, var, work->bgConfig, layer, 0, 0, 1, HEAP_ID_GAME_BOARD);
}

static void ov84_0223EB08(GAME_BOARD_WORK *work, enum GFBgLayer layer) {
    u32 var;

    if (BattleArcade_MultiplayerCheck(work->type) == FALSE) {
        var = 121;
    } else {
        var = 123;
    }

    GfGfxLoader_LoadScrnDataFromOpenNarc(work->narc, var, work->bgConfig, layer, 0, 0, 1, HEAP_ID_GAME_BOARD);
}

static void ov84_0223EB44(void) {
    void *buffer;
    NNSG2dPaletteData *dat;

    buffer = GfGfxLoader_GetPlttData(NARC_a_1_8_3, 186, &dat, HEAP_ID_GAME_BOARD);

    DC_FlushRange(dat->pRawData, 224);
    GX_LoadBGPltt(dat->pRawData, 0, 224);

    FreeToHeap(buffer);
}

static void ov84_0223EB78(GAME_BOARD_WORK *work, enum GFBgLayer layer) {
    GfGfxLoader_LoadCharDataFromOpenNarc(work->narc, 126, work->bgConfig, layer, 0, 0, TRUE, HEAP_ID_GAME_BOARD);
    GfGfxLoader_GXLoadPalFromOpenNarc(work->narc, 187, GF_BG_LYR_SUB_0, 0, 64, HEAP_ID_GAME_BOARD);
    GfGfxLoader_LoadScrnDataFromOpenNarc(work->narc, 125, work->bgConfig, layer, 0, 0, TRUE, HEAP_ID_GAME_BOARD);
}

static void BattleArcadeGameBoard_SetState(GAME_BOARD_WORK *work, int *state, int a2) {
    work->substate = 0;
    *state = a2;
}

extern u8 ov84_0223F913[8][2];

static void ov84_0223EBE8(GAME_BOARD_WORK *work, int key) {
    u8 level = *work->cursorSpeed;
    work->unk10++;

    if (work->unk10 >= ov84_0223F913[level][0]) {
        work->unk10 = 0;
        if (work->randomFlag == 1) {
            work->cursorPos = LCRandom() % 16;
        } else {
            work->cursorPos++;
        }

        PlaySE(SEQ_SE_DP_BUTTON3);

        if (work->cursorPos >= work->boardArea) {
            work->cursorPos = 0;
        }

        BattleArcadeGameBoard_SetCursorPos(work, work->cursorPos);
    }
}

static void BattleArcadeGameBoard_SetCursorPos(GAME_BOARD_WORK *work, u8 cursorPos) {
    BattleArcadeObj_SetPos(work->cursor, 68 + 40*(cursorPos % 4), 36 + 40*(cursorPos / 4));
}

static void BattleArcadeGameBoard_StartCursorSlowdown(GAME_BOARD_WORK *work) {
    work->unk14 = work->cursorPos;
}

static u8 ov84_0223EC88(u8 area, u8 a2) {
    if (a2 >= area){
        return a2 - area;
    }
    return a2;
}

static u16 BattleArcade_GetWinstreak(GAME_BOARD_WORK *work) {
    u16 winstreak = work->winstreak;

    if (BattleArcade_MultiplayerCheck(work->type) == TRUE && work->multiWinstreak > work->winstreak) {
        winstreak = work->multiWinstreak;
    }

    return winstreak;
}

static BOOL ov84_0223ECBC(GAME_BOARD_WORK *work, u16 type, u16 a2) {
    int unkA;

    switch (type) {
    case 30:
        unkA = 71;
        ov84_0223ED00(work, type);
        break;
    case 31:
        unkA = 72;
        ov84_0223ED6C(work, type, a2);
        break;
    case 32:
        unkA = 73;
        ov84_0223EDF8(work, type);
        break;
    }

    return (sub_02037030(unkA, work->sendBuffer, 40) == TRUE);
}

static void ov84_0223ED00(GAME_BOARD_WORK *work, u16 type) {
    int i, offset;

    Save_PlayerData_GetProfileAddr(work->saveData);

    work->sendBuffer[0] = type;

    offset = 2;

    for (i = 0; i < 16; i++) {
        work->sendBuffer[offset + i] = work->unk34[i];
    }

    offset += 16;

    work->sendBuffer[offset] = work->cursorPosStart;
}

void ov84_0223ED34(int a0, int size, void *data, void *_work) {
    int i, offset;
    GAME_BOARD_WORK *work = _work;
    const u16 *recv = data;

    work->unkF++;

    if (sub_0203769C() == a0) {
        return;
    }

    if (sub_0203769C() != 0) {
        offset = 2;

        for (i = 0; i < 16; i++) {
            work->unk34[i] = (u8) recv[offset + i];
        }

        offset += 16;

        work->cursorPosStart = recv[offset];
    }
}

static void ov84_0223ED6C(GAME_BOARD_WORK *work, u16 type, u16 a2) {
    int offset = 0;

    work->sendBuffer[offset] = type;
    offset++;

    work->sendBuffer[offset] = a2;
    offset++;

    if (sub_0203769C() == 0 && work->unkE == 255) {
        work->unkE = a2;
    }

    work->sendBuffer[offset] = work->unkE;
    offset++;

    work->sendBuffer[offset] = *work->unk24;
}

static u16 BattleArcade_Random(GAME_BOARD_WORK *work) {
    return LCRandom();
}

void ov84_0223EDA8(int a0, int size, void *data, void *_work) {
    GAME_BOARD_WORK *work = _work;

    u16 *recv = data;

    work->unkF++;

    if (sub_0203769C() == a0) {
        return;
    }

    work->multiSelectPos = recv[1];

    if (sub_0203769C() == 0) {
        if (work->unkE != 255) {
            work->multiSelectPos = 0;
        } else {
            work->unkE = work->multiSelectPos + work->boardArea;
        }
    } else {
        work->unkE = recv[2];
        *work->unk24 = recv[3];
    }
}

static void ov84_0223EDF8(GAME_BOARD_WORK *work, u16 type) {
    work->sendBuffer[0] = type;
    work->sendBuffer[1] = work->cursorPos;
}

void ov84_0223EE08(int a0, int size, void *data, void *_work) {
    GAME_BOARD_WORK *work = _work;
    const u16 *recv = data;

    if (sub_0203769C() == a0) {
        return;
    }

    work->multiCursorPos = (u8) recv[1];
}

static void BattleArcadeGameBoard_StopCursor(GAME_BOARD_WORK *work, u8 type) {
    int i;

    u8 offset = work->boardArea;
    u8 pos = ov84_0223EC88(offset, type);
    u8 panelId = work->unk34[pos];

    *work->unk20 = panelId;

    for (i = 0; i < 16; i++) {
        if (work->panel[i] != NULL) {
            BattleArcadeObj_SetAnimation(work->panel[i], panelId);
        }
    }

    BattleArcadeGameBoard_SetCursorPos(work, pos);
    PlaySE(SEQ_SE_DP_PIRORIRO2);
}

typedef struct _0223F99C {
    u8 flag0:1;
    u8 flag1:1;
    u8 flag2:1;
    u8 flag3:1;
    u8 flag4:1;
    u8 flag5:1;
    u8 flag6:1;
    u8 flag7:1;
} STRUCT_0223F99C;

extern const STRUCT_0223F99C ov84_0223F99C[32];
extern const STRUCT_0223F99C ov84_0223F904[7];

static void ov84_0223EE74(GAME_BOARD_WORK *work) {
    int i;
    u16 winstreak, var;
    u8 flag, challenge;

    for (i = 0; i < NELEMS(ov84_0223F99C); i++) {
        switch (work->unk2A) {
        case 0:
            flag = ov84_0223F99C[i].flag0;
            break;
        case 1:
            flag = ov84_0223F99C[i].flag1;
            break;
        case 2:
            flag = ov84_0223F99C[i].flag2;
            break;
        case 3:
            flag = ov84_0223F99C[i].flag3;
            break;
        case 4:
            flag = ov84_0223F99C[i].flag4;
            break;
        case 5:
            flag = ov84_0223F99C[i].flag5;
            break;
        default:
            flag = ov84_0223F99C[i].flag6;
            break;
        }

        if (flag == 1) {
            challenge = 0xff;

            switch (i) {
            case 27:
                challenge = 0;
                break;
            case 24:
                challenge = 1;
                break;
            case 25:
                challenge = 2;
                break;
            case 26:
                challenge = 3;
                break;
            case 28:
                challenge = 4;
                break;
            case 29:
                challenge = 5;
                break;
            case 31:
                challenge = 6;
                break;
            }

            winstreak = BattleArcade_GetWinstreak(work);

            var = winstreak % 7;

            if (winstreak >= 9999) {
                var = 6;
            }

            if (challenge != 255) {
                switch (var) {
                case 0:
                    flag = ov84_0223F904[challenge].flag0;
                    break;
                case 1:
                    flag = ov84_0223F904[challenge].flag1;
                    break;
                case 2:
                    flag = ov84_0223F904[challenge].flag2;
                    break;
                case 3:
                    flag = ov84_0223F904[challenge].flag3;
                    break;
                case 4:
                    flag = ov84_0223F904[challenge].flag4;
                    break;
                case 5:
                    flag = ov84_0223F904[challenge].flag5;
                    break;
                case 6:
                case 7:
                    flag = ov84_0223F904[challenge].flag6;
                    break;
                default:
                    GF_ASSERT(FALSE);
                    flag = 1;
                    break;
                }
            } else {
                flag = 1;
            }

            if (flag == 1) {
                work->unk44[work->unk64] = i;
                work->unk64++;
            }
        }
    }
}

extern const u8 _0223F900[4];

static void ov84_0223EFE0(GAME_BOARD_WORK *work) {
    int i;

    for (i = 0; i < NELEMS(_0223F900); i++) {
        if (work->unk12 >= _0223F900[i]) {
            break;
        }
    }

    work->unk11 = i;

    for (i = 0; i < work->unk64; i++) {
        if (ov80_022384BC(work->unk44[i]) == 0) {
            work->unk30[0]++;
        } else if (ov80_022384BC(work->unk44[i]) == 1) {
            work->unk30[1]++;
        } else if (ov80_022384BC(work->unk44[i]) == 2) {
            work->unk30[2]++;
        } else if (ov80_022384BC(work->unk44[i]) == 3) {
            work->unk30[3]++;
        }
    }
}

static void ov84_0223F094(GAME_BOARD_WORK *work) {
    int cnt, i, offset, range;
    u16 rand0;
    u8 rand, color;

    for (i = 0; i < 16; i++) {
        color = ov84_0223F178(work, work->unk11);
        offset = 0;
        range = work->unk30[color];

        if (color == 0) {
            offset = 0;
        } else if (color == 1) {
            offset += work->unk30[0];
        } else if (color == 2) {
            offset += work->unk30[0];
            offset += work->unk30[1];
        } else if (color == 3) {
            offset += work->unk30[0];
            offset += work->unk30[1];
            offset += work->unk30[2];
        }

        rand0 = LCRandom() % range;
        rand0 += offset;
        rand = rand0;

        cnt = 0;

        while (TRUE) {
            if (cnt >= 50) {
                GF_ASSERT(FALSE);
                work->unk34[i] = 0;
                cnt = 0;
                break;
            }

            if (ov80_022384BC(work->unk44[rand]) == color) {
                work->unk34[i] = work->unk44[rand];
                break;
            }

            rand++;
            cnt++;

            if (rand >= work->unk64) {
                rand  = 0;
            }

            if (rand == rand0) {
                color++;
                if (color >= 4) {
                    color = 0;
                }
            }
        }
    }
}

extern const u8 ov84_0223F934[4][4];

static u8 ov84_0223F178(GAME_BOARD_WORK *work, u8 a1) {
    u8 cnt, i;
    u16 rand;

    cnt = 0;
    rand = LCRandom() % 100;

    for (i = 0; i < 4; i++) {
        cnt += ov84_0223F934[a1][i];
        if (rand < cnt) {
            break;
        }
    }

    if (i >= 4) {
        GF_ASSERT(FALSE);
        i = 0;
    }

    return i;
}

static void ov84_0223F1BC(GAME_BOARD_WORK *work) {
    u8 partyCount, opponentPartyCount, i;
    Pokemon *mon;

    partyCount = BattleArcade_GetMonCount(work->type, 1);
    opponentPartyCount = BattleArcade_GetOpponentMonCount(work->type, 1);

    for (i = 0; i < partyCount; i++) {
        mon = Party_GetMonByIndex(work->playerParty, i);
        if (GetMonData(mon, 6, NULL) == 0) {
            BattleArcadeObj_SetVisible(work->itemA[i], 0);
        } else {
            BattleArcadeObj_SetVisible(work->itemA[i], 1);
        }
    }

    for (i = 0; i < opponentPartyCount; i++) {
        mon = Party_GetMonByIndex(work->opponentParty, i);
        if (GetMonData(mon, 6, NULL) == 0) {
            BattleArcadeObj_SetVisible(work->itemB[i], 0);
        } else {
            BattleArcadeObj_SetVisible(work->itemB[i], 1);
        }
    }
}

extern STRUCT_0223F90B ov84_0223F90B[2];

static BOOL BattleArcadeGameBoard_CheckButtonPress(GAME_BOARD_WORK *work) {
    int var = sub_0202529C(ov84_0223F90B);

    if (var == 0) {
        ov84_0223F28C(work);
        return TRUE;
    }

    return FALSE;
}

static void ov84_0223F28C(GAME_BOARD_WORK *work) {
    StopSE(SEQ_SE_DP_SELECT, 0);
    PlaySE(SEQ_SE_DP_BUTTON9);
    BattleArcadeObj_SetAnimation(work->button, 1);
}

extern u8 ov84_0223F9E4[4];

static void ov84_0223F2B4(GAME_BOARD_SUB_3E8 *work, Party *playerParty, Party *opponentParty, u8 type) {
    int i;

    GF_CreateVramTransferManager(32, HEAP_ID_GAME_BOARD);
    ov84_0223F480();
    NNS_G2dInitOamManagerModule();

    OamManager_Create(0, 128, 0, 32, 0, 128, 0, 32, HEAP_ID_GAME_BOARD);

    work->spriteList = G2dRenderer_Init(34, &work->render, HEAP_ID_GAME_BOARD);

    for (i = 0; i < 4; i++) {
        work->resourceMan[i] = Create2DGfxResObjMan(ov84_0223F9E4[i], (GfGfxResType)i, HEAP_ID_GAME_BOARD);
    }

    ov84_0223F714(work);
    ov84_0223F4B4(work);
    ov84_0223F538(work);
    ov84_0223F5E4(work, playerParty, opponentParty, type);

    for (i = 0; i < 11; i++) {
        sub_0200ACF0(work->resourceObj[i][0]);
    }

    for (i = 0; i < 4; i++) {
        sub_0200AF94(work->resourceObj[i][1]);
    }

    GX_EngineBToggleLayers(16, GX_LAYER_TOGGLE_ON);
    GX_EngineAToggleLayers(16, GX_LAYER_TOGGLE_ON);
}

static Sprite *ov84_0223F374(GAME_BOARD_SUB_3E8 *work, u32 chara, u32 pal, u32 cell, u32 anim, u32 prio, int bgPrio, u8 display) {
    struct SpriteResourcesHeader resourceHeader;
    Sprite *sprite;

    CreateSpriteResourcesHeader(&resourceHeader, chara, pal, cell, cell, -1, -1, 0, bgPrio, work->resourceMan[0], work->resourceMan[1], work->resourceMan[2], work->resourceMan[3], NULL, NULL);

    {
    SpriteTemplate template;
    template.spriteList = work->spriteList;
    template.header = &resourceHeader;
    template.position.x = 0;
    template.position.y = 0;
    template.position.z = 0;
    template.scale.x = 1 * FX32_ONE;
    template.scale.y = 1 * FX32_ONE;
    template.scale.z = 1 * FX32_ONE;
    template.rotation = 0;
    template.priority = prio;
    template.heapId = HEAP_ID_GAME_BOARD;

    if (display == 0) {
        template.whichScreen = 1;
    } else {
        template.whichScreen = 2;
        template.position.y += (192 * FX32_ONE);
    }

    sprite = CreateSprite(&template);
    Set2dSpriteAnimActiveFlag(sprite, 1);
    sub_02024868(sprite, 1 * FX32_ONE);
    Set2dSpriteAnimSeqNo(sprite, anim);
    }

    return sprite;
}

static void ov84_0223F418(GAME_BOARD_SUB_3E8 *work) {
    u8 i;

    for (i = 0; i < 11; i++) {
        sub_0200AEB0(work->resourceObj[i][0]);
    }

    for (i = 0; i < 4; i++) {
        sub_0200B0A8(work->resourceObj[i][1]);
    }

    for (i = 0; i < 4; i++) {
        Destroy2DGfxResObjMan(work->resourceMan[i]);
    }

    sub_02024504(work->spriteList);
    OamManager_Free();
    sub_0202168C();
    sub_02022608();
}

extern UnkStruct_020215A0 ov84_0223F9E8;

static void ov84_0223F480(void) {
    UnkStruct_020215A0 var = ov84_0223F9E8;
    sub_020215C0(&var, 16, 16);
    sub_02022588(14, HEAP_ID_GAME_BOARD);
    sub_020216C8();
    sub_02022638();
}

static void ov84_0223F4B4(GAME_BOARD_SUB_3E8 *work) {
    work->resourceObj[1][0] = AddCharResObjFromNarc(work->resourceMan[0], NARC_a_1_8_4, 18, TRUE, 1, 1, HEAP_ID_GAME_BOARD);
    work->resourceObj[1][1] = AddPlttResObjFromNarc(work->resourceMan[1], NARC_a_1_8_4, 56, FALSE, 1, 1, 8, HEAP_ID_GAME_BOARD);
    work->resourceObj[1][2] = AddCellOrAnimResObjFromNarc(work->resourceMan[2], NARC_a_1_8_4, 20, TRUE, 1, GF_GFX_RES_TYPE_CELL, HEAP_ID_GAME_BOARD);
    work->resourceObj[1][3] = AddCellOrAnimResObjFromNarc(work->resourceMan[3], NARC_a_1_8_4, 19, TRUE, 1, GF_GFX_RES_TYPE_ANIM, HEAP_ID_GAME_BOARD);
}

static void ov84_0223F538(GAME_BOARD_SUB_3E8 *work) {
    NARC *narc = NARC_New(NARC_a_0_2_1, HEAP_ID_GAME_BOARD);

    work->resourceObj[2][0] = AddCharResObjFromOpenNarc(work->resourceMan[0], narc, sub_0207CA9C(), FALSE, 2, 1, HEAP_ID_GAME_BOARD);
    work->resourceObj[2][1] = AddPlttResObjFromNarc(work->resourceMan[1], NARC_a_0_2_1, sub_0207CAA0(), FALSE, 2, 1, 3, HEAP_ID_GAME_BOARD);
    work->resourceObj[2][2] = AddCellOrAnimResObjFromOpenNarc(work->resourceMan[2], narc, sub_0207CAA4(), FALSE, 2, GF_GFX_RES_TYPE_CELL, HEAP_ID_GAME_BOARD);
    work->resourceObj[2][3] = AddCellOrAnimResObjFromOpenNarc(work->resourceMan[3], narc, sub_0207CAA8(), FALSE, 2, GF_GFX_RES_TYPE_ANIM, HEAP_ID_GAME_BOARD);

    NARC_Delete(narc);
}

static void ov84_0223F5E4(GAME_BOARD_SUB_3E8 *work, Party *playerParty, Party *opponentParty, u8 type) {
    u32 i;
    Pokemon *playerMon;
    Pokemon *opponentMon;
    NARC *narc = NARC_New(NARC_a_0_2_0, HEAP_ID_GAME_BOARD);

    work->resourceObj[3][1] = AddPlttResObjFromNarc(work->resourceMan[1], NARC_a_0_2_0, sub_02074490(), FALSE, 3, 1, 3, HEAP_ID_GAME_BOARD);
    work->resourceObj[3][2] = AddCellOrAnimResObjFromOpenNarc(work->resourceMan[2], narc, sub_02074498(), FALSE, 3, GF_GFX_RES_TYPE_CELL, HEAP_ID_GAME_BOARD);
    work->resourceObj[3][3] = AddCellOrAnimResObjFromOpenNarc(work->resourceMan[3], narc, sub_020744A4(), FALSE, 3, GF_GFX_RES_TYPE_ANIM, HEAP_ID_GAME_BOARD);

    for (i = 0; i < 4; i++) {
        if (i == 3) {
            if (type == FALSE) {
                playerMon = Party_GetMonByIndex(playerParty, 0);
                opponentMon = Party_GetMonByIndex(opponentParty, 0);
            } else {
                playerMon = Party_GetMonByIndex(playerParty, i);
                opponentMon = Party_GetMonByIndex(opponentParty, i);
            }
        } else {
            playerMon = Party_GetMonByIndex(playerParty, i);
            opponentMon = Party_GetMonByIndex(opponentParty, i);
        }

        work->resourceObj[3 + i][0] = AddCharResObjFromOpenNarc(work->resourceMan[0], narc, Pokemon_GetIconNaix(playerMon), FALSE, 3 + i, 1, HEAP_ID_GAME_BOARD);
        work->resourceObj[7 + i][0] = AddCharResObjFromOpenNarc(work->resourceMan[0], narc, Pokemon_GetIconNaix(opponentMon), FALSE, 7 + i, 1, HEAP_ID_GAME_BOARD);
    }

    NARC_Delete(narc);
}

static void ov84_0223F714(GAME_BOARD_SUB_3E8 *work) {
    work->resourceObj[0][0] = AddCharResObjFromNarc(work->resourceMan[0], NARC_a_1_8_4, 21, TRUE, 0, 2, HEAP_ID_GAME_BOARD);
    work->resourceObj[0][1] = AddPlttResObjFromNarc(work->resourceMan[1], NARC_a_1_8_4, 57, FALSE, 0, 2, 2, HEAP_ID_GAME_BOARD);
    work->resourceObj[0][2] = AddCellOrAnimResObjFromNarc(work->resourceMan[2], NARC_a_1_8_4, 23, TRUE, 0, GF_GFX_RES_TYPE_CELL, HEAP_ID_GAME_BOARD);
    work->resourceObj[0][3] = AddCellOrAnimResObjFromNarc(work->resourceMan[3], NARC_a_1_8_4, 22, TRUE, 0, GF_GFX_RES_TYPE_ANIM, HEAP_ID_GAME_BOARD);
}

static BATTLE_ARCADE_OBJECT *BattleArcadeObject_Create(GAME_BOARD_SUB_3E8 *work, u32 chara, u32 pal, u32 cell, u32 anim, u16 x, u16 y, u32 priority, int bgPrio, u8 display) {
    BATTLE_ARCADE_OBJECT *obj;
    VecFx32 vec;
    u32 i;

    obj = AllocFromHeap(HEAP_ID_GAME_BOARD, sizeof(BATTLE_ARCADE_OBJECT));

    u8 *temp = (u8*) obj;
    for (i = sizeof(BATTLE_ARCADE_OBJECT); i; i--) {
        *temp++ = 0;
    }

    obj->sprite = ov84_0223F374(work, chara, pal, cell, anim, priority, bgPrio, display);

    obj->x0 = x;
    obj->y0 = y;
    obj->display = display;

    vec.x = x * FX32_ONE;
    vec.y = y * FX32_ONE;

    if (display == 1) {
        vec.y += (192 * FX32_ONE);
    }

    sub_020247D4(obj->sprite, &vec);

    return obj;
}

static void *BattleArcadeObj_Delete(BATTLE_ARCADE_OBJECT *obj) {
    Sprite_Delete(obj->sprite);
    FreeToHeap(obj);
    return NULL;
}

static void BattleArcadeObj_SetVisible(BATTLE_ARCADE_OBJECT *obj, int flag) {
    Set2dSpriteVisibleFlag(obj->sprite, flag);
}

static void BattleArcadeObj_SetPos(BATTLE_ARCADE_OBJECT *obj, u16 x, u16 y) {
    VecFx32 vec;
    vec = *sub_020248AC(obj->sprite);
    vec.x = x * FX32_ONE;
    vec.y = y * FX32_ONE;

    if (obj->display == 1) {
        vec.y += (192 * FX32_ONE);
    }

    sub_020247D4(obj->sprite, &vec);
}

static void BattleArcadeObj_SetAnimation(BATTLE_ARCADE_OBJECT *obj, u32 val) {
    sub_02024868(obj->sprite, FX32_ONE);
    sub_02024950(obj->sprite, val);
}

static void ov84_0223F894(BATTLE_ARCADE_OBJECT *obj, Pokemon *mon) {
    sub_02024AA8(obj->sprite, Pokemon_GetIconPalette(mon));
}

static void ov84_0223F8A8(BATTLE_ARCADE_OBJECT *obj, int flag) {
    Set2dSpriteAnimActiveFlag(obj->sprite, flag);
}

extern WindowTemplate ov84_0223F9F8[2];

static void ov84_0223F8B4(BgConfig *config, Window *window) {
    u8 i;
    WindowTemplate *dat = ov84_0223F9F8;

    for (i = 0; i < 2; i++) {
        AddWindow(config, &window[i], &dat[i]);
        FillWindowPixelBuffer(&window[i], 0);
    }
}

static void ov84_0223F8E4(Window *window) {
    u16 i;

    for (i = 0; i < 2; i++) {
        RemoveWindow(&window[i]);
    }
}
