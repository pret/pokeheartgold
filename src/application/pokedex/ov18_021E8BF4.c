#include "application/pokedex/pokedex_internal.h"
#include "application/pokedex/pokedex_internal_constants.h"
#include "graphic/zukan_gra.naix"

#include "font.h"
#include "gf_gfx_loader.h"
#include "list_menu_items.h"
#include "sound_02004A44.h"
#include "unk_02005D10.h"
#include "unk_0200FA24.h"
#include "unk_020210A0.h"
#include "unk_0208805C.h"

#define PLTTBUF_EXCEPT_MAIN_BG_F (PLTTBUF_SUB_BG_F | PLTTBUF_MAIN_OBJ_F | PLTTBUF_SUB_OBJ_F)
#define PLTTFADE_OPAQUE_ALL_F    (0xFFFF)

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
void ov18_021EA350(PokedexAppData *pokedexApp, int bgId, int a2);
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
void ov18_021EAD74(u32 *pOut, int hmin, int hmax, u32 *pStep, int direction);
void ov18_021EADB8(PokedexAppData *pokedexApp, int a1, int a2, int a3, int a4);
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
int ov18_021EC1DC(PokedexAppData *pokedexApp, u8 a1, u8 a2);
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

static int (*const sMainSeqFuncs[POKEDEXAPP_MAINSEQ_MAX])(PokedexAppData *pokedexApp) = {
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
    if (*pState == POKEDEXAPP_MAINSEQ_MAX) {
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
    PaletteData_BeginPaletteFade(pokedexApp->paletteData, 0xF, PLTTFADE_OPAQUE_ALL_F, -127, 0, 0, RGB_BLACK);
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
        PaletteData_BeginPaletteFade(pokedexApp->paletteData, PLTTBUF_MAIN_BG_F, PLTTFADE_OPAQUE_ALL_F & ~(1 << 0), 0, 0, 16, RGB_BLACK);
        PaletteData_BeginPaletteFade(pokedexApp->paletteData, PLTTBUF_EXCEPT_MAIN_BG_F, PLTTFADE_OPAQUE_ALL_F, 0, 0, 16, RGB_BLACK);
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
            ZeroPalettesByBitmask(PLTTBUF_MAIN_BG_F | PLTTBUF_SUB_BG_F | PLTTBUF_MAIN_OBJ_F | PLTTBUF_SUB_OBJ_F, HEAP_ID_37);
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
        PaletteData_BeginPaletteFade(pokedexApp->paletteData, PLTTBUF_MAIN_BG_F, PLTTFADE_OPAQUE_ALL_F & ~(1 << 0), 0, 0, 16, RGB_BLACK);
        PaletteData_BeginPaletteFade(pokedexApp->paletteData, PLTTBUF_EXCEPT_MAIN_BG_F, PLTTFADE_OPAQUE_ALL_F, 0, 0, 16, RGB_BLACK);
        pokedexApp->unk_085C = POKEDEXAPP_MAINSEQ_18;
        ++pokedexApp->unk_0868.state_10.unk_0;
        return POKEDEXAPP_MAINSEQ_03;
    case 1:
        if (!sub_020199E4(pokedexApp->unk_0008, 1)) {
            ScheduleSetBgPosText(pokedexApp->bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_SET_X, 0);
            ScheduleSetBgPosText(pokedexApp->bgConfig, GF_BG_LYR_SUB_0, BG_POS_OP_SET_X, 0);
            ZeroPalettesByBitmask(PLTTBUF_MAIN_BG_F | PLTTBUF_SUB_BG_F | PLTTBUF_MAIN_OBJ_F | PLTTBUF_SUB_OBJ_F, HEAP_ID_37);
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
        PaletteData_BeginPaletteFade(pokedexApp->paletteData, PLTTBUF_MAIN_BG_F, PLTTFADE_OPAQUE_ALL_F & ~(1 << 4), 0, 16, 0, RGB_BLACK);
        PaletteData_BeginPaletteFade(pokedexApp->paletteData, PLTTBUF_EXCEPT_MAIN_BG_F, PLTTFADE_OPAQUE_ALL_F, 0, 16, 0, RGB_BLACK);
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
        ov18_021F7ED4(pokedexApp, pokedexApp->unk_1858, pokedexApp->dexSearchCriteria[dex_search_criteria_sort_order], pokedexApp->dexSearchCriteria[dex_search_criteria_letter], pokedexApp->dexSearchCriteria[dex_search_criteria_type1], pokedexApp->dexSearchCriteria[dex_search_criteria_type2], pokedexApp->dexSearchCriteria[dex_search_criteria_height_min], pokedexApp->dexSearchCriteria[dex_search_criteria_height_max], pokedexApp->dexSearchCriteria[dex_search_criteria_weight_min], pokedexApp->dexSearchCriteria[dex_search_criteria_weight_max], 1 << pokedexApp->dexSearchCriteria[dex_search_criteria_area], pokedexApp->dexSearchCriteria[dex_search_criteria_body_type]);
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
        ov18_021EA350(pokedexApp, GF_BG_LYR_MAIN_0, 9);
        r5->unk_0 = 3;
        break;
    case 3:
        ov18_021EA350(pokedexApp, GF_BG_LYR_MAIN_2, 10);
        r5->unk_0 = 4;
        break;
    case 4:
        ov18_021EA350(pokedexApp, GF_BG_LYR_MAIN_0, 11);
        r5->unk_0 = 5;
        break;
    case 5:
        ov18_021EA350(pokedexApp, GF_BG_LYR_MAIN_2, 12);
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

void ov18_021EA350(PokedexAppData *pokedexApp, int bgId, int a2) {
    sub_02019668(pokedexApp->unk_0008, a2, GetBgTilemapBuffer(pokedexApp->bgConfig, bgId));
}

int PokedexApp_MainSeq_24(PokedexAppData *pokedexApp) {
    ov18_021E6FFC(pokedexApp);
    ov18_021EF528(pokedexApp);
    ov18_021F3494(pokedexApp);
    return POKEDEXAPP_MAINSEQ_22;
}

int PokedexApp_MainSeq_25(PokedexAppData *pokedexApp) {
    switch (pokedexApp->unk_0868.state_10.unk_0) {
    case 0:
        ov18_021F11C0(pokedexApp, 0, 0);
        ov18_021E6624(pokedexApp);
        PaletteData_BeginPaletteFade(pokedexApp->paletteData, PLTTBUF_MAIN_BG_F, PLTTFADE_OPAQUE_ALL_F & ~(1 << 4), 0, 0, 16, RGB_BLACK);
        PaletteData_BeginPaletteFade(pokedexApp->paletteData, PLTTBUF_EXCEPT_MAIN_BG_F, PLTTFADE_OPAQUE_ALL_F, 0, 0, 16, RGB_BLACK);
        pokedexApp->unk_085C = POKEDEXAPP_MAINSEQ_25;
        ++pokedexApp->unk_0868.state_10.unk_0;
        return POKEDEXAPP_MAINSEQ_03;
    case 1:
        ZeroPalettesByBitmask(PLTTBUF_MAIN_BG_F | PLTTBUF_SUB_BG_F | PLTTBUF_MAIN_OBJ_F | PLTTBUF_SUB_OBJ_F, HEAP_ID_37);
        ov18_021F7B74(pokedexApp);
        ov18_021EE388(pokedexApp);
        ov18_021F3438(pokedexApp);
        ov18_021F3448(pokedexApp);
        pokedexApp->unk_0868.state_10.unk_0 = 0;
        return POKEDEXAPP_MAINSEQ_19;
    }

    return POKEDEXAPP_MAINSEQ_25;
}

int PokedexApp_MainSeq_19(PokedexAppData *pokedexApp) {
    switch (pokedexApp->unk_0868.state_10.unk_0) {
    case 0:
        ov18_021F7ED4(pokedexApp, pokedexApp->unk_1858, 0, 26, 17, 17, 0, 152, 0, 152, 8, 14);
        ov18_021F8884(pokedexApp, 1);
        ++pokedexApp->unk_0868.state_10.unk_0;
        break;
    case 1:
        ov18_021E67C8(pokedexApp, 0);
        if (ov18_021F8824(pokedexApp) >= ov18_021F891C(pokedexApp, TRUE)) {
            ov18_021E6FB8(pokedexApp->bgConfig, GF_BG_LYR_SUB_3, pokedexApp->gfxNarc, HEAP_ID_37);
            ClearWindowTilemapAndScheduleTransfer(&pokedexApp->windows[7]);
            ov18_021F11C0(pokedexApp, 10, 0);
        }
        sub_0201980C(pokedexApp->unk_0008, 0);
        ov18_021E65AC(pokedexApp);
        ScheduleSetBgPosText(pokedexApp->bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_SET_X, 256);
        ScheduleSetBgPosText(pokedexApp->bgConfig, GF_BG_LYR_SUB_0, BG_POS_OP_SET_X, 256);
        ov18_021F2B3C(pokedexApp, 0, -256);
        PaletteData_BeginPaletteFade(pokedexApp->paletteData, PLTTBUF_MAIN_BG_F, PLTTFADE_OPAQUE_ALL_F & ~(1 << 0), 0, 16, 0, RGB_BLACK);
        PaletteData_BeginPaletteFade(pokedexApp->paletteData, PLTTBUF_EXCEPT_MAIN_BG_F, PLTTFADE_OPAQUE_ALL_F, 0, 16, 0, RGB_BLACK);
        pokedexApp->unk_085C = POKEDEXAPP_MAINSEQ_19;
        ++pokedexApp->unk_0868.state_10.unk_0;
        return POKEDEXAPP_MAINSEQ_03;
    case 2: {
        u16 species = ov18_021F8838(pokedexApp);
        ov18_021E659C(pokedexApp);
        if (species != SPECIES_NONE) {
            ov18_021F2A84(pokedexApp, 8, 1);
        } else {
            ov18_021F2A84(pokedexApp, 8, 0);
        }
        if (ov18_021E6D38(pokedexApp, species) == TRUE) {
            ov18_021F2A2C(pokedexApp, 6, 1);
        }
        ov18_021EE638(pokedexApp, species, 6);
        pokedexApp->unk_0868.state_10.unk_0 = 0;
        return POKEDEXAPP_MAINSEQ_11;
    }
    }

    return POKEDEXAPP_MAINSEQ_19;
}

int PokedexApp_MainSeq_20(PokedexAppData *pokedexApp) {
    PokedexAppData_UnkSub0868_State09 *r4 = &pokedexApp->unk_0868.state_09;

    switch (r4->unk_0) {
    case 0:
        sub_0201980C(pokedexApp->unk_0008, 4);
        ov18_021F2A2C(pokedexApp, 6, 0);
        ov18_021F2A84(pokedexApp, 8, 0);
        ClearWindowTilemapAndScheduleTransfer(&pokedexApp->windows[6]);
        ov18_021E65D4(pokedexApp);
        r4->unk_2 = 0;
        ++r4->unk_0;
        // fallthrough
    case 1:
        if (r4->unk_2 == 10) {
            ov18_021EDB3C(pokedexApp, POKEDEXAPP_MAINSEQ_MAX);
        } else if (r4->unk_2 > 10 && IsPaletteFadeFinished() == TRUE) {
            MI_CpuClear8(&pokedexApp->unk_0868, sizeof(pokedexApp->unk_0868));
            pokedexApp->unk_085C = POKEDEXAPP_MAINSEQ_MAX;
            return POKEDEXAPP_MAINSEQ_01;
        }
        ++r4->unk_2;
        if (Bg_GetXpos(pokedexApp->bgConfig, GF_BG_LYR_MAIN_0) == 0) {
            ScheduleSetBgPosText(pokedexApp->bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_SET_X, 0);
            ScheduleSetBgPosText(pokedexApp->bgConfig, GF_BG_LYR_SUB_0, BG_POS_OP_SET_X, 0);
            ov18_021F2B70(pokedexApp, 0, ov18_021F2B9C(pokedexApp));
        } else {
            ScheduleSetBgPosText(pokedexApp->bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_SUB_X, 16);
            ScheduleSetBgPosText(pokedexApp->bgConfig, GF_BG_LYR_SUB_0, BG_POS_OP_SUB_X, 16);
            ov18_021F2B3C(pokedexApp, 0, 16);
        }
        break;
    }

    return POKEDEXAPP_MAINSEQ_20;
}

int PokedexApp_MainSeq_26(PokedexAppData *pokedexApp) {
    PokedexAppData_UnkSub0868_State26 *r4 = &pokedexApp->unk_0868.state_26;

    switch (r4->unk_2) {
    case 0:
        ov18_021F11C0(pokedexApp, 0, 0);
        ov18_021E6624(pokedexApp);
        PaletteData_BeginPaletteFade(pokedexApp->paletteData, PLTTBUF_MAIN_BG_F, PLTTFADE_OPAQUE_ALL_F & ~(1 << 4), 0, 0, 16, RGB_BLACK);
        PaletteData_BeginPaletteFade(pokedexApp->paletteData, PLTTBUF_EXCEPT_MAIN_BG_F, PLTTFADE_OPAQUE_ALL_F, 0, 0, 16, RGB_BLACK);
        pokedexApp->unk_085C = POKEDEXAPP_MAINSEQ_26;
        ++r4->unk_2;
        return POKEDEXAPP_MAINSEQ_03;
    case 1:
        ov18_021F7B74(pokedexApp);
        ov18_021E664C(pokedexApp);
        ov18_021E71D0(pokedexApp, r4->unk_0, r4->unk_3);
        PaletteData_BeginPaletteFade(pokedexApp->paletteData, PLTTBUF_MAIN_BG_F, PLTTFADE_OPAQUE_ALL_F & ~(1 << 4), 0, 16, 0, RGB_BLACK);
        PaletteData_BeginPaletteFade(pokedexApp->paletteData, PLTTBUF_EXCEPT_MAIN_BG_F, PLTTFADE_OPAQUE_ALL_F, 0, 16, 0, RGB_BLACK);
        pokedexApp->unk_085C = r4->unk_1;
        MI_CpuClear8(&pokedexApp->unk_0868, sizeof(pokedexApp->unk_0868));
        return POKEDEXAPP_MAINSEQ_03;
    }

    return POKEDEXAPP_MAINSEQ_26; // if we're here, we're softlocked
}

int PokedexApp_MainSeq_27(PokedexAppData *pokedexApp) {
    PokedexAppData_UnkSub0868_State26 *r4 = &pokedexApp->unk_0868.state_26;

    switch (r4->unk_2) {
    case 0:
        ov18_021F11C0(pokedexApp, 0, 0);
        ov18_021E6674(pokedexApp);
        PaletteData_BeginPaletteFade(pokedexApp->paletteData, PLTTBUF_MAIN_BG_F, PLTTFADE_OPAQUE_ALL_F & ~(1 << 4), 0, 0, 16, RGB_BLACK);
        PaletteData_BeginPaletteFade(pokedexApp->paletteData, PLTTBUF_EXCEPT_MAIN_BG_F, PLTTFADE_OPAQUE_ALL_F, 0, 0, 16, RGB_BLACK);
        pokedexApp->unk_085C = POKEDEXAPP_MAINSEQ_27;
        ++r4->unk_2;
        return POKEDEXAPP_MAINSEQ_03;
    case 1:
        ov18_021F7B74(pokedexApp);
        ov18_021E65FC(pokedexApp);
        ov18_021E71D0(pokedexApp, 0, r4->unk_3);
        PaletteData_BeginPaletteFade(pokedexApp->paletteData, PLTTBUF_MAIN_BG_F, PLTTFADE_OPAQUE_ALL_F & ~(1 << 4), 0, 16, 0, RGB_BLACK);
        PaletteData_BeginPaletteFade(pokedexApp->paletteData, PLTTBUF_EXCEPT_MAIN_BG_F, PLTTFADE_OPAQUE_ALL_F, 0, 16, 0, RGB_BLACK);
        pokedexApp->unk_085C = r4->unk_1;
        MI_CpuClear8(&pokedexApp->unk_0868, sizeof(pokedexApp->unk_0868));
        return POKEDEXAPP_MAINSEQ_03;
    }

    return POKEDEXAPP_MAINSEQ_27; // if we're here, we're softlocked
}

int PokedexApp_MainSeq_28(PokedexAppData *pokedexApp) {
    pokedexApp->dexSearchCriteriaBak[0] = pokedexApp->dexSearchCriteria[dex_search_criteria_sort_order];
    ov18_021EDE4C(pokedexApp, 1, 0, POKEDEXAPP_MAINSEQ_29);
    return POKEDEXAPP_MAINSEQ_26;
}

int PokedexApp_MainSeq_29(PokedexAppData *pokedexApp) {
    switch (ov18_021F6F08(pokedexApp)) {
    case dex_order_national:
        (void)MenuInputStateMgr_GetState(pokedexApp->args->menuInputStatePtr);
        PlaySE(SEQ_SE_GS_ZKN04);
        ov18_021E74B8(pokedexApp, 0);
        break;
    case dex_order_johto:
        (void)MenuInputStateMgr_GetState(pokedexApp->args->menuInputStatePtr);
        PlaySE(SEQ_SE_GS_ZKN04);
        ov18_021E74B8(pokedexApp, 1);
        break;
    case dex_order_alphabetical:
        (void)MenuInputStateMgr_GetState(pokedexApp->args->menuInputStatePtr);
        PlaySE(SEQ_SE_GS_ZKN04);
        ov18_021E74B8(pokedexApp, 2);
        break;
    case dex_order_heaviest:
        (void)MenuInputStateMgr_GetState(pokedexApp->args->menuInputStatePtr);
        PlaySE(SEQ_SE_GS_ZKN04);
        ov18_021E74B8(pokedexApp, 3);
        break;
    case dex_order_lightest:
        (void)MenuInputStateMgr_GetState(pokedexApp->args->menuInputStatePtr);
        PlaySE(SEQ_SE_GS_ZKN04);
        ov18_021E74B8(pokedexApp, 4);
        break;
    case dex_order_tallest:
        (void)MenuInputStateMgr_GetState(pokedexApp->args->menuInputStatePtr);
        PlaySE(SEQ_SE_GS_ZKN04);
        ov18_021E74B8(pokedexApp, 5);
        break;
    case dex_order_shortest:
        (void)MenuInputStateMgr_GetState(pokedexApp->args->menuInputStatePtr);
        PlaySE(SEQ_SE_GS_ZKN04);
        return ov18_021EDBDC(pokedexApp, 0, 10, POKEDEXAPP_MAINSEQ_30);
    case dex_order_quit:
    case LIST_CANCEL:
        PlaySE(SEQ_SE_GS_GEARCANCEL);
        pokedexApp->dexSearchCriteria[dex_search_criteria_sort_order] = pokedexApp->dexSearchCriteriaBak[0];
        return ov18_021EDBDC(pokedexApp, 22, 10, POKEDEXAPP_MAINSEQ_30);
    }

    return POKEDEXAPP_MAINSEQ_29;
}

int PokedexApp_MainSeq_30(PokedexAppData *pokedexApp) {
    ov18_021EDE4C(pokedexApp, 0, 0, POKEDEXAPP_MAINSEQ_22);
    return POKEDEXAPP_MAINSEQ_27;
}

int PokedexApp_MainSeq_31(PokedexAppData *pokedexApp) {
    pokedexApp->dexSearchCriteriaBak[0] = pokedexApp->dexSearchCriteria[dex_search_criteria_letter];
    ov18_021EDE4C(pokedexApp, 2, 0, POKEDEXAPP_MAINSEQ_32);
    return POKEDEXAPP_MAINSEQ_26;
}

int PokedexApp_MainSeq_32(PokedexAppData *pokedexApp) {
    u32 r4 = ov18_021F6FE8(pokedexApp);
    switch (r4) {
    case -4:
    case -3:
    case -1:
        break;
    case dex_search_letters_submit:
        (void)MenuInputStateMgr_GetState(pokedexApp->args->menuInputStatePtr);
        PlaySE(SEQ_SE_GS_ZKN04);
        return ov18_021EDBDC(pokedexApp, 0, 10, POKEDEXAPP_MAINSEQ_33);
    case dex_search_letters_cancel:
    case -2:
        PlaySE(SEQ_SE_GS_GEARCANCEL);
        pokedexApp->dexSearchCriteria[dex_search_criteria_letter] = pokedexApp->dexSearchCriteriaBak[0];
        return ov18_021EDBDC(pokedexApp, 22, 10, POKEDEXAPP_MAINSEQ_33);
    default:
        (void)MenuInputStateMgr_GetState(pokedexApp->args->menuInputStatePtr);
        PlaySE(SEQ_SE_GS_ZKN04);
        ov18_021E76EC(pokedexApp, r4);
        break;
    }

    return POKEDEXAPP_MAINSEQ_32;
}

int PokedexApp_MainSeq_33(PokedexAppData *pokedexApp) {
    ov18_021EDE4C(pokedexApp, 0, 1, POKEDEXAPP_MAINSEQ_22);
    return POKEDEXAPP_MAINSEQ_27;
}

int PokedexApp_MainSeq_34(PokedexAppData *pokedexApp) {
    pokedexApp->dexSearchCriteriaBak[0] = pokedexApp->dexSearchCriteria[dex_search_criteria_type1];
    pokedexApp->dexSearchCriteriaBak[1] = pokedexApp->dexSearchCriteria[dex_search_criteria_type2];
    ov18_021EDE4C(pokedexApp, 3, 0, POKEDEXAPP_MAINSEQ_35);
    return POKEDEXAPP_MAINSEQ_26;
}

int PokedexApp_MainSeq_35(PokedexAppData *pokedexApp) {
    u32 r0 = ov18_021F716C(pokedexApp);
    switch (r0) {
    case -4:
    case -3:
    case -1:
        break;
    case dex_search_type_submit:
        if (pokedexApp->dexSearchCriteria[dex_search_criteria_type1] == pokedexApp->dexSearchCriteria[dex_search_criteria_type2]) {
            pokedexApp->dexSearchCriteria[dex_search_criteria_type2] = dex_search_type_all;
        }
        (void)MenuInputStateMgr_GetState(pokedexApp->args->menuInputStatePtr);
        PlaySE(SEQ_SE_GS_ZKN04);
        return ov18_021EDBDC(pokedexApp, 0, 10, POKEDEXAPP_MAINSEQ_36);
    case dex_search_type_cancel:
    case -2:
        pokedexApp->dexSearchCriteria[dex_search_criteria_type1] = pokedexApp->dexSearchCriteriaBak[0];
        pokedexApp->dexSearchCriteria[dex_search_criteria_type2] = pokedexApp->dexSearchCriteriaBak[1];
        PlaySE(SEQ_SE_GS_GEARCANCEL);
        return ov18_021EDBDC(pokedexApp, 22, 10, POKEDEXAPP_MAINSEQ_36);
    default:
        if (r0 == dex_search_type_all) {
            if (pokedexApp->dexSearchCriteria[dex_search_criteria_type2] != dex_search_type_all) {
                pokedexApp->dexSearchCriteria[dex_search_criteria_type2] = r0;
            } else {
                pokedexApp->dexSearchCriteria[dex_search_criteria_type1] = r0;
            }
        } else if (pokedexApp->dexSearchCriteria[dex_search_criteria_type1] == dex_search_type_all) {
            pokedexApp->dexSearchCriteria[dex_search_criteria_type1] = r0;
        } else if (pokedexApp->dexSearchCriteria[dex_search_criteria_type2] == dex_search_type_all) {
            if (pokedexApp->dexSearchCriteria[dex_search_criteria_type1] == r0) {
                break;
            }
            pokedexApp->dexSearchCriteria[dex_search_criteria_type2] = r0;
        } else {
            if (pokedexApp->dexSearchCriteria[dex_search_criteria_type2] == r0) {
                break;
            }
            pokedexApp->dexSearchCriteria[dex_search_criteria_type1] = pokedexApp->dexSearchCriteria[dex_search_criteria_type2];
            pokedexApp->dexSearchCriteria[dex_search_criteria_type2] = r0;
        }
        (void)MenuInputStateMgr_GetState(pokedexApp->args->menuInputStatePtr);
        PlaySE(SEQ_SE_GS_ZKN04);
        ov18_021E74E4(pokedexApp);
        ov18_021EFC9C(pokedexApp, pokedexApp->dexSearchCriteria[dex_search_criteria_type1], 45, 29);
        ov18_021EFC9C(pokedexApp, pokedexApp->dexSearchCriteria[dex_search_criteria_type2], 46, 35);
        ScheduleWindowCopyToVram(&pokedexApp->windows[45]);
        ScheduleWindowCopyToVram(&pokedexApp->windows[46]);
        break;
    }

    return POKEDEXAPP_MAINSEQ_35;
}

int PokedexApp_MainSeq_36(PokedexAppData *pokedexApp) {
    ov18_021EDE4C(pokedexApp, 0, 2, POKEDEXAPP_MAINSEQ_22);
    return POKEDEXAPP_MAINSEQ_27;
}

int PokedexApp_MainSeq_37(PokedexAppData *pokedexApp) {
    pokedexApp->dexSearchCriteriaBak[0] = pokedexApp->dexSearchCriteria[dex_search_criteria_height_min];
    pokedexApp->dexSearchCriteriaBak[1] = pokedexApp->dexSearchCriteria[dex_search_criteria_height_max];
    ov18_021EDE4C(pokedexApp, 4, 0, POKEDEXAPP_MAINSEQ_38);
    return POKEDEXAPP_MAINSEQ_26;
}

int PokedexApp_MainSeq_38(PokedexAppData *pokedexApp) {
    PokedexAppData_UnkSub0868_State38 *r5 = &pokedexApp->unk_0868.state_38;

    switch (ov18_021F739C(pokedexApp)) {
    case 0:
        r5->unk_0 = pokedexApp->dexSearchCriteria[dex_search_criteria_height_max];
        r5->unk_4 = 0;
        ov18_021F36D4(pokedexApp, 0, 5, 1);
        return POKEDEXAPP_MAINSEQ_40;
    case 1:
        r5->unk_0 = pokedexApp->dexSearchCriteria[dex_search_criteria_height_min];
        r5->unk_4 = 0;
        ov18_021F36D4(pokedexApp, 0, 11, 1);
        return POKEDEXAPP_MAINSEQ_41;
    case 2:
        (void)MenuInputStateMgr_GetState(pokedexApp->args->menuInputStatePtr);
        PlaySE(SEQ_SE_GS_ZKN04);
        MI_CpuClear8(&pokedexApp->unk_0868, sizeof(pokedexApp->unk_0868));
        return ov18_021EDBDC(pokedexApp, 0, 10, POKEDEXAPP_MAINSEQ_39);
    case 3:
    case -2:
        PlaySE(SEQ_SE_GS_GEARCANCEL);
        pokedexApp->dexSearchCriteria[dex_search_criteria_height_min] = pokedexApp->dexSearchCriteriaBak[0];
        pokedexApp->dexSearchCriteria[dex_search_criteria_height_max] = pokedexApp->dexSearchCriteriaBak[1];
        MI_CpuClear8(&pokedexApp->unk_0868, sizeof(pokedexApp->unk_0868));
        return ov18_021EDBDC(pokedexApp, 22, 10, POKEDEXAPP_MAINSEQ_39);
    case 4:
        if (pokedexApp->dexSearchCriteria[dex_search_criteria_height_max] == 152) {
            break;
        }
        (void)MenuInputStateMgr_GetState(pokedexApp->args->menuInputStatePtr);
        PlaySE(SEQ_SE_GS_ZKN04);
        r5->unk_8 = 2;
        r5->unk_A = 1;
        ov18_021F118C(pokedexApp, r5->unk_8, 54);
        return POKEDEXAPP_MAINSEQ_42;
    case 5:
        if (pokedexApp->dexSearchCriteria[dex_search_criteria_height_max] > pokedexApp->dexSearchCriteria[dex_search_criteria_height_min]) {
            (void)MenuInputStateMgr_GetState(pokedexApp->args->menuInputStatePtr);
            PlaySE(SEQ_SE_GS_ZKN04);
            r5->unk_8 = 1;
            r5->unk_A = -1;
            ov18_021F118C(pokedexApp, r5->unk_8, 57);
            return POKEDEXAPP_MAINSEQ_42;
        }
        break;
    case 6:
        if (pokedexApp->dexSearchCriteria[dex_search_criteria_height_min] < pokedexApp->dexSearchCriteria[dex_search_criteria_height_max]) {
            (void)MenuInputStateMgr_GetState(pokedexApp->args->menuInputStatePtr);
            PlaySE(SEQ_SE_GS_ZKN04);
            r5->unk_8 = 4;
            r5->unk_A = 1;
            ov18_021F118C(pokedexApp, r5->unk_8, 54);
            return POKEDEXAPP_MAINSEQ_43;
        }
        break;
    case 7:
        if (pokedexApp->dexSearchCriteria[dex_search_criteria_height_min] == 0) {
            break;
        }
        (void)MenuInputStateMgr_GetState(pokedexApp->args->menuInputStatePtr);
        PlaySE(SEQ_SE_GS_ZKN04);
        r5->unk_8 = 3;
        r5->unk_A = -1;
        ov18_021F118C(pokedexApp, r5->unk_8, 57);
        return POKEDEXAPP_MAINSEQ_43;
    case -1:
        if ((gSystem.heldKeys & PAD_KEY_LEFT) || (gSystem.heldKeys & PAD_KEY_RIGHT) || System_GetTouchHeld()) {
            break;
        }
        r5->unk_4 = 0;
        break;
    }

    return POKEDEXAPP_MAINSEQ_38;
}

void ov18_021EAD74(u32 *pOut, int hmin, int hmax, u32 *pStep, int direction) {
    int tmp;
    int step;

    if (*pStep != 24) {
        ++(*pStep);
    }
    if (*pStep >= 24) {
        step = 32;
    } else if (*pStep >= 16) {
        step = 16;
    } else if (*pStep >= 8) {
        step = 8;
    } else {
        step = 1;
    }
    tmp = (*pOut) + step * direction;
    if (tmp < hmin) {
        tmp = hmin;
    } else if (tmp > hmax) {
        tmp = hmax;
    }
    *pOut = tmp;
}

void ov18_021EADB8(PokedexAppData *pokedexApp, int a1, BOOL a2, int a3, int a4) {
    if (a2 == FALSE) {
        ov18_021F36D4(pokedexApp, ov18_021F3AD0(pokedexApp, a1), a3, 1);
        ov18_021F38F0(pokedexApp, a3 + 1, pokedexApp->unk_1850[a1].unk_0);
        ov18_021EFD00(pokedexApp, pokedexApp->unk_1850[a1].unk_0, a4);
        ScheduleWindowCopyToVram(&pokedexApp->windows[a4]);
    } else {
        ov18_021F37D4(pokedexApp, ov18_021F3AD0(pokedexApp, a1), a3, 1);
        ov18_021F39C4(pokedexApp, a3 + 1, pokedexApp->unk_1850[a1].unk_2);
        ov18_021EFDB4(pokedexApp, pokedexApp->unk_1850[a1].unk_2, a4);
        ScheduleWindowCopyToVram(&pokedexApp->windows[a4]);
    }
}

int PokedexApp_MainSeq_39(PokedexAppData *pokedexApp) {
    ov18_021EDE4C(pokedexApp, 0, 3, POKEDEXAPP_MAINSEQ_22);
    return POKEDEXAPP_MAINSEQ_27;
}

int PokedexApp_MainSeq_40(PokedexAppData *pokedexApp) {
    u32 sp4;
    u32 r4;
    PokedexAppData_UnkSub0868_State38 *r4_2 = &pokedexApp->unk_0868.state_38;

    if (!ov18_021F765C(&sp4)) {
        if (pokedexApp->dexSearchCriteria[dex_search_criteria_height_max] < pokedexApp->dexSearchCriteria[dex_search_criteria_height_min]) {
            pokedexApp->dexSearchCriteria[dex_search_criteria_height_max] = r4_2->unk_0;
        }
        ov18_021EADB8(pokedexApp, pokedexApp->dexSearchCriteria[dex_search_criteria_height_max], FALSE, 5, 70);
        ov18_021F3A64(pokedexApp, pokedexApp->dexSearchCriteria[dex_search_criteria_height_max], 1);
        return POKEDEXAPP_MAINSEQ_38;
    }

    r4 = pokedexApp->dexSearchCriteria[dex_search_criteria_height_max];
    ov18_021F36D4(pokedexApp, sp4, 5, 1);
    pokedexApp->dexSearchCriteria[dex_search_criteria_height_max] = ov18_021F3AB0(pokedexApp, 5);
    ov18_021F38F0(pokedexApp, 6, pokedexApp->unk_1850[pokedexApp->dexSearchCriteria[dex_search_criteria_height_max]].unk_0);
    ov18_021EFD00(pokedexApp, pokedexApp->unk_1850[pokedexApp->dexSearchCriteria[dex_search_criteria_height_max]].unk_0, 70);
    ScheduleWindowCopyToVram(&pokedexApp->windows[70]);
    ov18_021F3A64(pokedexApp, pokedexApp->dexSearchCriteria[dex_search_criteria_height_max], 1);
    if (r4 != pokedexApp->dexSearchCriteria[dex_search_criteria_height_max]) {
        PlaySE(SEQ_SE_GS_ZKN03);
    }
    return POKEDEXAPP_MAINSEQ_40;
}

int PokedexApp_MainSeq_41(PokedexAppData *pokedexApp) {
    u32 sp4;
    u32 r4;
    PokedexAppData_UnkSub0868_State38 *r4_2 = &pokedexApp->unk_0868.state_38;

    if (!ov18_021F765C(&sp4)) {
        if (pokedexApp->dexSearchCriteria[dex_search_criteria_height_min] > pokedexApp->dexSearchCriteria[dex_search_criteria_height_max]) {
            pokedexApp->dexSearchCriteria[dex_search_criteria_height_min] = r4_2->unk_0;
        }
        ov18_021EADB8(pokedexApp, pokedexApp->dexSearchCriteria[dex_search_criteria_height_min], FALSE, 11, 69);
        ov18_021F3A64(pokedexApp, pokedexApp->dexSearchCriteria[dex_search_criteria_height_min], 3);
        return POKEDEXAPP_MAINSEQ_38;
    }

    r4 = pokedexApp->dexSearchCriteria[dex_search_criteria_height_min];
    ov18_021F36D4(pokedexApp, sp4, 11, 1);
    pokedexApp->dexSearchCriteria[dex_search_criteria_height_min] = ov18_021F3AB0(pokedexApp, 11);
    ov18_021F38F0(pokedexApp, 12, pokedexApp->unk_1850[pokedexApp->dexSearchCriteria[dex_search_criteria_height_min]].unk_0);
    ov18_021EFD00(pokedexApp, pokedexApp->unk_1850[pokedexApp->dexSearchCriteria[dex_search_criteria_height_min]].unk_0, 69);
    ScheduleWindowCopyToVram(&pokedexApp->windows[69]);
    ov18_021F3A64(pokedexApp, pokedexApp->dexSearchCriteria[dex_search_criteria_height_min], 3);
    if (r4 != pokedexApp->dexSearchCriteria[dex_search_criteria_height_min]) {
        PlaySE(SEQ_SE_GS_ZKN03);
    }
    return POKEDEXAPP_MAINSEQ_41;
}

int PokedexApp_MainSeq_42(PokedexAppData *pokedexApp) {
    PokedexAppData_UnkSub0868_State38 *r4 = &pokedexApp->unk_0868.state_38;

    if (!ov18_021F11AC(pokedexApp, r4->unk_8)) {
        ov18_021EAD74(&pokedexApp->dexSearchCriteria[dex_search_criteria_height_max], pokedexApp->dexSearchCriteria[dex_search_criteria_height_min], 152, &r4->unk_4, r4->unk_A);
        ov18_021EADB8(pokedexApp, pokedexApp->dexSearchCriteria[dex_search_criteria_height_max], FALSE, 5, 70);
        ov18_021F3A64(pokedexApp, pokedexApp->dexSearchCriteria[dex_search_criteria_height_max], 1);
        return POKEDEXAPP_MAINSEQ_38;
    }

    return POKEDEXAPP_MAINSEQ_42;
}

int PokedexApp_MainSeq_43(PokedexAppData *pokedexApp) {
    PokedexAppData_UnkSub0868_State38 *r4 = &pokedexApp->unk_0868.state_38;

    if (!ov18_021F11AC(pokedexApp, r4->unk_8)) {
        ov18_021EAD74(&pokedexApp->dexSearchCriteria[dex_search_criteria_height_min], 0, pokedexApp->dexSearchCriteria[dex_search_criteria_height_max], &r4->unk_4, r4->unk_A);
        ov18_021EADB8(pokedexApp, pokedexApp->dexSearchCriteria[dex_search_criteria_height_min], FALSE, 11, 69);
        ov18_021F3A64(pokedexApp, pokedexApp->dexSearchCriteria[dex_search_criteria_height_min], 3);
        return POKEDEXAPP_MAINSEQ_38;
    }

    return POKEDEXAPP_MAINSEQ_43;
}

int PokedexApp_MainSeq_44(PokedexAppData *pokedexApp) {
    pokedexApp->dexSearchCriteriaBak[0] = pokedexApp->dexSearchCriteria[dex_search_criteria_weight_min];
    pokedexApp->dexSearchCriteriaBak[1] = pokedexApp->dexSearchCriteria[dex_search_criteria_weight_max];
    ov18_021EDE4C(pokedexApp, 5, 0, POKEDEXAPP_MAINSEQ_45);
    return POKEDEXAPP_MAINSEQ_26;
}

int PokedexApp_MainSeq_45(PokedexAppData *pokedexApp) {
    PokedexAppData_UnkSub0868_State38 *r5 = &pokedexApp->unk_0868.state_38;

    switch (ov18_021F7520(pokedexApp)) {
    case 0:
        r5->unk_0 = pokedexApp->dexSearchCriteria[dex_search_criteria_weight_max];
        r5->unk_4 = 0;
        ov18_021F37D4(pokedexApp, 0, 5, 1);
        return POKEDEXAPP_MAINSEQ_47;
    case 1:
        r5->unk_0 = pokedexApp->dexSearchCriteria[dex_search_criteria_weight_min];
        r5->unk_4 = 0;
        ov18_021F37D4(pokedexApp, 0, 11, 1);
        return POKEDEXAPP_MAINSEQ_48;
    case 2:
        (void)MenuInputStateMgr_GetState(pokedexApp->args->menuInputStatePtr);
        PlaySE(SEQ_SE_GS_ZKN04);
        MI_CpuClear8(&pokedexApp->unk_0868, sizeof(pokedexApp->unk_0868));
        return ov18_021EDBDC(pokedexApp, 0, 10, POKEDEXAPP_MAINSEQ_46);
    case 3:
    case -2:
        PlaySE(SEQ_SE_GS_GEARCANCEL);
        pokedexApp->dexSearchCriteria[dex_search_criteria_weight_min] = pokedexApp->dexSearchCriteriaBak[0];
        pokedexApp->dexSearchCriteria[dex_search_criteria_weight_max] = pokedexApp->dexSearchCriteriaBak[1];
        MI_CpuClear8(&pokedexApp->unk_0868, sizeof(pokedexApp->unk_0868));
        return ov18_021EDBDC(pokedexApp, 22, 10, POKEDEXAPP_MAINSEQ_46);
    case 4:
        if (pokedexApp->dexSearchCriteria[dex_search_criteria_weight_max] == 152) {
            break;
        }
        (void)MenuInputStateMgr_GetState(pokedexApp->args->menuInputStatePtr);
        PlaySE(SEQ_SE_GS_ZKN04);
        r5->unk_8 = 2;
        r5->unk_A = 1;
        ov18_021F118C(pokedexApp, r5->unk_8, 54);
        return POKEDEXAPP_MAINSEQ_49;
    case 5:
        if (pokedexApp->dexSearchCriteria[dex_search_criteria_weight_max] > pokedexApp->dexSearchCriteria[dex_search_criteria_weight_min]) {
            (void)MenuInputStateMgr_GetState(pokedexApp->args->menuInputStatePtr);
            PlaySE(SEQ_SE_GS_ZKN04);
            r5->unk_8 = 1;
            r5->unk_A = -1;
            ov18_021F118C(pokedexApp, r5->unk_8, 57);
            return POKEDEXAPP_MAINSEQ_49;
        }
        break;
    case 6:
        if (pokedexApp->dexSearchCriteria[dex_search_criteria_weight_min] < pokedexApp->dexSearchCriteria[dex_search_criteria_weight_max]) {
            (void)MenuInputStateMgr_GetState(pokedexApp->args->menuInputStatePtr);
            PlaySE(SEQ_SE_GS_ZKN04);
            r5->unk_8 = 4;
            r5->unk_A = 1;
            ov18_021F118C(pokedexApp, r5->unk_8, 54);
            return POKEDEXAPP_MAINSEQ_50;
        }
        break;
    case 7:
        if (pokedexApp->dexSearchCriteria[dex_search_criteria_weight_min] == 0) {
            break;
        }
        (void)MenuInputStateMgr_GetState(pokedexApp->args->menuInputStatePtr);
        PlaySE(SEQ_SE_GS_ZKN04);
        r5->unk_8 = 3;
        r5->unk_A = -1;
        ov18_021F118C(pokedexApp, r5->unk_8, 57);
        return POKEDEXAPP_MAINSEQ_50;
    case -1:
        if ((gSystem.heldKeys & PAD_KEY_LEFT) || (gSystem.heldKeys & PAD_KEY_RIGHT) || System_GetTouchHeld()) {
            break;
        }
        r5->unk_4 = 0;
        break;
    }

    return POKEDEXAPP_MAINSEQ_45;
}

int PokedexApp_MainSeq_46(PokedexAppData *pokedexApp) {
    ov18_021EDE4C(pokedexApp, 0, 4, POKEDEXAPP_MAINSEQ_22);
    return POKEDEXAPP_MAINSEQ_27;
}

int PokedexApp_MainSeq_47(PokedexAppData *pokedexApp) {
    u32 sp4;
    u32 r4;
    PokedexAppData_UnkSub0868_State38 *r4_2 = &pokedexApp->unk_0868.state_38;

    if (!ov18_021F765C(&sp4)) {
        if (pokedexApp->dexSearchCriteria[dex_search_criteria_weight_max] < pokedexApp->dexSearchCriteria[dex_search_criteria_weight_min]) {
            pokedexApp->dexSearchCriteria[dex_search_criteria_weight_max] = r4_2->unk_0;
        }
        ov18_021EADB8(pokedexApp, pokedexApp->dexSearchCriteria[dex_search_criteria_weight_max], TRUE, 5, 73);
        ov18_021F3A64(pokedexApp, pokedexApp->dexSearchCriteria[dex_search_criteria_weight_max], 1);
        return POKEDEXAPP_MAINSEQ_45;
    }

    r4 = pokedexApp->dexSearchCriteria[dex_search_criteria_weight_max];
    ov18_021F37D4(pokedexApp, sp4, 5, 1);
    pokedexApp->dexSearchCriteria[dex_search_criteria_weight_max] = ov18_021F3AB0(pokedexApp, 5);
    ov18_021F39C4(pokedexApp, 6, pokedexApp->unk_1850[pokedexApp->dexSearchCriteria[dex_search_criteria_weight_max]].unk_2);
    ov18_021EFDB4(pokedexApp, pokedexApp->unk_1850[pokedexApp->dexSearchCriteria[dex_search_criteria_weight_max]].unk_2, 73);
    ScheduleWindowCopyToVram(&pokedexApp->windows[73]);
    ov18_021F3A64(pokedexApp, pokedexApp->dexSearchCriteria[dex_search_criteria_weight_max], 1);
    if (r4 != pokedexApp->dexSearchCriteria[dex_search_criteria_weight_max]) {
        PlaySE(SEQ_SE_GS_ZKN03);
    }
    return POKEDEXAPP_MAINSEQ_47;
}

int PokedexApp_MainSeq_48(PokedexAppData *pokedexApp) {
    u32 sp4;
    u32 r4;
    PokedexAppData_UnkSub0868_State38 *r4_2 = &pokedexApp->unk_0868.state_38;

    if (!ov18_021F765C(&sp4)) {
        if (pokedexApp->dexSearchCriteria[dex_search_criteria_weight_min] > pokedexApp->dexSearchCriteria[dex_search_criteria_weight_max]) {
            pokedexApp->dexSearchCriteria[dex_search_criteria_weight_min] = r4_2->unk_0;
        }
        ov18_021EADB8(pokedexApp, pokedexApp->dexSearchCriteria[dex_search_criteria_weight_min], TRUE, 11, 72);
        ov18_021F3A64(pokedexApp, pokedexApp->dexSearchCriteria[dex_search_criteria_weight_min], 3);
        return POKEDEXAPP_MAINSEQ_45;
    }

    r4 = pokedexApp->dexSearchCriteria[dex_search_criteria_weight_min];
    ov18_021F37D4(pokedexApp, sp4, 11, 1);
    pokedexApp->dexSearchCriteria[dex_search_criteria_weight_min] = ov18_021F3AB0(pokedexApp, 11);
    ov18_021F39C4(pokedexApp, 12, pokedexApp->unk_1850[pokedexApp->dexSearchCriteria[dex_search_criteria_weight_min]].unk_2);
    ov18_021EFDB4(pokedexApp, pokedexApp->unk_1850[pokedexApp->dexSearchCriteria[dex_search_criteria_weight_min]].unk_2, 72);
    ScheduleWindowCopyToVram(&pokedexApp->windows[72]);
    ov18_021F3A64(pokedexApp, pokedexApp->dexSearchCriteria[dex_search_criteria_weight_min], 3);
    if (r4 != pokedexApp->dexSearchCriteria[dex_search_criteria_weight_min]) {
        PlaySE(SEQ_SE_GS_ZKN03);
    }
    return POKEDEXAPP_MAINSEQ_48;
}

int PokedexApp_MainSeq_49(PokedexAppData *pokedexApp) {
    PokedexAppData_UnkSub0868_State38 *r4 = &pokedexApp->unk_0868.state_38;

    if (!ov18_021F11AC(pokedexApp, r4->unk_8)) {
        ov18_021EAD74(&pokedexApp->dexSearchCriteria[dex_search_criteria_weight_max], pokedexApp->dexSearchCriteria[dex_search_criteria_weight_min], 152, &r4->unk_4, r4->unk_A);
        ov18_021EADB8(pokedexApp, pokedexApp->dexSearchCriteria[dex_search_criteria_weight_max], TRUE, 5, 73);
        ov18_021F3A64(pokedexApp, pokedexApp->dexSearchCriteria[dex_search_criteria_weight_max], 1);
        return POKEDEXAPP_MAINSEQ_45;
    }

    return POKEDEXAPP_MAINSEQ_49;
}

int PokedexApp_MainSeq_50(PokedexAppData *pokedexApp) {
    PokedexAppData_UnkSub0868_State38 *r4 = &pokedexApp->unk_0868.state_38;

    if (!ov18_021F11AC(pokedexApp, r4->unk_8)) {
        ov18_021EAD74(&pokedexApp->dexSearchCriteria[dex_search_criteria_weight_min], 0, pokedexApp->dexSearchCriteria[dex_search_criteria_weight_max], &r4->unk_4, r4->unk_A);
        ov18_021EADB8(pokedexApp, pokedexApp->dexSearchCriteria[dex_search_criteria_weight_min], TRUE, 11, 72);
        ov18_021F3A64(pokedexApp, pokedexApp->dexSearchCriteria[dex_search_criteria_weight_min], 3);
        return POKEDEXAPP_MAINSEQ_45;
    }

    return POKEDEXAPP_MAINSEQ_50;
}

int PokedexApp_MainSeq_51(PokedexAppData *pokedexApp) {
    pokedexApp->dexSearchCriteriaBak[0] = pokedexApp->dexSearchCriteria[dex_search_criteria_area];
    ov18_021EDE4C(pokedexApp, 6, 0, POKEDEXAPP_MAINSEQ_52);
    return POKEDEXAPP_MAINSEQ_26;
}

int PokedexApp_MainSeq_52(PokedexAppData *pokedexApp) {
    u32 r4 = ov18_021F76B0(pokedexApp);

    switch (r4) {
    case dex_search_area_submit:
        (void)MenuInputStateMgr_GetState(pokedexApp->args->menuInputStatePtr);
        PlaySE(SEQ_SE_GS_ZKN04);
        return ov18_021EDBDC(pokedexApp, 0, 10, POKEDEXAPP_MAINSEQ_53);
    case dex_search_area_cancel:
    case -2:
        PlaySE(SEQ_SE_GS_GEARCANCEL);
        pokedexApp->dexSearchCriteria[dex_search_criteria_area] = pokedexApp->dexSearchCriteriaBak[0];
        return ov18_021EDBDC(pokedexApp, 22, 10, POKEDEXAPP_MAINSEQ_53);
    default:
        (void)MenuInputStateMgr_GetState(pokedexApp->args->menuInputStatePtr);
        PlaySE(SEQ_SE_GS_ZKN04);
        ov18_021E7534(pokedexApp, r4);
        break;
    case -3:
    case -1:
    case -4:
        break;
    }

    return POKEDEXAPP_MAINSEQ_52;
}

int PokedexApp_MainSeq_53(PokedexAppData *pokedexApp) {
    ov18_021EDE4C(pokedexApp, 0, 5, POKEDEXAPP_MAINSEQ_22);
    return POKEDEXAPP_MAINSEQ_27;
}

int PokedexApp_MainSeq_54(PokedexAppData *pokedexApp) {
    pokedexApp->dexSearchCriteriaBak[0] = pokedexApp->dexSearchCriteria[dex_search_criteria_body_type];
    ov18_021EDE4C(pokedexApp, 7, 0, POKEDEXAPP_MAINSEQ_55);
    return POKEDEXAPP_MAINSEQ_26;
}

int PokedexApp_MainSeq_55(PokedexAppData *pokedexApp) {
    u32 r4 = ov18_021F7790(pokedexApp);

    switch (r4) {
    case dex_search_bodytype_submit:
        (void)MenuInputStateMgr_GetState(pokedexApp->args->menuInputStatePtr);
        PlaySE(SEQ_SE_GS_ZKN04);
        return ov18_021EDBDC(pokedexApp, 0, 10, POKEDEXAPP_MAINSEQ_56);
    case dex_search_bodytype_cancel:
    case -2:
        PlaySE(SEQ_SE_GS_GEARCANCEL);
        pokedexApp->dexSearchCriteria[dex_search_criteria_body_type] = pokedexApp->dexSearchCriteriaBak[0];
        return ov18_021EDBDC(pokedexApp, 22, 10, POKEDEXAPP_MAINSEQ_56);
    default:
        (void)MenuInputStateMgr_GetState(pokedexApp->args->menuInputStatePtr);
        PlaySE(SEQ_SE_GS_ZKN04);
        ov18_021E766C(pokedexApp, r4);
        break;
    case -3:
    case -1:
    case -4:
        break;
    }

    return POKEDEXAPP_MAINSEQ_55;
}

int PokedexApp_MainSeq_56(PokedexAppData *pokedexApp) {
    ov18_021EDE4C(pokedexApp, 0, 6, POKEDEXAPP_MAINSEQ_22);
    return POKEDEXAPP_MAINSEQ_27;
}

int PokedexApp_MainSeq_57(PokedexAppData *pokedexApp) {
    switch (ov18_021F7974(pokedexApp, 0)) {
    case 0:
        ov18_021F2BB0(pokedexApp, 0);
        ov18_021E78AC(pokedexApp);
        ov18_021EDEB0(pokedexApp);
        break;
    case 1:
        break;
    case 2:
        return ov18_021EDBB8(pokedexApp, 0, 8, POKEDEXAPP_MAINSEQ_62);
    case 3:
        if (ov18_021F8824(pokedexApp) && ov18_021EDE04(pokedexApp) == 1) {
            return ov18_021EDBB8(pokedexApp, 8, 8, POKEDEXAPP_MAINSEQ_57);
        }
        break;
    case 4:
        if (ov18_021F8824(pokedexApp) && ov18_021F8838(pokedexApp)) {
            PlaySE(SEQ_SE_GS_ZKN04);
            pokedexApp->unk_185B = 1;
            return ov18_021EDBB8(pokedexApp, 16, 8, POKEDEXAPP_MAINSEQ_64);
        }
        break;
    case 5:
        return ov18_021EDBB8(pokedexApp, 24, 8, POKEDEXAPP_MAINSEQ_63);
    case 6:
        return ov18_021EDBB8(pokedexApp, 24, 8, POKEDEXAPP_MAINSEQ_63);
    case 7:
        ov18_021E7A80(pokedexApp, ov18_021F8838(pokedexApp), -1);
        break;
    case 8:
        ov18_021E7A80(pokedexApp, ov18_021F8838(pokedexApp), 1);
        break;
    case 9:
        if (pokedexApp->unk_1859 > 0) {
            PlaySE(SEQ_SE_GS_ZKN04);
            MI_CpuClear8(&pokedexApp->unk_0868, sizeof(pokedexApp->unk_0868));
            return POKEDEXAPP_MAINSEQ_58;
        }
        break;
    case 10:
        if (pokedexApp->unk_1859 > 0) {
            PlaySE(SEQ_SE_GS_ZKN04);
            MI_CpuClear8(&pokedexApp->unk_0868, sizeof(pokedexApp->unk_0868));
            pokedexApp->unk_0868.state_13.unk_7 = 1;
            return POKEDEXAPP_MAINSEQ_58;
        }
        break;
    case 11:
        if (pokedexApp->unk_1859 + 1 <= ov18_021F8950(pokedexApp, 0)) {
            PlaySE(SEQ_SE_GS_ZKN04);
            MI_CpuClear8(&pokedexApp->unk_0868, sizeof(pokedexApp->unk_0868));
            return POKEDEXAPP_MAINSEQ_59;
        }
        break;
    case 12:
        if (pokedexApp->unk_1859 + 1 <= ov18_021F8950(pokedexApp, 0)) {
            PlaySE(SEQ_SE_GS_ZKN04);
            MI_CpuClear8(&pokedexApp->unk_0868, sizeof(pokedexApp->unk_0868));
            pokedexApp->unk_0868.state_13.unk_7 = 1;
            return POKEDEXAPP_MAINSEQ_59;
        }
        break;
    case 13: {
        u32 x, y;

        System_GetTouchHeldCoords(&x, &y);
        if (ov18_021F2CD0(pokedexApp, 18, x, y) == 1) {
            return POKEDEXAPP_MAINSEQ_60;
        } else {
            PokedexAppData_UnkSub0868_State16 *r1 = &pokedexApp->unk_0868.state_16;

            r1->unk_0 = x;
            r1->unk_2 = y;
            return POKEDEXAPP_MAINSEQ_61;
        }
    } break;
    }

    return POKEDEXAPP_MAINSEQ_57;
}

int PokedexApp_MainSeq_58(PokedexAppData *pokedexApp) {
    PokedexAppData_UnkSub0868_State13 *r4 = &pokedexApp->unk_0868.state_13;

    switch (r4->unk_4) {
    case 0:
        ov18_021F11C0(pokedexApp, 0, 0);
        ov18_021F118C(pokedexApp, 19, 6);
        ov18_021F2A2C(pokedexApp, 22, 0);
        ov18_021F2A84(pokedexApp, 24, 0);
        ClearWindowTilemapAndScheduleTransfer(&pokedexApp->windows[94]);
        r4->unk_0 = ov18_021E6BB8(pokedexApp, 15 * (pokedexApp->unk_1859 - 1));
        r4->unk_6 = ov18_021F2E14(pokedexApp, 18, ov18_021F2DD4(pokedexApp, pokedexApp->unk_1859 - 1, 18, 0), 15);
        if (pokedexApp->unk_1859 == 1) {
            ov18_021F3C30(pokedexApp);
        }
        ++r4->unk_4;
        // fallthrough
    case 1:
        ++r4->unk_5;
        ov18_021E6CE8(pokedexApp, &r4->unk_0[0x1E0 - 32 * r4->unk_5]);
        ov18_021F16C4(pokedexApp, 59, 8, r4->unk_5 / 5);
        ov18_021F2E4C(pokedexApp, 18, -r4->unk_6);
        if (pokedexApp->unk_1859 == 1) {
            ov18_021F3C54(pokedexApp, 8);
        }
        if (r4->unk_5 == 15) {
            ++r4->unk_4;
        }
        break;
    case 2:
        if (r4->unk_7 == 1) {
            pokedexApp->unk_185A += 10;
        }
        --pokedexApp->unk_1859;
        ov18_021F2BB0(pokedexApp, 0);
        ov18_021E6C90(r4->unk_0);
        ov18_021E78AC(pokedexApp);
        ov18_021EDEB0(pokedexApp);
        ov18_021F2C10(pokedexApp, 19, 0);
        ov18_021F2E80(pokedexApp, 18, 0);
        MI_CpuClear8(&pokedexApp->unk_0868, sizeof(pokedexApp->unk_0868));
        return POKEDEXAPP_MAINSEQ_57;
    }

    return POKEDEXAPP_MAINSEQ_58;
}

int PokedexApp_MainSeq_59(PokedexAppData *pokedexApp) {
    PokedexAppData_UnkSub0868_State13 *r4 = &pokedexApp->unk_0868.state_13;

    switch (r4->unk_4) {
    case 0:
        ov18_021F11C0(pokedexApp, 0, 0);
        ov18_021F118C(pokedexApp, 20, 9);
        ov18_021F2A2C(pokedexApp, 22, 0);
        ov18_021F2A84(pokedexApp, 24, 0);
        ClearWindowTilemapAndScheduleTransfer(&pokedexApp->windows[94]);
        r4->unk_0 = ov18_021E6BB8(pokedexApp, 15 * (pokedexApp->unk_1859));
        r4->unk_6 = ov18_021F2E14(pokedexApp, 18, ov18_021F2DD4(pokedexApp, pokedexApp->unk_1859 + 1, 18, 0), 15);
        ++r4->unk_4;
        // fallthrough
    case 1:
        ++r4->unk_5;
        ov18_021E6CE8(pokedexApp, &r4->unk_0[32 * r4->unk_5]);
        ov18_021F1760(pokedexApp, 59, -8, r4->unk_5 / 5);
        ov18_021F2E4C(pokedexApp, 18, r4->unk_6);
        if (pokedexApp->unk_1859 == 0) {
            ov18_021F3C54(pokedexApp, -8);
        }
        if (r4->unk_5 == 15) {
            ++r4->unk_4;
        }
        break;
    case 2:
        if (r4->unk_7 == 1) {
            pokedexApp->unk_185A -= 10;
        }
        ++pokedexApp->unk_1859;
        ov18_021F2BB0(pokedexApp, 0);
        ov18_021E6C90(r4->unk_0);
        ov18_021E78AC(pokedexApp);
        ov18_021EDEB0(pokedexApp);
        ov18_021F2C10(pokedexApp, 19, 0);
        ov18_021F2E80(pokedexApp, 18, 0);
        MI_CpuClear8(&pokedexApp->unk_0868, sizeof(pokedexApp->unk_0868));
        return POKEDEXAPP_MAINSEQ_57;
    }

    return POKEDEXAPP_MAINSEQ_59;
}

int PokedexApp_MainSeq_60(PokedexAppData *pokedexApp) {
    u32 x, y;

    if (!System_GetTouchHeldCoords(&x, &y)) {
        return POKEDEXAPP_MAINSEQ_57;
    }
    if (ov18_021F2D24(pokedexApp, 18, x, y, 0) == 1) {
        u16 *r4 = ov18_021E6BB8(pokedexApp, 15 * pokedexApp->unk_1859);
        pokedexApp->unk_185E ^= 1;
        ov18_021E6CE8(pokedexApp, r4);
        ov18_021E6C90(r4);
        ov18_021F1620(pokedexApp, 59);
        if (!pokedexApp->unk_1859) {
            ov18_021F3C88(pokedexApp);
        } else {
            ov18_021F11C0(pokedexApp, 25, 0);
        }
        ov18_021E78AC(pokedexApp);
        ov18_021EDEB0(pokedexApp);
        ov18_021F2C10(pokedexApp, 19, 0);
        PlaySE(SEQ_SE_GS_ZKN03);
    }
    return POKEDEXAPP_MAINSEQ_60;
}

int PokedexApp_MainSeq_61(PokedexAppData *pokedexApp) {
    PokedexAppData_UnkSub0868_State16 *r3 = &pokedexApp->unk_0868.state_16;

    if (ov18_021F2D24(pokedexApp, 18, r3->unk_0, r3->unk_2, 0) == 1) {
        u16 *r4 = ov18_021E6BB8(pokedexApp, 15 * pokedexApp->unk_1859);
        pokedexApp->unk_185E ^= 1;
        ov18_021E6CE8(pokedexApp, r4);
        ov18_021E6C90(r4);
        ov18_021F1620(pokedexApp, 59);
        if (!pokedexApp->unk_1859) {
            ov18_021F3C88(pokedexApp);
        } else {
            ov18_021F11C0(pokedexApp, 25, 0);
        }
        ov18_021E78AC(pokedexApp);
        ov18_021EDEB0(pokedexApp);
        ov18_021F2C10(pokedexApp, 19, 1);
        PlaySE(SEQ_SE_GS_ZKN03);
        MI_CpuClear8(&pokedexApp->unk_0868, sizeof(pokedexApp->unk_0868));
    }
    return POKEDEXAPP_MAINSEQ_57;
}

PokedexApp_MainSeq_62(PokedexAppData *pokedexApp) {
    switch (pokedexApp->unk_0868.state_10.unk_0) {
    case 0: {
        u16 r1 = ov18_021F8838(pokedexApp);
        if (r1 != 0) {
            sub_02092BD8(pokedexApp->args->unk_08, r1, pokedexApp->unk_1858);
        }
        ov18_021F7ED4(pokedexApp, pokedexApp->unk_1858, dex_order_national, dex_search_letters_all, dex_search_type_all, dex_search_type_all, 0, 152, 0, 152, 1 << dex_search_area_all, dex_search_bodytype_all);
        ov18_021F8884(pokedexApp, 1);
        ov18_021EDDB4(pokedexApp);
        ov18_021EDE64(pokedexApp);
        sub_0201980C(pokedexApp->unk_0008, 4);
        ov18_021F2A2C(pokedexApp, 22, 0);
        ov18_021F2A84(pokedexApp, 24, 0);
        ClearWindowTilemapAndScheduleTransfer(&pokedexApp->windows[94]);
        PaletteData_BeginPaletteFade(pokedexApp->paletteData, PLTTBUF_MAIN_BG_F, PLTTFADE_OPAQUE_ALL_F & ~(1 << 0), 0, 0, 16, RGB_BLACK);
        PaletteData_BeginPaletteFade(pokedexApp->paletteData, PLTTBUF_EXCEPT_MAIN_BG_F, PLTTFADE_OPAQUE_ALL_F, 0, 0, 16, RGB_BLACK);
        pokedexApp->unk_085C = POKEDEXAPP_MAINSEQ_62;
        ov18_021E66C4(pokedexApp);
        ++pokedexApp->unk_0868.state_10.unk_0;
        return POKEDEXAPP_MAINSEQ_03;
    }
    case 1:
        if (!sub_020199E4(pokedexApp->unk_0008, 8)) {
            ZeroPalettesByBitmask(PLTTBUF_MAIN_BG_F | PLTTBUF_SUB_BG_F | PLTTBUF_MAIN_OBJ_F | PLTTBUF_SUB_OBJ_F, HEAP_ID_37);
            ov18_021EE388(pokedexApp);
            ov18_021F3294(pokedexApp);
            ov18_021F3438(pokedexApp);
            pokedexApp->unk_0868.state_10.unk_0 = 0;
            return POKEDEXAPP_MAINSEQ_21;
        }
        break;
    }

    return POKEDEXAPP_MAINSEQ_62;
}

int PokedexApp_MainSeq_63(PokedexAppData *pokedexApp) {
    switch (pokedexApp->unk_0868.state_10.unk_0) {
    case 0: {
        u16 species = ov18_021F8838(pokedexApp);
        if (species != SPECIES_NONE) {
            sub_02092BD8(pokedexApp->args->unk_08, species, pokedexApp->unk_1858);
        }
        ov18_021F7ED4(pokedexApp, pokedexApp->unk_1858, dex_order_national, dex_search_letters_all, dex_search_type_all, dex_search_type_all, 0, 152, 0, 152, 1 << dex_search_area_all, dex_search_bodytype_all);
        ov18_021F8884(pokedexApp, 1);
        ov18_021EDDB4(pokedexApp);
        GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000001_NCGR_lz, pokedexApp->bgConfig, GF_BG_LYR_MAIN_0, 0, 0, TRUE, HEAP_ID_37);
        GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000017_NCGR_lz, pokedexApp->bgConfig, GF_BG_LYR_SUB_0, 0, 0, TRUE, HEAP_ID_37);
        ov18_021E7724(pokedexApp);
        sub_020196E8(pokedexApp->unk_0008, 13, -36, 0);
        sub_020196E8(pokedexApp->unk_0008, 15, -36, 0);
        sub_020196E8(pokedexApp->unk_0008, 14, -4, 0);
        sub_020198FC(pokedexApp->unk_0008, 13, 2, 0, 18);
        sub_020198FC(pokedexApp->unk_0008, 15, 2, 0, 18);
        sub_020198FC(pokedexApp->unk_0008, 14, 2, 0, 18);
        sub_0201980C(pokedexApp->unk_0008, 4);
        ov18_021F2A2C(pokedexApp, 22, 0);
        ov18_021F2A84(pokedexApp, 24, 0);
        ClearWindowTilemapAndScheduleTransfer(&pokedexApp->windows[94]);
        ov18_021F11C0(pokedexApp, 0, 0);
        ov18_021F3AD8(pokedexApp);
        ov18_021E66C4(pokedexApp);
        ++pokedexApp->unk_0868.state_10.unk_0;
    } // fallthrough
    case 1:
        if (!sub_020199E4(pokedexApp->unk_0008, 13)) {
            ++pokedexApp->unk_0868.state_10.unk_0;
        } else {
            ov18_021F3B2C(pokedexApp, 16);
        }
        break;
    case 2:
        pokedexApp->unk_0868.state_10.unk_0 = 0;
        ov18_021EE388(pokedexApp);
        ov18_021F3294(pokedexApp);
        ov18_021F3438(pokedexApp);
        ov18_021E67C8(pokedexApp, 0);
        sub_0201980C(pokedexApp->unk_0008, 0);
        pokedexApp->unk_0868.state_09.unk_0 = 1;
        return POKEDEXAPP_MAINSEQ_09;
    }

    return POKEDEXAPP_MAINSEQ_63;
}

int PokedexApp_MainSeq_64(PokedexAppData *pokedexApp) {
    switch (pokedexApp->unk_0868.state_10.unk_0) {
    case 0: {
        u16 r1 = ov18_021F8838(pokedexApp);
        if (r1 != SPECIES_NONE) {
            sub_02092BD8(pokedexApp->args->unk_08, r1, pokedexApp->unk_1858);
        }
        sub_0201980C(pokedexApp->unk_0008, 4);
        ov18_021F2A2C(pokedexApp, 22, 0);
        ov18_021F2A84(pokedexApp, 24, 0);
        ClearWindowTilemapAndScheduleTransfer(&pokedexApp->windows[94]);
        ov18_021F11C0(pokedexApp, 0, 0);
        ov18_021E66C4(pokedexApp);
        PaletteData_BeginPaletteFade(pokedexApp->paletteData, PLTTBUF_MAIN_BG_F, PLTTFADE_OPAQUE_ALL_F & ~(1 << 0), 0, 0, 16, RGB_BLACK);
        PaletteData_BeginPaletteFade(pokedexApp->paletteData, PLTTBUF_EXCEPT_MAIN_BG_F, PLTTFADE_OPAQUE_ALL_F, 0, 0, 16, RGB_BLACK);
        pokedexApp->unk_085C = 0x40;
        ++pokedexApp->unk_0868.state_10.unk_0;
        return POKEDEXAPP_MAINSEQ_03;
    }
    case 1:
        if (sub_020199E4(pokedexApp->unk_0008, 8)) {
            break;
        }
        pokedexApp->unk_0868.state_10.unk_0 = 0;
        ov18_021EE388(pokedexApp);
        ov18_021F3294(pokedexApp);
        ov18_021F3438(pokedexApp);
        pokedexApp->unk_18A0 = 5;
        return POKEDEXAPP_MAINSEQ_66;
    }

    return POKEDEXAPP_MAINSEQ_64;
}

int PokedexApp_MainSeq_65(PokedexAppData *pokedexApp) {
    switch (pokedexApp->unk_0868.state_10.unk_0) {
    case 0:
        ov18_021E67C8(pokedexApp, 5);
        ov18_021EA350(pokedexApp, GF_BG_LYR_MAIN_0, 9);
        ov18_021EA350(pokedexApp, GF_BG_LYR_MAIN_2, 10);
        ov18_021EA350(pokedexApp, GF_BG_LYR_MAIN_0, 11);
        ov18_021EA350(pokedexApp, GF_BG_LYR_MAIN_2, 12);
        ov18_021EFEC4(pokedexApp);
        ov18_021F1620(pokedexApp, 59);
        ov18_021E6CC0(pokedexApp);
        ov18_021F11C0(pokedexApp, 18, 1);
        ov18_021F11C0(pokedexApp, 19, 1);
        ov18_021F11C0(pokedexApp, 20, 1);
        ov18_021F11C0(pokedexApp, 21, 1);
        ov18_021F11C0(pokedexApp, 25, 1);
        ov18_021F2C5C(pokedexApp, 18, 0);
        ov18_021F2E80(pokedexApp, 18, 0);
        ov18_021F2C10(pokedexApp, 19, 0);
        ov18_021EEED0(pokedexApp, 1);
        ov18_021F3BA4(pokedexApp);
        ov18_021F3BD4(pokedexApp, -192);
        sub_020196E8(pokedexApp->unk_0008, 9, 0, 0);
        sub_020196E8(pokedexApp->unk_0008, 10, 0, 0);
        sub_020196E8(pokedexApp->unk_0008, 11, 0, 0);
        sub_020196E8(pokedexApp->unk_0008, 12, 0, 0);
        sub_0201980C(pokedexApp->unk_0008, 9);
        sub_0201980C(pokedexApp->unk_0008, 10);
        GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000004_NCGR_lz, pokedexApp->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, TRUE, HEAP_ID_37);
        GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000019_NCGR_lz, pokedexApp->bgConfig, GF_BG_LYR_SUB_3, 0, 0, TRUE, HEAP_ID_37);
        GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000020_NSCR_lz, pokedexApp->bgConfig, GF_BG_LYR_SUB_3, 0, 0, TRUE, HEAP_ID_37);
        ov18_021E669C(pokedexApp);
        ov18_021F3448(pokedexApp);
        ov18_021F11C0(pokedexApp, 0, 1);
        ov18_021F2BB0(pokedexApp, 0);
        ov18_021F118C(pokedexApp, 0, 1);
        ov18_021F3190(pokedexApp);
        ov18_021E78AC(pokedexApp);
        ov18_021EDEB0(pokedexApp);
        ov18_021E659C(pokedexApp);
        if (pokedexApp->unk_1859) {
            ov18_021F3C54(pokedexApp, -40);
        }
        PaletteData_BeginPaletteFade(pokedexApp->paletteData, PLTTBUF_MAIN_BG_F, PLTTFADE_OPAQUE_ALL_F & ~(1 << 4), 0, 16, 0, RGB_BLACK);
        PaletteData_BeginPaletteFade(pokedexApp->paletteData, PLTTBUF_EXCEPT_MAIN_BG_F, PLTTFADE_OPAQUE_ALL_F, 0, 16, 0, RGB_BLACK);
        ++pokedexApp->unk_0868.state_10.unk_0;
        pokedexApp->unk_085C = POKEDEXAPP_MAINSEQ_65;
        return POKEDEXAPP_MAINSEQ_03;
    case 1:
        if (!sub_020199E4(pokedexApp->unk_0008, 8)) {
            pokedexApp->unk_0868.state_10.unk_0 = 0;
            return POKEDEXAPP_MAINSEQ_57;
        }
        break;
    }

    return POKEDEXAPP_MAINSEQ_65;
}

