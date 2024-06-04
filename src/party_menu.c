#include "constants/moves.h"
#include "gf_gfx_loader.h"
#include "global.h"
#include "party_menu.h"
#include "font.h"
#include "msgdata/msg.naix"
#include "overlay_94.h"
#include "render_text.h"
#include "sound_02004A44.h"
#include "system.h"
#include "unk_0200FA24.h"
#include "unk_020210A0.h"
#include "unk_0207CB7C.h"
#include "unk_0207F42C.h"
#include "unk_0203A3B0.h"
#include "unk_02080BB4.h"
#include "unk_0208805C.h"
#include "unk_0207EB24.h"
#include "unk_02078E30.h"
#include "unk_02074944.h"
#include "unk_02088288.h"
#include "vram_transfer_manager.h"

BOOL PartyMenuApp_Init(OVY_MANAGER *manager, int *pState);
BOOL PartyMenuApp_Main(OVY_MANAGER *manager, int *pState);
void sub_02079230(PartyMenuStruct *partyMenu);
int sub_02079280(PartyMenuStruct *partyMenu);
int sub_02079308(PartyMenuStruct *partyMenu);
int sub_020793C0(PartyMenuStruct *partyMenu);
int sub_02079400(PartyMenuStruct *partyMenu);
int sub_02079440(PartyMenuStruct *partyMenu);
int sub_020794C8(PartyMenuStruct *partyMenu);
int sub_020794EC(PartyMenuStruct *partyMenu);
int sub_020794F0(PartyMenuStruct *partyMenu);
int sub_020794FC(PartyMenuStruct *partyMenu);
int sub_02079550(PartyMenuStruct *partyMenu);
BOOL PartyMenuApp_Exit(OVY_MANAGER *manager, int *pState);
void sub_020796B8(void *cbData);
void sub_02079700(void);
void sub_02079720(BgConfig *bgConfig);
void sub_02079758(BgConfig *bgConfig);
void sub_020798C4(BgConfig *bgConfig);
GF3DVramMan *sub_0207997C(HeapID heapId);
void sub_0207999C(void);
void sub_02079A0C(GF3DVramMan *gf3dVramMan);
void sub_02079A14(PartyMenuStruct *partyMenu, NARC *narc);
PartyMenuStruct *sub_02079BD8(OVY_MANAGER *manager);
void sub_02079CE4(PartyMenuStruct *partyMenu);
void sub_02079D38(PartyMenuStruct *partyMenu);
u8 sub_02079E28(PartyMenuStruct *partyMenu, u8 partySlot);
void sub_02079FB8(PartyMenuStruct *partyMenu, Pokemon *mon, u8 partySlot);
u32 sub_0207A058(Pokemon *mon, u8 contestStat);
void sub_0207A22C(PartyMenuStruct *partyMenu);
void sub_0207A89C(PartyMenuStruct *partyMenu);
void sub_0207AC20(PartyMenuStruct *partyMenu);
int sub_0207ADB8(PartyMenuStruct *partyMenu);
void sub_0207B51C(PartyMenuStruct *partyMenu, u8 a1, int a2);
int sub_0207B600(PartyMenuStruct *partyMenu);
int sub_0207B7E0(PartyMenuStruct *partyMenu);
BOOL sub_0207BC1C(PartyMenuStruct *partyMenu, int *pState);
int sub_0207BD78(PartyMenuStruct *partyMenu);
int sub_0207C0DC(PartyMenuStruct *partyMenu);
int sub_0207C288(PartyMenuStruct *partyMenu);
int sub_0207C400(PartyMenuStruct *partyMenu);
int sub_0207C6BC(PartyMenuStruct *partyMenu);
int sub_0207C6DC(PartyMenuStruct *partyMenu);
int sub_0207C70C(PartyMenuStruct *partyMenu);
int sub_0207C728(PartyMenuStruct *partyMenu);
int sub_0207C74C(PartyMenuStruct *partyMenu);
int sub_0207C908(PartyMenuStruct *partyMenu);
int sub_0207CA30(PartyMenuStruct *partyMenu);
void sub_0207CAAC(HeapID heapId, void *a1, void *a2, void *a3);
void sub_0207CB20(PartyMenuStruct *partyMenu);
void sub_0207CB90(void);

extern const UnkStruct_02020654 _0210140C[8];
extern const UnkStruct_02020654 _0210144C[8];
extern const UnkStruct_02020654 _0210148C[8];
extern const UnkStruct_02020654 _021014CC[8];

