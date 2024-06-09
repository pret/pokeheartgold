#include "constants/maps.h"
#include "global.h"
#include "bag.h"
#include "party_menu.h"
#include "gf_gfx_loader.h"
#include "field_system.h"
#include "msgdata/msg.naix"
#include "font.h"
#include "overlay_94.h"
#include "render_text.h"
#include "sound_02004A44.h"
#include "system.h"
#include "unk_02005D10.h"
#include "unk_0200FA24.h"
#include "unk_020210A0.h"
#include "unk_020290B4.h"
#include "unk_02066EDC.h"
#include "unk_0207CB7C.h"
#include "unk_0207F42C.h"
#include "unk_0203A3B0.h"
#include "unk_02080BB4.h"
#include "unk_0208805C.h"
#include "unk_0207EB24.h"
#include "unk_02074944.h"
#include "unk_02088288.h"
#include "use_item_on_mon.h"
#include "vram_transfer_manager.h"
#include "constants/moves.h"
#include "msgdata/msg/msg_0300.h"

typedef struct UnkStruct_0207A22C {
    u16 unk_0;
    u16 unk_2;
    u16 unk_4;
    u16 unk_6;
    u16 unk_8;
    u16 unk_A;
} UnkStruct_0207A22C;

BOOL PartyMenuApp_Init(OVY_MANAGER *manager, int *pState);
BOOL PartyMenuApp_Main(OVY_MANAGER *manager, int *pState);
void sub_02079230(PartyMenuStruct *partyMenu);
int sub_02079280(PartyMenuStruct *partyMenu);
int sub_02079308(PartyMenuStruct *partyMenu);
int sub_020793C0(PartyMenuStruct *partyMenu);
int sub_02079400(PartyMenuStruct *partyMenu);
int sub_02079440(PartyMenuStruct *partyMenu);
int PartyMenu_Subtask_WaitTextPrinter(PartyMenuStruct *partyMenu);
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
BOOL sub_0207A880(PartyMenuStruct *partyMenu, u8 partySlot);
PartyMenuStruct *sub_02079BD8(OVY_MANAGER *manager);
void sub_02079CE4(PartyMenuStruct *partyMenu);
void sub_02079D38(PartyMenuStruct *partyMenu);
u8 sub_02079E28(PartyMenuStruct *partyMenu, u8 partySlot);
void sub_02079FB8(PartyMenuStruct *partyMenu, Pokemon *mon, u8 partySlot);
u32 sub_0207A058(Pokemon *mon, u8 contestStat);
void sub_0207A174(PartyMenuStruct *partyMenu, u8 partySlot, u8 x, u8 y, u8 a4);
void sub_0207A22C(PartyMenuStruct *partyMenu);
void sub_0207A2AC(PartyMenuStruct *partyMenu, const UnkStruct_0207A22C *a1);
void sub_0207A3C8(PartyMenuStruct *partyMenu, const UnkStruct_0207A22C *a1);
void sub_0207A4B4(PartyMenuStruct *partyMenu, const UnkStruct_0207A22C *a1);
void sub_0207A5A0(PartyMenuStruct *partyMenu, const UnkStruct_0207A22C *a1);
void sub_0207A68C(PartyMenuStruct *partyMenu, const UnkStruct_0207A22C *a1);
void sub_0207A780(PartyMenuStruct *partyMenu, u8 partySlot, s16 x, s16 y);
void sub_0207A89C(PartyMenuStruct *partyMenu);
u8 sub_0207A8FC(PartyMenuStruct *partyMenu);
void sub_0207A910(PartyMenuStruct *partyMenu, int selection, int x, int y);
void sub_0207A988(PartyMenuStruct *partyMenu, int selection, int x, int y);
BOOL sub_0207A99C(PartyMenuStruct *partyMenu);
int sub_0207B5EC(u8 a0, u8 partySlot);
u8 sub_0207AAD0(PartyMenuStruct *partyMenu, u8 *px, u8 *py, u8 direction);
u8 sub_0207AB20(PartyMenuStruct *partyMenu, u8 *px, u8 *py, const u8 *a3);
void sub_0207AC20(PartyMenuStruct *partyMenu);
int sub_0207AC70(PartyMenuStruct *partyMenu, BOOL a1);
int sub_0207AD6C(PartyMenuStruct *partyMenu);
u8 sub_0207ADB8(PartyMenuStruct *partyMenu);
void sub_0207AFC4(PartyMenuStruct *partyMenu);
u8 sub_0207B0B0(PartyMenuStruct *partyMenu, u8 *buf);
u8 sub_0207B1BC(PartyMenuStruct *partyMenu, u8 *buf);
u8 sub_0207B1C8(PartyMenuStruct *partyMenu, u8 *buf);
u8 sub_0207B200(PartyMenuStruct *partyMenu, u8 *buf);
u8 sub_0207B23C(PartyMenuStruct *partyMenu, u8 *buf);
u8 sub_0207B32C(PartyMenuStruct *partyMenu, u8 *buf);
u8 sub_0207B28C(PartyMenuStruct *partyMenu, u8 *buf);
u8 sub_0207B2DC(PartyMenuStruct *partyMenu, u8 *buf);
u8 sub_0207B364(PartyMenuStruct *partyMenu, u8 selection);
u8 sub_0207B418(PartyMenuStruct *partyMenu, u8 selection);
u8 sub_0207B4A0(PartyMenuStruct *partyMenu, u8 selection);
u8 sub_0207BCC0(u16 move);
int PartyMenu_SoftboiledTryTargetCheck(PartyMenuStruct *partyMenu);
void sub_0207B51C(PartyMenuStruct *partyMenu, u8 selection, BOOL a2);
u8 sub_0207B600(PartyMenuStruct *partyMenu);
int sub_0207B7E0(PartyMenuStruct *partyMenu);
u8 sub_0207BA78(PartyMenuStruct *partyMenu);
u8 sub_0207BB14(PartyMenuStruct *partyMenu);
u8 sub_0207BB88(PartyMenuStruct *partyMenu);
void sub_0207BBFC(u8 a0, s16 *px, s16 *py);
BOOL sub_0207BC1C(PartyMenuStruct *partyMenu, int *pState);
int PartyMenu_Subtask_Softboiled(PartyMenuStruct *partyMenu);
u8 PartyMenu_SoftboiledTargetCheck(PartyMenuStruct *partyMenu);
BOOL PartyMenu_SoftboiledHPTransferStep(PartyMenuStruct *partyMenu, u8 partySlot, s8 delta);
u8 sub_0207C0DC(PartyMenuStruct *partyMenu);
int sub_0207C288(PartyMenuStruct *partyMenu);
u8 sub_0207C3D0(PartyMenuStruct *partyMenu);
int sub_0207C400(PartyMenuStruct *partyMenu);
int sub_0207C5D4(PartyMenuStruct *partyMenu, Pokemon *mon, s32 *transformResult);
void sub_0207C658(PartyMenuStruct *partyMenu, Pokemon *mon, u32 oldItemId, u32 newItemId, ...);
int sub_0207C6BC(PartyMenuStruct *partyMenu);
int sub_0207C6DC(PartyMenuStruct *partyMenu);
int sub_0207C70C(PartyMenuStruct *partyMenu);
int sub_0207C728(PartyMenuStruct *partyMenu);
int sub_0207C74C(PartyMenuStruct *partyMenu);
int sub_0207C8B4(PartyMenuStruct *partyMenu);
int sub_0207C908(PartyMenuStruct *partyMenu);
int sub_0207CA30(PartyMenuStruct *partyMenu);
void sub_0207CAAC(HeapID heapId, void *a1, void *a2, void *a3);
void sub_0207CB20(PartyMenuStruct *partyMenu);
void sub_0207CB3C(PartyMenuStruct *partyMenu, BOOL a1);
void sub_0207CB54(PartyMenuStruct *partyMenu);

