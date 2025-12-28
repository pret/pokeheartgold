#include "application/pokedex/pokedex_internal.h"

#include "font.h"
#include "sound_02004A44.h"
#include "unk_02005D10.h"
#include "unk_0200FA24.h"
#include "unk_020210A0.h"
#include "unk_0208805C.h"

int ov18_021E8C30(PokedexAppData *pokedexApp);
int ov18_021E8D38(PokedexAppData *pokedexApp);
int ov18_021E8DB0(PokedexAppData *pokedexApp);
int ov18_021E8DC8(PokedexAppData *pokedexApp);
int ov18_021E8DE8(PokedexAppData *pokedexApp);
int ov18_021E8E8C(PokedexAppData *pokedexApp);
int ov18_021E8ECC(PokedexAppData *pokedexApp);
int ov18_021E8FCC(PokedexAppData *pokedexApp);
int ov18_021E9070(PokedexAppData *pokedexApp);
int ov18_021E918C(PokedexAppData *pokedexApp);
int ov18_021E92AC(PokedexAppData *pokedexApp);
int ov18_021E93D8(PokedexAppData *pokedexApp);
int ov18_021E9600(PokedexAppData *pokedexApp);
int ov18_021E96F4(PokedexAppData *pokedexApp);
int ov18_021E9820(PokedexAppData *pokedexApp);
int ov18_021E9940(PokedexAppData *pokedexApp);
int ov18_021E99C8(PokedexAppData *pokedexApp);
int ov18_021E9A4C(PokedexAppData *pokedexApp);
int ov18_021E9BE0(PokedexAppData *pokedexApp);
int ov18_021E9CD8(PokedexAppData *pokedexApp);
int ov18_021E9D70(PokedexAppData *pokedexApp);
int ov18_021E9F28(PokedexAppData *pokedexApp);
int ov18_021EA36C(PokedexAppData *pokedexApp);
int ov18_021EA384(PokedexAppData *pokedexApp);
int ov18_021EA430(PokedexAppData *pokedexApp);
int ov18_021EA5A8(PokedexAppData *pokedexApp);
int ov18_021EA688(PokedexAppData *pokedexApp);
int ov18_021EA760(PokedexAppData *pokedexApp);
int ov18_021EA838(PokedexAppData *pokedexApp);
int ov18_021EA854(PokedexAppData *pokedexApp);
int ov18_021EA95C(PokedexAppData *pokedexApp);
int ov18_021EA96C(PokedexAppData *pokedexApp);
int ov18_021EA988(PokedexAppData *pokedexApp);
int ov18_021EAA20(PokedexAppData *pokedexApp);
int ov18_021EAA30(PokedexAppData *pokedexApp);
int ov18_021EAA58(PokedexAppData *pokedexApp);
int ov18_021EAB7C(PokedexAppData *pokedexApp);
int ov18_021EAB8C(PokedexAppData *pokedexApp);
int ov18_021EABB4(PokedexAppData *pokedexApp);
int ov18_021EAE44(PokedexAppData *pokedexApp);
int ov18_021EAE54(PokedexAppData *pokedexApp);
int ov18_021EAF18(PokedexAppData *pokedexApp);
int ov18_021EAFDC(PokedexAppData *pokedexApp);
int ov18_021EB034(PokedexAppData *pokedexApp);
int ov18_021EB08C(PokedexAppData *pokedexApp);
int ov18_021EB0B0(PokedexAppData *pokedexApp);
int ov18_021EB270(PokedexAppData *pokedexApp);
int ov18_021EB280(PokedexAppData *pokedexApp);
int ov18_021EB348(PokedexAppData *pokedexApp);
int ov18_021EB41C(PokedexAppData *pokedexApp);
int ov18_021EB474(PokedexAppData *pokedexApp);
int ov18_021EB4CC(PokedexAppData *pokedexApp);
int ov18_021EB4E8(PokedexAppData *pokedexApp);
int ov18_021EB580(PokedexAppData *pokedexApp);
int ov18_021EB590(PokedexAppData *pokedexApp);
int ov18_021EB5AC(PokedexAppData *pokedexApp);
int ov18_021EB644(PokedexAppData *pokedexApp);
int ov18_021EB654(PokedexAppData *pokedexApp);
int ov18_021EB838(PokedexAppData *pokedexApp);
int ov18_021EB988(PokedexAppData *pokedexApp);
int ov18_021EBAC4(PokedexAppData *pokedexApp);
int ov18_021EBB68(PokedexAppData *pokedexApp);
int ov18_021EBC08(PokedexAppData *pokedexApp);
int ov18_021EBD28(PokedexAppData *pokedexApp);
int ov18_021EBEC8(PokedexAppData *pokedexApp);
int ov18_021EBFC0(PokedexAppData *pokedexApp);
int ov18_021EC280(PokedexAppData *pokedexApp);
int ov18_021EC2C4(PokedexAppData *pokedexApp);
int ov18_021EC3E8(PokedexAppData *pokedexApp);
int ov18_021EC4FC(PokedexAppData *pokedexApp);
int ov18_021EC7AC(PokedexAppData *pokedexApp);
int ov18_021EC88C(PokedexAppData *pokedexApp);
int ov18_021EC95C(PokedexAppData *pokedexApp);
int ov18_021ECA2C(PokedexAppData *pokedexApp);
int ov18_021ECA90(PokedexAppData *pokedexApp);
int ov18_021ECAEC(PokedexAppData *pokedexApp);
int ov18_021ECC00(PokedexAppData *pokedexApp);
int ov18_021ECCB0(PokedexAppData *pokedexApp);
int ov18_021ECDC8(PokedexAppData *pokedexApp);
int ov18_021ECEA0(PokedexAppData *pokedexApp);
int ov18_021ECF58(PokedexAppData *pokedexApp);
int ov18_021ED15C(PokedexAppData *pokedexApp);
int ov18_021ED224(PokedexAppData *pokedexApp);
int ov18_021ED304(PokedexAppData *pokedexApp);
int ov18_021ED3E8(PokedexAppData *pokedexApp);
int ov18_021ED450(PokedexAppData *pokedexApp);
int ov18_021ED4B4(PokedexAppData *pokedexApp);
int ov18_021ED5FC(PokedexAppData *pokedexApp);
int ov18_021ED7BC(PokedexAppData *pokedexApp);
int ov18_021ED8E4(PokedexAppData *pokedexApp);
int ov18_021ED98C(PokedexAppData *pokedexApp);
int ov18_021EDA60(PokedexAppData *pokedexApp);
int ov18_021EDB28(PokedexAppData *pokedexApp);