BOOL PartyMenuApp_Init(OVY_MANAGER *manager, int *pState) {
    PartyMenuStruct *partyMenu;
    NARC * narc;

    Main_SetVBlankIntrCB(NULL, NULL);
    HBlankInterruptDisable();
    GfGfx_DisableEngineAPlanes();
    GfGfx_DisableEngineBPlanes();
    GX_SetVisiblePlane(0);
    GXS_SetVisiblePlane(0);
    G2_BlendNone();
    G2S_BlendNone();
    GX_SetDispSelect(GX_DISP_SELECT_SUB_MAIN);
    SetKeyRepeatTimers(4, 8);
    CreateHeap(HEAP_ID_3, HEAP_ID_PARTY_MENU, 0x30000);

    narc = NARC_New(NARC_a_0_2_1, HEAP_ID_PARTY_MENU);
    partyMenu = sub_02079BD8(manager);
    BeginNormalPaletteFade(2, 3, 3, RGB_BLACK, 6, 1, HEAP_ID_PARTY_MENU);
    sub_02079CE4(partyMenu);
    sub_02079700();
    sub_02079758(partyMenu->bgConfig);
    sub_02079A14(partyMenu, narc);
    sub_020210BC();
    sub_02021148(4);
    sub_02004EC4(57, 0, 0);
    sub_0207CF98(partyMenu);
    sub_0207CDCC(partyMenu);
    sub_0207EB24(partyMenu);
    sub_0207EDD4(partyMenu);
    sub_02079D38(partyMenu);
    sub_0207A22C(partyMenu);
    sub_0207B51C(partyMenu, partyMenu->partyMonIndex, 1);
    if (partyMenu->args->unk_24 == 5 || partyMenu->args->unk_24 == 16) {
        if (!sub_020817C4(partyMenu->args->itemId)) {
            sub_0207DAC4(partyMenu, 33, 1);
        }
    } else if (partyMenu->args->unk_24 == 6) {
        sub_0207DAC4(partyMenu, 34, 1);
    } else if (partyMenu->args->unk_24 == 9 || partyMenu->args->unk_24 == 14) {
        sub_0207DAC4(partyMenu, 32, 1);
    } else if (partyMenu->args->unk_24 == 7 || partyMenu->args->unk_24 == 8 || partyMenu->args->unk_24 == 11 || partyMenu->args->unk_24 == 12) {
        thunk_Sprite_SetPalIndex(partyMenu->unk_678, 1);
    } else if (partyMenu->args->unk_24 == 2 || partyMenu->args->unk_24 == 17) {
        sub_0207DAC4(partyMenu, 35, 1);
    } else if (partyMenu->args->unk_24 == 15) {
        sub_0207DAC4(partyMenu, 35, 1);
    } else if (partyMenu->args->unk_24 == 21) {
        sub_0207DAC4(partyMenu, 184, 1);
    } else if (partyMenu->args->unk_24 == 22) {
        sub_0207DAC4(partyMenu, 35, 1);
    } else if (partyMenu->args->unk_24 == 23) {
        sub_0207DAC4(partyMenu, 35, 1);
    } else if (partyMenu->args->unk_24 != 10) {
        sub_0207DAC4(partyMenu, 29, 1);
    } else {
        thunk_Sprite_SetPalIndex(partyMenu->unk_678, 1);
    }
    sub_0207A89C(partyMenu);
    sub_02002B8C(TRUE);
    Main_SetVBlankIntrCB(sub_020796B8, partyMenu);
    sub_0203A994(2);
    FontID_Alloc(4, HEAP_ID_PARTY_MENU);
    NARC_Delete(narc);
    return TRUE;
}