extern const u8 _021012B0[][2];
extern const u8 _021012CC[][6];
extern const UnkStruct_02020654 _0210140C[8];
extern const UnkStruct_02020654 _0210144C[8];
extern const UnkStruct_02020654 _0210148C[8];
extern const UnkStruct_02020654 _021014CC[8];
extern const UnkStruct_0207A22C _0210150C[];
extern const UnkStruct_0207A22C _02101554[];
extern const u16 _021013C4[16];
extern TouchscreenHitbox _02110104[];
extern TouchscreenHitbox _02110128[][8];

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
    sub_0207B51C(partyMenu, partyMenu->partyMonIndex, TRUE);
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
    case PARTY_MENU_STATE_0:
        *pState = sub_02079280(partyMenu);
        break;
    case PARTY_MENU_STATE_1:
        *pState = sub_02079308(partyMenu);
        break;
    case PARTY_MENU_STATE_2:
        if (sub_0207BC1C(partyMenu, pState) == TRUE) {
            *pState = PARTY_MENU_STATE_1;
        }
        break;
    case PARTY_MENU_STATE_3:
        *pState = sub_02080B74(partyMenu);
        break;
    case PARTY_MENU_STATE_4:
        *pState = sub_020793C0(partyMenu);
        break;
    case PARTY_MENU_STATE_5:
        *pState = partyMenu->unk_C54(partyMenu);
        break;
    case PARTY_MENU_STATE_6:
        *pState = sub_02082738(partyMenu);
        break;
    case PARTY_MENU_STATE_7:
        *pState = sub_02081820(partyMenu);
        break;
    case PARTY_MENU_STATE_8:
        *pState = sub_02079400(partyMenu);
        break;
    case PARTY_MENU_STATE_9:
        *pState = sub_0207C728(partyMenu);
        break;
    case PARTY_MENU_STATE_10:
        *pState = sub_0207C74C(partyMenu);
        break;
    case PARTY_MENU_STATE_11:
        *pState = sub_0207C6BC(partyMenu);
        break;
    case PARTY_MENU_STATE_12:
        *pState = sub_0207C6DC(partyMenu);
        break;
    case PARTY_MENU_STATE_13:
        *pState = sub_0207C70C(partyMenu);
        break;
    case PARTY_MENU_STATE_14:
        *pState = sub_0207C908(partyMenu);
        break;
    case PARTY_MENU_STATE_15:
        *pState = sub_02079440(partyMenu);
        break;
    case PARTY_MENU_STATE_16:
        *pState = sub_0207C400(partyMenu);
        break;
    case PARTY_MENU_STATE_17:
        *pState = sub_0207F694(partyMenu);
        break;
    case PARTY_MENU_STATE_18:
        *pState = sub_0207F6E8(partyMenu);
        break;
    case PARTY_MENU_STATE_19:
        *pState = sub_0207F720(partyMenu);
        break;
    case PARTY_MENU_STATE_20:
        *pState = sub_0207FA08(partyMenu);
        break;
    case PARTY_MENU_STATE_21:
        *pState = sub_02079550(partyMenu);
        break;
    case PARTY_MENU_STATE_22:
        *pState = sub_02082370(partyMenu);
        break;
    case PARTY_MENU_STATE_23:
        *pState = sub_02080610(partyMenu);
        break;
    case PARTY_MENU_STATE_24:
        *pState = PartyMenu_Subtask_WaitTextPrinter(partyMenu);
        break;
    case PARTY_MENU_STATE_25:
        *pState = sub_020794EC(partyMenu);
        break;
    case PARTY_MENU_STATE_26:
        *pState = sub_020794F0(partyMenu);
        break;
    case PARTY_MENU_STATE_27:
        *pState = sub_020794FC(partyMenu);
        break;
    case PARTY_MENU_STATE_28: {
        u8 x = sub_0207B600(partyMenu);
        if (x == 0) {
            *pState = PARTY_MENU_STATE_29;
        } else if (x == 3) {
            *pState = PARTY_MENU_STATE_1;
        }
        break;
    }
    case PARTY_MENU_STATE_29:
        if (sub_0207FD6C(partyMenu) == TRUE) {
            *pState = PARTY_MENU_STATE_1;
        }
        break;
    case PARTY_MENU_STATE_30:
        *pState = PartyMenu_Subtask_Softboiled(partyMenu);
        break;
    case PARTY_MENU_STATE_31:
        if (PartyMenu_AnimateIconFormChange(partyMenu) == TRUE) {
            sub_0207CB6C(partyMenu);
            *pState = PARTY_MENU_STATE_25;
        }
        else {
            *pState = PARTY_MENU_STATE_31;
        }
        break;
    case PARTY_MENU_STATE_32:
        sub_020880CC(1, HEAP_ID_PARTY_MENU);
        *pState = PARTY_MENU_STATE_33;
        break;
    case PARTY_MENU_STATE_33:
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
                partyMenu->afterTextPrinterState = PARTY_MENU_STATE_0;
                return PARTY_MENU_STATE_7;
            } else {
                return PARTY_MENU_STATE_4;
            }
        } else if (partyMenu->args->unk_24 == 6) {
            return PARTY_MENU_STATE_21;
        } else if (partyMenu->args->unk_24 == 7) {
            return sub_020822CC(partyMenu);
        } else if (partyMenu->args->unk_24 == 8) {
            return sub_02081ED0(partyMenu);
        } else if (partyMenu->args->unk_24 == 11 || partyMenu->args->unk_24 == 12) {
            return PARTY_MENU_STATE_14;
        } else if (partyMenu->args->unk_24 == 9) {
            return PARTY_MENU_STATE_8;
        } else if (partyMenu->args->unk_24 == 10) {
            return PARTY_MENU_STATE_16;
        } else {
            return PARTY_MENU_STATE_1;
        }
    } else {
        return PARTY_MENU_STATE_0;
    }
}

int sub_02079308(PartyMenuStruct *partyMenu) {
    switch (sub_0207ADB8(partyMenu)) {
    case 0:
        switch (partyMenu->args->unk_24) {
        case 3:
        case 20:
            partyMenu->args->selectedAction = 0;
            return PARTY_MENU_STATE_32;
        case 14:
            sub_02082868(partyMenu);
            return PARTY_MENU_STATE_24;
        case 19:
            return sub_0207CA30(partyMenu);
        default:
            sub_02079224(partyMenu, 1);
            return PARTY_MENU_STATE_2;
        }
    case 4:
        return sub_0207B7E0(partyMenu);
    case 3:
        partyMenu->args->selectedAction = 0;
        return PARTY_MENU_STATE_32;
    case 2:
        if (partyMenu->args->unk_24 != 15) {
            partyMenu->args->selectedAction = 1;
            return PARTY_MENU_STATE_32;
        } else {
            thunk_Sprite_SetPalIndex(partyMenu->unk_678, 1);
            return sub_020807AC(partyMenu);
        }
    }
    return PARTY_MENU_STATE_1;
}

int sub_020793C0(PartyMenuStruct *partyMenu) {
    u8 x = sub_0207C0DC(partyMenu);
    if (x == 0 || x == 2) {
        thunk_Sprite_SetPalIndex(partyMenu->unk_678, 1);
        return sub_0207C288(partyMenu);
    } else if (x == 3) {
        partyMenu->args->selectedAction = 0;
        return PARTY_MENU_STATE_32;
    } else {
        return PARTY_MENU_STATE_4;
    }
}

int sub_02079400(PartyMenuStruct *partyMenu) {
    u8 x = sub_0207C0DC(partyMenu);
    if (x == 0 || x == 2) {
        thunk_Sprite_SetPalIndex(partyMenu->unk_678, 1);
        return sub_0207C400(partyMenu);
    } else if (x == 3) {
        partyMenu->args->selectedAction = 0;
        return PARTY_MENU_STATE_32;
    } else {
        return PARTY_MENU_STATE_8;
    }
}

int sub_02079440(PartyMenuStruct *partyMenu) {
    PartyMenuStruct_SubC90_UnkFunc func = sub_0207E93C(partyMenu, partyMenu->unk_824);
    switch ((int)func) {
    case -2:
        ClearFrameAndWindow2(&partyMenu->unk_214, TRUE);
        sub_0200E5D4(&partyMenu->unk_234, TRUE);
        ClearWindowTilemapAndScheduleTransfer(&partyMenu->unk_234);
        sub_02079224(partyMenu, FALSE);
        sub_0207CB20(partyMenu);
        sub_0207CB90();
        sub_0207DAC4(partyMenu, 29, 1);
        thunk_Sprite_SetPalIndex(partyMenu->unk_678, 0);
        return PARTY_MENU_STATE_1;
    default: {
        int result;
        func(partyMenu, &result);
        return result;
    }
    case -1:
        return PARTY_MENU_STATE_15;
    }
}

int PartyMenu_Subtask_WaitTextPrinter(PartyMenuStruct *partyMenu) {
    if (TextPrinterCheckActive(partyMenu->textPrinterId) == FALSE) {
        return partyMenu->afterTextPrinterState;
    } else {
        return PARTY_MENU_STATE_24;
    }
}

int sub_020794EC(PartyMenuStruct *partyMenu) {
    return PARTY_MENU_STATE_32;
}

int sub_020794F0(PartyMenuStruct *partyMenu) {
    sub_0207DBCC(partyMenu);
    return PARTY_MENU_STATE_27;
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
        return PARTY_MENU_STATE_27;
    }
}

int sub_02079550(PartyMenuStruct *partyMenu) {
    u8 x = sub_0207C0DC(partyMenu);
    if (x == 0 || x == 2) {
        thunk_Sprite_SetPalIndex(partyMenu->unk_678, 1);
        if (partyMenu->monsDrawState[partyMenu->partyMonIndex].isEgg != 1) {
            return sub_02082134(partyMenu);
        } else {
            sub_0207DAEC(partyMenu, -1, 1);
            partyMenu->args->selectedAction = 0;
            partyMenu->afterTextPrinterState = PARTY_MENU_STATE_25;
            ReadMsgDataIntoString(partyMenu->msgData, msg_0300_00102, partyMenu->strbuf);
            return PARTY_MENU_STATE_24;
        }
    } else if (x == 3) {
        partyMenu->args->selectedAction = 0;
        return PARTY_MENU_STATE_32;
    } else {
        return PARTY_MENU_STATE_21;
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
        String_Delete(partyMenu->monsDrawState[i].nickname);
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
    if (ret->args->unk_24 == 2 && ret->args->unk_14 != NULL) {
        ret->pokedex = sub_02074944(HEAP_ID_PARTY_MENU);
    } else {
        ret->pokedex = NULL;
    }
    ret->msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0300_bin, HEAP_ID_PARTY_MENU);
    ret->msgPrinter = MessagePrinter_New(15, 14, 0, HEAP_ID_PARTY_MENU);
    ret->msgFormat = MessageFormat_New(HEAP_ID_PARTY_MENU);
    for (i = 0; i < PARTY_SIZE; ++i) {
        ret->monsDrawState[i].nickname = String_New(POKEMON_NAME_LENGTH + 1, HEAP_ID_PARTY_MENU);
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
        partyMenu->unk_C63_7 = TRUE;
        partyMenu->args->unk_24 ^= 0x80;
    } else if (partyMenu->args->unk_24 == 21) {
        partyMenu->unk_C63_7 = TRUE;
    } else {
        partyMenu->unk_C63_7 = FALSE;
    }
}