int ov18_021EC1DC(PokedexAppData *pokedexApp, u8 a1, u8 a2) {
    PokedexAppData_UnkSub0868_State69 *r2 = &pokedexApp->unk_0868.state_69;
    int r6 = 0;

    r2->unk_0 = 0;
    r2->unk_2 = a1;

    if (a2 == 0xFF) {
        ov18_021F3D80(pokedexApp, 3);
        return ov18_021EDC28(pokedexApp, 24, POKEDEXAPP_MAINSEQ_67);
    }

    if (a2 == 1) {
        r6 = 0;
        ov18_021F3D80(pokedexApp, 0);
    } else if (a2 == 2) {
        r6 = 8;
        ov18_021F3D80(pokedexApp, 1);
    } else if (a2 == 3) {
        r6 = 16;
        ov18_021F3D80(pokedexApp, 2);
    } else {
        r6 = 24;
        ov18_021F3D80(pokedexApp, 3);
    }
    if (pokedexApp->unk_185B == 1) {
        pokedexApp->unk_185B = a2;
        return ov18_021EDC28(pokedexApp, r6, POKEDEXAPP_MAINSEQ_70);
    } else if (pokedexApp->unk_185B == 2) {
        pokedexApp->unk_185B = a2;
        return ov18_021EDC28(pokedexApp, r6, POKEDEXAPP_MAINSEQ_78);
    } else if (pokedexApp->unk_185B == 3) {
        pokedexApp->unk_185B = a2;
        return ov18_021EDC28(pokedexApp, r6, POKEDEXAPP_MAINSEQ_81);
    } else {
        pokedexApp->unk_185B = a2;
        return ov18_021EDC28(pokedexApp, r6, POKEDEXAPP_MAINSEQ_91);
    }
}