BOOL PartyMenuApp_Main(OVY_MANAGER *manager, int *pState) {
    PartyMenuStruct *partyMenu = (PartyMenuStruct *)OverlayManager_GetData(manager);

    switch (*pState) {
    case 0:
        *pState = sub_02079280(partyMenu);
        break;
    case 1:
        *pState = sub_02079308(partyMenu);
        break;
    case 2:
        if (sub_0207BC1C(partyMenu, pState) == TRUE) {
            *pState = 1;
        }
        break;
    case 3:
        *pState = sub_02080B74(partyMenu);
        break;
    case 4:
        *pState = sub_020793C0(partyMenu);
        break;
    case 5:
        *pState = partyMenu->unk_C54(partyMenu);
        break;
    case 6:
        *pState = sub_02082738(partyMenu);
        break;
    case 7:
        *pState = sub_02081820(partyMenu);
        break;
    case 8:
        *pState = sub_02079400(partyMenu);
        break;
    case 9:
        *pState = sub_0207C728(partyMenu);
        break;
    case 10:
        *pState = sub_0207C74C(partyMenu);
        break;
    case 11:
        *pState = sub_0207C6BC(partyMenu);
        break;
    case 12:
        *pState = sub_0207C6DC(partyMenu);
        break;
    case 13:
        *pState = sub_0207C70C(partyMenu);
        break;
    case 14:
        *pState = sub_0207C908(partyMenu);
        break;
    case 15:
        *pState = sub_02079440(partyMenu);
        break;
    case 16:
        *pState = sub_0207C400(partyMenu);
        break;
    case 17:
        *pState = sub_0207F694(partyMenu);
        break;
    case 18:
        *pState = sub_0207F6E8(partyMenu);
        break;
    case 19:
        *pState = sub_0207F720(partyMenu);
        break;
    case 20:
        *pState = sub_0207FA08(partyMenu);
        break;
    case 21:
        *pState = sub_02079550(partyMenu);
        break;
    case 22:
        *pState = sub_02082370(partyMenu);
        break;
    case 23:
        *pState = sub_02080610(partyMenu);
        break;
    case 24:
        *pState = sub_020794C8(partyMenu);
        break;
    case 25:
        *pState = sub_020794EC(partyMenu);
        break;
    case 26:
        *pState = sub_020794F0(partyMenu);
        break;
    case 27:
        *pState = sub_020794FC(partyMenu);
        break;
    case 28: {
        int x = sub_0207B600(partyMenu);
        if (x == 0) {
            *pState = 29;
        } else if (x == 3) {
            *pState = 1;
        }
        break;
    }
    case 29:
        if (sub_0207FD6C(partyMenu) == TRUE) {
            *pState = 1;
        }
        break;
    case 30:
        *pState = sub_0207BD78(partyMenu);
        break;
    case 31:
        if (PartyMenu_AnimateIconFormChange(partyMenu) == TRUE) {
            sub_0207CB6C(partyMenu);
            *pState = 25;
        }
        else {
            *pState = 31;
        }
        break;
    case 32:
        sub_020880CC(1, HEAP_ID_PARTY_MENU);
        *pState = 33;
        break;
    case 33:
        if (IsPaletteFadeFinished() == TRUE) {
            partyMenu->args->partySlot = partyMenu->partyMonIndex;
            return TRUE;
        }
        break;
    }

    sub_0207F178(partyMenu);
    sub_0207F2F8(partyMenu);
    sub_0207AC20(partyMenu);
    sub_02079230(partyMenu);
    sub_0200D020(partyMenu->unk_65C);
    return FALSE;
}

void sub_02079224(PartyMenuStruct *partyMenu, BOOL a1) {
    partyMenu->unk_C7C = a1;
}

void sub_02079230(PartyMenuStruct *partyMenu) {
    if (partyMenu->unk_C7C) {
        partyMenu->unk_C78 += 12;
        if (partyMenu->unk_C78 > 40) {
            partyMenu->unk_C78 = 40;
        }
        sub_0207F334(partyMenu, partyMenu->unk_C78);
    } else {
        partyMenu->unk_C78 -= 12;
        if (partyMenu->unk_C78 < 0) {
            partyMenu->unk_C78 = 0;
        }
        sub_0207F334(partyMenu, partyMenu->unk_C78);
    }
}

int sub_02079280(PartyMenuStruct *partyMenu) {
    if (IsPaletteFadeFinished() == TRUE) {
        if (partyMenu->args->unk_24 == 5 || partyMenu->args->unk_24 == 16) {
            if (sub_020817C4(partyMenu->args->itemId) == TRUE) {
                partyMenu->unk_C62 = 0;
                return 7;
            } else {
                return 4;
            }
        } else if (partyMenu->args->unk_24 == 6) {
            return 21;
        } else if (partyMenu->args->unk_24 == 7) {
            return sub_020822CC(partyMenu);
        } else if (partyMenu->args->unk_24 == 8) {
            return sub_02081ED0(partyMenu);
        } else if (partyMenu->args->unk_24 == 11 || partyMenu->args->unk_24 == 12) {
            return 14;
        } else if (partyMenu->args->unk_24 == 9) {
            return 8;
        } else if (partyMenu->args->unk_24 == 10) {
            return 16;
        } else {
            return 1;
        }
    } else {
        return 0;
    }
}

int sub_02079308(PartyMenuStruct *partyMenu) {
    switch (sub_0207ADB8(partyMenu)) {
    case 0:
        switch (partyMenu->args->unk_24) {
        case 3:
        case 20:
            partyMenu->args->selectedAction = 0;
            return 32;
        case 14:
            sub_02082868(partyMenu);
            return 24;
        case 19:
            return sub_0207CA30(partyMenu);
        default:
            sub_02079224(partyMenu, 1);
            return 2;
        }
    case 4:
        return sub_0207B7E0(partyMenu);
    case 3:
        partyMenu->args->selectedAction = 0;
        return 32;
    case 2:
        if (partyMenu->args->unk_24 != 15) {
            partyMenu->args->selectedAction = 1;
            return 32;
        } else {
            thunk_Sprite_SetPalIndex(partyMenu->unk_678, 1);
            return sub_020807AC(partyMenu);
        }
    }
    return 1;
}