static int (*const ov18_021F9C3C[])(PokedexAppData *pokedexApp) = {
    ov18_021E8C30,
    ov18_021E8D38,
    ov18_021E8DB0,
    ov18_021E8DC8,
    ov18_021E8DE8,
    ov18_021E8E8C,
    ov18_021E8ECC,
    ov18_021E8FCC,
    ov18_021E9070,
    ov18_021E918C,
    ov18_021E92AC,
    ov18_021E93D8,
    ov18_021E9600,
    ov18_021E96F4,
    ov18_021E9820,
    ov18_021E9940,
    ov18_021E99C8,
    ov18_021E9A4C,
    ov18_021E9BE0,
    ov18_021EA430,
    ov18_021EA5A8,
    ov18_021E9CD8,
    ov18_021E9D70,
    ov18_021E9F28,
    ov18_021EA36C,
    ov18_021EA384,
    ov18_021EA688,
    ov18_021EA760,
    ov18_021EA838,
    ov18_021EA854,
    ov18_021EA95C,
    ov18_021EA96C,
    ov18_021EA988,
    ov18_021EAA20,
    ov18_021EAA30,
    ov18_021EAA58,
    ov18_021EAB7C,
    ov18_021EAB8C,
    ov18_021EABB4,
    ov18_021EAE44,
    ov18_021EAE54,
    ov18_021EAF18,
    ov18_021EAFDC,
    ov18_021EB034,
    ov18_021EB08C,
    ov18_021EB0B0,
    ov18_021EB270,
    ov18_021EB280,
    ov18_021EB348,
    ov18_021EB41C,
    ov18_021EB474,
    ov18_021EB4CC,
    ov18_021EB4E8,
    ov18_021EB580,
    ov18_021EB590,
    ov18_021EB5AC,
    ov18_021EB644,
    ov18_021EB654,
    ov18_021EB838,
    ov18_021EB988,
    ov18_021EBAC4,
    ov18_021EBB68,
    ov18_021EBC08,
    ov18_021EBD28,
    ov18_021EBEC8,
    ov18_021EBFC0,
    ov18_021EC280,
    ov18_021EC2C4,
    ov18_021EC3E8,
    ov18_021EC4FC,
    ov18_021EC7AC,
    ov18_021EC88C,
    ov18_021EC95C,
    ov18_021ECA2C,
    ov18_021ECA90,
    ov18_021ECAEC,
    ov18_021ECC00,
    ov18_021ECCB0,
    ov18_021ECDC8,
    ov18_021ECEA0,
    ov18_021ECF58,
    ov18_021ED15C,
    ov18_021ED224,
    ov18_021ED304,
    ov18_021ED3E8,
    ov18_021ED450,
    ov18_021ED4B4,
    ov18_021ED5FC,
    ov18_021ED7BC,
    ov18_021ED8E4,
    ov18_021ED98C,
    ov18_021EDA60,
    ov18_021EDB28,
};