int PokedexApp_MainSeq_66(PokedexAppData *pokedexApp) {
    pokedexApp->curSpecies = ov18_021F8838(pokedexApp);
    pokedexApp->unk_18C9 = 0;
    pokedexApp->unk_18CA = 0;
    pokedexApp->unk_18C8 = 0;
    ov18_021E8254(pokedexApp);
    ov18_021E673C(pokedexApp);
    ov18_021E66EC(pokedexApp);
    ov18_021F3D34(pokedexApp);
    return PokedexApp_MainSeq_68(pokedexApp);
}

int PokedexApp_MainSeq_67(PokedexAppData *pokedexApp) {
    PokedexAppData_UnkSub0868_State69 *r4 = &pokedexApp->unk_0868.state_69;

    switch (r4->unk_0) {
    case 0:
        ov18_021F11C0(pokedexApp, 0, 0);
        ov18_021E6714(pokedexApp);
        PaletteData_BeginPaletteFade(pokedexApp->paletteData, PLTTBUF_MAIN_BG_F, 0xF7BE, 0, r4->unk_2, 16, RGB_BLACK);
        PaletteData_BeginPaletteFade(pokedexApp->paletteData, PLTTBUF_EXCEPT_MAIN_BG_F, 0xFFFF, 0, r4->unk_2, 16, RGB_BLACK);
        ++r4->unk_0;
        pokedexApp->unk_085C = POKEDEXAPP_MAINSEQ_67;
        return POKEDEXAPP_MAINSEQ_03;
    case 1:
        if (sub_020199E4(pokedexApp->unk_0008, 16)) {
            break;
        }
        ZeroPalettesByBitmask(PLTTBUF_MAIN_BG_F | PLTTBUF_SUB_BG_F | PLTTBUF_MAIN_OBJ_F | PLTTBUF_SUB_OBJ_F, HEAP_ID_37);
        if (pokedexApp->unk_185B == 3) {
            ov18_021F0918(pokedexApp);
            ov18_021F5DE0(pokedexApp);
        } else if (pokedexApp->unk_185B == 2) {
            ov18_021F0838(pokedexApp);
            ov18_021F4A50(pokedexApp);
            ov18_021E5E70(pokedexApp, 0);
        } else if (pokedexApp->unk_185B == 1) {
            ov18_021F03C0(pokedexApp);
            ov18_021F3E08(pokedexApp);
            ov18_021E8648(pokedexApp);
            ov18_021E8BD4(pokedexApp);
            ov18_021EE20C(pokedexApp);
        } else {
            ov18_021F08E0(pokedexApp);
        }
        ov18_021F3D6C(pokedexApp);
        MI_CpuClear8(&pokedexApp->unk_0868, sizeof(pokedexApp->unk_0868));
        pokedexApp->unk_185B = pokedexApp->unk_18A0;
        if (pokedexApp->unk_18A0 == 0) {
            return POKEDEXAPP_MAINSEQ_19;
        } else {
            return POKEDEXAPP_MAINSEQ_65;
        }
    }

    return POKEDEXAPP_MAINSEQ_67;
}