int sub_020793C0(PartyMenuStruct *partyMenu) {
    int x = sub_0207C0DC(partyMenu);
    if (x == 0 || x == 2) {
        thunk_Sprite_SetPalIndex(partyMenu->unk_678, 1);
        return sub_0207C288(partyMenu);
    } else if (x == 3) {
        partyMenu->args->selectedAction = 0;
        return 32;
    } else {
        return 4;
    }
}

int sub_02079400(PartyMenuStruct *partyMenu) {
    int x = sub_0207C0DC(partyMenu);
    if (x == 0 || x == 2) {
        thunk_Sprite_SetPalIndex(partyMenu->unk_678, 1);
        return sub_0207C400(partyMenu);
    } else if (x == 3) {
        partyMenu->args->selectedAction = 0;
        return 32;
    } else {
        return 8;
    }
}

int sub_02079440(PartyMenuStruct *partyMenu) {
    PartyMenuStruct_SubC90_UnkFunc r2 = sub_0207E93C(partyMenu, partyMenu->unk_824);
    switch ((int)r2) {
    case -2:
        ClearFrameAndWindow2(&partyMenu->unk_214, TRUE);
        sub_0200E5D4(&partyMenu->unk_234, TRUE);
        ClearWindowTilemapAndScheduleTransfer(&partyMenu->unk_234);
        sub_02079224(partyMenu, FALSE);
        sub_0207CB20(partyMenu);
        sub_0207CB90();
        sub_0207DAC4(partyMenu, 29, 1);
        thunk_Sprite_SetPalIndex(partyMenu->unk_678, 0);
        return TRUE;
    default: {
        int result;
        r2(partyMenu, &result);
        return result;
    }
    case -1:
        return 15;
    }
}

int sub_020794C8(PartyMenuStruct *partyMenu) {
    if (TextPrinterCheckActive(partyMenu->unk_C64) == FALSE) {
        return partyMenu->unk_C62;
    } else {
        return 24;
    }
}

int sub_020794EC(PartyMenuStruct *partyMenu) {
    return 32;
}

int sub_020794F0(PartyMenuStruct *partyMenu) {
    sub_0207DBCC(partyMenu);
    return 27;
}

int sub_020794FC(PartyMenuStruct *partyMenu) {
    switch (YesNoPrompt_HandleInput(partyMenu->yesNoPrompt)) {
    case YESNORESPONSE_YES:
        YesNoPrompt_Destroy(partyMenu->yesNoPrompt);
        sub_0207CB90();
        return partyMenu->unk_C58(partyMenu);
    case YESNORESPONSE_NO:
        YesNoPrompt_Destroy(partyMenu->yesNoPrompt);
        sub_0207CB90();
        return partyMenu->unk_C5C(partyMenu);
    default:
        return 27;
    }
}

int sub_02079550(PartyMenuStruct *partyMenu) {
    int x = sub_0207C0DC(partyMenu);
    if (x == 0 || x == 2) {
        thunk_Sprite_SetPalIndex(partyMenu->unk_678, 1);
        if (partyMenu->unk_828[partyMenu->partyMonIndex].isEgg != 1) {
            return sub_02082134(partyMenu);
        } else {
            sub_0207DAEC(partyMenu, -1, 1);
            partyMenu->args->selectedAction = 0;
            partyMenu->unk_C62 = 25;
            ReadMsgDataIntoString(partyMenu->msgData, 102, partyMenu->strbuf);
            return 24;
        }
    } else if (x == 3) {
        partyMenu->args->selectedAction = 0;
        return 32;
    } else {
        return 21;
    }
}

BOOL PartyMenuApp_Exit(OVY_MANAGER *manager, int *pState) {
    u32 i;
    PartyMenuStruct *partyMenu = (PartyMenuStruct *)OverlayManager_GetData(manager);
    sub_02002B8C(FALSE);
    Main_SetVBlankIntrCB(NULL, NULL);
    sub_0207EFA4(partyMenu);
    sub_0207CF68(partyMenu);
    sub_020798C4(partyMenu->bgConfig);
    sub_02021238();
    GF_DestroyVramTransferManager();
    for (i = 0; i < PARTY_SIZE; ++i) {
        String_Delete(partyMenu->unk_828[i].nickname);
    }
    String_Delete(partyMenu->strbuf);
    String_Delete(partyMenu->unk_7CC);
    for (i = 0; i < 20; ++i) {
        String_Delete(partyMenu->unk_7D0[i]);
    }
    DestroyMsgData(partyMenu->msgData);
    MessagePrinter_Delete(partyMenu->msgPrinter);
    MessageFormat_Delete(partyMenu->msgFormat);
    if (partyMenu->pokedex != NULL) {
        sub_0207495C(partyMenu->pokedex);
    }
    if (partyMenu->args->unk_24 == 0) {
        sub_02004B10();
    }
    FontID_Release(4);
    OverlayManager_FreeData(manager);
    DestroyHeap(HEAP_ID_PARTY_MENU);
    sub_0203A964();
    return TRUE;
}