void sub_02079D38(PartyMenuStruct *partyMenu) {
    u8 r4 = 3;
    if (partyMenu->args->unk_25 == 2) {
        partyMenu->unk_948 = _0210144C;
    } else if (partyMenu->args->unk_24 == 2 || partyMenu->args->unk_24 == 17 || partyMenu->args->unk_24 == 22 || partyMenu->args->unk_24 == 23) {
        partyMenu->unk_948 = _0210148C;
    } else if (partyMenu->args->unk_24 == 21) {
        partyMenu->unk_948 = _021014CC;
    } else {
        partyMenu->unk_948 = _0210140C;
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
    return partyMenu->monsDrawState[partySlot].active;
}

BOOL sub_02079E38(PartyMenuStruct *partyMenu, u8 partySlot) {
    Pokemon *mon;
    u32 unused;
    u16 species;  // sp4

    (void)unused;

    partyMenu->monsDrawState[partySlot].active = FALSE;
    if (Party_GetCount(partyMenu->args->party) <= partySlot) {
        return FALSE;
    }
    mon = Party_GetMonByIndex(partyMenu->args->party, partySlot);
    species = (u16)GetMonData(mon, MON_DATA_SPECIES, NULL);
    if (species == SPECIES_NONE) {
        return FALSE;
    }
    sub_0207D294(partyMenu, mon, partySlot);
    partyMenu->monsDrawState[partySlot].species = species;
    partyMenu->monsDrawState[partySlot].hp = (u16)GetMonData(mon, MON_DATA_HP, NULL);
    partyMenu->monsDrawState[partySlot].maxHp = (u16)GetMonData(mon, MON_DATA_MAXHP, NULL);
    partyMenu->monsDrawState[partySlot].level = (u16)GetMonData(mon, MON_DATA_LEVEL, NULL);
    partyMenu->monsDrawState[partySlot].heldItem = (u16)GetMonData(mon, MON_DATA_HELD_ITEM, NULL);
    partyMenu->monsDrawState[partySlot].capsule = (u16)GetMonData(mon, MON_DATA_CAPSULE, NULL);
    partyMenu->monsDrawState[partySlot].isEgg = (u8)GetMonData(mon, MON_DATA_IS_EGG, NULL);
    partyMenu->monsDrawState[partySlot].form = (u8)GetMonData(mon, MON_DATA_FORM, NULL);
    if (GetMonData(mon, MON_DATA_UNK_176, NULL) == TRUE) {
        partyMenu->monsDrawState[partySlot].unk_0E_0C = FALSE;
    } else {
        partyMenu->monsDrawState[partySlot].unk_0E_0C = TRUE;
    }
    partyMenu->monsDrawState[partySlot].gender = GetMonGender(mon);
    partyMenu->monsDrawState[partySlot].active = TRUE;
    partyMenu->monsDrawState[partySlot].unk_0E_00 = (u8)sub_0208AD64(mon);
    sub_02079FB8(partyMenu, mon, partySlot);
    return TRUE;
}

void sub_02079FB8(PartyMenuStruct *partyMenu, Pokemon *mon, u8 partySlot) {
    if (partyMenu->args->unk_24 == 13) {
        if (partyMenu->monsDrawState[partySlot].isEgg == TRUE || partyMenu->monsDrawState[partySlot].hp == 0) {
            partyMenu->monsDrawState[partySlot].unk_0E_0F = FALSE;
        } else {
            u32 numRibbons = sub_0207A058(mon, partyMenu->args->contestStat);
            u32 i;
            for (i = 0; i < 4; ++i) {
                if (GetMonData(mon, MON_DATA_MOVE1 + i, NULL) == MOVE_NONE) {
                    break;
                }
            }
            if (partyMenu->args->unk_2F <= numRibbons && i >= 2) {
                partyMenu->monsDrawState[partySlot].unk_0E_0F = TRUE;
            } else {
                partyMenu->monsDrawState[partySlot].unk_0E_0F = FALSE;
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

void sub_0207A174(PartyMenuStruct *partyMenu, u8 partySlot, u8 x, u8 y, u8 a4) {
    void *src;
    if (partySlot == 0 || (partyMenu->args->unk_25 != 0 && partySlot == 1)) {
        src = partyMenu->unk_314;
    } else {
        src = partyMenu->unk_3D4;
    }
    partyMenu->monsDrawState[partySlot].unk_14 = x;
    partyMenu->monsDrawState[partySlot].unk_15 = y;
    CopyToBgTilemapRect(partyMenu->bgConfig, GF_BG_LYR_MAIN_2, x, y, 16, 6, src, 0, 0, 16, 6);
    if (!a4) {
        FillBgTilemapRect(partyMenu->bgConfig, GF_BG_LYR_MAIN_2, 0x4B, x + 6, y + 3, 9, 1, TILEMAP_FILL_KEEP_PAL);
    }
    BgTilemapRectChangePalette(partyMenu->bgConfig, GF_BG_LYR_MAIN_2, x, y, 16, 6, partySlot + 3);
    sub_0207A7F4(partyMenu, partySlot);
}

void sub_0207A22C(PartyMenuStruct *partyMenu) {
    const UnkStruct_0207A22C *r1 = partyMenu->args->unk_25 == 2 ? _02101554 : _0210150C;
    if (partyMenu->args->unk_24 == 16) {
        sub_0207A3C8(partyMenu, r1);
    } else if (partyMenu->args->unk_24 == 6) {
        sub_0207A4B4(partyMenu, r1);
    } else if (partyMenu->args->unk_24 == 13) {
        sub_0207A5A0(partyMenu, r1);
    } else if (partyMenu->args->unk_24 == 2 || partyMenu->args->unk_24 == 17 || partyMenu->args->unk_24 == 22 || partyMenu->args->unk_24 == 23) {
        sub_0207A68C(partyMenu, r1);
    } else {
        sub_0207A2AC(partyMenu, r1);
    }
    ScheduleBgTilemapBufferTransfer(partyMenu->bgConfig, GF_BG_LYR_MAIN_2);
    ScheduleBgTilemapBufferTransfer(partyMenu->bgConfig, GF_BG_LYR_SUB_0);
}

void sub_0207A2AC(PartyMenuStruct *partyMenu, const UnkStruct_0207A22C *a1) {
    NARC *narc = NARC_New(NARC_poketool_icongra_poke_icon, HEAP_ID_PARTY_MENU);
    for (u8 i = 0; i < PARTY_SIZE; ++i) {
        if (sub_02079E38(partyMenu, i) == TRUE) {
            if (partyMenu->monsDrawState[i].isEgg == TRUE) {
                sub_0207A174(partyMenu, i, a1[i].unk_0, a1[i].unk_2, FALSE);
            } else {
                sub_0207A174(partyMenu, i, a1[i].unk_0, a1[i].unk_2, TRUE);
            }
            sub_0207D5DC(partyMenu, i);
            sub_0207EBE4(partyMenu, i, a1[i].unk_4, a1[i].unk_6, narc);
            sub_0207EF5C(partyMenu, i, a1[i].unk_8, a1[i].unk_A);
            sub_0207F004(partyMenu, i, partyMenu->monsDrawState[i].heldItem);
            sub_0207F064(partyMenu, i, a1[i].unk_4, a1[i].unk_6);
            sub_0207F0C8(partyMenu, i);
            sub_0207F098(partyMenu, i);
            sub_0207EFC4(partyMenu, i, partyMenu->monsDrawState[i].unk_0E_00);
        } else {
            sub_0207A780(partyMenu, i, a1[i].unk_0, a1[i].unk_2);
        }
    }
    NARC_Delete(narc);
}

void sub_0207A3C8(PartyMenuStruct *partyMenu, const UnkStruct_0207A22C *a1) {
    NARC *narc = NARC_New(NARC_poketool_icongra_poke_icon, HEAP_ID_PARTY_MENU);
    for (u8 i = 0; i < PARTY_SIZE; ++i) {
        if (sub_02079E38(partyMenu, i) == TRUE) {
            sub_0207A174(partyMenu, i, a1[i].unk_0, a1[i].unk_2, FALSE);
            sub_0207D710(partyMenu, i);
            sub_0207EBE4(partyMenu, i, a1[i].unk_4, a1[i].unk_6, narc);
            sub_0207EF5C(partyMenu, i, a1[i].unk_8, a1[i].unk_A);
            sub_0207F004(partyMenu, i, partyMenu->monsDrawState[i].heldItem);
            sub_0207F064(partyMenu, i, a1[i].unk_4, a1[i].unk_6);
            sub_0207F0C8(partyMenu, i);
            sub_0207F098(partyMenu, i);
            sub_0207EFC4(partyMenu, i, partyMenu->monsDrawState[i].unk_0E_00);
        } else {
            sub_0207A780(partyMenu, i, a1[i].unk_0, a1[i].unk_2);
        }
    }
    NARC_Delete(narc);
}

void sub_0207A4B4(PartyMenuStruct *partyMenu, const UnkStruct_0207A22C *a1) {
    NARC *narc = NARC_New(NARC_poketool_icongra_poke_icon, HEAP_ID_PARTY_MENU);
    for (u8 i = 0; i < PARTY_SIZE; ++i) {
        if (sub_02079E38(partyMenu, i) == TRUE) {
            sub_0207A174(partyMenu, i, a1[i].unk_0, a1[i].unk_2, FALSE);
            sub_0207D7A8(partyMenu, i);
            sub_0207EBE4(partyMenu, i, a1[i].unk_4, a1[i].unk_6, narc);
            sub_0207EF5C(partyMenu, i, a1[i].unk_8, a1[i].unk_A);
            sub_0207F004(partyMenu, i, partyMenu->monsDrawState[i].heldItem);
            sub_0207F064(partyMenu, i, a1[i].unk_4, a1[i].unk_6);
            sub_0207F0C8(partyMenu, i);
            sub_0207F098(partyMenu, i);
            sub_0207EFC4(partyMenu, i, partyMenu->monsDrawState[i].unk_0E_00);
        } else {
            sub_0207A780(partyMenu, i, a1[i].unk_0, a1[i].unk_2);
        }
    }
    NARC_Delete(narc);
}

void sub_0207A5A0(PartyMenuStruct *partyMenu, const UnkStruct_0207A22C *a1) {
    NARC *narc = NARC_New(NARC_poketool_icongra_poke_icon, HEAP_ID_PARTY_MENU);
    for (u8 i = 0; i < PARTY_SIZE; ++i) {
        if (sub_02079E38(partyMenu, i) == TRUE) {
            sub_0207A174(partyMenu, i, a1[i].unk_0, a1[i].unk_2, FALSE);
            sub_0207D840(partyMenu, i);
            sub_0207EBE4(partyMenu, i, a1[i].unk_4, a1[i].unk_6, narc);
            sub_0207EF5C(partyMenu, i, a1[i].unk_8, a1[i].unk_A);
            sub_0207F004(partyMenu, i, partyMenu->monsDrawState[i].heldItem);
            sub_0207F064(partyMenu, i, a1[i].unk_4, a1[i].unk_6);
            sub_0207F0C8(partyMenu, i);
            sub_0207F098(partyMenu, i);
            sub_0207EFC4(partyMenu, i, partyMenu->monsDrawState[i].unk_0E_00);
        } else {
            sub_0207A780(partyMenu, i, a1[i].unk_0, a1[i].unk_2);
        }
    }
    NARC_Delete(narc);
}

void sub_0207A68C(PartyMenuStruct *partyMenu, const UnkStruct_0207A22C *a1) {
    NARC *narc = NARC_New(NARC_poketool_icongra_poke_icon, HEAP_ID_PARTY_MENU);
    for (u8 i = 0; i < PARTY_SIZE; ++i) {
        if (sub_02079E38(partyMenu, i) == TRUE) {
            sub_0207A174(partyMenu, i, a1[i].unk_0, a1[i].unk_2, FALSE);
            sub_0207D8A4(partyMenu, i);
            sub_0207D8EC(partyMenu, i);
            sub_0207EBE4(partyMenu, i, a1[i].unk_4, a1[i].unk_6, narc);
            sub_0207EF5C(partyMenu, i, a1[i].unk_8, a1[i].unk_A);
            sub_0207F004(partyMenu, i, partyMenu->monsDrawState[i].heldItem);
            sub_0207F064(partyMenu, i, a1[i].unk_4, a1[i].unk_6);
            sub_0207F0C8(partyMenu, i);
            sub_0207F098(partyMenu, i);
            sub_0207EFC4(partyMenu, i, partyMenu->monsDrawState[i].unk_0E_00);
        } else {
            sub_0207A780(partyMenu, i, a1[i].unk_0, a1[i].unk_2);
        }
    }
    NARC_Delete(narc);
}

void sub_0207A780(PartyMenuStruct *partyMenu, u8 partySlot, s16 x, s16 y) {
    CopyToBgTilemapRect(partyMenu->bgConfig, GF_BG_LYR_MAIN_2, x, y, 16, 6, partyMenu->unk_494, 0, 0, 16, 6);
    BgTilemapRectChangePalette(partyMenu->bgConfig, GF_BG_LYR_MAIN_2, x, y, 16, 6, 1);
    sub_0207EFC4(partyMenu, partySlot, 7);
    sub_0207F004(partyMenu, partySlot, ITEM_NONE);
    sub_0207F0C8(partyMenu, partySlot);
}

void sub_0207A7F4(PartyMenuStruct *partyMenu, u8 partySlot) {
    Pokemon *mon = Party_GetMonByIndex(partyMenu->args->party, partySlot);
    u8 r4;
    if (partyMenu->unk_C63_6 == TRUE && (partySlot == partyMenu->partyMonIndex || partySlot == partyMenu->softboiledDonorSlot)) {
        r4 = 7;
    } else {
        if (partySlot == partyMenu->partyMonIndex) {
            r4 = 4;
        } else {
            r4 = 0;
        }
        if (GetMonData(mon, MON_DATA_HP, NULL) == 0) {
            r4 += 2;
        } else if (sub_0207A880(partyMenu, partySlot) == TRUE) {
            r4 += 1;
        }
    }
    BG_LoadPlttData(GF_BG_LYR_MAIN_2, &partyMenu->unk_554[16 * r4], 0x10, (partySlot + 3) * 32);
}

BOOL sub_0207A880(PartyMenuStruct *partyMenu, u8 partySlot) {
    return partyMenu->args->unk_25 == 2 && (partySlot & 1);
}

void sub_0207A89C(PartyMenuStruct *partyMenu) {
    u8 x;
    u8 y;
    sub_02020A24(partyMenu->unk_948, &x, &y, 0, 0, partyMenu->partyMonIndex, 4);
    Set2dSpriteAnimSeqNo(partyMenu->unk_678, sub_0207B5EC(partyMenu->args->unk_25, partyMenu->partyMonIndex));
    Sprite_SetPositionXY(partyMenu->unk_678, x, y);
}

u8 sub_0207A8FC(PartyMenuStruct *partyMenu) {
    if (sub_0207A99C(partyMenu) == TRUE) {
        return 1;
    } else {
        return 5;
    }
}

void sub_0207A910(PartyMenuStruct *partyMenu, int selection, int x, int y) {
    if (selection == 6 || selection == 7) {
        Set2dSpriteVisibleFlag(partyMenu->unk_678, FALSE);
    } else {
        Set2dSpriteAnimSeqNo(partyMenu->unk_678, sub_0207B5EC(partyMenu->args->unk_25, selection));
        Set2dSpriteVisibleFlag(partyMenu->unk_678, TRUE);
        Sprite_SetPositionXY(partyMenu->unk_678, x, y);
    }
    u8 oldPartyMonIndex = partyMenu->partyMonIndex;
    partyMenu->partyMonIndex = selection;
    sub_0207B51C(partyMenu, oldPartyMonIndex, FALSE);
    sub_0207B51C(partyMenu, partyMenu->partyMonIndex, TRUE);
}

void sub_0207A988(PartyMenuStruct *partyMenu, int selection, int x, int y) {
    sub_0207A910(partyMenu, selection, x, y);
    PlaySE(SEQ_SE_DP_SELECT);
}

BOOL sub_0207A99C(PartyMenuStruct *partyMenu) {
    u8 newSelection;
    u8 direction;
    u8 x, y;

    direction = DIR_MAX;

    if (gSystem.newAndRepeatedKeys & PAD_KEY_UP) {
        direction = DIR_NORTH;
    } else if (gSystem.newAndRepeatedKeys & PAD_KEY_DOWN) {
        direction = DIR_SOUTH;
    } else if (gSystem.newAndRepeatedKeys & PAD_KEY_LEFT) {
        direction = DIR_WEST;
    } else if (gSystem.newAndRepeatedKeys & PAD_KEY_RIGHT) {
        direction = DIR_EAST;
    }

    if (direction == DIR_MAX) {
        return FALSE;
    }

    newSelection = partyMenu->partyMonIndex;
    if (newSelection == 6) {
        if (direction == DIR_NORTH) {
            newSelection = sub_0207AB20(partyMenu, &x, &y, _021012CC[(partyMenu->unk_C66 & 1) + 2]);
        } else {
            newSelection = sub_0207AAD0(partyMenu, &x, &y, direction);
        }
    } else if (newSelection == 7) {
        if (partyMenu->args->unk_24 != 2 && partyMenu->args->unk_24 != 17 && partyMenu->args->unk_24 != 23 && partyMenu->args->unk_24 != 22 && direction == DIR_NORTH) {
            newSelection = sub_0207AB20(partyMenu, &x, &y, _021012CC[(partyMenu->unk_C66 & 1) + 2]);
        } else if (direction == DIR_SOUTH) {
            newSelection = sub_0207AB20(partyMenu, &x, &y, _021012CC[partyMenu->unk_C66 & 1]);
        } else {
            newSelection = sub_0207AAD0(partyMenu, &x, &y, direction);
        }
    } else {
        newSelection = sub_0207AAD0(partyMenu, &x, &y, direction);
    }
    if (newSelection != partyMenu->partyMonIndex && newSelection != 0xFF) {
        sub_0207A988(partyMenu, newSelection, x, y);
        return TRUE;
    }

    return FALSE;
}

u8 sub_0207AAD0(PartyMenuStruct *partyMenu, u8 *px, u8 *py, u8 direction) {
    u8 result = partyMenu->partyMonIndex;
    while (TRUE) {
        result = sub_02020A24(partyMenu->unk_948, px, py, 0, 0, result, direction);
        if (result == 6 || result == 7 || result == 0xFF) {
            break;
        }
        if (sub_02079E28(partyMenu, result)) {
            break;
        }
    }
    return result;
}

u8 sub_0207AB20(PartyMenuStruct *partyMenu, u8 *px, u8 *py, const u8 *a3) {
    u8 i = 0;
    while (TRUE) {
        if (i == 6) {
            break;
        }
        if (sub_02079E28(partyMenu, a3[i])) {
            sub_02020A24(partyMenu->unk_948, px, py, 0, 0, a3[i], DIR_MAX);
            return a3[i];
        }
        ++i;
    }
    sub_02020A24(partyMenu->unk_948, px, py, 0, 0, 0, DIR_MAX);
    return 0;
}

void sub_0207AB84(PartyMenuStruct *partyMenu, u8 partySlot) {
    if (partySlot == 6 || partySlot == 7) {
        Set2dSpriteVisibleFlag(partyMenu->unk_678, FALSE);
    } else {
        u8 x, y;
        sub_02020A24(partyMenu->unk_948, &x, &y, 0, 0, partyMenu->partyMonIndex, DIR_MAX);
        Set2dSpriteAnimSeqNo(partyMenu->unk_678, sub_0207B5EC(partyMenu->args->unk_25, partySlot));
        Set2dSpriteVisibleFlag(partyMenu->unk_678, TRUE);
        Sprite_SetPositionXY(partyMenu->unk_678, x, y);
    }
    u8 oldSlot = partyMenu->partyMonIndex;
    partyMenu->partyMonIndex = partySlot;
    sub_0207B51C(partyMenu, oldSlot, FALSE);
    sub_0207B51C(partyMenu, partyMenu->partyMonIndex, TRUE);
}

void sub_0207AC20(PartyMenuStruct *partyMenu) {
    s16 x, y;
    switch (partyMenu->unk_C60) {
    case 0:
        break;
    case 1:
        sub_0207BBFC(partyMenu->unk_C61, &x, &y);
        sub_0207F2A8(partyMenu, x, y);
        ++partyMenu->unk_C60;
        break;
    case 2:
        partyMenu->unk_C60 = 0;
        break;
    }
}

int sub_0207AC70(PartyMenuStruct *partyMenu, BOOL a1) {
    G2_BlendNone();
    if (partyMenu->partyMonIndex == 6) {
        return 4;
    } else if (partyMenu->partyMonIndex == 7) {
        PlaySE(SEQ_SE_GS_GEARCANCEL);
        if (!partyMenu->unk_C63_7) {
            sub_0207CB3C(partyMenu, a1);
            return 3;
        }
    } else if (partyMenu->args->unk_24 == 3 || partyMenu->args->unk_24 == 19) {
        PlaySE(SEQ_SE_DP_SELECT);
        return 0;
    } else if (partyMenu->args->unk_24 == 20 || partyMenu->args->unk_24 == 14) {
        if (!partyMenu->monsDrawState[partyMenu->partyMonIndex].isEgg) {
            PlaySE(SEQ_SE_DP_SELECT);
            return 0;
        } else {
            PlaySE(SEQ_SE_DP_CUSTOM06);
            return 5;
        }
    } else if (partyMenu->args->unk_24 == 15) {
        if (!partyMenu->monsDrawState[partyMenu->partyMonIndex].isEgg) {
            PlaySE(SEQ_SE_DP_SELECT);
            sub_0207E068(partyMenu);
            sub_0207F3A4(partyMenu, partyMenu->partyMonIndex);
            sub_0207AFC4(partyMenu);
            return 0;
        } else {
            PlaySE(SEQ_SE_DP_CUSTOM06);
            return 5;
        }
    } else {
        PlaySE(SEQ_SE_DP_SELECT);
        sub_0207E068(partyMenu);
        sub_0207F3A4(partyMenu, partyMenu->partyMonIndex);
        sub_0207AFC4(partyMenu);
        return 0;
    }
    return 5;
}

int sub_0207AD6C(PartyMenuStruct *partyMenu) {
    int idx = 0;
    if (partyMenu->args->unk_24 == 2 || partyMenu->args->unk_24 == 17 || partyMenu->args->unk_24 == 22 || partyMenu->args->unk_24 == 23) {
        return TouchscreenHitbox_FindRectAtTouchNew(_02110104);
    } else {
        if (partyMenu->args->unk_25 == 2) {
            idx = 1;
        }
        return TouchscreenHitbox_FindRectAtTouchNew(_02110128[idx]);
    }
}

u8 sub_0207ADB8(PartyMenuStruct *partyMenu) {
    PartyMenuStruct_SubC90 *r5 = &partyMenu->unk_C90;
    u8 result;

    if (r5->unk_C == 1) {
        if (sub_0207CC24(partyMenu) == FALSE) {
            return r5->unk_8;
        } else {
            return 5;
        }
    }

    u32 selection = sub_0207AD6C(partyMenu);
    if (selection != -1) {
        switch (selection) {
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
            if (selection >= Party_GetCount(partyMenu->args->party)) {
                // UB: hits "return result;" but result was never initialized
                break;
            }
            sub_0207A910(partyMenu, selection, partyMenu->unk_948[selection].unk_0, partyMenu->unk_948[selection].unk_1);
            return sub_0207AC70(partyMenu, TRUE);
        case 6:
            if (partyMenu->unk_C63_7) {
                // UB: hits "return result;" but result was never initialized
                break;
            }
            PlaySE(SEQ_SE_GS_GEARCANCEL);
            sub_02079224(partyMenu, FALSE);
            partyMenu->partyMonIndex = 7;
            sub_0207CB3C(partyMenu, TRUE);
            G2_BlendNone();
            sub_0207A910(partyMenu, 7, partyMenu->unk_948[7].unk_0, partyMenu->unk_948[7].unk_1);
            sub_0207CBD0(partyMenu, 9, 3, TRUE);
            return 5;
        case 7:
            sub_0207A988(partyMenu, 6, partyMenu->unk_948[6].unk_0, partyMenu->unk_948[6].unk_1);
            sub_0207CBD0(partyMenu, 8, sub_0207AC70(partyMenu, TRUE), TRUE);
            return 5;
        }
    } else {
        if (gSystem.newKeys & PAD_BUTTON_A) {
            if (partyMenu->partyMonIndex == 7) {
                sub_0207A910(partyMenu, partyMenu->partyMonIndex, partyMenu->unk_948[partyMenu->partyMonIndex].unk_0, partyMenu->unk_948[partyMenu->partyMonIndex].unk_1);
                sub_0207CBD0(partyMenu, 9,  sub_0207AC70(partyMenu, FALSE), FALSE);
                return 5;
            } else if (partyMenu->partyMonIndex == 6) {
                sub_0207A988(partyMenu, partyMenu->partyMonIndex, partyMenu->unk_948[partyMenu->partyMonIndex].unk_0, partyMenu->unk_948[partyMenu->partyMonIndex].unk_1);
                sub_0207CBD0(partyMenu, 8, sub_0207AC70(partyMenu, FALSE), FALSE);
                return 5;
            } else {
                return sub_0207AC70(partyMenu, FALSE);
            }
        } else if ((gSystem.newKeys & PAD_BUTTON_B) && !partyMenu->unk_C63_7) {
            PlaySE(SEQ_SE_GS_GEARCANCEL);
            sub_02079224(partyMenu, FALSE);
            sub_0207CB3C(partyMenu, FALSE);
            G2_BlendNone();
            if (partyMenu->partyMonIndex == 7) {
                sub_0207CBD0(partyMenu, 9, 3, FALSE);
            } else {
                sub_0207A910(partyMenu, 7, partyMenu->unk_948[7].unk_0, partyMenu->unk_948[7].unk_1);
                sub_0207CBD0(partyMenu, 9, 3, TRUE);
            }
            return 5;
        } else {
            result = sub_0207A8FC(partyMenu);
        }
    }
    return result;  // possible UB
}

void sub_0207AFC4(PartyMenuStruct *partyMenu) {
    ClearFrameAndWindow2(&partyMenu->unk_204, TRUE);
    u8 *buf = AllocFromHeap(HEAP_ID_PARTY_MENU, 8);
    u8 r2;
    switch (partyMenu->args->unk_24) {
    case 0:
        r2 = sub_0207B0B0(partyMenu, buf);
        break;
    case 2:
    case 17:
        r2 = sub_0207B23C(partyMenu, buf);
        break;
    case 15:
        r2 = sub_0207B1BC(partyMenu, buf);
        break;
    case 18:
        r2 = sub_0207B1C8(partyMenu, buf);
        break;
    case 21:
        r2 = sub_0207B32C(partyMenu, buf);
        break;
    case 22:
        r2 = sub_0207B28C(partyMenu, buf);
        break;
    case 23:
        r2 = sub_0207B2DC(partyMenu, buf);
        break;
    default:
        r2 = sub_0207B200(partyMenu, buf);
        break;
    }
    sub_0207D0E4(partyMenu, buf, r2);
    FreeToHeapExplicit(HEAP_ID_PARTY_MENU, buf);
    sub_0207D1C8(partyMenu);
    sub_0207DAD8(partyMenu, -1, 1);
    thunk_Sprite_SetPalIndex(partyMenu->unk_678, 1);
}

u8 sub_0207B0B0(PartyMenuStruct *partyMenu, u8 *buf) {
    Pokemon *pokemon = Party_GetMonByIndex(partyMenu->args->party, partyMenu->partyMonIndex);
    u16 move;
    u8 r4 = 0;
    u8 i;
    u8 count = 0;
    u8 fieldEffect;

    buf[count] = 1;
    ++count;
    if (!FieldSystem_MapIsBattleTowerMultiPartnerSelectRoom(partyMenu->args->fieldSystem)) {
        if (!partyMenu->monsDrawState[partyMenu->partyMonIndex].isEgg) {
            buf[count] = 0;
            ++count;
            if (ItemIdIsMail(partyMenu->monsDrawState[partyMenu->partyMonIndex].heldItem) == TRUE) {
                buf[count] = 5;
            } else {
                buf[count] = 2;
            }
            ++count;
            buf[count] = 9;
            ++count;
            for (i = 0; i < MAX_MON_MOVES; ++i) {
                move = GetMonData(pokemon, MON_DATA_MOVE1 + i, NULL);
                if (move == MOVE_NONE) {
                    break;
                }
                fieldEffect = sub_0207BCC0(move);
                if (fieldEffect != 0xFF) {
                    buf[count] = fieldEffect;
                    ++count;
                    sub_0207D0A0(partyMenu, move, r4);
                    ++r4;
                }
            }
        } else {
            buf[count] = 0;
            ++count;
            buf[count] = 9;
            ++count;
        }
    } else {
        buf[count] = 9;
        ++count;
    }
    return count;
}

u8 sub_0207B1BC(PartyMenuStruct *partyMenu, u8 *buf) {
    buf[0] = 14;
    buf[1] = 9;
    return 2;
}

u8 sub_0207B1C8(PartyMenuStruct *partyMenu, u8 *buf) {
    if (partyMenu->monsDrawState[partyMenu->partyMonIndex].isEgg == FALSE) {
        buf[0] = 8;
        buf[1] = 1;
        buf[2] = 9;
        return 3;
    } else {
        buf[0] = 1;
        buf[1] = 9;
        return 2;
    }
}

u8 sub_0207B200(PartyMenuStruct *partyMenu, u8 *buf) {
    if (partyMenu->monsDrawState[partyMenu->partyMonIndex].unk_0E_0F == TRUE) {
        buf[0] = 13;
        buf[1] = 1;
        buf[2] = 9;
        return 3;
    } else {
        buf[0] = 1;
        buf[1] = 9;
        return 2;
    }
}

u8 sub_0207B23C(PartyMenuStruct *partyMenu, u8 *buf) {
    switch (sub_0207B364(partyMenu, partyMenu->partyMonIndex)) {
    case 0:
        buf[0] = 1;
        buf[1] = 9;
        return 2;
    case 1:
        buf[0] = 11;
        buf[1] = 1;
        buf[2] = 9;
        return 3;
    case 2:
        buf[0] = 12;
        buf[1] = 1;
        buf[2] = 9;
        return 3;
    }

    return 0;
}

u8 sub_0207B28C(PartyMenuStruct *partyMenu, u8 *buf) {
    switch (sub_0207B418(partyMenu, partyMenu->partyMonIndex)) {
    case 0:
        buf[0] = 1;
        buf[1] = 9;
        return 2;
    case 1:
        buf[0] = 11;
        buf[1] = 1;
        buf[2] = 9;
        return 3;
    case 2:
        buf[0] = 12;
        buf[1] = 1;
        buf[2] = 9;
        return 3;
    }

    return 0;
}

u8 sub_0207B2DC(PartyMenuStruct *partyMenu, u8 *buf) {
    switch (sub_0207B4A0(partyMenu, partyMenu->partyMonIndex)) {
    case 0:
        buf[0] = 1;
        buf[1] = 9;
        return 2;
    case 1:
        buf[0] = 11;
        buf[1] = 1;
        buf[2] = 9;
        return 3;
    case 2:
        buf[0] = 12;
        buf[1] = 1;
        buf[2] = 9;
        return 3;
    }

    return 0;
}

u8 sub_0207B32C(PartyMenuStruct *partyMenu, u8 *buf) {
    if (partyMenu->monsDrawState[partyMenu->partyMonIndex].isEgg == TRUE) {
        buf[0] = 1;
        buf[1] = 15;
        buf[2] = 9;
        return 3;
    } else {
        buf[0] = 1;
        buf[1] = 9;
        return 2;
    }
}

u8 sub_0207B364(PartyMenuStruct *partyMenu, u8 selection) {
    u8 i;

    if (partyMenu->args->unk_14 != NULL) {
        Pokemon *pokemon = Party_GetMonByIndex(partyMenu->args->party, selection);
        if (sub_0207496C(partyMenu->args->unk_14, pokemon, partyMenu->pokedex) == FALSE) {
            return 0;
        }
    }
    if (partyMenu->args->unk_24 == 17) {
        if (IsPokemonBannedFromBattleFrontier(partyMenu->monsDrawState[selection].species, partyMenu->monsDrawState[selection].form) == TRUE) {
            return 0;
        }
    }
    for (i = 0; i < partyMenu->args->unk_36_4; ++i) {
        if (partyMenu->args->selectedOrder[i] == selection + 1) {
            return 2;
        }
    }
    if (partyMenu->monsDrawState[selection].isEgg == TRUE || partyMenu->monsDrawState[selection].level > partyMenu->args->unk_37) {
        return 0;
    }
    return 1;
}

u8 sub_0207B418(PartyMenuStruct *partyMenu, u8 selection) {
    u8 i;

    if (partyMenu->args->unk_24 == 22) {
        if (IsPokemonBannedFromBattleFrontier(partyMenu->monsDrawState[selection].species, partyMenu->monsDrawState[selection].form) == TRUE) {
            return 0;
        }
    }
    for (i = 0; i < partyMenu->args->unk_36_4; ++i) {
        if (partyMenu->args->selectedOrder[i] == selection + 1) {
            return 2;
        }
    }
    if (partyMenu->monsDrawState[selection].isEgg == TRUE || partyMenu->monsDrawState[selection].level < partyMenu->args->unk_37) {
        return 0;
    }
    return 1;
}

u8 sub_0207B4A0(PartyMenuStruct *partyMenu, u8 selection) {
    u8 i;

    if (partyMenu->args->unk_24 == 23) {
        if (IsPokemonBannedFromBattleFrontier(partyMenu->monsDrawState[selection].species, partyMenu->monsDrawState[selection].form) == TRUE) {
            return 0;
        }
    }
    for (i = 0; i < partyMenu->args->unk_36_4; ++i) {
        if (partyMenu->args->selectedOrder[i] == selection + 1) {
            return 2;
        }
    }
    if (partyMenu->monsDrawState[selection].isEgg == TRUE) {
        return 0;
    }
    return 1;
}

void sub_0207B51C(PartyMenuStruct *partyMenu, u8 selection, BOOL a2) {
    u8 animSeqNo;
    if (selection == 6) {
        animSeqNo = Get2dSpriteCurrentAnimSeqNo(partyMenu->unk_680);
        if (a2 == FALSE) {
            animSeqNo &= 2;
        } else {
            animSeqNo = (animSeqNo & 2) + 1;
        }
        Set2dSpriteAnimSeqNo(partyMenu->unk_680, animSeqNo);
    } else if (selection == 7) {
        animSeqNo = Get2dSpriteCurrentAnimSeqNo(partyMenu->unk_684);
        if (a2 == FALSE) {
            animSeqNo &= 2;
        } else {
            animSeqNo = (animSeqNo & 2) + 1;
        }
        Set2dSpriteAnimSeqNo(partyMenu->unk_684, animSeqNo);
    } else {
        if (!a2) {
            partyMenu->monsDrawState[selection].unk_16 -= 2;
            partyMenu->monsDrawState[selection].unk_18 -= 2;
            Set2dSpriteAnimSeqNo(partyMenu->unk_660[selection], 0);
        } else {
            partyMenu->monsDrawState[selection].unk_16 += 2;
            partyMenu->monsDrawState[selection].unk_18 += 2;
            Set2dSpriteAnimSeqNo(partyMenu->unk_660[selection], 1);
        }
        sub_0207A7F4(partyMenu, selection);
    }
}

int sub_0207B5EC(u8 a0, u8 partySlot) {
    return partySlot == 0 || (a0 != 0 && partySlot == 1);
}

u8 sub_0207B600(PartyMenuStruct *partyMenu) {
    u8 result;
    PartyMenuStruct_SubC90 *r5 = &partyMenu->unk_C90;

    if (r5->unk_C == TRUE) {
        if (!sub_0207CC24(partyMenu)) {
            if (partyMenu->partyMonIndex != 7) {
                Sprite_SetAnimCtrlCurrentFrame(partyMenu->unk_684, 0);
                Set2dSpriteAnimSeqNo(partyMenu->unk_684, 0);
            }
            return r5->unk_8;
        } else {
            return 5;
        }
    }

    u32 selection = sub_0207AD6C(partyMenu);
    if (selection != -1) {
        switch (selection) {
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
        case 5: {
            if (selection >= Party_GetCount(partyMenu->args->party)) {
                break;
            }
            u32 oldSelection = partyMenu->partyMonIndex;
            partyMenu->partyMonIndex = selection;
            PlaySE(SEQ_SE_DP_SELECT);
            if (partyMenu->partyMonIndex == partyMenu->softboiledDonorSlot) {
                if (oldSelection != partyMenu->partyMonIndex) {
                    sub_0207B51C(partyMenu, oldSelection, FALSE);
                    sub_0207B51C(partyMenu, partyMenu->partyMonIndex, TRUE);
                    sub_0207A910(partyMenu, selection, partyMenu->unk_948[selection].unk_0, partyMenu->unk_948[selection].unk_1);
                }
                sub_0207FBC8(partyMenu);
                return 3;
            } else {
                if (oldSelection != partyMenu->partyMonIndex && oldSelection != partyMenu->softboiledDonorSlot) {
                    sub_0207B51C(partyMenu, oldSelection, FALSE);
                }
                if (oldSelection == partyMenu->softboiledDonorSlot) {
                    sub_0207B51C(partyMenu, partyMenu->softboiledDonorSlot, FALSE);
                }
                if (oldSelection != partyMenu->partyMonIndex) {
                    sub_0207B51C(partyMenu, partyMenu->partyMonIndex, TRUE);
                }
                sub_0207A910(partyMenu, selection, partyMenu->unk_948[selection].unk_0, partyMenu->unk_948[selection].unk_1);
                sub_0207FC1C(partyMenu);
                return 0;
            }
            break;
        }
        case 6:
            PlaySE(SEQ_SE_GS_GEARCANCEL);
            sub_0207FBC8(partyMenu);
            sub_0207CBD0(partyMenu, 9, 3, FALSE);
            return 5;
        }
    } else {
        if (gSystem.newKeys & PAD_BUTTON_A) {
            if (partyMenu->partyMonIndex >= 7) {
                PlaySE(SEQ_SE_GS_GEARCANCEL);
                sub_0207FBC8(partyMenu);
                sub_0207CBD0(partyMenu, 9, 3, FALSE);
                return 5;
            } else if (partyMenu->partyMonIndex == partyMenu->softboiledDonorSlot) {
                PlaySE(SEQ_SE_DP_SELECT);
                sub_0207FBC8(partyMenu);
                return 3;
            } else {
                PlaySE(SEQ_SE_DP_SELECT);
                sub_0207FC1C(partyMenu);
                return 0;
            }
        } else if (gSystem.newKeys & PAD_BUTTON_B) {
            PlaySE(SEQ_SE_GS_GEARCANCEL);
            sub_0207FBC8(partyMenu);
            return 3;
        } else {
            result = sub_0207A8FC(partyMenu);
        }
    }

    return result;  // UB rist
}

int sub_0207B7E0(PartyMenuStruct *partyMenu) {
    for (u8 i = 0; i < partyMenu->args->unk_36_0; ++i) {
        if (partyMenu->args->selectedOrder[i] == 0) {
            switch (partyMenu->args->unk_36_4) {
            case 2:
                sub_0207DAEC(partyMenu, msg_0300_00103, 1);
                break;
            case 3:
                sub_0207DAEC(partyMenu, msg_0300_00108, 1);
                break;
            case 4:
                sub_0207DAEC(partyMenu, msg_0300_00109, 1);
                break;
            case 5:
                sub_0207DAEC(partyMenu, msg_0300_00110, 1);
                break;
            case 6:
                sub_0207DAEC(partyMenu, msg_0300_00111, 1);
                break;
            case 0:
            case 1:
            default:
                sub_0207DAEC(partyMenu, msg_0300_00030, 1);
                break;
            }
            partyMenu->afterTextPrinterState = PARTY_MENU_STATE_23;
            PlaySE(SEQ_SE_DP_CUSTOM06);
            return PARTY_MENU_STATE_24;
        }
    }

    if (partyMenu->args->unk_14 != NULL) {
        switch (sub_02074A6C(partyMenu->args->unk_14, partyMenu->args->party, partyMenu->pokedex, partyMenu->args->selectedOrder)) {
        case 0:
            break;
        case 1: {
            String *string = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00167);
            BufferIntegerAsString(partyMenu->msgFormat, 0, sub_020290FC(partyMenu->args->unk_14, 3), 3, PRINTING_MODE_LEFT_ALIGN, TRUE);
            StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->strbuf, string);
            String_Delete(string);
            sub_0207DAEC(partyMenu, -1, 1);
            partyMenu->afterTextPrinterState = PARTY_MENU_STATE_23;
            PlaySE(SEQ_SE_DP_CUSTOM06);
            return PARTY_MENU_STATE_24;
        }
        case 2:
            sub_0207DAEC(partyMenu, msg_0300_00165, 1);
            partyMenu->afterTextPrinterState = PARTY_MENU_STATE_23;
            PlaySE(SEQ_SE_DP_CUSTOM06);
            return PARTY_MENU_STATE_24;
        case 3:
            sub_0207DAEC(partyMenu, msg_0300_00166, 1);
            partyMenu->afterTextPrinterState = PARTY_MENU_STATE_23;
            PlaySE(SEQ_SE_DP_CUSTOM06);
            return PARTY_MENU_STATE_24;
        case 4:
            break;
        case 5:
            break;
        case 6:
            sub_0207DAEC(partyMenu, msg_0300_00168, 1);
            partyMenu->afterTextPrinterState = PARTY_MENU_STATE_23;
            PlaySE(SEQ_SE_DP_CUSTOM06);
            return PARTY_MENU_STATE_24;
        case 7:
            break;
        case 8:
            sub_0207DAEC(partyMenu, msg_0300_00191, 1);
            partyMenu->afterTextPrinterState = PARTY_MENU_STATE_23;
            PlaySE(SEQ_SE_DP_CUSTOM06);
            return PARTY_MENU_STATE_24;
        }
    }

    if (partyMenu->args->unk_24 == 17) {
        switch (sub_0207BA78(partyMenu)) {
        case 0:
            break;
        case 1:
            sub_0207DAEC(partyMenu, msg_0300_00165, 1);
            partyMenu->afterTextPrinterState = PARTY_MENU_STATE_23;
            PlaySE(SEQ_SE_DP_CUSTOM06);
            return PARTY_MENU_STATE_24;
        case 2:
            sub_0207DAEC(partyMenu, msg_0300_00166, 1);
            partyMenu->afterTextPrinterState = PARTY_MENU_STATE_23;
            PlaySE(SEQ_SE_DP_CUSTOM06);
            return PARTY_MENU_STATE_24;
        }
    }

    if (partyMenu->args->unk_24 == 22) {
        switch (sub_0207BB14(partyMenu)) {
        case 0:
            break;
        case 1:
            sub_0207DAEC(partyMenu, msg_0300_00187, 1);
            partyMenu->afterTextPrinterState = PARTY_MENU_STATE_23;
            PlaySE(SEQ_SE_DP_CUSTOM06);
            return PARTY_MENU_STATE_24;
        }
    }

    if (partyMenu->args->unk_24 == 23) {
        switch (sub_0207BB88(partyMenu)) {
        case 0:
            break;
        case 1:
            sub_0207DAEC(partyMenu, msg_0300_00165, 1);
            partyMenu->afterTextPrinterState = PARTY_MENU_STATE_23;
            PlaySE(SEQ_SE_DP_CUSTOM06);
            return PARTY_MENU_STATE_24;
        }
    }

    partyMenu->args->selectedAction = 0;
    return PARTY_MENU_STATE_32;
}

u8 sub_0207BA78(PartyMenuStruct *partyMenu) {
    for (u8 i = 0; i < PARTY_SIZE - 1; ++i) {
        if (partyMenu->args->selectedOrder[i] == 0) {
            break;
        }
        for (u8 j = i + 1; j < PARTY_SIZE; ++j) {
            if (partyMenu->args->selectedOrder[j] == 0) {
                break;
            }
            if (partyMenu->monsDrawState[partyMenu->args->selectedOrder[i] - 1].species == partyMenu->monsDrawState[partyMenu->args->selectedOrder[j] - 1].species) {
                return 1;
            }
            if (partyMenu->monsDrawState[partyMenu->args->selectedOrder[i] - 1].heldItem != ITEM_NONE && partyMenu->monsDrawState[partyMenu->args->selectedOrder[i] - 1].heldItem == partyMenu->monsDrawState[partyMenu->args->selectedOrder[j] - 1].heldItem) {
                return 2;
            }
        }
    }

    return 0;
}

u8 sub_0207BB14(PartyMenuStruct *partyMenu) {
    for (u8 i = 0; i < PARTY_SIZE - 1; ++i) {
        if (partyMenu->args->selectedOrder[i] == 0) {
            break;
        }
        for (u8 j = i + 1; j < PARTY_SIZE; ++j) {
            if (partyMenu->args->selectedOrder[j] == 0) {
                break;
            }
            if (partyMenu->monsDrawState[partyMenu->args->selectedOrder[i] - 1].species != partyMenu->monsDrawState[partyMenu->args->selectedOrder[j] - 1].species) {
                return 1;
            }
        }
    }

    return 0;
}

u8 sub_0207BB88(PartyMenuStruct *partyMenu) {
    for (u8 i = 0; i < PARTY_SIZE - 1; ++i) {
        if (partyMenu->args->selectedOrder[i] == 0) {
            break;
        }
        for (u8 j = i + 1; j < PARTY_SIZE; ++j) {
            if (partyMenu->args->selectedOrder[j] == 0) {
                break;
            }
            if (partyMenu->monsDrawState[partyMenu->args->selectedOrder[i] - 1].species == partyMenu->monsDrawState[partyMenu->args->selectedOrder[j] - 1].species) {
                return 1;
            }
        }
    }

    return 0;
}

void sub_0207BBFC(u8 a0, s16 *px, s16 *py) {
    *px = _021012B0[a0][0] * 8 + 20;
    *py = _021012B0[a0][1] * 8 + 20;
}

BOOL sub_0207BC1C(PartyMenuStruct *partyMenu, int *pState) {
    PartyMenuStruct_SubC90_UnkFunc func = sub_0207E778(partyMenu, partyMenu->unk_824);
    switch ((int)func) {
    case -2:
        sub_02079224(partyMenu, FALSE);
        ClearFrameAndWindow2(&partyMenu->unk_214, TRUE);
        sub_0207CB20(partyMenu);
        sub_0207CB90();
        if (partyMenu->args->unk_24 == 2 || partyMenu->args->unk_24 == 17 || partyMenu->args->unk_24 == 22 || partyMenu->args->unk_24 == 23) {
            sub_0207DAC4(partyMenu, 35, 1);
        } else if (partyMenu->args->unk_24 == 21) {
            sub_0207DAC4(partyMenu, 184, 1);
        } else {
            sub_0207DAC4(partyMenu, 29, 1);
        }
        thunk_Sprite_SetPalIndex(partyMenu->unk_678, 0);
        return TRUE;
    case -1:
        break;
    default:
        func(partyMenu, (int *)pState);
        break;
    }

    return FALSE;
}

u8 sub_0207BCC0(u16 move) {
    for (u8 i = 0; i < 16; ++i) {
        if (move == _021013C4[i]) {
            return i + 16;
        }
    }
    return 0xFF;
}

int PartyMenu_SoftboiledTryTargetCheck(PartyMenuStruct *partyMenu) {
    switch (PartyMenu_SoftboiledTargetCheck(partyMenu)) {
    case 0:
        PlaySE(SEQ_SE_DP_KAIFUKU);
        thunk_Sprite_SetPalIndex(partyMenu->unk_678, 1);
        if (partyMenu->monsDrawState[partyMenu->partyMonIndex].maxHp - partyMenu->monsDrawState[partyMenu->partyMonIndex].hp < partyMenu->unk_C68) {
            partyMenu->unk_C68 = partyMenu->monsDrawState[partyMenu->partyMonIndex].maxHp - partyMenu->monsDrawState[partyMenu->partyMonIndex].hp;
        }
        partyMenu->subtaskState = 2;
        partyMenu->unk_C6C = 0;
        return PARTY_MENU_STATE_30;
    case 1:
        PlaySE(SEQ_SE_DP_SELECT);
        partyMenu->subtaskState = 1;
        return PARTY_MENU_STATE_24;
    case 2:
        PlaySE(SEQ_SE_DP_CUSTOM06);
        return PARTY_MENU_STATE_30;
    }

    return PARTY_MENU_STATE_30;
}

int PartyMenu_Subtask_Softboiled(PartyMenuStruct *partyMenu) {
    PartyMenuStruct_SubC90 *r5 = &partyMenu->unk_C90;
    if (r5->unk_C == TRUE) {
        if (!sub_0207CC24(partyMenu)) {
            if (partyMenu->partyMonIndex != 7) {
                Sprite_SetAnimCtrlCurrentFrame(partyMenu->unk_684, 0);
                Set2dSpriteAnimSeqNo(partyMenu->unk_684, 0);
            }
            return r5->unk_8;
        } else {
            return PARTY_MENU_STATE_30;
        }
    }

    switch (partyMenu->subtaskState) {
    case 0: {
        u32 selection = sub_0207AD6C(partyMenu);
        if (selection != -1) {
            switch (selection) {
            case 0:
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
                if (selection >= Party_GetCount(partyMenu->args->party)) {
                    break;
                }
                sub_0207A910(partyMenu, selection, partyMenu->unk_948[selection].unk_0, partyMenu->unk_948[selection].unk_1);
                return PartyMenu_SoftboiledTryTargetCheck(partyMenu);
            case 6:
                PlaySE(SEQ_SE_GS_GEARCANCEL);
                sub_0207FBC8(partyMenu);
                sub_0207CBD0(partyMenu, 9, 1, 0);
                return PARTY_MENU_STATE_30;
            }
        } else {
            if (gSystem.newKeys & PAD_BUTTON_A) {
                if (partyMenu->partyMonIndex >= 6) {
                    PlaySE(SEQ_SE_GS_GEARCANCEL);
                    sub_0207FBC8(partyMenu);
                    sub_0207CBD0(partyMenu, 9, 1, 0);
                    return PARTY_MENU_STATE_30;
                } else {
                    return PartyMenu_SoftboiledTryTargetCheck(partyMenu);
                }
            } else if (gSystem.newKeys & PAD_BUTTON_B) {
                PlaySE(SEQ_SE_GS_GEARCANCEL);
                sub_0207FBC8(partyMenu);
                return PARTY_MENU_STATE_1;
            } else {
                sub_0207A8FC(partyMenu);
            }
        }
        break;
    }
    case 1:
        ClearFrameAndWindow2(&partyMenu->unk_224, TRUE);
        thunk_Sprite_SetPalIndex(partyMenu->unk_678, 0);
        sub_0207DAC4(partyMenu, 37, 1);
        partyMenu->subtaskState = 0;
        break;
    case 2:
        if (PartyMenu_SoftboiledHPTransferStep(partyMenu, partyMenu->softboiledDonorSlot, -1) == TRUE) {
            PlaySE(SEQ_SE_DP_KAIFUKU);
            partyMenu->subtaskState = 3;
            partyMenu->unk_C6C = 0;
        }
        break;
    case 3:
        if (PartyMenu_SoftboiledHPTransferStep(partyMenu, partyMenu->partyMonIndex, 1) == TRUE) {
            Pokemon *pokemon = Party_GetMonByIndex(partyMenu->args->party, partyMenu->partyMonIndex);
            String *string = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00065);
            BufferBoxMonNickname(partyMenu->msgFormat, 0, Mon_GetBoxMon(pokemon));
            BufferIntegerAsString(partyMenu->msgFormat, 1, partyMenu->unk_C6C, 3, PRINTING_MODE_LEFT_ALIGN, TRUE);
            StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->strbuf, string);
            String_Delete(string);
            sub_0207DAEC(partyMenu, -1, 1);
            partyMenu->subtaskState = 4;
            partyMenu->afterTextPrinterState = PARTY_MENU_STATE_30;
            return PARTY_MENU_STATE_24;
        }
        break;
    case 4:
        ClearFrameAndWindow2(&partyMenu->unk_224, TRUE);
        thunk_Sprite_SetPalIndex(partyMenu->unk_678, 0);
        sub_0207FBC8(partyMenu);
        return PARTY_MENU_STATE_1;
    }

    return PARTY_MENU_STATE_30;
}

u8 PartyMenu_SoftboiledTargetCheck(PartyMenuStruct *partyMenu) {
    if (partyMenu->monsDrawState[partyMenu->partyMonIndex].isEgg) {
        return 2;
    }
    if (partyMenu->partyMonIndex == partyMenu->softboiledDonorSlot || partyMenu->monsDrawState[partyMenu->partyMonIndex].hp == 0 || partyMenu->monsDrawState[partyMenu->partyMonIndex].hp == partyMenu->monsDrawState[partyMenu->partyMonIndex].maxHp) {
        thunk_Sprite_SetPalIndex(partyMenu->unk_678, 1);
        sub_0207DAEC(partyMenu, msg_0300_00120, 1);
        partyMenu->subtaskState = 1;
        partyMenu->afterTextPrinterState = PARTY_MENU_STATE_30;
        return 1;
    }
    return 0;
}

BOOL PartyMenu_SoftboiledHPTransferStep(PartyMenuStruct *partyMenu, u8 partySlot, s8 delta) {
    partyMenu->monsDrawState[partySlot].hp += delta;
    ++partyMenu->unk_C6C;
    sub_0207D480(partyMenu, partySlot);
    FillWindowPixelBuffer(&partyMenu->unk_004[partySlot * 5 + 3], 0);
    sub_0207D440(partyMenu, partySlot);
    sub_0207D4EC(partyMenu, partySlot);
    if (partyMenu->unk_C68 == partyMenu->unk_C6C || partyMenu->monsDrawState[partySlot].hp == partyMenu->monsDrawState[partySlot].maxHp) {
        Pokemon *mon = Party_GetMonByIndex(partyMenu->args->party, partySlot);
        u32 hp = partyMenu->monsDrawState[partySlot].hp;
        SetMonData(mon, MON_DATA_HP, &hp);
        return TRUE;
    }

    return FALSE;
}

u8 sub_0207C0DC(PartyMenuStruct *partyMenu) {
    PartyMenuStruct_SubC90 *r5 = &partyMenu->unk_C90;
    if (r5->unk_C == TRUE) {
        if (sub_0207CC24(partyMenu) == FALSE) {
            return r5->unk_8;
        } else {
            return 5;
        }
    }

    u32 selection = sub_0207AD6C(partyMenu);
    if (selection != -1) {
        switch (selection) {
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
            if (selection < Party_GetCount(partyMenu->args->party)) {
                sub_0207A910(partyMenu, selection, partyMenu->unk_948[selection].unk_0, partyMenu->unk_948[selection].unk_1);
                partyMenu->partyMonIndex = selection;
                if (!partyMenu->monsDrawState[partyMenu->partyMonIndex].isEgg) {
                    PlaySE(SEQ_SE_DP_SELECT);
                    return 0;
                } else {
                    PlaySE(SEQ_SE_DP_CUSTOM06);
                    return 5;
                }
            }
            break;
        case 6:
            if (!partyMenu->unk_C63_7) {
                PlaySE(SEQ_SE_GS_GEARCANCEL);
                sub_0207A910(partyMenu, 7, partyMenu->unk_948[7].unk_0, partyMenu->unk_948[7].unk_1);
                sub_0207CBD0(partyMenu, 9, 3, 1);
                return 5;
            }
        }
    } else if (gSystem.newKeys & PAD_BUTTON_A) {
        if (partyMenu->partyMonIndex == 7) {
            if (!partyMenu->unk_C63_7) {
                PlaySE(SEQ_SE_GS_GEARCANCEL);
                sub_0207CBD0(partyMenu, 9, 3, 0);
                return 5;
            }
        } else {
            if (!partyMenu->monsDrawState[partyMenu->partyMonIndex].isEgg) {
                PlaySE(SEQ_SE_DP_SELECT);
                return 0;
            } else {
                PlaySE(SEQ_SE_DP_CUSTOM06);
            }
        }
        return 5;
    }
    if (gSystem.newKeys & PAD_BUTTON_B) {
        if (!partyMenu->unk_C63_7) {
            PlaySE(SEQ_SE_GS_GEARCANCEL);
            if (partyMenu->partyMonIndex == 7) {
                sub_0207CBD0(partyMenu, 9, 3, 0);
            } else {
                sub_0207A910(partyMenu, 7, partyMenu->unk_948[7].unk_0, partyMenu->unk_948[7].unk_1);
                sub_0207CBD0(partyMenu, 9, 3, 1);
            }
            return 5;
        } else {
            return 5;
        }
    }

    return sub_0207A8FC(partyMenu);
}

int sub_0207C288(PartyMenuStruct *partyMenu) {
    ItemData *itemData = LoadItemDataOrGfx(partyMenu->args->itemId, ITEMNARC_PARAM, HEAP_ID_PARTY_MENU);

    if (partyMenu->args->itemId == ITEM_GRACIDEA && Mon_CanUseGracidea(Party_GetMonByIndex(partyMenu->args->party, partyMenu->partyMonIndex)) == TRUE) {
        partyMenu->args->species = 1;
        FreeToHeap(itemData);
        sub_0207CB54(partyMenu);
        return PARTY_MENU_STATE_31;
    }

    if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_PP_UP) || GetItemAttr_PreloadedItemData(itemData, ITEMATTR_PP_MAX)) {
        FreeToHeap(itemData);
        sub_02082654(partyMenu, 0);
        return PARTY_MENU_STATE_6;
    }
    if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_PP_RESTORE) && !GetItemAttr_PreloadedItemData(itemData, ITEMATTR_PP_RESTORE_ALL)) {
        FreeToHeap(itemData);
        sub_02082654(partyMenu, 1);
        return PARTY_MENU_STATE_6;
    }

    if (CanUseItemOnMonInParty(partyMenu->args->party, partyMenu->args->itemId, partyMenu->partyMonIndex, 0, HEAP_ID_PARTY_MENU) == TRUE) {
        Bag_TakeItem(partyMenu->args->bag, partyMenu->args->itemId, 1, HEAP_ID_PARTY_MENU);
        if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_EVOLVE)) {
            Pokemon *mon = Party_GetMonByIndex(partyMenu->args->party, partyMenu->partyMonIndex);
            partyMenu->args->species = GetMonEvolution(NULL, mon, 3, partyMenu->args->itemId, &partyMenu->args->unk_40);
            partyMenu->args->selectedAction = 8;
            FreeToHeap(itemData);
            return PARTY_MENU_STATE_32;
        } else {
            sub_020812E8(partyMenu);
        }
    } else {
        sub_0207DAEC(partyMenu, msg_0300_00102, 1);
        partyMenu->partyMonIndex = 7;
        partyMenu->unk_C54 = sub_02081378;
    }
    FreeToHeap(itemData);
    return PARTY_MENU_STATE_5;
}