int PokedexApp_MainSeq_68(PokedexAppData *pokedexApp) {
    switch (pokedexApp->unk_0868.state_10.unk_0) {
    case 0:
        pokedexApp->unk_18C9 = 0;
        pokedexApp->unk_18C8 = 0;
        pokedexApp->unk_18CA = 0;
        ov18_021E8B94(pokedexApp);
        ov18_021E8528(pokedexApp, pokedexApp->unk_18C9, pokedexApp->unk_18C8);
        ov18_021F018C(pokedexApp);
        ov18_021E67C8(pokedexApp, 1);
        ov18_021EE170(pokedexApp);
        ov18_021EE1F8(pokedexApp);
        ov18_021F4384(pokedexApp);
        ov18_021EE314(pokedexApp);
        if (pokedexApp->unk_18DC.unk_20.nMaps == 1) {
            ov18_021E6794(pokedexApp);
        }
        PaletteData_BeginPaletteFade(pokedexApp->paletteData, PLTTBUF_MAIN_BG_F, 0xF7BE, -2, 16, 0, RGB_BLACK);
        PaletteData_BeginPaletteFade(pokedexApp->paletteData, PLTTBUF_MAIN_OBJ_F, 0xFFEF, -2, 16, 0, RGB_BLACK);
        PaletteData_BeginPaletteFade(pokedexApp->paletteData, PLTTBUF_SUB_BG_F | PLTTBUF_SUB_OBJ_F, PLTTFADE_OPAQUE_ALL_F, -2, 16, 0, RGB_BLACK);
        ++pokedexApp->unk_0868.state_10.unk_0;
        pokedexApp->unk_085C = POKEDEXAPP_MAINSEQ_68;
        return POKEDEXAPP_MAINSEQ_03;
    case 1:
        if (sub_020199E4(pokedexApp->unk_0008, 16)) {
            break;
        }
        ov18_021F11C0(pokedexApp, 0, 1);
        pokedexApp->unk_185B = 1;
        pokedexApp->unk_0868.state_10.unk_0 = 0;
        return POKEDEXAPP_MAINSEQ_69;
    }

    return POKEDEXAPP_MAINSEQ_68;
}