void sub_020796B8(void *cbData) {
    PartyMenuStruct *partyMenu = (PartyMenuStruct *)cbData;

    BgSetPosTextAndCommit(partyMenu->bgConfig, GF_BG_LYR_SUB_0, BG_POS_OP_SET_Y, partyMenu->unk_C78);
    BgSetPosTextAndCommit(partyMenu->bgConfig, GF_BG_LYR_SUB_2, BG_POS_OP_SET_Y, partyMenu->unk_C78);
    DoScheduledBgGpuUpdates(partyMenu->bgConfig);
    GF_RunVramTransferTasks();
    thunk_OamManager_ApplyAndResetBuffers();
    OS_SetIrqCheckFlag(OS_IE_V_BLANK);
}

void sub_02079700(void) {
    extern const GraphicsBanks _021013E4;
    GraphicsBanks graphicsBanks = _021013E4;
    GfGfx_SetBanks(&graphicsBanks);
}

void sub_02079720(BgConfig *bgConfig) {
    extern const BgTemplate _02101370;
    BgTemplate bgTemplate = _02101370;
    InitBgFromTemplate(bgConfig, GF_BG_LYR_MAIN_0, &bgTemplate, GF_BG_TYPE_TEXT);
    BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_MAIN_0);
}

void sub_02079758(BgConfig *bgConfig) {
    {
        extern const GraphicsModes _021012BC;
        GraphicsModes graphicsModes = _021012BC;
        SetBothScreensModesAndDisable(&graphicsModes);
    }

    {
        extern const BgTemplate _02101354;
        BgTemplate bgTemplate = _02101354;
        InitBgFromTemplate(bgConfig, GF_BG_LYR_MAIN_0, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_MAIN_0);
    }

    {
        extern const BgTemplate _021013A8;
        BgTemplate bgTemplate = _021013A8;
        InitBgFromTemplate(bgConfig, GF_BG_LYR_MAIN_1, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_MAIN_1);
    }

    {
        extern const BgTemplate _0210131C;
        BgTemplate bgTemplate = _0210131C;
        InitBgFromTemplate(bgConfig, GF_BG_LYR_MAIN_2, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_MAIN_2);
    }

    {
        extern const BgTemplate _021012E4;
        BgTemplate bgTemplate = _021012E4;
        InitBgFromTemplate(bgConfig, GF_BG_LYR_MAIN_3, &bgTemplate, GF_BG_TYPE_TEXT);
    }

    {
        extern const BgTemplate _02101338;
        BgTemplate bgTemplate = _02101338;
        InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_2, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_SUB_2);
    }

    {
        extern const BgTemplate _0210138C;
        BgTemplate bgTemplate = _0210138C;
        InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_0, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_SUB_0);
    }

    {
        extern const BgTemplate _02101300;
        BgTemplate bgTemplate = _02101300;
        InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_1, &bgTemplate, GF_BG_TYPE_TEXT);
    }

    BG_ClearCharDataRange(GF_BG_LYR_MAIN_0, 0x20, 0, HEAP_ID_PARTY_MENU);
    BG_ClearCharDataRange(GF_BG_LYR_SUB_0, 0x20, 0, HEAP_ID_PARTY_MENU);
    BG_ClearCharDataRange(GF_BG_LYR_SUB_2, 0x20, 0, HEAP_ID_PARTY_MENU);
}

void sub_020798C4(BgConfig *bgConfig) {
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_ALL, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineBTogglePlanes((GXPlaneMask)(GX_PLANEMASK_BG0 | GX_PLANEMASK_BG1 | GX_PLANEMASK_OBJ), GF_PLANE_TOGGLE_OFF);
    FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_SUB_2);
    FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_SUB_1);
    FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_SUB_0);
    FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_MAIN_3);
    FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_MAIN_2);
    FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_MAIN_1);
    FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_MAIN_0);
    FreeToHeapExplicit(HEAP_ID_PARTY_MENU, bgConfig);
}

void sub_0207991C(PartyMenuStruct *partyMenu, int a1) {
    if (a1 == FALSE) {
        ToggleBgLayer(GF_BG_LYR_MAIN_0, GF_PLANE_TOGGLE_OFF);
        FreeBgTilemapBuffer(partyMenu->bgConfig, GF_BG_LYR_MAIN_0);
        GX_SetGraphicsMode(GX_DISPMODE_GRAPHICS, GX_BGMODE_0, GX_BG0_AS_3D);
        partyMenu->unk_C84 = sub_0207997C(HEAP_ID_PARTY_MENU);
    } else {
        GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_OFF);
        sub_02079A0C(partyMenu->unk_C84);
        GX_SetGraphicsMode(GX_DISPMODE_GRAPHICS, GX_BGMODE_0, GX_BG0_AS_2D);
        sub_02079720(partyMenu->bgConfig);
        BG_ClearCharDataRange(GF_BG_LYR_MAIN_0, 0x20, 0, HEAP_ID_PARTY_MENU);
    }
}