BOOL ov18_021E8BF4(PokedexAppData *pokedexApp, int *pState) {
    *pState = ov18_021F9C3C[*pState](pokedexApp);
    if (*pState == NELEMS(ov18_021F9C3C)) {
        return FALSE;
    }

    sub_02019934(pokedexApp->unk_0008);
    ov18_021F1004(pokedexApp);
    SpriteSystem_DrawSprites(pokedexApp->unk_066C);
    return TRUE;
}

int ov18_021E8C30(PokedexAppData *pokedexApp) {
    Main_SetVBlankIntrCB(NULL, NULL);
    HBlankInterruptDisable();
    GfGfx_EngineASetPlanes(GX_PLANEMASK_NONE);
    GfGfx_EngineBSetPlanes(GX_PLANEMASK_NONE);
    G2_BlendNone();
    G2S_BlendNone();
    sub_020210BC();
    sub_02021148(4);
    GX_SetDispSelect(GX_DISP_SELECT_SUB_MAIN);
    SetKeyRepeatTimers(4, 8);
    ov18_021E62A8(pokedexApp);
    ov18_021E8410(pokedexApp);
    sub_020880CC(0, HEAP_ID_37);
    FontID_Alloc(4, HEAP_ID_37);
    pokedexApp->gfxNarc = NARC_New(NARC_graphic_zukan_gra, HEAP_ID_37);
    ov18_021E6FFC(pokedexApp);
    ov18_021F7ED4(pokedexApp, pokedexApp->unk_1858, 0, 26, 17, 17, 0, 152, 0, 152, 8, 14);
    ov18_021F8884(pokedexApp, 1);
    ov18_021EDDB4(pokedexApp);
    ov18_021E5C74();
    ov18_021E5C84(pokedexApp);
    ov18_021E6308(pokedexApp);
    ov18_021E61A4(pokedexApp);
    ov18_021E6244(pokedexApp);
    ov18_021F0FC8(pokedexApp);
    ov18_021E6174();
    Sound_SetSceneAndPlayBGM(54, 0, 0);
    Main_SetVBlankIntrCB(ov18_021E5C40, pokedexApp);
    return pokedexApp->unk_085C;
}