int PokedexApp_MainSeq_69(PokedexAppData *pokedexApp) {
    u32 sp8;

    ov18_021EE26C(pokedexApp);
    switch (ov18_021F7C14(pokedexApp, &sp8)) {
    case 0:
        if (sp8 == 1) {
            PlaySE(SEQ_SE_GS_ZKN04);
        } else {
            PlaySE(SEQ_SE_GS_ZKN03);
        }
        return ov18_021EDC28(pokedexApp, 0, POKEDEXAPP_MAINSEQ_69);
    case 1:
        if (sp8 == 1) {
            PlaySE(SEQ_SE_GS_ZKN04);
        } else {
            PlaySE(SEQ_SE_GS_ZKN03);
        }
        return ov18_021EC1DC(pokedexApp, 0, 2);
    case 2:
        if (sp8 == 1) {
            PlaySE(SEQ_SE_GS_ZKN04);
        } else {
            PlaySE(SEQ_SE_GS_ZKN03);
        }
        return ov18_021EC1DC(pokedexApp, 0, 3);
    case 3:
        PlaySE(SEQ_SE_GS_GEARCANCEL);
        return ov18_021EC1DC(pokedexApp, 0, 255);
    case 4:
        if (ov18_021EE0F0(pokedexApp, -2, 2) == 1) {
            if (sp8 == 1) {
                PlaySE(SEQ_SE_GS_ZKN04);
            } else {
                PlaySE(SEQ_SE_GS_ZKN03);
            }
            return POKEDEXAPP_MAINSEQ_71;
        } else {
            return POKEDEXAPP_MAINSEQ_69;
        }
    case 5:
    case 8:
        if (ov18_021EE0F0(pokedexApp, -1, 1) == 1) {
            if (sp8 == 1) {
                PlaySE(SEQ_SE_GS_ZKN04);
            } else {
                PlaySE(SEQ_SE_GS_ZKN03);
            }
            return POKEDEXAPP_MAINSEQ_71;
        } else {
            return POKEDEXAPP_MAINSEQ_69;
        }
    case 6:
        if (ov18_021EE0F0(pokedexApp, 2, 2) == 1) {
            if (sp8 == 1) {
                PlaySE(SEQ_SE_GS_ZKN04);
            } else {
                PlaySE(SEQ_SE_GS_ZKN03);
            }
            return POKEDEXAPP_MAINSEQ_72;
        } else {
            return POKEDEXAPP_MAINSEQ_69;
        }
    case 7:
    case 9:
        if (ov18_021EE0F0(pokedexApp, 1, 1) == 1) {
            if (sp8 == 1) {
                PlaySE(SEQ_SE_GS_ZKN04);
            } else {
                PlaySE(SEQ_SE_GS_ZKN03);
            }
            return POKEDEXAPP_MAINSEQ_72;
        } else {
            return POKEDEXAPP_MAINSEQ_69;
        }
    case 10: {
        u32 x, y;

        System_GetTouchHeldCoords(&x, &y);
        if (ov18_021F62B4(pokedexApp, x, y) == 1) {
            return POKEDEXAPP_MAINSEQ_73;
        } else {
            PokedexAppData_UnkSub0868_State16 *r1 = &pokedexApp->unk_0868.state_16;

            r1->unk_0 = x;
            r1->unk_2 = y;
            return POKEDEXAPP_MAINSEQ_74;
        }
    } break;
    case 11:
        if (ov18_021EE140(pokedexApp, 0) == 1) {
            if (sp8 == 1) {
                PlaySE(SEQ_SE_GS_ZKN04);
            } else {
                PlaySE(SEQ_SE_GS_ZKN03);
            }
            return POKEDEXAPP_MAINSEQ_75;
        }
        break;
    case 12:
        if (ov18_021EE140(pokedexApp, 1) == 1) {
            if (sp8 == 1) {
                PlaySE(SEQ_SE_GS_ZKN04);
            } else {
                PlaySE(SEQ_SE_GS_ZKN03);
            }
            return POKEDEXAPP_MAINSEQ_75;
        }
        break;
    case 13:
        if (ov18_021EE124(pokedexApp, 0) == 1) {
            if (sp8 == 1) {
                PlaySE(SEQ_SE_GS_ZKN04);
            } else {
                PlaySE(SEQ_SE_GS_ZKN03);
            }
            ov18_021F4080(pokedexApp);
            return POKEDEXAPP_MAINSEQ_75;
        }
        break;
    case 14:
        if (ov18_021EE124(pokedexApp, 1) == 1) {
            if (sp8 == 1) {
                PlaySE(SEQ_SE_GS_ZKN04);
            } else {
                PlaySE(SEQ_SE_GS_ZKN03);
            }
            ov18_021F4080(pokedexApp);
            return POKEDEXAPP_MAINSEQ_75;
        }
        break;
    case 15:
        if (ov18_021EE124(pokedexApp, 2) == 1) {
            if (sp8 == 1) {
                PlaySE(SEQ_SE_GS_ZKN04);
            } else {
                PlaySE(SEQ_SE_GS_ZKN03);
            }
            ov18_021F4080(pokedexApp);
            return POKEDEXAPP_MAINSEQ_75;
        }
        break;
    case 16:
        if (sp8 == 1) {
            PlaySE(SEQ_SE_GS_ZKN04);
        } else {
            PlaySE(SEQ_SE_GS_ZKN03);
        }
        return ov18_021EC1DC(pokedexApp, 0, 4);
    }

    return POKEDEXAPP_MAINSEQ_69;
}