GF3DVramMan *sub_0207997C(HeapID heapId) {
    return GF_3DVramMan_Create(heapId, GF_3D_TEXALLOC_LNK, 1, GF_3D_PLTTALLOC_LNK, 2, sub_0207999C);
}

void sub_0207999C(void) {
    G3X_SetShading(GX_SHADING_TOON);
    G3X_AntiAlias(TRUE);
    G3X_AlphaTest(FALSE, 0);
    G3X_AlphaBlend(TRUE);
    G3X_EdgeMarking(FALSE);
    G3X_SetFog(FALSE, GX_FOGBLEND_COLOR_ALPHA, GX_FOGSLOPE_0x8000, 0);
    G3X_SetClearColor(RGB_BLACK, 0, 0x7FFF, 0x3F, FALSE);
    G3_ViewPort(0, 0, 255, 191);
}

void sub_02079A0C(GF3DVramMan *gf3dVramMan) {
    GF_3DVramMan_Delete(gf3dVramMan);
}

void sub_02079A14(PartyMenuStruct *partyMenu, NARC *narc) {
    GfGfxLoader_LoadCharDataFromOpenNarc(narc, 15, partyMenu->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, FALSE, HEAP_ID_PARTY_MENU);
    GfGfxLoader_LoadScrnDataFromOpenNarc(narc, 17, partyMenu->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, FALSE, HEAP_ID_PARTY_MENU);

    void *nclrFile = NARC_AllocAndReadWholeMember(narc, 16, HEAP_ID_PARTY_MENU);
    NNSG2dPaletteData *plttData;
    NNS_G2dGetUnpackedPaletteData(nclrFile, &plttData);
    u16 *plttBuf = AllocFromHeap(HEAP_ID_PARTY_MENU, plttData->szByte);
    memcpy(plttBuf, plttData->pRawData, plttData->szByte);
    plttBuf[0] = RGB_BLACK;
    BG_LoadPlttData(GF_PAL_LOCATION_MAIN_OBJEXT, plttBuf, plttData->szByte, 0);
    FreeToHeap(plttBuf);
    memcpy(partyMenu->unk_554, (u8 *)plttData->pRawData + 0x60, 0x100);
    FreeToHeap(nclrFile);
    LoadFontPal1(GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)0x1A0, HEAP_ID_PARTY_MENU);
    LoadFontPal1(GF_PAL_LOCATION_SUB_BG, (enum GFPalSlotOffset)0x40, HEAP_ID_PARTY_MENU);
    LoadUserFrameGfx1(partyMenu->bgConfig, GF_BG_LYR_MAIN_0, 1, 14, 0, HEAP_ID_PARTY_MENU);
    GfGfxLoader_LoadCharDataFromOpenNarc(narc, 26, partyMenu->bgConfig, GF_BG_LYR_MAIN_0, 10, 0, FALSE, HEAP_ID_PARTY_MENU);
    LoadUserFrameGfx2(partyMenu->bgConfig, GF_BG_LYR_MAIN_0, 42, 15, Options_GetFrame(partyMenu->args->options), HEAP_ID_PARTY_MENU);
    GfGfxLoader_LoadCharDataFromOpenNarc(narc, 3, partyMenu->bgConfig, GF_BG_LYR_SUB_0, 0, 0, FALSE, HEAP_ID_PARTY_MENU);
    GfGfxLoader_GXLoadPalFromOpenNarc(narc, 4, GF_PAL_LOCATION_SUB_BG, (enum GFPalSlotOffset)0x20, 0x20, HEAP_ID_PARTY_MENU);
    GfGfxLoader_LoadCharDataFromOpenNarc(narc, 12, partyMenu->bgConfig, GF_BG_LYR_SUB_1, 0, 0, FALSE, HEAP_ID_PARTY_MENU);
    GfGfxLoader_LoadScrnDataFromOpenNarc(narc, 14, partyMenu->bgConfig, GF_BG_LYR_SUB_1, 0, 0, FALSE, HEAP_ID_PARTY_MENU);
    GfGfxLoader_LoadCharDataFromOpenNarc(narc, 24, partyMenu->bgConfig, GF_BG_LYR_SUB_0, 0, 0, FALSE, HEAP_ID_PARTY_MENU);
    GfGfxLoader_LoadScrnDataFromOpenNarc(narc, 25, partyMenu->bgConfig, GF_BG_LYR_SUB_0, 0, 0, FALSE, HEAP_ID_PARTY_MENU);
    GfGfxLoader_GXLoadPalFromOpenNarc(narc, 13, GF_PAL_LOCATION_SUB_BG, (enum GFPalSlotOffset)0, 0x40, HEAP_ID_PARTY_MENU);
    sub_0207CAAC(HEAP_ID_PARTY_MENU, partyMenu->unk_314, partyMenu->unk_3D4, partyMenu->unk_494);
    BG_SetMaskColor(GF_BG_LYR_MAIN_0, RGB_BLACK);
    BG_SetMaskColor(GF_BG_LYR_SUB_0, RGB_BLACK);
}