u8 sub_0207C3D0(PartyMenuStruct *partyMenu) {
    if (partyMenu->monsDrawState[partyMenu->partyMonIndex].heldItem == ITEM_NONE) {
        return 0;
    } else if (ItemIdIsMail(partyMenu->monsDrawState[partyMenu->partyMonIndex].heldItem) == TRUE) {
        return 2;
    } else {
        return 1;
    }
}

int sub_0207C400(PartyMenuStruct *partyMenu) {
    int result = -1;
    Pokemon *mon = Party_GetMonByIndex(partyMenu->args->party, partyMenu->partyMonIndex);
    FieldSystem *fieldSystem = partyMenu->args->fieldSystem;

    if (partyMenu->args->itemId == ITEM_GRISEOUS_ORB) {
        if (GetMonData(mon, MON_DATA_SPECIES, NULL) != SPECIES_GIRATINA) {
            ReadMsgDataIntoString(partyMenu->msgData, msg_0300_00189, partyMenu->unk_7CC);
            BufferBoxMonNickname(partyMenu->msgFormat, 0, Mon_GetBoxMon(mon));
            BufferItemNameWithIndefArticle(partyMenu->msgFormat, 1, partyMenu->args->itemId);
            StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->strbuf, partyMenu->unk_7CC);
            result = PARTY_MENU_STATE_11;
        } else if (fieldSystem != NULL) {
            if (fieldSystem->location->mapId == MAP_UNION) {
                ReadMsgDataIntoString(partyMenu->msgData, msg_0300_00190, partyMenu->unk_7CC);
                BufferItemName(partyMenu->msgFormat, 0, partyMenu->args->itemId);
                StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->strbuf, partyMenu->unk_7CC);
                result = PARTY_MENU_STATE_11;
            }
        }
    }

    if (result == -1) {
        switch (sub_0207C3D0(partyMenu)) {
        case 0:
            if (ItemIdIsMail(partyMenu->args->itemId) == TRUE) {
                partyMenu->args->selectedAction = 6;
                return PARTY_MENU_STATE_32;
            } else {
                s32 sp0;
                result = sub_0207C5D4(partyMenu, mon, &sp0);
                ReadMsgDataIntoString(partyMenu->msgData, msg_0300_00107, partyMenu->unk_7CC);
                BufferBoxMonNickname(partyMenu->msgFormat, 0, Mon_GetBoxMon(mon));
                BufferItemName(partyMenu->msgFormat, 1, partyMenu->args->itemId);
                StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->strbuf, partyMenu->unk_7CC);
            }
            break;
        case 1:
            ReadMsgDataIntoString(partyMenu->msgData, msg_0300_00079, partyMenu->unk_7CC);
            BufferBoxMonNickname(partyMenu->msgFormat, 0, Mon_GetBoxMon(mon));
            BufferItemNameWithIndefArticle(partyMenu->msgFormat, 1, partyMenu->monsDrawState[partyMenu->partyMonIndex].heldItem);
            StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->strbuf, partyMenu->unk_7CC);
            result = PARTY_MENU_STATE_9;
            break;
        case 2:
            ReadMsgDataIntoString(partyMenu->msgData, msg_0300_00078, partyMenu->strbuf);
            result = PARTY_MENU_STATE_11;
            break;
        }
    }

    DrawFrameAndWindow2(&partyMenu->unk_224, TRUE, 0x02A, 15);
    FillWindowPixelBuffer(&partyMenu->unk_224, 15);
    sub_0207DB30(partyMenu);
    return result;
}