int PokedexApp_MainSeq_70(PokedexAppData *pokedexApp) {
    PokedexAppData_UnkSub0868_State69 *r4 = &pokedexApp->unk_0868.state_69;

    switch (r4->unk_0) {
    case 0:
        PaletteData_BeginPaletteFade(pokedexApp->paletteData, PLTTBUF_MAIN_BG_F, 0xF7BE, -2, r4->unk_2, 16, RGB_BLACK);
        PaletteData_BeginPaletteFade(pokedexApp->paletteData, PLTTBUF_MAIN_OBJ_F, 0xFFEF, -2, r4->unk_2, 16, RGB_BLACK);
        PaletteData_BeginPaletteFade(pokedexApp->paletteData, PLTTBUF_SUB_BG_F | PLTTBUF_SUB_OBJ_F, PLTTFADE_OPAQUE_ALL_F, -2, r4->unk_2, 16, RGB_BLACK);
        ++r4->unk_0;
        pokedexApp->unk_085C = POKEDEXAPP_MAINSEQ_70;
        return POKEDEXAPP_MAINSEQ_03;
    case 1:
        ov18_021F03C0(pokedexApp);
        ov18_021F3E08(pokedexApp);
        ov18_021E8648(pokedexApp);
        ov18_021E8BD4(pokedexApp);
        ov18_021EE20C(pokedexApp);
        MI_CpuClear8(&pokedexApp->unk_0868, sizeof(pokedexApp->unk_0868));
        if (pokedexApp->unk_185B == 2) {
            return POKEDEXAPP_MAINSEQ_76;
        } else if (pokedexApp->unk_185B == 3) {
            return POKEDEXAPP_MAINSEQ_79;
        } else {
            return POKEDEXAPP_MAINSEQ_89;
        }
    }

    return POKEDEXAPP_MAINSEQ_70;
}

