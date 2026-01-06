#include "application/pokedex/pokedex_internal.h"
#include "graphic/zukan_gra.naix"

#include "font.h"
#include "gf_gfx_loader.h"
#include "sound_02004A44.h"
#include "unk_02005D10.h"
#include "unk_0200FA24.h"
#include "unk_020210A0.h"
#include "unk_0208805C.h"

int PokedexApp_MainSeq_00(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_01(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_02(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_03(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_04(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_05(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_06(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_07(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_08(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_09(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_10(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_11(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_12(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_13(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_14(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_15(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_16(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_17(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_18(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_21(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_22(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_23(PokedexAppData *pokedexApp);
void ov18_021EA350(PokedexAppData *pokedexApp, int a1, int a2);
int PokedexApp_MainSeq_24(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_25(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_19(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_20(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_26(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_27(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_28(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_29(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_30(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_31(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_32(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_33(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_34(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_35(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_36(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_37(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_38(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_39(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_40(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_41(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_42(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_43(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_44(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_45(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_46(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_47(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_48(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_49(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_50(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_51(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_52(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_53(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_54(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_55(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_56(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_57(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_58(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_59(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_60(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_61(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_62(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_63(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_64(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_65(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_66(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_67(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_68(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_69(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_70(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_71(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_72(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_73(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_74(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_75(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_76(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_77(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_78(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_79(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_80(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_81(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_82(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_83(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_84(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_85(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_86(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_87(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_88(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_89(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_90(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_91(PokedexAppData *pokedexApp);
int PokedexApp_MainSeq_92(PokedexAppData *pokedexApp);

static int (*const sMainSeqFuncs[])(PokedexAppData *pokedexApp) = {
    [POKEDEXAPP_MAINSEQ_00] = PokedexApp_MainSeq_00,
    [POKEDEXAPP_MAINSEQ_01] = PokedexApp_MainSeq_01,
    [POKEDEXAPP_MAINSEQ_02] = PokedexApp_MainSeq_02,
    [POKEDEXAPP_MAINSEQ_03] = PokedexApp_MainSeq_03,
    [POKEDEXAPP_MAINSEQ_04] = PokedexApp_MainSeq_04,
    [POKEDEXAPP_MAINSEQ_05] = PokedexApp_MainSeq_05,
    [POKEDEXAPP_MAINSEQ_06] = PokedexApp_MainSeq_06,
    [POKEDEXAPP_MAINSEQ_07] = PokedexApp_MainSeq_07,
    [POKEDEXAPP_MAINSEQ_08] = PokedexApp_MainSeq_08,
    [POKEDEXAPP_MAINSEQ_09] = PokedexApp_MainSeq_09,
    [POKEDEXAPP_MAINSEQ_10] = PokedexApp_MainSeq_10,
    [POKEDEXAPP_MAINSEQ_11] = PokedexApp_MainSeq_11,
    [POKEDEXAPP_MAINSEQ_12] = PokedexApp_MainSeq_12,
    [POKEDEXAPP_MAINSEQ_13] = PokedexApp_MainSeq_13,
    [POKEDEXAPP_MAINSEQ_14] = PokedexApp_MainSeq_14,
    [POKEDEXAPP_MAINSEQ_15] = PokedexApp_MainSeq_15,
    [POKEDEXAPP_MAINSEQ_16] = PokedexApp_MainSeq_16,
    [POKEDEXAPP_MAINSEQ_17] = PokedexApp_MainSeq_17,
    [POKEDEXAPP_MAINSEQ_18] = PokedexApp_MainSeq_18,
    [POKEDEXAPP_MAINSEQ_19] = PokedexApp_MainSeq_19,
    [POKEDEXAPP_MAINSEQ_20] = PokedexApp_MainSeq_20,
    [POKEDEXAPP_MAINSEQ_21] = PokedexApp_MainSeq_21,
    [POKEDEXAPP_MAINSEQ_22] = PokedexApp_MainSeq_22,
    [POKEDEXAPP_MAINSEQ_23] = PokedexApp_MainSeq_23,
    [POKEDEXAPP_MAINSEQ_24] = PokedexApp_MainSeq_24,
    [POKEDEXAPP_MAINSEQ_25] = PokedexApp_MainSeq_25,
    [POKEDEXAPP_MAINSEQ_26] = PokedexApp_MainSeq_26,
    [POKEDEXAPP_MAINSEQ_27] = PokedexApp_MainSeq_27,
    [POKEDEXAPP_MAINSEQ_28] = PokedexApp_MainSeq_28,
    [POKEDEXAPP_MAINSEQ_29] = PokedexApp_MainSeq_29,
    [POKEDEXAPP_MAINSEQ_30] = PokedexApp_MainSeq_30,
    [POKEDEXAPP_MAINSEQ_31] = PokedexApp_MainSeq_31,
    [POKEDEXAPP_MAINSEQ_32] = PokedexApp_MainSeq_32,
    [POKEDEXAPP_MAINSEQ_33] = PokedexApp_MainSeq_33,
    [POKEDEXAPP_MAINSEQ_34] = PokedexApp_MainSeq_34,
    [POKEDEXAPP_MAINSEQ_35] = PokedexApp_MainSeq_35,
    [POKEDEXAPP_MAINSEQ_36] = PokedexApp_MainSeq_36,
    [POKEDEXAPP_MAINSEQ_37] = PokedexApp_MainSeq_37,
    [POKEDEXAPP_MAINSEQ_38] = PokedexApp_MainSeq_38,
    [POKEDEXAPP_MAINSEQ_39] = PokedexApp_MainSeq_39,
    [POKEDEXAPP_MAINSEQ_40] = PokedexApp_MainSeq_40,
    [POKEDEXAPP_MAINSEQ_41] = PokedexApp_MainSeq_41,
    [POKEDEXAPP_MAINSEQ_42] = PokedexApp_MainSeq_42,
    [POKEDEXAPP_MAINSEQ_43] = PokedexApp_MainSeq_43,
    [POKEDEXAPP_MAINSEQ_44] = PokedexApp_MainSeq_44,
    [POKEDEXAPP_MAINSEQ_45] = PokedexApp_MainSeq_45,
    [POKEDEXAPP_MAINSEQ_46] = PokedexApp_MainSeq_46,
    [POKEDEXAPP_MAINSEQ_47] = PokedexApp_MainSeq_47,
    [POKEDEXAPP_MAINSEQ_48] = PokedexApp_MainSeq_48,
    [POKEDEXAPP_MAINSEQ_49] = PokedexApp_MainSeq_49,
    [POKEDEXAPP_MAINSEQ_50] = PokedexApp_MainSeq_50,
    [POKEDEXAPP_MAINSEQ_51] = PokedexApp_MainSeq_51,
    [POKEDEXAPP_MAINSEQ_52] = PokedexApp_MainSeq_52,
    [POKEDEXAPP_MAINSEQ_53] = PokedexApp_MainSeq_53,
    [POKEDEXAPP_MAINSEQ_54] = PokedexApp_MainSeq_54,
    [POKEDEXAPP_MAINSEQ_55] = PokedexApp_MainSeq_55,
    [POKEDEXAPP_MAINSEQ_56] = PokedexApp_MainSeq_56,
    [POKEDEXAPP_MAINSEQ_57] = PokedexApp_MainSeq_57,
    [POKEDEXAPP_MAINSEQ_58] = PokedexApp_MainSeq_58,
    [POKEDEXAPP_MAINSEQ_59] = PokedexApp_MainSeq_59,
    [POKEDEXAPP_MAINSEQ_60] = PokedexApp_MainSeq_60,
    [POKEDEXAPP_MAINSEQ_61] = PokedexApp_MainSeq_61,
    [POKEDEXAPP_MAINSEQ_62] = PokedexApp_MainSeq_62,
    [POKEDEXAPP_MAINSEQ_63] = PokedexApp_MainSeq_63,
    [POKEDEXAPP_MAINSEQ_64] = PokedexApp_MainSeq_64,
    [POKEDEXAPP_MAINSEQ_65] = PokedexApp_MainSeq_65,
    [POKEDEXAPP_MAINSEQ_66] = PokedexApp_MainSeq_66,
    [POKEDEXAPP_MAINSEQ_67] = PokedexApp_MainSeq_67,
    [POKEDEXAPP_MAINSEQ_68] = PokedexApp_MainSeq_68,
    [POKEDEXAPP_MAINSEQ_69] = PokedexApp_MainSeq_69,
    [POKEDEXAPP_MAINSEQ_70] = PokedexApp_MainSeq_70,
    [POKEDEXAPP_MAINSEQ_71] = PokedexApp_MainSeq_71,
    [POKEDEXAPP_MAINSEQ_72] = PokedexApp_MainSeq_72,
    [POKEDEXAPP_MAINSEQ_73] = PokedexApp_MainSeq_73,
    [POKEDEXAPP_MAINSEQ_74] = PokedexApp_MainSeq_74,
    [POKEDEXAPP_MAINSEQ_75] = PokedexApp_MainSeq_75,
    [POKEDEXAPP_MAINSEQ_76] = PokedexApp_MainSeq_76,
    [POKEDEXAPP_MAINSEQ_77] = PokedexApp_MainSeq_77,
    [POKEDEXAPP_MAINSEQ_78] = PokedexApp_MainSeq_78,
    [POKEDEXAPP_MAINSEQ_79] = PokedexApp_MainSeq_79,
    [POKEDEXAPP_MAINSEQ_80] = PokedexApp_MainSeq_80,
    [POKEDEXAPP_MAINSEQ_81] = PokedexApp_MainSeq_81,
    [POKEDEXAPP_MAINSEQ_82] = PokedexApp_MainSeq_82,
    [POKEDEXAPP_MAINSEQ_83] = PokedexApp_MainSeq_83,
    [POKEDEXAPP_MAINSEQ_84] = PokedexApp_MainSeq_84,
    [POKEDEXAPP_MAINSEQ_85] = PokedexApp_MainSeq_85,
    [POKEDEXAPP_MAINSEQ_86] = PokedexApp_MainSeq_86,
    [POKEDEXAPP_MAINSEQ_87] = PokedexApp_MainSeq_87,
    [POKEDEXAPP_MAINSEQ_88] = PokedexApp_MainSeq_88,
    [POKEDEXAPP_MAINSEQ_89] = PokedexApp_MainSeq_89,
    [POKEDEXAPP_MAINSEQ_90] = PokedexApp_MainSeq_90,
    [POKEDEXAPP_MAINSEQ_91] = PokedexApp_MainSeq_91,
    [POKEDEXAPP_MAINSEQ_92] = PokedexApp_MainSeq_92,
};

BOOL PokedexApp_RunMainSeq(PokedexAppData *pokedexApp, int *pState) {
    *pState = sMainSeqFuncs[*pState](pokedexApp);
    if (*pState == NELEMS(sMainSeqFuncs)) {
        return FALSE;
    }

    sub_02019934(pokedexApp->unk_0008);
    ov18_021F1004(pokedexApp);
    SpriteSystem_DrawSprites(pokedexApp->unk_066C);
    return TRUE;
}

int PokedexApp_MainSeq_00(PokedexAppData *pokedexApp) {
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

int PokedexApp_MainSeq_01(PokedexAppData *pokedexApp) {
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

int PokedexApp_MainSeq_02(PokedexAppData *pokedexApp) {
    if (IsPaletteFadeFinished() == TRUE) {
        return pokedexApp->unk_0860;
    }

    return POKEDEXAPP_MAINSEQ_02;
}

int PokedexApp_MainSeq_03(PokedexAppData *pokedexApp) {
    if (PaletteData_GetSelectedBuffersBitmask(pokedexApp->paletteData) == 0) {
        return pokedexApp->unk_085C;
    }

    return POKEDEXAPP_MAINSEQ_03;
}

int PokedexApp_MainSeq_04(PokedexAppData *pokedexApp) {
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

    return POKEDEXAPP_MAINSEQ_04;
}

int PokedexApp_MainSeq_05(PokedexAppData *pokedexApp) {
    pokedexApp->unk_185B = 0;
    ov18_021E67C8(pokedexApp, 0);
    PaletteData_BeginPaletteFade(pokedexApp->paletteData, 0xF, 0xFFFF, -127, 0, 0, RGB_BLACK);
    pokedexApp->unk_0860 = 6;
    return POKEDEXAPP_MAINSEQ_02;
}

int PokedexApp_MainSeq_06(PokedexAppData *pokedexApp) {
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
        return POKEDEXAPP_MAINSEQ_08;
    }
    case 6: {
        u32 sp4;
        u32 sp0;

        System_GetTouchNewCoords(&sp4, &sp0);
        if (ov18_021F2AF8(pokedexApp, sp4, sp0) == TRUE) {
            return POKEDEXAPP_MAINSEQ_07;
        }
    } break;
    }

    return POKEDEXAPP_MAINSEQ_06;
}

int PokedexApp_MainSeq_07(PokedexAppData *pokedexApp) {
    u32 sp4;
    u32 sp0;

    if (!System_GetTouchHeldCoords(&sp4, &sp0)) {
        ov18_021EDCD4(pokedexApp);
        return POKEDEXAPP_MAINSEQ_06;
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
        return POKEDEXAPP_MAINSEQ_06;
    }

    return POKEDEXAPP_MAINSEQ_07;
}

int PokedexApp_MainSeq_08(PokedexAppData *pokedexApp) {
    PokedexAppData_UnkSub0868_State06 *r4 = &pokedexApp->unk_0868.state_06;

    switch (r4->unk_A) {
    case 0: {
        u32 sp4;
        u32 sp0;

        if (!System_GetTouchHeldCoords(&sp4, &sp0)) {
            if (Bg_GetXpos(pokedexApp->bgConfig, GF_BG_LYR_MAIN_0) >= 64) {
                MI_CpuClear8(&pokedexApp->unk_0868, sizeof(pokedexApp->unk_0868));
                return POKEDEXAPP_MAINSEQ_09;
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
            return POKEDEXAPP_MAINSEQ_06;
        }
        break;
    }

    return POKEDEXAPP_MAINSEQ_08;
}

int PokedexApp_MainSeq_09(PokedexAppData *pokedexApp) {
    PokedexAppData_UnkSub0868_State09 *r4 = &pokedexApp->unk_0868.state_09;

    switch (r4->unk_0) {
    case 0:
        ov18_021E6574(pokedexApp);
        ++r4->unk_0;
        // fallthrough
    case 1: {
        ScheduleSetBgPosText(pokedexApp->bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_ADD_X, 16);
        ScheduleSetBgPosText(pokedexApp->bgConfig, GF_BG_LYR_SUB_0, BG_POS_OP_ADD_X, 16);
        ov18_021F2B3C(pokedexApp, 0, -16);
        int r6 = Bg_GetXpos(pokedexApp->bgConfig, GF_BG_LYR_MAIN_0);
        if (r4->unk_3 == 0 && r6 >= 192 && !sub_020199E4(pokedexApp->unk_0008, 0)) {
            r4->unk_3 = 1;
            ov18_021E65AC(pokedexApp);
            ov18_021EDE64(pokedexApp);
        }
        if (r6 >= 256) {
            ScheduleSetBgPosText(pokedexApp->bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_SET_X, 256);
            ScheduleSetBgPosText(pokedexApp->bgConfig, GF_BG_LYR_SUB_0, BG_POS_OP_SET_X, 256);
            ov18_021F2B70(pokedexApp, 0, ov18_021F2B9C(pokedexApp) - 256);
            if (r4->unk_3 == 1) {
                ++r4->unk_0;
            }
        }
    } break;
    case 2:
        if (!sub_020199E4(pokedexApp->unk_0008, 1)) {
            u16 species = ov18_021F8838(pokedexApp);
            ov18_021E659C(pokedexApp);
            if (species != SPECIES_NONE) {
                ov18_021F24E0(pokedexApp, species, 8);
                if (ov18_021E6D38(pokedexApp, species) == TRUE) {
                    ov18_021F2A2C(pokedexApp, 6, 1);
                }
            }
            ov18_021EE638(pokedexApp, species, 6);
            MI_CpuClear8(&pokedexApp->unk_0868, sizeof(pokedexApp->unk_0868));
            return POKEDEXAPP_MAINSEQ_11;
        }
        break;
    }

    return POKEDEXAPP_MAINSEQ_09;
}

int PokedexApp_MainSeq_10(PokedexAppData *pokedexApp) {
    switch (pokedexApp->unk_0868.state_10.unk_0) {
    case 0:
        ov18_021E6574(pokedexApp);
        PaletteData_BeginPaletteFade(pokedexApp->paletteData, 0x0001, 0xFFFE, 0, 0, 16, RGB_BLACK);
        PaletteData_BeginPaletteFade(pokedexApp->paletteData, 0x000E, 0xFFFF, 0, 0, 16, RGB_BLACK);
        ++pokedexApp->unk_0868.state_10.unk_0;
        break;
    case 1:
        if (PaletteData_GetSelectedBuffersBitmask(pokedexApp->paletteData) == 0) {
            ++pokedexApp->unk_0868.state_10.unk_0;
        } else if (Bg_GetXpos(pokedexApp->bgConfig, GF_BG_LYR_MAIN_0) >= 256) {
            ScheduleSetBgPosText(pokedexApp->bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_SET_X, 256);
            ScheduleSetBgPosText(pokedexApp->bgConfig, GF_BG_LYR_SUB_0, BG_POS_OP_SET_X, 256);
            ov18_021F2B70(pokedexApp, 0, ov18_021F2B9C(pokedexApp) - 256);
        } else {
            ScheduleSetBgPosText(pokedexApp->bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_ADD_X, 16);
            ScheduleSetBgPosText(pokedexApp->bgConfig, GF_BG_LYR_SUB_0, BG_POS_OP_ADD_X, 16);
            ov18_021F2B3C(pokedexApp, 0, -16);
        }
        break;
    case 2:
        if (sub_020199E4(pokedexApp->unk_0008, 0) == 0) {
            ScheduleSetBgPosText(pokedexApp->bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_SET_X, 0);
            ScheduleSetBgPosText(pokedexApp->bgConfig, GF_BG_LYR_SUB_0, BG_POS_OP_SET_X, 0);
            ZeroPalettesByBitmask(0x000F, HEAP_ID_37);
            ov18_021EE388(pokedexApp);
            ov18_021F2F00(pokedexApp);
            pokedexApp->unk_0868.state_10.unk_0 = 0;
            return POKEDEXAPP_MAINSEQ_21;
        }
        break;
    }

    return POKEDEXAPP_MAINSEQ_10;
}

int PokedexApp_MainSeq_11(PokedexAppData *pokedexApp) {
    switch (ov18_021F6BBC(pokedexApp, 1)) {
    case 0:
        ov18_021F2BB0(pokedexApp, 5);
        ov18_021E6E44(pokedexApp);
        ov18_021EDE64(pokedexApp);
        break;
    case 1:
        return POKEDEXAPP_MAINSEQ_12;
    case 2:
        pokedexApp->unk_185B = 5;
        return ov18_021EDBB8(pokedexApp, 0, 8, 18);
    case 3:
        if (ov18_021EDE04(pokedexApp) == 1) {
            return ov18_021EDBB8(pokedexApp, 8, 8, 11);
        }
        break;
    case 4:
        if (ov18_021F8838(pokedexApp) != SPECIES_NONE) {
            PlaySE(SEQ_SE_GS_ZKN04);
            pokedexApp->unk_185B = 1;
            return ov18_021EDBB8(pokedexApp, 16, 8, 18);
        }
        break;
    case 5:
        MenuInputStateMgr_SetState(pokedexApp->args->menuInputStatePtr, MENU_INPUT_STATE_TOUCH);
        return ov18_021EDBB8(pokedexApp, 24, 8, 20);
    case 6:
        MenuInputStateMgr_SetState(pokedexApp->args->menuInputStatePtr, MENU_INPUT_STATE_BUTTONS);
        return ov18_021EDBB8(pokedexApp, 24, 8, 20);
    case 7:
        ov18_021E6D68(pokedexApp, ov18_021F8838(pokedexApp), -1);
        break;
    case 8:
        ov18_021E6D68(pokedexApp, ov18_021F8838(pokedexApp), 1);
        break;
    case 9:
        if (pokedexApp->unk_1859 != 0) {
            PlaySE(SEQ_SE_GS_ZKN04);
            MI_CpuClear8(&pokedexApp->unk_0868, sizeof(pokedexApp->unk_0868));
            return POKEDEXAPP_MAINSEQ_13;
        }
        break;
    case 10:
        if (pokedexApp->unk_1859 != 0) {
            PlaySE(SEQ_SE_GS_ZKN04);
            MI_CpuClear8(&pokedexApp->unk_0868, sizeof(pokedexApp->unk_0868));
            pokedexApp->unk_0868.state_13.unk_7 = 1;
            return POKEDEXAPP_MAINSEQ_13;
        }
        break;
    case 11:
        if (pokedexApp->unk_1859 + 1 <= ov18_021F8950(pokedexApp, 1)) {
            PlaySE(SEQ_SE_GS_ZKN04);
            MI_CpuClear8(&pokedexApp->unk_0868, sizeof(pokedexApp->unk_0868));
            return POKEDEXAPP_MAINSEQ_14;
        }
        break;
    case 12:
        if (pokedexApp->unk_1859 + 1 <= ov18_021F8950(pokedexApp, 1)) {
            PlaySE(SEQ_SE_GS_ZKN04);
            MI_CpuClear8(&pokedexApp->unk_0868, sizeof(pokedexApp->unk_0868));
            pokedexApp->unk_0868.state_13.unk_7 = 1;
            return POKEDEXAPP_MAINSEQ_14;
        }
        break;
    case 13: {
        u32 x;
        u32 y;

        System_GetTouchHeldCoords(&x, &y);
        if (ov18_021F2CD0(pokedexApp, 1, x, y) == 1) {
            return POKEDEXAPP_MAINSEQ_15;
        } else {
            PokedexAppData_UnkSub0868_State16 *r1 = &pokedexApp->unk_0868.state_16;

            r1->unk_0 = x;
            r1->unk_2 = y;
            return POKEDEXAPP_MAINSEQ_16;
        }
    } break;
    case 14: {
        PokedexAppData_UnkSub0868_State17 *r0 = &pokedexApp->unk_0868.state_17;

        System_GetTouchNewCoords(&r0->unk_0, &r0->unk_4);
        sub_0201980C(pokedexApp->unk_0008, 4);
        ov18_021F2A2C(pokedexApp, 6, 0);
        ov18_021F2A84(pokedexApp, 8, 0);
        ClearWindowTilemapAndScheduleTransfer(&pokedexApp->windows[6]);
        return POKEDEXAPP_MAINSEQ_17;
    }
    }

    return POKEDEXAPP_MAINSEQ_11;
}

int PokedexApp_MainSeq_12(PokedexAppData *pokedexApp) {
    PokedexAppData_UnkSub0868_State09 *r4 = &pokedexApp->unk_0868.state_09;

    switch (r4->unk_0) {
    case 0:
        sub_0201980C(pokedexApp->unk_0008, 4);
        ov18_021F2A2C(pokedexApp, 6, 0);
        ov18_021F2A84(pokedexApp, 8, 0);
        ClearWindowTilemapAndScheduleTransfer(&pokedexApp->windows[6]);
        ov18_021E65D4(pokedexApp);
        ++r4->unk_0;
        // fallthrough
    case 1: {
        ScheduleSetBgPosText(pokedexApp->bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_SUB_X, 16);
        ScheduleSetBgPosText(pokedexApp->bgConfig, GF_BG_LYR_SUB_0, BG_POS_OP_SUB_X, 16);
        ov18_021F2B3C(pokedexApp, 0, 16);
        int r6 = Bg_GetXpos(pokedexApp->bgConfig, GF_BG_LYR_MAIN_0);
        if (r4->unk_3 == 0 && r6 < 64 && !sub_020199E4(pokedexApp->unk_0008, 1)) {
            r4->unk_3 = 1;
            ov18_021E654C(pokedexApp);
        }
        if (r6 <= 0) {
            ScheduleSetBgPosText(pokedexApp->bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_SET_X, 0);
            ScheduleSetBgPosText(pokedexApp->bgConfig, GF_BG_LYR_SUB_0, BG_POS_OP_SET_X, 0);
            ov18_021F2B70(pokedexApp, 0, ov18_021F2B9C(pokedexApp));
            if (r4->unk_3 == 1) {
                ++r4->unk_0;
            }
        }
    } break;
    case 2:
        if (!sub_020199E4(pokedexApp->unk_0008, 0)) {
            MI_CpuClear8(&pokedexApp->unk_0868, sizeof(pokedexApp->unk_0868));
            return POKEDEXAPP_MAINSEQ_06;
        }
    }

    return POKEDEXAPP_MAINSEQ_12;
}

int PokedexApp_MainSeq_13(PokedexAppData *pokedexApp) {
    PokedexAppData_UnkSub0868_State13 *r4 = &pokedexApp->unk_0868.state_13;

    switch (r4->unk_4) {
    case 0:
        ov18_021F2BFC(pokedexApp);
        ov18_021F118C(pokedexApp, 2, 6);
        ov18_021F2A2C(pokedexApp, 6, 0);
        ov18_021F2A84(pokedexApp, 8, 0);
        ClearWindowTilemapAndScheduleTransfer(&pokedexApp->windows[6]);
        r4->unk_0 = ov18_021E6AEC(pokedexApp, 15 * (pokedexApp->unk_1859 - 1));
        r4->unk_6 = ov18_021F2E14(pokedexApp, 1, ov18_021F2DD4(pokedexApp, pokedexApp->unk_1859 - 1, 1, 1), 15);
        ++r4->unk_4;
        // fallthrough
    case 1:
        ++r4->unk_5;
        ov18_021E6CE8(pokedexApp, &r4->unk_0[0x1E0 - 32 * r4->unk_5]);
        ov18_021F16C4(pokedexApp, 24, 8, r4->unk_5 / 5);
        ov18_021F2E4C(pokedexApp, 1, -r4->unk_6);
        if (r4->unk_5 == 15) {
            ++r4->unk_4;
        }
        break;
    case 2:
        if (r4->unk_7 == 1) {
            pokedexApp->unk_185A += 10;
        }
        --pokedexApp->unk_1859;
        ov18_021F2BB0(pokedexApp, 5);
        ov18_021E6C90(r4->unk_0);
        ov18_021E6E44(pokedexApp);
        ov18_021F2C10(pokedexApp, 2, 1);
        ov18_021F2E80(pokedexApp, 1, 1);
        ov18_021EDE64(pokedexApp);
        MI_CpuClear8(&pokedexApp->unk_0868, sizeof(pokedexApp->unk_0868));
        return POKEDEXAPP_MAINSEQ_11;
    }

    return POKEDEXAPP_MAINSEQ_13;
}

int PokedexApp_MainSeq_14(PokedexAppData *pokedexApp) {
    PokedexAppData_UnkSub0868_State13 *r4 = &pokedexApp->unk_0868.state_13;

    switch (r4->unk_4) {
    case 0:
        ov18_021F2BFC(pokedexApp);
        ov18_021F118C(pokedexApp, 3, 9);
        ov18_021F2A2C(pokedexApp, 6, 0);
        ov18_021F2A84(pokedexApp, 8, 0);
        ClearWindowTilemapAndScheduleTransfer(&pokedexApp->windows[6]);
        r4->unk_0 = ov18_021E6AEC(pokedexApp, 15 * pokedexApp->unk_1859);
        r4->unk_6 = ov18_021F2E14(pokedexApp, 1, ov18_021F2DD4(pokedexApp, pokedexApp->unk_1859 + 1, 1, 1), 15);
        ++r4->unk_4;
        // fallthrough
    case 1:
        ++r4->unk_5;
        ov18_021E6CE8(pokedexApp, &r4->unk_0[32 * r4->unk_5]);
        ov18_021F1760(pokedexApp, 24, -8, r4->unk_5 / 5);
        ov18_021F2E4C(pokedexApp, 1, r4->unk_6);
        if (r4->unk_5 == 15) {
            ++r4->unk_4;
        }
        break;
    case 2:
        if (r4->unk_7 == 1) {
            pokedexApp->unk_185A -= 10;
        }
        ++pokedexApp->unk_1859;
        ov18_021F2BB0(pokedexApp, 5);
        ov18_021E6C90(r4->unk_0);
        ov18_021E6E44(pokedexApp);
        ov18_021F2C10(pokedexApp, 2, 1);
        ov18_021F2E80(pokedexApp, 1, 1);
        ov18_021EDE64(pokedexApp);
        MI_CpuClear8(&pokedexApp->unk_0868, sizeof(pokedexApp->unk_0868));
        return POKEDEXAPP_MAINSEQ_11;
    }

    return POKEDEXAPP_MAINSEQ_14;
}

int PokedexApp_MainSeq_15(PokedexAppData *pokedexApp) {
    u32 x;
    u32 y;

    if (!System_GetTouchHeldCoords(&x, &y)) {
        return POKEDEXAPP_MAINSEQ_11;
    }
    if (ov18_021F2D24(pokedexApp, 1, x, y, 1) == 1) {
        u16 *r4 = ov18_021E6AEC(pokedexApp, 15 * pokedexApp->unk_1859);
        pokedexApp->unk_185E ^= 1;
        ov18_021E6CE8(pokedexApp, r4);
        ov18_021E6C90(r4);
        ov18_021F1620(pokedexApp, 24);
        ov18_021E6E44(pokedexApp);
        ov18_021F2C10(pokedexApp, 2, 1);
        ov18_021EDE64(pokedexApp);
        PlaySE(SEQ_SE_GS_ZKN03);
    }
    return POKEDEXAPP_MAINSEQ_15;
}

int PokedexApp_MainSeq_16(PokedexAppData *pokedexApp) {
    PokedexAppData_UnkSub0868_State16 *r3 = &pokedexApp->unk_0868.state_16;
    if (ov18_021F2D24(pokedexApp, 1, r3->unk_0, r3->unk_2, 1) == 1) {
        u16 *r4 = ov18_021E6AEC(pokedexApp, 15 * pokedexApp->unk_1859);
        pokedexApp->unk_185E ^= 1;
        ov18_021E6CE8(pokedexApp, r4);
        ov18_021E6C90(r4);
        ov18_021F1620(pokedexApp, 24);
        ov18_021E6E44(pokedexApp);
        ov18_021F2C10(pokedexApp, 2, 1);
        ov18_021EDE64(pokedexApp);
        MI_CpuClear8(&pokedexApp->unk_0868, sizeof(pokedexApp->unk_0868));
        PlaySE(SEQ_SE_GS_ZKN03);
    }
    return POKEDEXAPP_MAINSEQ_11;
}

int PokedexApp_MainSeq_17(PokedexAppData *pokedexApp) {
    PokedexAppData_UnkSub0868_State17 *r4 = &pokedexApp->unk_0868.state_17;

    switch (r4->unk_A) {
    case 0: {
        u32 x;
        u32 y;

        if (!System_GetTouchHeldCoords(&x, &y)) {
            if (Bg_GetXpos(pokedexApp->bgConfig, GF_BG_LYR_MAIN_0) < 192) {
                MI_CpuClear8(&pokedexApp->unk_0868, sizeof(pokedexApp->unk_0868));
                return POKEDEXAPP_MAINSEQ_12;
            }
            ++r4->unk_A;
        } else {
            if ((int)(r4->unk_0 + 256 - x) > 256) {
                ScheduleSetBgPosText(pokedexApp->bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_SET_X, 256);
                ScheduleSetBgPosText(pokedexApp->bgConfig, GF_BG_LYR_SUB_0, BG_POS_OP_SET_X, 256);
                ov18_021F2B70(pokedexApp, 0, ov18_021F2B9C(pokedexApp) - 256);
            } else {
                ScheduleSetBgPosText(pokedexApp->bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_SET_X, r4->unk_0 + 0x100 - x);
                ScheduleSetBgPosText(pokedexApp->bgConfig, GF_BG_LYR_SUB_0, BG_POS_OP_SET_X, r4->unk_0 + 0x100 - x);
                ov18_021F2B70(pokedexApp, 0, (ov18_021F2B9C(pokedexApp) - 256) - (r4->unk_0 - x));
            }
        }
    } break;
    case 1:
        ScheduleSetBgPosText(pokedexApp->bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_ADD_X, 16);
        ScheduleSetBgPosText(pokedexApp->bgConfig, GF_BG_LYR_SUB_0, BG_POS_OP_ADD_X, 16);
        ov18_021F2B3C(pokedexApp, 0, -16);
        if (Bg_GetXpos(pokedexApp->bgConfig, GF_BG_LYR_MAIN_0) > 256) {
            u16 r4 = ov18_021F8838(pokedexApp);
            ov18_021E659C(pokedexApp);
            if (r4 != SPECIES_NONE) {
                ov18_021F24E0(pokedexApp, r4, 8);
                if (ov18_021E6D38(pokedexApp, r4) == TRUE) {
                    ov18_021F2A2C(pokedexApp, 6, 1);
                }
            }
            ov18_021EE638(pokedexApp, r4, 6);
            ScheduleSetBgPosText(pokedexApp->bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_SET_X, 256);
            ScheduleSetBgPosText(pokedexApp->bgConfig, GF_BG_LYR_SUB_0, BG_POS_OP_SET_X, 256);
            ov18_021F2B70(pokedexApp, 0, ov18_021F2B9C(pokedexApp) - 256);
            MI_CpuClear8(&pokedexApp->unk_0868, sizeof(pokedexApp->unk_0868));
            return POKEDEXAPP_MAINSEQ_11;
        }
        break;
    }

    return POKEDEXAPP_MAINSEQ_17;
}

int PokedexApp_MainSeq_18(PokedexAppData *pokedexApp) {
    switch (pokedexApp->unk_0868.state_10.unk_0) {
    case 0:
        sub_0201980C(pokedexApp->unk_0008, 4);
        ov18_021F2A2C(pokedexApp, 6, 0);
        ov18_021F2A84(pokedexApp, 8, 0);
        ClearWindowTilemapAndScheduleTransfer(&pokedexApp->windows[6]);
        ov18_021E65D4(pokedexApp);
        PaletteData_BeginPaletteFade(pokedexApp->paletteData, 0x0001, 0xFFFE, 0, 0, 16, RGB_BLACK);
        PaletteData_BeginPaletteFade(pokedexApp->paletteData, 0x000E, 0xFFFF, 0, 0, 16, RGB_BLACK);
        pokedexApp->unk_085C = POKEDEXAPP_MAINSEQ_18;
        ++pokedexApp->unk_0868.state_10.unk_0;
        return POKEDEXAPP_MAINSEQ_03;
    case 1:
        if (!sub_020199E4(pokedexApp->unk_0008, 1)) {
            ScheduleSetBgPosText(pokedexApp->bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_SET_X, 0);
            ScheduleSetBgPosText(pokedexApp->bgConfig, GF_BG_LYR_SUB_0, BG_POS_OP_SET_X, 0);
            ZeroPalettesByBitmask(0x000F, HEAP_ID_37);
            ov18_021EE388(pokedexApp);
            ov18_021F2F00(pokedexApp);
            pokedexApp->unk_0868.state_10.unk_0 = 0;
            if (pokedexApp->unk_185B == 5) {
                return POKEDEXAPP_MAINSEQ_21;
            } else {
                pokedexApp->unk_18A0 = 0;
                return POKEDEXAPP_MAINSEQ_66;
            }
        }
        break;
    }

    return POKEDEXAPP_MAINSEQ_18;
}

int PokedexApp_MainSeq_21(PokedexAppData *pokedexApp) {
    switch (pokedexApp->unk_0868.state_10.unk_0) {
    case 0:
        ov18_021E67C8(pokedexApp, 5);
        ov18_021E65FC(pokedexApp);
        ov18_021F6DE0(pokedexApp, 0);
        PaletteData_BeginPaletteFade(pokedexApp->paletteData, 0x0001, 0xFFEF, 0, 16, 0, RGB_BLACK);
        PaletteData_BeginPaletteFade(pokedexApp->paletteData, 0x000E, 0xFFFF, 0, 16, 0, RGB_BLACK);
        ++pokedexApp->unk_0868.state_10.unk_0;
        pokedexApp->unk_085C = POKEDEXAPP_MAINSEQ_21;
        return POKEDEXAPP_MAINSEQ_03;
    case 1:
        if (!sub_020199E4(pokedexApp->unk_0008, 6)) {
            pokedexApp->unk_0868.state_10.unk_0 = 0;
            return POKEDEXAPP_MAINSEQ_22;
        }
        break;
    }

    return POKEDEXAPP_MAINSEQ_21;
}

int PokedexApp_MainSeq_22(PokedexAppData *pokedexApp) {
    switch (ov18_021F6E2C(pokedexApp)) {
    case 0:
        (void)MenuInputStateMgr_GetState(pokedexApp->args->menuInputStatePtr);
        PlaySE(SEQ_SE_GS_ZKN04);
        return ov18_021EDC00(pokedexApp, 16, 1, 11, 2, POKEDEXAPP_MAINSEQ_28);
    case 1:
        (void)MenuInputStateMgr_GetState(pokedexApp->args->menuInputStatePtr);
        PlaySE(SEQ_SE_GS_ZKN04);
        return ov18_021EDC00(pokedexApp, 7, 4, 9, 2, POKEDEXAPP_MAINSEQ_31);
    case 2:
        (void)MenuInputStateMgr_GetState(pokedexApp->args->menuInputStatePtr);
        PlaySE(SEQ_SE_GS_ZKN04);
        return ov18_021EDC00(pokedexApp, 7, 7, 16, 2, POKEDEXAPP_MAINSEQ_34);
    case 3:
        (void)MenuInputStateMgr_GetState(pokedexApp->args->menuInputStatePtr);
        PlaySE(SEQ_SE_GS_ZKN04);
        return ov18_021EDC00(pokedexApp, 7, 10, 14, 2, POKEDEXAPP_MAINSEQ_37);
    case 4:
        (void)MenuInputStateMgr_GetState(pokedexApp->args->menuInputStatePtr);
        PlaySE(SEQ_SE_GS_ZKN04);
        return ov18_021EDC00(pokedexApp, 7, 13, 20, 2, POKEDEXAPP_MAINSEQ_44);
    case 5:
        (void)MenuInputStateMgr_GetState(pokedexApp->args->menuInputStatePtr);
        PlaySE(SEQ_SE_GS_ZKN04);
        return ov18_021EDC00(pokedexApp, 7, 16, 7, 2, POKEDEXAPP_MAINSEQ_51);
    case 6:
        (void)MenuInputStateMgr_GetState(pokedexApp->args->menuInputStatePtr);
        PlaySE(SEQ_SE_GS_ZKN04);
        return ov18_021EDC00(pokedexApp, 26, 7, 4, 4, POKEDEXAPP_MAINSEQ_54);
    case 7:
        (void)MenuInputStateMgr_GetState(pokedexApp->args->menuInputStatePtr);
        PlaySE(SEQ_SE_GS_ZKN04);
        return ov18_021EDBDC(pokedexApp, 0, 10, POKEDEXAPP_MAINSEQ_24);
    case 8:
        (void)MenuInputStateMgr_GetState(pokedexApp->args->menuInputStatePtr);
        PlaySE(SEQ_SE_GS_ZKN04);
        return ov18_021EDBDC(pokedexApp, 11, 10, POKEDEXAPP_MAINSEQ_23);
    case 9:
    case -2:
        PlaySE(SEQ_SE_GS_GEARCANCEL);
        return ov18_021EDBDC(pokedexApp, 22, 10, POKEDEXAPP_MAINSEQ_25);
    case -3:
        break;
    case -1:
    case -4:
    default:
        break;
    }

    return POKEDEXAPP_MAINSEQ_22;
}

int PokedexApp_MainSeq_23(PokedexAppData *pokedexApp) {
    PokedexAppData_UnkSub0868_State16 *r5 = &pokedexApp->unk_0868.state_16;

    switch (r5->unk_0) {
    case 0:
        ov18_021F118C(pokedexApp, 27, 2);
        ov18_021F11C0(pokedexApp, 27, 1);
        ov18_021F11C0(pokedexApp, 0, 0);
        ov18_021EEED0(pokedexApp, 9);
        ov18_021E6624(pokedexApp);
        PlaySE(SEQ_SE_DP_Z_SEARCH);
        r5->unk_0 = 1;
        break;
    case 1:
        ov18_021F7ED4(pokedexApp, pokedexApp->unk_1858, pokedexApp->unk_1868[0], pokedexApp->unk_1868[1], pokedexApp->unk_1868[2], pokedexApp->unk_1868[3], pokedexApp->unk_1868[4], pokedexApp->unk_1868[5], pokedexApp->unk_1868[6], pokedexApp->unk_1868[7], 1 << pokedexApp->unk_1868[8], pokedexApp->unk_1868[9]);
        if (pokedexApp->unk_102E == 0 && pokedexApp->unk_102C == 0) {
            r5->unk_0 = 15;
        } else {
            ov18_021F8884(pokedexApp, 0);
            pokedexApp->unk_185A = 0;
            pokedexApp->unk_1859 = 0;
            pokedexApp->unk_185C = 2;
            r5->unk_0 = 2;
        }
        break;
    case 2:
        ov18_021EA350(pokedexApp, 0, 9);
        r5->unk_0 = 3;
        break;
    case 3:
        ov18_021EA350(pokedexApp, 2, 10);
        r5->unk_0 = 4;
        break;
    case 4:
        ov18_021EA350(pokedexApp, 0, 11);
        r5->unk_0 = 5;
        break;
    case 5:
        ov18_021EA350(pokedexApp, 2, 12);
        r5->unk_0 = 6;
        break;
    case 6:
        ov18_021EFEC4(pokedexApp);
        r5->unk_0 = 7;
        break;
    case 7:
        ov18_021F1620(pokedexApp, 59);
        ov18_021E6CC0(pokedexApp);
        r5->unk_0 = 8;
        break;
    case 8:
        ov18_021F11C0(pokedexApp, 18, 1);
        ov18_021F11C0(pokedexApp, 19, 1);
        ov18_021F11C0(pokedexApp, 20, 1);
        ov18_021F11C0(pokedexApp, 21, 1);
        ov18_021F11C0(pokedexApp, 25, 1);
        ov18_021F2C5C(pokedexApp, 18, 0);
        ov18_021F2E80(pokedexApp, 18, 0);
        ov18_021F2C10(pokedexApp, 19, 0);
        r5->unk_0 = 9;
        break;
    case 9:
        if (!ov18_021F11AC(pokedexApp, 27)) {
            ov18_021F118C(pokedexApp, 26, 1);
            ov18_021F11C0(pokedexApp, 27, 0);
            r5->unk_0 = 10;
        }
        break;
    case 10:
        ++r5->unk_2;
        if (r5->unk_2 == 32) {
            ov18_021EEED0(pokedexApp, 1);
            ov18_021F3BA4(pokedexApp);
            ov18_021F3BD4(pokedexApp, -8);
            ov18_021E7B6C(TRUE);
            sub_020196E8(pokedexApp->unk_0008, 9, 0, 0);
            sub_020196E8(pokedexApp->unk_0008, 10, 0, 0);
            sub_020196E8(pokedexApp->unk_0008, 11, 0, 24);
            sub_020196E8(pokedexApp->unk_0008, 12, 0, 24);
            sub_020198FC(pokedexApp->unk_0008, 9, 0, -1, 24);
            sub_020198FC(pokedexApp->unk_0008, 10, 0, -1, 24);
            sub_020198FC(pokedexApp->unk_0008, 11, 0, -1, 24);
            sub_020198FC(pokedexApp->unk_0008, 12, 0, -1, 24);
            PlaySE(SEQ_SE_GS_ZUKAN06);
            r5->unk_2 = 0;
            r5->unk_0 = 11;
        }
        break;
    case 11:
        if (!sub_020199E4(pokedexApp->unk_0008, 9)) {
            ov18_021E7B6C(FALSE);
            r5->unk_0 = 12;
        } else {
            ov18_021F3BD4(pokedexApp, -8);
        }
        break;
    case 12:
        GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000004_NCGR_lz, pokedexApp->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, TRUE, HEAP_ID_37);
        GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000019_NCGR_lz, pokedexApp->bgConfig, GF_BG_LYR_SUB_3, 0, 0, TRUE, HEAP_ID_37);
        GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000020_NSCR_lz, pokedexApp->bgConfig, GF_BG_LYR_SUB_3, 0, 0, TRUE, HEAP_ID_37);
        ov18_021E669C(pokedexApp);
        ov18_021F3448(pokedexApp);
        r5->unk_0 = 13;
        break;
    case 13:
        if (!sub_020199E4(pokedexApp->unk_0008, 8)) {
            r5->unk_0 = 14;
        }
        break;
    case 14:
        ov18_021F7B74(pokedexApp);
        ov18_021F11C0(pokedexApp, 0, 1);
        ov18_021F2BB0(pokedexApp, 0);
        ov18_021F118C(pokedexApp, 0, 1);
        ov18_021F3190(pokedexApp);
        ov18_021EDEB0(pokedexApp);
        ov18_021E659C(pokedexApp);
        MI_CpuClear8(&pokedexApp->unk_0868, sizeof(pokedexApp->unk_0868));
        return POKEDEXAPP_MAINSEQ_57;
    case 15:
        if (!ov18_021F11AC(pokedexApp, 27)) {
            ov18_021F118C(pokedexApp, 26, 3);
            ov18_021F11C0(pokedexApp, 27, 0);
            r5->unk_0 = 16;
        }
        break;
    case 16:
        if (!ov18_021F11AC(pokedexApp, 26)) {
            ov18_021EEED0(pokedexApp, 10);
            PlaySE(SEQ_SE_DP_CUSTOM06);
            r5->unk_0 = 17;
        }
        break;
    case 17:
        ++r5->unk_2;
        if ((gSystem.newKeys & (PAD_BUTTON_A | PAD_BUTTON_B)) || System_GetTouchNew() == TRUE || r5->unk_2 == 60) {
            ov18_021EEED0(pokedexApp, 0);
            ov18_021E65FC(pokedexApp);
            r5->unk_2 = 0;
            r5->unk_0 = 18;
        }
        break;
    case 18:
        if (!sub_020199E4(pokedexApp->unk_0008, 6)) {
            ov18_021F11C0(pokedexApp, 0, 1);
            MI_CpuClear8(&pokedexApp->unk_0868, sizeof(pokedexApp->unk_0868));
            return POKEDEXAPP_MAINSEQ_22;
        }
        break;
    }

    return POKEDEXAPP_MAINSEQ_23;
}