int sub_0207C5D4(PartyMenuStruct *partyMenu, Pokemon *mon, s32 *transformResult) {
    u32 itemToBeHeld = partyMenu->args->itemId;
    Bag_TakeItem(partyMenu->args->bag, partyMenu->args->itemId, 1, HEAP_ID_PARTY_MENU);
    SetMonData(mon, MON_DATA_HELD_ITEM, &itemToBeHeld);
    Pokemon_UpdateArceusForm(mon);
    *transformResult = Mon_UpdateGiratinaForm(mon);
    partyMenu->monsDrawState[partyMenu->partyMonIndex].heldItem = partyMenu->args->itemId;
    sub_0207F004(partyMenu, partyMenu->partyMonIndex, partyMenu->monsDrawState[partyMenu->partyMonIndex].heldItem);
    if (itemToBeHeld == ITEM_GRISEOUS_ORB && *transformResult != -1) {
        return PARTY_MENU_STATE_12;
    } else {
        return PARTY_MENU_STATE_11;
    }
}

void sub_0207C658(PartyMenuStruct *partyMenu, Pokemon *mon, u32 oldItemId, u32 newItemId, ...) {
    va_list va_args;
    va_start(va_args, newItemId);

    Bag_AddItem(partyMenu->args->bag, oldItemId, 1, HEAP_ID_PARTY_MENU);
    SetMonData(mon, MON_DATA_HELD_ITEM, &newItemId);
    Pokemon_UpdateArceusForm(mon);
    Mon_UpdateGiratinaForm(mon);
    partyMenu->monsDrawState[partyMenu->partyMonIndex].heldItem = newItemId;
    sub_0207F004(partyMenu, partyMenu->partyMonIndex, partyMenu->monsDrawState[partyMenu->partyMonIndex].heldItem);

    va_end(va_args);
}

int sub_0207C6BC(PartyMenuStruct *partyMenu) {
    if (TextPrinterCheckActive(partyMenu->textPrinterId) == FALSE) {
        return sub_0207C8B4(partyMenu);
    } else {
        return PARTY_MENU_STATE_11;
    }
}