int PokedexApp_MainSeq_71(PokedexAppData *pokedexApp) {
    PokedexAppData_UnkSub0868_State26 *r6 = &pokedexApp->unk_0868.state_26;

    switch (r6->unk_0) {
    case 0:
        --pokedexApp->unk_18CA;
        ov18_021F118C(pokedexApp, 6, 6);
        ov18_021F0504(pokedexApp, 1);
        for (u32 i = 0; i < 6; ++i) {
            sub_020198FC(pokedexApp->unk_0008, i + 17, 0, 1, 3);
        }
        r6->unk_3 = ov18_021F6540(pokedexApp, 5, ov18_021F64F4(pokedexApp, pokedexApp->unk_18CA), 3);
        ++r6->unk_0;
        // fallthrough
    case 1:
        ov18_021F6578(pokedexApp, 5, -r6->unk_3);
        ++r6->unk_1;
        if (r6->unk_1 == 3) {
            r6->unk_0 = 0;
            r6->unk_1 = 0;
            --r6->unk_2;
            if (r6->unk_2 == 0) {
                ov18_021F65EC(pokedexApp);
                ov18_021F619C(pokedexApp, pokedexApp->unk_18CA, pokedexApp->unk_18DC.unk_20.nMaps, 6);
                ov18_021F4384(pokedexApp);
                ov18_021F463C(pokedexApp);
                MI_CpuClear8(&pokedexApp->unk_0868, sizeof(pokedexApp->unk_0868));
                return POKEDEXAPP_MAINSEQ_69;
            }
        }
        break;
    }

    return POKEDEXAPP_MAINSEQ_71;
}