int ov18_021E8D38(PokedexAppData *pokedexApp) {
    Main_SetVBlankIntrCB(NULL, NULL);
    ov18_021EE388(pokedexApp);
    ov18_021F0FEC(pokedexApp);
    ov18_021E6280(pokedexApp);
    ov18_021E6204(pokedexApp);
    ov18_021E6540(pokedexApp);
    ov18_021E5F58(pokedexApp);
    NARC_Delete(pokedexApp->gfxNarc);
    FontID_Release(4);
    ov18_021E84EC(pokedexApp);
    ov18_021E62E8(pokedexApp);
    sub_02021238();
    G2_BlendNone();
    G2S_BlendNone();
    GfGfx_EngineASetPlanes(GX_PLANEMASK_NONE);
    GfGfx_EngineBSetPlanes(GX_PLANEMASK_NONE);
    return pokedexApp->unk_085C;
}

int ov18_021E8DB0(PokedexAppData *pokedexApp) {
    if (IsPaletteFadeFinished() == TRUE) {
        return pokedexApp->unk_0860;
    }

    return 2;
}

int ov18_021E8DC8(PokedexAppData *pokedexApp) {
    if (PaletteData_GetSelectedBuffersBitmask(pokedexApp->paletteData) == 0) {
        return pokedexApp->unk_085C;
    }

    return 3;
}

int ov18_021E8DE8(PokedexAppData *pokedexApp) {
    PokedexAppData_UnkSub0868_State04 *r4 = &pokedexApp->unk_0868.state_04;
    switch (r4->unk_5) {
    case 0:
        BgTilemapRectChangePalette(pokedexApp->bgConfig, r4->unk_4, r4->unk_0, r4->unk_1, r4->unk_2, r4->unk_3, r4->unk_7_4);
        ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, r4->unk_4);
        ++r4->unk_5;
        break;
    case 1:
        ++r4->unk_6;
        if (r4->unk_6 == 4) {
            BgTilemapRectChangePalette(pokedexApp->bgConfig, r4->unk_4, r4->unk_0, r4->unk_1, r4->unk_2, r4->unk_3, r4->unk_7_0);
            ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, r4->unk_4);
            r4->unk_6 = 0;
            ++r4->unk_5;
        }
        break;
    case 2:
        MI_CpuClear8(r4, sizeof(pokedexApp->unk_0868));
        return pokedexApp->unk_085C;
    }

    return 4;
}

int ov18_021E8E8C(PokedexAppData *pokedexApp) {
    pokedexApp->unk_185B = 0;
    ov18_021E67C8(pokedexApp, 0);
    PaletteData_BeginPaletteFade(pokedexApp->paletteData, 0xF, 0xFFFF, -127, 0, 0, RGB_BLACK);
    pokedexApp->unk_0860 = 6;
    return 2;
}

int ov18_021E8ECC(PokedexAppData *pokedexApp) {
    switch (ov18_021F6B00(pokedexApp)) {
    case 0:
        PlaySE(SEQ_SE_GS_BUTTON01);
        return ov18_021EDBB8(pokedexApp, 8, 16, 9);
    case 1:
        PlaySE(SEQ_SE_GS_ZKN04);
        return ov18_021EDBB8(pokedexApp, 0, 8, 10);
    case 2:
        if (pokedexApp->unk_0864 == 0) {
            MenuInputStateMgr_SetState(pokedexApp->args->menuInputStatePtr, MENU_INPUT_STATE_TOUCH);
        } else {
            MenuInputStateMgr_SetState(pokedexApp->args->menuInputStatePtr, MENU_INPUT_STATE_BUTTONS);
        }
        PlaySE(SEQ_SE_GS_GEARCANCEL);
        return ov18_021EDBB8(pokedexApp, 24, 8, 92);
    case 3:
        PlaySE(SEQ_SE_GS_ZKN_BUTTON8);
        ov18_021EDDA4(pokedexApp, 1);
        break;
    case 4:
        PlaySE(SEQ_SE_GS_ZKN_BUTTON8);
        ov18_021EDDA4(pokedexApp, 0);
        break;
    case 5: {
        PokedexAppData_UnkSub0868_State06 *r5 = &pokedexApp->unk_0868.state_06;
        System_GetTouchNewCoords(&r5->unk_0, &r5->unk_4);
        r5->unk_8 = ov18_021F2B9C(pokedexApp);
        PlaySE(SEQ_SE_GS_BUTTON01);
        return 8;
    }
    case 6: {
        u32 sp4;
        u32 sp0;

        System_GetTouchNewCoords(&sp4, &sp0);
        if (ov18_021F2AF8(pokedexApp, sp4, sp0) == TRUE) {
            return 7;
        }
    } break;
    }

    return 6;
}