PartyMenuStruct *sub_02079BD8(OVY_MANAGER *manager) {
    u32 i;
    PartyMenuStruct *ret = (PartyMenuStruct *)OverlayManager_CreateAndGetData(manager, sizeof(PartyMenuStruct), HEAP_ID_PARTY_MENU);
    memset(ret, 0, sizeof(PartyMenuStruct));
    ret->args = OverlayManager_GetArgs(manager);
    ret->bgConfig = BgConfig_Alloc(HEAP_ID_PARTY_MENU);
    if (ret->args->unk_24 == 2 && ret->args->unk_14 != 0) {
        ret->pokedex = sub_02074944(HEAP_ID_PARTY_MENU);
    } else {
        ret->pokedex = NULL;
    }
    ret->msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0300_bin, HEAP_ID_PARTY_MENU);
    ret->msgPrinter = MessagePrinter_New(15, 14, 0, HEAP_ID_PARTY_MENU);
    ret->msgFormat = MessageFormat_New(HEAP_ID_PARTY_MENU);
    for (i = 0; i < PARTY_SIZE; ++i) {
        ret->unk_828[i].nickname = String_New(POKEMON_NAME_LENGTH + 1, HEAP_ID_PARTY_MENU);
    }
    ret->strbuf = String_New(0x100, HEAP_ID_PARTY_MENU);
    ret->unk_7CC = String_New(0x100, HEAP_ID_PARTY_MENU);
    for (i = 0; i < 20; ++i) {
        ret->unk_7D0[i] = String_New(32, HEAP_ID_PARTY_MENU);
    }
    ret->unk_C7C = FALSE;
    ret->partyMonIndex = ret->args->partySlot;
    ret->unk_C66 = ret->partyMonIndex;
    return ret;
}

void sub_02079CE4(PartyMenuStruct *partyMenu) {
    if (partyMenu->args->unk_24 & 0x80) {
        partyMenu->unk_C63 |= 0x80;
        partyMenu->args->unk_24 ^= 0x80;
    } else if (partyMenu->args->unk_24 == 21) {
        partyMenu->unk_C63 |= 0x80;
    } else {
        partyMenu->unk_C63 &= ~0x80;
    }
}

void sub_02079D38(PartyMenuStruct *partyMenu) {
    u8 r4 = 3;
    if (partyMenu->args->unk_25 == 2) {
        partyMenu->unk_948 = &_0210144C;
    } else if (partyMenu->args->unk_24 == 2 || partyMenu->args->unk_24 == 17 || partyMenu->args->unk_24 == 22 || partyMenu->args->unk_24 == 23) {
        partyMenu->unk_948 = &_0210148C;
    } else if (partyMenu->args->unk_24 == 21) {
        partyMenu->unk_948 = &_021014CC;
    } else {
        partyMenu->unk_948 = &_0210140C;
    }
    if (partyMenu->args->unk_24 != 2 && partyMenu->args->unk_24 != 17 && partyMenu->args->unk_24 != 23 && partyMenu->args->unk_24 != 22) {
        Set2dSpriteVisibleFlag(partyMenu->unk_680, FALSE);
        Set2dSpriteAnimSeqNo(partyMenu->unk_684, 0);
        s16 x, y;
        Sprite_GetPositionXY(partyMenu->unk_684, &x, &y);
        Sprite_SetPositionXY(partyMenu->unk_684, x, y - 8);
        r4 ^= 1;
    }
    if (partyMenu->args->unk_24 == 4 || partyMenu->args->unk_24 == 21) {
        Set2dSpriteVisibleFlag(partyMenu->unk_684, FALSE);
        r4 ^= 2;
    }
    sub_0207D998(partyMenu, r4);
}

u8 sub_02079E28(PartyMenuStruct *partyMenu, u8 partySlot) {
    return partyMenu->unk_828[partySlot].active;
}