int PokedexApp_MainSeq_72(PokedexAppData *pokedexApp) {
    PokedexAppData_UnkSub0868_State26 *r6 = &pokedexApp->unk_0868.state_26;

    switch (r6->unk_0) {
    case 0:
        ++pokedexApp->unk_18CA;
        ov18_021F118C(pokedexApp, 7, 9);
        ov18_021F0504(pokedexApp, -1);
        for (u32 i = 0; i < 6; ++i) {
            sub_020198FC(pokedexApp->unk_0008, i + 17, 0, -1, 3);
        }
        r6->unk_3 = ov18_021F6540(pokedexApp, 5, ov18_021F64F4(pokedexApp, pokedexApp->unk_18CA), 3);
        ++r6->unk_0;
        // fallthrough
    case 1:
        ov18_021F6578(pokedexApp, 5, r6->unk_3);
        ++r6->unk_1;
        if (r6->unk_1 == 3) {
            r6->unk_0 = 0;
            r6->unk_1 = 0;
            --r6->unk_2;
            if (r6->unk_2 == 0) {
                ov18_021F65EC(pokedexApp);
                ov18_021F619C(pokedexApp, pokedexApp->unk_18CA, pokedexApp->unk_18DC.unk_20.nMaps, 6);
                ov18_021F4384(pokedexApp);
                ov18_021F463C(pokedexApp);
                MI_CpuClear8(&pokedexApp->unk_0868, sizeof(pokedexApp->unk_0868));
                return POKEDEXAPP_MAINSEQ_69;
            }
        }
        break;
    }

    return POKEDEXAPP_MAINSEQ_72;
}

int PokedexApp_MainSeq_73(PokedexAppData *pokedexApp) {
    u32 x, y;

    ov18_021EE26C(pokedexApp);
    if (!System_GetTouchHeldCoords(&x, &y)) {
        return POKEDEXAPP_MAINSEQ_69;
    }
    if (ov18_021F63DC(pokedexApp, x, y) == TRUE) {
        ov18_021F619C(pokedexApp, pokedexApp->unk_18CA, pokedexApp->unk_18DC.unk_20.nMaps, 6);
        ov18_021F4384(pokedexApp);
        ov18_021F463C(pokedexApp);
        ov18_021F0428(pokedexApp);
        PlaySE(SEQ_SE_GS_ZKN03);
    }
    return POKEDEXAPP_MAINSEQ_73;
}

int PokedexApp_MainSeq_74(PokedexAppData *pokedexApp) {
    PokedexAppData_UnkSub0868_State16 *r2 = &pokedexApp->unk_0868.state_16;

    if (ov18_021F63DC(pokedexApp, r2->unk_0, r2->unk_2) == TRUE) {
        ov18_021F619C(pokedexApp, pokedexApp->unk_18CA, pokedexApp->unk_18DC.unk_20.nMaps, 6);
        ov18_021F4384(pokedexApp);
        ov18_021F463C(pokedexApp);
        ov18_021F0428(pokedexApp);
        PlaySE(SEQ_SE_GS_ZKN03);
        MI_CpuClear8(&pokedexApp->unk_0868, sizeof(pokedexApp->unk_0868));
    }
    return POKEDEXAPP_MAINSEQ_69;
}

int PokedexApp_MainSeq_75(PokedexAppData *pokedexApp) {
    PokedexAppData_UnkSub0868_State16 *r4 = &pokedexApp->unk_0868.state_16;
    BOOL r0 = ov18_021EE21C(pokedexApp);

    switch (r4->unk_0) {
    case 0:
        ov18_021E6794(pokedexApp);
        ov18_021E67B0(pokedexApp);
        ov18_021F11C0(pokedexApp, 2, 0);
        ov18_021F4620(pokedexApp);
        ++r4->unk_0;
        // fallthrough
    case 1:
        r4->unk_2 += 2;
        ov18_021E618C(31 - r4->unk_2, r4->unk_2);
        if (r4->unk_2 == 16) {
            ++r4->unk_0;
        }
        break;
    case 2:
        ov18_021E8648(pokedexApp);
        ov18_021E8528(pokedexApp, pokedexApp->unk_18C9, pokedexApp->unk_18C8);
        ov18_021F40A0(pokedexApp);
        ov18_021F03E0(pokedexApp);
        ov18_021F0428(pokedexApp);
        ov18_021EE170(pokedexApp);
        ++r4->unk_0;
        break;
    case 3:
        r4->unk_2 -= 2;
        ov18_021E618C(31 - r4->unk_2, r4->unk_2);
        if (r4->unk_2 == 0) {
            ov18_021E6174();
            ++r4->unk_0;
        }
        break;
    case 4:
        if (r0) {
            break;
        }
        ov18_021F4134(pokedexApp);
        ov18_021F4384(pokedexApp);
        ov18_021EE314(pokedexApp);
        if (pokedexApp->unk_18DC.unk_20.nMaps == 1) {
            ov18_021E6794(pokedexApp);
        }
        MI_CpuClear8(&pokedexApp->unk_0868, sizeof(pokedexApp->unk_0868));
        return POKEDEXAPP_MAINSEQ_69;
    }

    return POKEDEXAPP_MAINSEQ_75;
}

int PokedexApp_MainSeq_76(PokedexAppData *pokedexApp) {
    switch (pokedexApp->unk_0868.state_10.unk_0) {
    case 0:
        ov18_021E5E70(pokedexApp, TRUE);
        ov18_021E67C8(pokedexApp, 2);
        PaletteData_BeginPaletteFade(pokedexApp->paletteData, PLTTBUF_MAIN_BG_F, 0xF7BE, -2, 16, 0, RGB_BLACK);
        PaletteData_BeginPaletteFade(pokedexApp->paletteData, PLTTBUF_MAIN_OBJ_F, 0xFFEF, -2, 16, 0, RGB_BLACK);
        PaletteData_BeginPaletteFade(pokedexApp->paletteData, PLTTBUF_SUB_BG_F | PLTTBUF_SUB_OBJ_F, 0xFFFF, -2, 16, 0, RGB_BLACK);
        ++pokedexApp->unk_0868.state_10.unk_0;
        pokedexApp->unk_085C = POKEDEXAPP_MAINSEQ_76;
        return POKEDEXAPP_MAINSEQ_03;
    case 1:
        pokedexApp->unk_185B = 2;
        pokedexApp->unk_0868.state_10.unk_0 = 0;
        return POKEDEXAPP_MAINSEQ_77;
    }

    return POKEDEXAPP_MAINSEQ_76;
}

int PokedexApp_MainSeq_77(PokedexAppData *pokedexApp) {
    u32 sp0;

    ov18_021EE068(pokedexApp);
    switch (ov18_021F7D00(pokedexApp, &sp0)) {
    case 0:
        if (sp0 == 1) {
            PlaySE(SEQ_SE_GS_ZKN04);
        } else {
            PlaySE(SEQ_SE_GS_ZKN03);
        }
        ov18_021EE0CC(pokedexApp);
        return ov18_021EC1DC(pokedexApp, 0, 1);
    case 1:
        if (sp0 == 1) {
            PlaySE(SEQ_SE_GS_ZKN04);
        } else {
            PlaySE(SEQ_SE_GS_ZKN03);
        }
        ov18_021EE0CC(pokedexApp);
        return ov18_021EC1DC(pokedexApp, 0, 2);
    case 2:
        if (sp0 == 1) {
            PlaySE(SEQ_SE_GS_ZKN04);
        } else {
            PlaySE(SEQ_SE_GS_ZKN03);
        }
        ov18_021EE0CC(pokedexApp);
        return ov18_021EC1DC(pokedexApp, 0, 3);
    case 3:
        PlaySE(SEQ_SE_GS_GEARCANCEL);
        ov18_021EE0CC(pokedexApp);
        return ov18_021EC1DC(pokedexApp, 0, 255);
    default:
        if (gSystem.newKeys & PAD_BUTTON_A) {
            PlaySE(SEQ_SE_GS_ZKN03);
            ov18_021EE0CC(pokedexApp);
            return ov18_021EC1DC(pokedexApp, 0, 2);
        }
        if (System_GetTouchNew() == TRUE) {
            PlaySE(SEQ_SE_GS_ZKN04);
            ov18_021EE0CC(pokedexApp);
            return ov18_021EC1DC(pokedexApp, 0, 2);
        }
        break;
    }

    return POKEDEXAPP_MAINSEQ_77;
}

int PokedexApp_MainSeq_78(PokedexAppData *pokedexApp) {
    PokedexAppData_UnkSub0868_State09 *r4 = &pokedexApp->unk_0868.state_09;

    switch (r4->unk_0) {
    case 0:
        PaletteData_BeginPaletteFade(pokedexApp->paletteData, PLTTBUF_MAIN_BG_F, 0xF7BE, -2, r4->unk_2, 16, RGB_BLACK);
        PaletteData_BeginPaletteFade(pokedexApp->paletteData, PLTTBUF_MAIN_OBJ_F, 0xFFEF, -2, r4->unk_2, 16, RGB_BLACK);
        PaletteData_BeginPaletteFade(pokedexApp->paletteData, PLTTBUF_SUB_BG_F | PLTTBUF_SUB_OBJ_F, 0xFFFF, -2, r4->unk_2, 16, RGB_BLACK);
        ++r4->unk_0;
        pokedexApp->unk_085C = POKEDEXAPP_MAINSEQ_78;
        return POKEDEXAPP_MAINSEQ_03;
    case 1:
        ov18_021F0838(pokedexApp);
        ov18_021F4A50(pokedexApp);
        ov18_021E5E70(pokedexApp, 0);
        MI_CpuClear8(&pokedexApp->unk_0868, sizeof(pokedexApp->unk_0868));
        if (pokedexApp->unk_185B == 1) {
            return POKEDEXAPP_MAINSEQ_68;
        } else if (pokedexApp->unk_185B == 2) {
            return POKEDEXAPP_MAINSEQ_76;
        } else {
            return POKEDEXAPP_MAINSEQ_79;
        }
    }

    return POKEDEXAPP_MAINSEQ_78;
}

int PokedexApp_MainSeq_79(PokedexAppData *pokedexApp) {
    switch (pokedexApp->unk_0868.state_10.unk_0) {
    case 0:
        pokedexApp->unk_18C5 = 0;
        ov18_021F01D4(pokedexApp);
        ov18_021E67C8(pokedexApp, 3);
        PaletteData_BeginPaletteFade(pokedexApp->paletteData, PLTTBUF_MAIN_BG_F, 0xF7BE, -2, 16, 0, RGB_BLACK);
        PaletteData_BeginPaletteFade(pokedexApp->paletteData, PLTTBUF_MAIN_OBJ_F, 0xFFEF, -2, 16, 0, RGB_BLACK);
        PaletteData_BeginPaletteFade(pokedexApp->paletteData, PLTTBUF_SUB_BG_F | PLTTBUF_SUB_OBJ_F, 0xFFFF, -2, 16, 0, RGB_BLACK);
        ++pokedexApp->unk_0868.state_10.unk_0;
        pokedexApp->unk_085C = POKEDEXAPP_MAINSEQ_79;
        return POKEDEXAPP_MAINSEQ_03;
    case 1:
        pokedexApp->unk_185B = 3;
        pokedexApp->unk_0868.state_10.unk_0 = 0;
        return POKEDEXAPP_MAINSEQ_80;
    }

    return POKEDEXAPP_MAINSEQ_79;
}