int ov18_021E8FCC(PokedexAppData *pokedexApp) {
    u32 sp4;
    u32 sp0;

    if (!System_GetTouchHeldCoords(&sp4, &sp0)) {
        ov18_021EDCD4(pokedexApp);
        return 6;
    }

    if (sp4 >= 92 && sp4 < 164 && sp0 >= 112 && sp0 < 144) {
        if (sp4 < 96) {
            sp4 = 96;
        } else if (sp4 > 159) {
            sp4 = 159;
        }
        if (sp0 < 120) {
            sp0 = 120;
        } else if (sp0 > 135) {
            sp0 = 135;
        }
        if (!ov18_021F2AF8(pokedexApp, sp4, sp0)) {
            if (pokedexApp->unk_1858 == 1) {
                PlaySE(SEQ_SE_GS_ZKN_BUTTON8);
                ov18_021EDC74(pokedexApp, 0);
            } else {
                PlaySE(SEQ_SE_GS_ZKN_BUTTON8);
                ov18_021EDC74(pokedexApp, 1);
            }
        }
    } else {
        ov18_021EDCD4(pokedexApp);
        return 6;
    }

    return 7;
}

int ov18_021E9070(PokedexAppData *pokedexApp) {
    PokedexAppData_UnkSub0868_State06 *r4 = &pokedexApp->unk_0868.state_06;

    switch (r4->unk_A) {
    case 0: {
        u32 sp4;
        u32 sp0;

        if (!System_GetTouchHeldCoords(&sp4, &sp0)) {
            if (Bg_GetXpos(pokedexApp->bgConfig, GF_BG_LYR_MAIN_0) >= 64) {
                MI_CpuClear8(&pokedexApp->unk_0868, sizeof(pokedexApp->unk_0868));
                return 9;
            }
            ++r4->unk_A;
        } else if ((s32)(r4->unk_0 - sp4) < 0) {
            ScheduleSetBgPosText(pokedexApp->bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_SET_X, 0);
            ScheduleSetBgPosText(pokedexApp->bgConfig, GF_BG_LYR_SUB_0, BG_POS_OP_SET_X, 0);
            ov18_021F2B70(pokedexApp, 0, r4->unk_8);
        } else {
            ScheduleSetBgPosText(pokedexApp->bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_SET_X, r4->unk_0 - sp4);
            ScheduleSetBgPosText(pokedexApp->bgConfig, GF_BG_LYR_SUB_0, BG_POS_OP_SET_X, r4->unk_0 - sp4);
            ov18_021F2B70(pokedexApp, 0, r4->unk_8 - (r4->unk_0 - sp4));
        }
    } break;
    case 1:
        ScheduleSetBgPosText(pokedexApp->bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_SUB_X, 16);
        ScheduleSetBgPosText(pokedexApp->bgConfig, GF_BG_LYR_SUB_0, BG_POS_OP_SUB_X, 16);
        ov18_021F2B3C(pokedexApp, 0, 16);
        if (Bg_GetXpos(pokedexApp->bgConfig, GF_BG_LYR_MAIN_0) <= 0) {
            ScheduleSetBgPosText(pokedexApp->bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_SET_X, 0);
            ScheduleSetBgPosText(pokedexApp->bgConfig, GF_BG_LYR_SUB_0, BG_POS_OP_SET_X, 0);
            ov18_021F2B70(pokedexApp, 0, ov18_021F2B9C(pokedexApp));
            MI_CpuClear8(&pokedexApp->unk_0868, sizeof(pokedexApp->unk_0868));
            return 6;
        }
        break;
    }

    return 8;
}