BOOL sub_02079E38(PartyMenuStruct *partyMenu, u8 partySlot) {
    Pokemon *mon;
    u32 unused;
    u16 species;  // sp4

    (void)unused;

    partyMenu->unk_828[partySlot].active = FALSE;
    if (Party_GetCount(partyMenu->args->party) <= partySlot) {
        return FALSE;
    }
    mon = Party_GetMonByIndex(partyMenu->args->party, partySlot);
    species = (u16)GetMonData(mon, MON_DATA_SPECIES, NULL);
    if (species == SPECIES_NONE) {
        return FALSE;
    }
    sub_0207D294(partyMenu, mon, partySlot);
    partyMenu->unk_828[partySlot].species = species;
    partyMenu->unk_828[partySlot].hp = (u16)GetMonData(mon, MON_DATA_HP, NULL);
    partyMenu->unk_828[partySlot].maxHp = (u16)GetMonData(mon, MON_DATA_MAXHP, NULL);
    partyMenu->unk_828[partySlot].level = (u16)GetMonData(mon, MON_DATA_LEVEL, NULL);
    partyMenu->unk_828[partySlot].heldItem = (u16)GetMonData(mon, MON_DATA_HELD_ITEM, NULL);
    partyMenu->unk_828[partySlot].capsule = (u16)GetMonData(mon, MON_DATA_CAPSULE, NULL);
    partyMenu->unk_828[partySlot].isEgg = (u8)GetMonData(mon, MON_DATA_IS_EGG, NULL);
    partyMenu->unk_828[partySlot].form = (u8)GetMonData(mon, MON_DATA_FORM, NULL);
    if (GetMonData(mon, MON_DATA_UNK_176, NULL) == TRUE) {
        partyMenu->unk_828[partySlot].unk_0E_0C = FALSE;
    } else {
        partyMenu->unk_828[partySlot].unk_0E_0C = TRUE;
    }
    partyMenu->unk_828[partySlot].gender = GetMonGender(mon);
    partyMenu->unk_828[partySlot].active = TRUE;
    partyMenu->unk_828[partySlot].unk_0E_00 = (u8)sub_0208AD64(mon);
    sub_02079FB8(partyMenu, mon, partySlot);
    return TRUE;
}

void sub_02079FB8(PartyMenuStruct *partyMenu, Pokemon *mon, u8 partySlot) {
    if (partyMenu->args->unk_24 == 13) {
        if (partyMenu->unk_828[partySlot].isEgg == TRUE || partyMenu->unk_828[partySlot].hp == 0) {
            partyMenu->unk_828[partySlot].unk_0E_0F = FALSE;
        } else {
            u32 numRibbons = sub_0207A058(mon, partyMenu->args->contestStat);
            u32 i;
            for (i = 0; i < 4; ++i) {
                if (GetMonData(mon, MON_DATA_MOVE1 + i, NULL) == MOVE_NONE) {
                    break;
                }
            }
            if (partyMenu->args->unk_2F <= numRibbons && i >= 2) {
                partyMenu->unk_828[partySlot].unk_0E_0F = TRUE;
            } else {
                partyMenu->unk_828[partySlot].unk_0E_0F = FALSE;
            }
        }
    }
}

u32 sub_0207A058(Pokemon *mon, u8 contestStat) {
    u32 result;
    switch (contestStat) {
    case COOL:
        result  = GetMonData(mon, MON_DATA_COOL_RIBBON, NULL);
        result += GetMonData(mon, MON_DATA_COOL_RIBBON_GREAT, NULL);
        result += GetMonData(mon, MON_DATA_COOL_RIBBON_ULTRA, NULL);
        result += GetMonData(mon, MON_DATA_COOL_RIBBON_MASTER, NULL);
        break;
    case BEAUTY:
        result  = GetMonData(mon, MON_DATA_BEAUTY_RIBBON, NULL);
        result += GetMonData(mon, MON_DATA_BEAUTY_RIBBON_GREAT, NULL);
        result += GetMonData(mon, MON_DATA_BEAUTY_RIBBON_ULTRA, NULL);
        result += GetMonData(mon, MON_DATA_BEAUTY_RIBBON_MASTER, NULL);
        break;
    case CUTE:
        result  = GetMonData(mon, MON_DATA_CUTE_RIBBON, NULL);
        result += GetMonData(mon, MON_DATA_CUTE_RIBBON_GREAT, NULL);
        result += GetMonData(mon, MON_DATA_CUTE_RIBBON_ULTRA, NULL);
        result += GetMonData(mon, MON_DATA_CUTE_RIBBON_MASTER, NULL);
        break;
    case SMART:
        result  = GetMonData(mon, MON_DATA_SMART_RIBBON, NULL);
        result += GetMonData(mon, MON_DATA_SMART_RIBBON_GREAT, NULL);
        result += GetMonData(mon, MON_DATA_SMART_RIBBON_ULTRA, NULL);
        result += GetMonData(mon, MON_DATA_SMART_RIBBON_MASTER, NULL);
        break;
    case TOUGH:
        result  = GetMonData(mon, MON_DATA_TOUGH_RIBBON, NULL);
        result += GetMonData(mon, MON_DATA_TOUGH_RIBBON_GREAT, NULL);
        result += GetMonData(mon, MON_DATA_TOUGH_RIBBON_ULTRA, NULL);
        result += GetMonData(mon, MON_DATA_TOUGH_RIBBON_MASTER, NULL);
        break;
    }
    return result;
}

u16 *sub_0207A16C(PartyMenuStruct *partyMenu) {
    return &partyMenu->unk_3D4[0x36];
}
