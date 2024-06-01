#include "global.h"
#include "party_menu.h"
#include "font.h"
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
void sub_02079758(BgConfig *bgConfig);
void sub_02079A14(PartyMenuStruct *partyMenu, NARC *narc);
PartyMenuStruct *sub_02079BD8(OVY_MANAGER *manager);
void sub_02079CE4(PartyMenuStruct *partyMenu);
void sub_02079D38(PartyMenuStruct *partyMenu);
void sub_0207A22C(PartyMenuStruct *partyMenu);
void sub_0207A89C(PartyMenuStruct *partyMenu);
void sub_0207AC20(PartyMenuStruct *partyMenu);
void sub_0207B51C(PartyMenuStruct *partyMenu, u8 a1, int a2);
int sub_0207B600(PartyMenuStruct *partyMenu);
BOOL sub_0207BC1C(PartyMenuStruct *partyMenu, int *pState);
int sub_0207BD78(PartyMenuStruct *partyMenu);
int sub_0207C400(PartyMenuStruct *partyMenu);
int sub_0207C6BC(PartyMenuStruct *partyMenu);
int sub_0207C6DC(PartyMenuStruct *partyMenu);
int sub_0207C70C(PartyMenuStruct *partyMenu);
int sub_0207C728(PartyMenuStruct *partyMenu);
int sub_0207C74C(PartyMenuStruct *partyMenu);
int sub_0207C908(PartyMenuStruct *partyMenu);

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
    sub_02079758(partyMenu->unk_000);
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
    if (partyMenu->unk_654->unk_24 == 5 || partyMenu->unk_654->unk_24 == 16) {
        if (!sub_020817C4(partyMenu->unk_654->itemId)) {
            sub_0207DAC4(partyMenu, 33, 1);
        }
    } else if (partyMenu->unk_654->unk_24 == 6) {
        sub_0207DAC4(partyMenu, 34, 1);
    } else if (partyMenu->unk_654->unk_24 == 9 || partyMenu->unk_654->unk_24 == 14) {
        sub_0207DAC4(partyMenu, 32, 1);
    } else if (partyMenu->unk_654->unk_24 == 7 || partyMenu->unk_654->unk_24 == 8 || partyMenu->unk_654->unk_24 == 11 || partyMenu->unk_654->unk_24 == 12) {
        thunk_Sprite_SetPalIndex(partyMenu->unk_678, 1);
    } else if (partyMenu->unk_654->unk_24 == 2 || partyMenu->unk_654->unk_24 == 17) {
        sub_0207DAC4(partyMenu, 35, 1);
    } else if (partyMenu->unk_654->unk_24 == 15) {
        sub_0207DAC4(partyMenu, 35, 1);
    } else if (partyMenu->unk_654->unk_24 == 21) {
        sub_0207DAC4(partyMenu, 184, 1);
    } else if (partyMenu->unk_654->unk_24 == 22) {
        sub_0207DAC4(partyMenu, 35, 1);
    } else if (partyMenu->unk_654->unk_24 == 23) {
        sub_0207DAC4(partyMenu, 35, 1);
    } else if (partyMenu->unk_654->unk_24 != 10) {
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
            partyMenu->unk_654->partySlot = partyMenu->partyMonIndex;
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
