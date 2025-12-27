#include "application/pokedex/pokedex_internal.h"
#include "msgdata/msg.naix"

#include "dex_mon_measures.h"
#include "gf_gfx_loader.h"
#include "pokedex_util.h"
#include "sprite_system.h"
#include "unk_02005D10.h"
#include "unk_02091278.h"
#include "unk_020912AC.h"

void ov18_021E5C40(void *cb_arg);
void ov18_021E5FA4(void);
void ov18_021E5FE8(void);
void ov18_021E602C(void);
void ov18_021E6070(void);
void ov18_021E60B4(void);
void ov18_021E60F8(void);
void ov18_021E6868(PokedexAppData *pokedexApp);
void ov18_021E6A98(u16 *a0, u16 a1, u16 a2);
void ov18_021E7048(PokedexAppData *pokedexApp);
void ov18_021E7448(PokedexAppData *pokedexApp, const UnkStruct_ov18_021F9780 *a1, BOOL a2);
void ov18_021E7490(PokedexAppData *pokedexApp, const UnkStruct_ov18_021F9780 *a1, int *a2, int a3);
void ov18_021E7564(PokedexAppData *pokedexApp);
void ov18_021E7628(PokedexAppData *pokedexApp, u32 a1, BOOL a2);
void ov18_021E76A4(PokedexAppData *pokedexApp, u32 a1, BOOL a2);
void ov18_021E7A3C(PokedexAppData *pokedexApp);
void ov18_021E7BD0(PokedexAppData *pokedexApp);
void ov18_021E7D90(PokedexAppData *pokedexApp);
void ov18_021E7ED8(PokedexAppData *pokedexApp);
void ov18_021E800C(PokedexAppData *pokedexApp);
u8 ov18_021E83D0(PokedexAppData *pokedexApp, u8 a1);
void ov18_021EE3FC(PokedexAppData *pokedexApp);
void ov18_021EEE58(PokedexAppData *pokedexApp);
void ov18_021F021C(PokedexAppData *pokedexApp);
void ov18_021F05E8(PokedexAppData *pokedexApp);
void ov18_021F0858(PokedexAppData *pokedexApp);
void ov18_021F0900(PokedexAppData *pokedexApp);
void ov18_021F2880(PokedexAppData *pokedexApp);
void ov18_021F2F3C(PokedexAppData *pokedexApp);
void ov18_021F3D98(PokedexAppData *pokedexApp);
void ov18_021F49F8(PokedexAppData *pokedexApp);
void ov18_021F5DC0(PokedexAppData *pokedexApp);

extern const UnkStruct_ov18_021F9780 ov18_021F9770[];
extern const UnkStruct_ov18_021F9780 ov18_021F9780[];
extern const GraphicsBanks ov18_021F98B0;
extern const UnkStruct_ov18_021F9780 ov18_021F990C[18];
extern const u8 ov18_021F9C18[6];
extern const u8 ov18_021F9C20[];

void ov18_021E5C40(void *cb_arg) {
    PokedexAppData *pokedexApp = cb_arg;

    PaletteData_PushTransparentBuffers(pokedexApp->unk_0850);
    ov18_021E7A3C(pokedexApp);
    DoScheduledBgGpuUpdates(pokedexApp->unk_0004);
    SpriteSystem_TransferOam();
    OS_SetIrqCheckFlag(OS_IE_V_BLANK);
}

void ov18_021E5C74(void) {
    GfGfx_SetBanks(&ov18_021F98B0);
}

void ov18_021E5C84(PokedexAppData *pokedexApp) {
    pokedexApp->unk_0004 = BgConfig_Alloc(HEAP_ID_37);

    {
        extern const GraphicsModes ov18_021F9750;
        GraphicsModes graphicsModes = ov18_021F9750;

        SetBothScreensModesAndDisable(&graphicsModes);
    }

    {
        extern const BgTemplate ov18_021F97EC;
        BgTemplate bgTemplate = ov18_021F97EC;

        InitBgFromTemplate(pokedexApp->unk_0004, GF_BG_LYR_MAIN_0, &bgTemplate, GF_BG_TYPE_TEXT);
        ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_0);
        BG_ClearCharDataRange(GF_BG_LYR_MAIN_0, 0x20, 0, HEAP_ID_37);
    }

    {
        extern const BgTemplate ov18_021F97B4;
        BgTemplate bgTemplate = ov18_021F97B4;

        InitBgFromTemplate(pokedexApp->unk_0004, GF_BG_LYR_MAIN_1, &bgTemplate, GF_BG_TYPE_TEXT);
        ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_1);
        BG_ClearCharDataRange(GF_BG_LYR_MAIN_1, 0x20, 0, HEAP_ID_37);
    }

    {
        extern const BgTemplate ov18_021F9894;
        BgTemplate bgTemplate = ov18_021F9894;

        InitBgFromTemplate(pokedexApp->unk_0004, GF_BG_LYR_MAIN_2, &bgTemplate, GF_BG_TYPE_TEXT);
        ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_2);
        BG_ClearCharDataRange(GF_BG_LYR_MAIN_2, 0x20, 0, HEAP_ID_37);
    }

    {
        extern const BgTemplate ov18_021F9824;
        BgTemplate bgTemplate = ov18_021F9824;

        InitBgFromTemplate(pokedexApp->unk_0004, GF_BG_LYR_MAIN_3, &bgTemplate, GF_BG_TYPE_TEXT);
        ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_3);
        BG_ClearCharDataRange(GF_BG_LYR_MAIN_3, 0x20, 0, HEAP_ID_37);
    }

    {
        extern const BgTemplate ov18_021F9840;
        BgTemplate bgTemplate = ov18_021F9840;

        InitBgFromTemplate(pokedexApp->unk_0004, GF_BG_LYR_SUB_0, &bgTemplate, GF_BG_TYPE_TEXT);
        ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_0);
        BG_ClearCharDataRange(GF_BG_LYR_SUB_0, 0x20, 0, HEAP_ID_37);
    }

    {
        extern const BgTemplate ov18_021F985C;
        BgTemplate bgTemplate = ov18_021F985C;

        InitBgFromTemplate(pokedexApp->unk_0004, GF_BG_LYR_SUB_1, &bgTemplate, GF_BG_TYPE_TEXT);
        ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_1);
        BG_ClearCharDataRange(GF_BG_LYR_SUB_1, 0x20, 0, HEAP_ID_37);
    }

    {
        extern const BgTemplate ov18_021F9798;
        BgTemplate bgTemplate = ov18_021F9798;

        InitBgFromTemplate(pokedexApp->unk_0004, GF_BG_LYR_SUB_2, &bgTemplate, GF_BG_TYPE_TEXT);
        ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_2);
        BG_ClearCharDataRange(GF_BG_LYR_SUB_2, 0x20, 0, HEAP_ID_37);
    }

    {
        extern const BgTemplate ov18_021F97D0;
        BgTemplate bgTemplate = ov18_021F97D0;

        InitBgFromTemplate(pokedexApp->unk_0004, GF_BG_LYR_SUB_3, &bgTemplate, GF_BG_TYPE_TEXT);
        ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_3);
        BG_ClearCharDataRange(GF_BG_LYR_SUB_3, 0x20, 0, HEAP_ID_37);
    }
}

void ov18_021E5E70(PokedexAppData *pokedexApp, BOOL a1) {
    FreeBgTilemapBuffer(pokedexApp->unk_0004, GF_BG_LYR_SUB_3);
    if (!a1) {
        {
            extern const GraphicsModes ov18_021F9740;
            GraphicsModes graphicsModes = ov18_021F9740;

            SetScreenModeAndDisable(&graphicsModes, SCREEN_SUB);
        }

        {
            extern const BgTemplate ov18_021F9878;
            BgTemplate bgTemplate = ov18_021F9878;

            InitBgFromTemplate(pokedexApp->unk_0004, GF_BG_LYR_SUB_3, &bgTemplate, GF_BG_TYPE_TEXT);
            ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_3);
            BG_ClearCharDataRange(GF_BG_LYR_SUB_3, 0x20, 0, HEAP_ID_37);
        }
    } else {
        {
            extern const GraphicsModes ov18_021F9760;
            GraphicsModes graphicsModes = ov18_021F9760;

            SetScreenModeAndDisable(&graphicsModes, SCREEN_SUB);
        }

        {
            extern const BgTemplate ov18_021F9808;
            BgTemplate bgTemplate = ov18_021F9808;

            InitBgFromTemplate(pokedexApp->unk_0004, GF_BG_LYR_SUB_3, &bgTemplate, GF_BG_TYPE_AFFINE);
            ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_3);
            BG_ClearCharDataRange(GF_BG_LYR_SUB_3, 0x40, 0, HEAP_ID_37);
        }
    }

    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_ON);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_ON);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG2, GF_PLANE_TOGGLE_ON);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG3, GF_PLANE_TOGGLE_ON);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
}

void ov18_021E5F58(PokedexAppData *pokedexApp) {
    FreeBgTilemapBuffer(pokedexApp->unk_0004, GF_BG_LYR_SUB_3);
    FreeBgTilemapBuffer(pokedexApp->unk_0004, GF_BG_LYR_SUB_2);
    FreeBgTilemapBuffer(pokedexApp->unk_0004, GF_BG_LYR_SUB_1);
    FreeBgTilemapBuffer(pokedexApp->unk_0004, GF_BG_LYR_SUB_0);
    FreeBgTilemapBuffer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_3);
    FreeBgTilemapBuffer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_2);
    FreeBgTilemapBuffer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_1);
    FreeBgTilemapBuffer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_0);
    Heap_Free(pokedexApp->unk_0004);
}

void ov18_021E5FA4(void) {
    // main bg
    SetBgPriority(GF_BG_LYR_MAIN_0, 2);
    SetBgPriority(GF_BG_LYR_MAIN_1, 0);
    SetBgPriority(GF_BG_LYR_MAIN_2, 1);
    SetBgPriority(GF_BG_LYR_MAIN_3, 3);

    // sub bg
    SetBgPriority(GF_BG_LYR_SUB_0, 0);
    SetBgPriority(GF_BG_LYR_SUB_1, 1);
    SetBgPriority(GF_BG_LYR_SUB_2, 2);
    SetBgPriority(GF_BG_LYR_SUB_3, 3);
}

void ov18_021E5FE8(void) {
    // main bg
    SetBgPriority(GF_BG_LYR_MAIN_0, 1);
    SetBgPriority(GF_BG_LYR_MAIN_1, 0);
    SetBgPriority(GF_BG_LYR_MAIN_2, 2);
    SetBgPriority(GF_BG_LYR_MAIN_3, 3);

    // sub bg
    SetBgPriority(GF_BG_LYR_SUB_0, 0);
    SetBgPriority(GF_BG_LYR_SUB_1, 1);
    SetBgPriority(GF_BG_LYR_SUB_2, 2);
    SetBgPriority(GF_BG_LYR_SUB_3, 3);
}

void ov18_021E602C(void) {
    // main bg
    SetBgPriority(GF_BG_LYR_MAIN_0, 1);
    SetBgPriority(GF_BG_LYR_MAIN_1, 0);
    SetBgPriority(GF_BG_LYR_MAIN_2, 2);
    SetBgPriority(GF_BG_LYR_MAIN_3, 3);

    // sub bg
    SetBgPriority(GF_BG_LYR_SUB_0, 0);
    SetBgPriority(GF_BG_LYR_SUB_1, 1);
    SetBgPriority(GF_BG_LYR_SUB_2, 2);
    SetBgPriority(GF_BG_LYR_SUB_3, 3);
}

void ov18_021E6070(void) {
    // main bg
    SetBgPriority(GF_BG_LYR_MAIN_0, 1);
    SetBgPriority(GF_BG_LYR_MAIN_1, 0);
    SetBgPriority(GF_BG_LYR_MAIN_2, 2);
    SetBgPriority(GF_BG_LYR_MAIN_3, 3);

    // sub bg
    SetBgPriority(GF_BG_LYR_SUB_0, 3);
    SetBgPriority(GF_BG_LYR_SUB_1, 0);
    SetBgPriority(GF_BG_LYR_SUB_2, 1);
    SetBgPriority(GF_BG_LYR_SUB_3, 2);
}

void ov18_021E60B4(void) {
    // main bg
    SetBgPriority(GF_BG_LYR_MAIN_0, 1);
    SetBgPriority(GF_BG_LYR_MAIN_1, 0);
    SetBgPriority(GF_BG_LYR_MAIN_2, 2);
    SetBgPriority(GF_BG_LYR_MAIN_3, 3);

    // sub bg
    SetBgPriority(GF_BG_LYR_SUB_0, 0);
    SetBgPriority(GF_BG_LYR_SUB_1, 1);
    SetBgPriority(GF_BG_LYR_SUB_2, 3);
    SetBgPriority(GF_BG_LYR_SUB_3, 2);
}

void ov18_021E60F8(void) {
    // main bg
    SetBgPriority(GF_BG_LYR_MAIN_0, 1);
    SetBgPriority(GF_BG_LYR_MAIN_1, 0);
    SetBgPriority(GF_BG_LYR_MAIN_2, 2);
    SetBgPriority(GF_BG_LYR_MAIN_3, 3);

    // sub bg
    SetBgPriority(GF_BG_LYR_SUB_0, 0);
    SetBgPriority(GF_BG_LYR_SUB_1, 1);
    SetBgPriority(GF_BG_LYR_SUB_2, 3);
    SetBgPriority(GF_BG_LYR_SUB_3, 2);
}

void ov18_021E613C(PokedexAppData *pokedexApp, u8 bgId) {
    u8 width;

    if (bgId == GF_BG_LYR_MAIN_0 || bgId == GF_BG_LYR_SUB_0) {
        width = 0x40;
    } else {
        width = 0x20;
    }

    FillBgTilemapRect(pokedexApp->unk_0004, bgId, 0, 0, 0, width, 0x20, 0);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, bgId);
}

void ov18_021E6174(void) {
    G2_SetBlendAlpha(0, GX_PLANEMASK_BG0 | GX_PLANEMASK_BG1 | GX_PLANEMASK_BG2 | GX_PLANEMASK_BG3, 6, 10);
}

void ov18_021E618C(int ev1, int ev2) {
    G2_SetBlendAlpha(GX_PLANEMASK_BG2, GX_PLANEMASK_BG3, ev1, ev2);
}

void ov18_021E61A4(PokedexAppData *pokedexApp) {
    pokedexApp->unk_0850 = PaletteData_Init(HEAP_ID_37);
    ZeroPalettesByBitmask(PLTTBUF_MAIN_BG_F | PLTTBUF_SUB_BG_F | PLTTBUF_MAIN_OBJ_F | PLTTBUF_SUB_OBJ_F, HEAP_ID_37);
    PaletteData_AllocBuffers(pokedexApp->unk_0850, PLTTBUF_MAIN_BG, 0x200, HEAP_ID_37);
    PaletteData_AllocBuffers(pokedexApp->unk_0850, PLTTBUF_SUB_BG, 0x200, HEAP_ID_37);
    PaletteData_AllocBuffers(pokedexApp->unk_0850, PLTTBUF_MAIN_OBJ, 0x200, HEAP_ID_37);
    PaletteData_AllocBuffers(pokedexApp->unk_0850, PLTTBUF_SUB_OBJ, 0x200, HEAP_ID_37);
}

void ov18_021E6204(PokedexAppData *pokedexApp) {
    PaletteData_FreeBuffers(pokedexApp->unk_0850, PLTTBUF_SUB_OBJ);
    PaletteData_FreeBuffers(pokedexApp->unk_0850, PLTTBUF_MAIN_OBJ);
    PaletteData_FreeBuffers(pokedexApp->unk_0850, PLTTBUF_SUB_BG);
    PaletteData_FreeBuffers(pokedexApp->unk_0850, PLTTBUF_MAIN_BG);
    PaletteData_Free(pokedexApp->unk_0850);
}

void ov18_021E6244(PokedexAppData *pokedexApp) {
    pokedexApp->unk_065C = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0802_bin, HEAP_ID_37);
    pokedexApp->unk_0660 = MessageFormat_New(HEAP_ID_37);
    pokedexApp->unk_0664 = String_New(0x400, HEAP_ID_37);
}

void ov18_021E6280(PokedexAppData *pokedexApp) {
    String_Delete(pokedexApp->unk_0664);
    MessageFormat_Delete(pokedexApp->unk_0660);
    DestroyMsgData(pokedexApp->unk_065C);
}

void ov18_021E62A8(PokedexAppData *pokedexApp) {
    NARC *narc = NARC_New(NARC_a_0_7_5, HEAP_ID_37);
    pokedexApp->unk_1850 = GfGfxLoader_LoadFromOpenNarc(narc, 0, FALSE, HEAP_ID_37, FALSE);
    pokedexApp->unk_1854 = GfGfxLoader_LoadFromOpenNarc(narc, 1, FALSE, HEAP_ID_37, FALSE);
    NARC_Delete(narc);
}

void ov18_021E62E8(PokedexAppData *pokedexApp) {
    Heap_Free(pokedexApp->unk_1854);
    Heap_Free(pokedexApp->unk_1850);
}

void ov18_021E6308(PokedexAppData *pokedexApp) {
    pokedexApp->unk_0008 = sub_0201956C(pokedexApp->unk_0004, 2, 24, HEAP_ID_37);
    sub_020195F4(pokedexApp->unk_0008, 0, 2, 32, 5);
    sub_020195F4(pokedexApp->unk_0008, 1, 2, 32, 5);
    sub_020195F4(pokedexApp->unk_0008, 2, 0, 22, 4);
    sub_020195F4(pokedexApp->unk_0008, 3, 0, 22, 4);
    sub_020195F4(pokedexApp->unk_0008, 4, 2, 32, 4);
    sub_020195F4(pokedexApp->unk_0008, 5, 3, 32, 5);
    sub_020195F4(pokedexApp->unk_0008, 6, 1, 32, 4);
    sub_020195F4(pokedexApp->unk_0008, 7, 1, 32, 4);
    sub_020195F4(pokedexApp->unk_0008, 8, 2, 32, 5);
    sub_020195F4(pokedexApp->unk_0008, 9, 0, 32, 24);
    sub_020195F4(pokedexApp->unk_0008, 10, 2, 32, 24);
    sub_020195F4(pokedexApp->unk_0008, 11, 5, 32, 24);
    sub_020195F4(pokedexApp->unk_0008, 12, 6, 32, 24);
    sub_020195F4(pokedexApp->unk_0008, 13, 4, 32, 24);
    sub_020195F4(pokedexApp->unk_0008, 15, 0, 32, 24);
    sub_020195F4(pokedexApp->unk_0008, 14, 0, 3, 24);
    sub_020195F4(pokedexApp->unk_0008, 16, 1, 32, 4);
    sub_020195F4(pokedexApp->unk_0008, 23, 7, 20, 4);
    sub_020196B8(pokedexApp->unk_0008, 0, pokedexApp->unk_0854, 5, 1);
    sub_020196B8(pokedexApp->unk_0008, 1, pokedexApp->unk_0854, 6, 1);
    sub_020196B8(pokedexApp->unk_0008, 2, pokedexApp->unk_0854, 7, 1);
    sub_020196B8(pokedexApp->unk_0008, 3, pokedexApp->unk_0854, 8, 1);
    sub_020196B8(pokedexApp->unk_0008, 4, pokedexApp->unk_0854, 9, 1);
    sub_020196B8(pokedexApp->unk_0008, 5, pokedexApp->unk_0854, 10, 1);
    sub_020196B8(pokedexApp->unk_0008, 6, pokedexApp->unk_0854, 69, 1);
    sub_020196B8(pokedexApp->unk_0008, 7, pokedexApp->unk_0854, 70, 1);
    sub_020196B8(pokedexApp->unk_0008, 8, pokedexApp->unk_0854, 71, 1);
    sub_020196B8(pokedexApp->unk_0008, 13, pokedexApp->unk_0854, 16, 1);
    sub_020196B8(pokedexApp->unk_0008, 16, pokedexApp->unk_0854, 11, 1);
    sub_020196B8(pokedexApp->unk_0008, 23, pokedexApp->unk_0854, 88, 1);
    sub_02019B70(pokedexApp->unk_0008, 11, 0, 32, 0, 19);
    sub_02019B70(pokedexApp->unk_0008, 12, 0, 32, 0, 19);
    ov18_021F0168(pokedexApp);
}

void ov18_021E6540(PokedexAppData *pokedexApp) {
    sub_020195C0(pokedexApp->unk_0008);
}

void ov18_021E654C(PokedexAppData *pokedexApp) {
    sub_020196E8(pokedexApp->unk_0008, 0, 0, 24);
    sub_020198FC(pokedexApp->unk_0008, 0, 0, -1, 5);
}

void ov18_021E6574(PokedexAppData *pokedexApp) {
    sub_020196E8(pokedexApp->unk_0008, 0, 0, 19);
    sub_020198FC(pokedexApp->unk_0008, 0, 0, 1, 5);
}

void ov18_021E659C(PokedexAppData *pokedexApp) {
    sub_020196E8(pokedexApp->unk_0008, 4, 0, 15);
}

void ov18_021E65AC(PokedexAppData *pokedexApp) {
    sub_020196E8(pokedexApp->unk_0008, 1, 0, 24);
    sub_020198FC(pokedexApp->unk_0008, 1, 0, -1, 5);
}

void ov18_021E65D4(PokedexAppData *pokedexApp) {
    sub_020196E8(pokedexApp->unk_0008, 1, 0, 19);
    sub_020198FC(pokedexApp->unk_0008, 1, 0, 1, 5);
}

void ov18_021E65FC(PokedexAppData *pokedexApp) {
    sub_020196E8(pokedexApp->unk_0008, 6, 0, 24);
    sub_020198FC(pokedexApp->unk_0008, 6, 0, -1, 4);
}

void ov18_021E6624(PokedexAppData *pokedexApp) {
    sub_020196E8(pokedexApp->unk_0008, 6, 0, 20);
    sub_020198FC(pokedexApp->unk_0008, 6, 0, 1, 4);
}

void ov18_021E664C(PokedexAppData *pokedexApp) {
    sub_020196E8(pokedexApp->unk_0008, 7, 0, 24);
    sub_020198FC(pokedexApp->unk_0008, 7, 0, -1, 4);
}

void ov18_021E6674(PokedexAppData *pokedexApp) {
    sub_020196E8(pokedexApp->unk_0008, 7, 0, 20);
    sub_020198FC(pokedexApp->unk_0008, 7, 0, 1, 4);
}

void ov18_021E669C(PokedexAppData *pokedexApp) {
    sub_020196E8(pokedexApp->unk_0008, 8, 0, 24);
    sub_020198FC(pokedexApp->unk_0008, 8, 0, -1, 5);
}

void ov18_021E66C4(PokedexAppData *pokedexApp) {
    sub_020196E8(pokedexApp->unk_0008, 8, 0, 19);
    sub_020198FC(pokedexApp->unk_0008, 8, 0, 1, 5);
}

void ov18_021E66EC(PokedexAppData *pokedexApp) {
    sub_020196E8(pokedexApp->unk_0008, 16, 0, 24);
    sub_020198FC(pokedexApp->unk_0008, 16, 0, -1, 4);
}

void ov18_021E6714(PokedexAppData *pokedexApp) {
    sub_020196E8(pokedexApp->unk_0008, 16, 0, 20);
    sub_020198FC(pokedexApp->unk_0008, 16, 0, 1, 4);
}

void ov18_021E673C(PokedexAppData *pokedexApp) {
    u16 *r4 = sub_02019B08(pokedexApp->unk_0008, 16);
    u16 r5;

    if (Pokedex_CheckMonCaughtFlag(pokedexApp->unk_0000->pokedex, pokedexApp->unk_18A2)) {
        r5 = 0;
    } else {
        r5 = 0xB000;
    }
    for (u32 i = 0; i < 4; ++i) {
        for (u32 j = 8; j < 16; ++j) {
            r4[32 * i + j] = (r4[32 * i + j] & 0xFFF) | r5;
        }
    }
}

void ov18_021E6794(PokedexAppData *pokedexApp) {
    sub_020196E8(pokedexApp->unk_0008, 23, 10, 11);
    ScheduleWindowCopyToVram(&pokedexApp->unk_003C);
}

void ov18_021E67B0(PokedexAppData *pokedexApp) {
    sub_0201980C(pokedexApp->unk_0008, 23);
    ClearWindowTilemapAndScheduleTransfer(&pokedexApp->unk_003C);
}

void ov18_021E67C8(PokedexAppData *pokedexApp, int a1) {
    switch (a1) {
    case 0:
        ov18_021E6868(pokedexApp);
        ov18_021E5FA4();
        ov18_021EE3FC(pokedexApp);
        ov18_021F2880(pokedexApp);
        break;
    case 1:
        ov18_021E7BD0(pokedexApp);
        ov18_021E6070();
        ov18_021F021C(pokedexApp);
        ov18_021F3D98(pokedexApp);
        break;
    case 2:
        ov18_021E7D90(pokedexApp);
        ov18_021E60B4();
        ov18_021F05E8(pokedexApp);
        ov18_021F49F8(pokedexApp);
        break;
    case 3:
        ov18_021E800C(pokedexApp);
        ov18_021E602C();
        ov18_021F0900(pokedexApp);
        ov18_021F5DC0(pokedexApp);
        break;
    case 4:
        ov18_021E7ED8(pokedexApp);
        ov18_021E60F8();
        ov18_021F0858(pokedexApp);
        break;
    case 5:
        ov18_021E7048(pokedexApp);
        ov18_021E5FE8();
        ov18_021EEE58(pokedexApp);
        ov18_021F2F3C(pokedexApp);
        break;
    }
}

void ov18_021E6868(PokedexAppData *pokedexApp) {
    ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_1);
    ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_2);
    ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_3);
    ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_0);
    ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_1);
    ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_2);

    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->unk_0854, 1, pokedexApp->unk_0004, GF_BG_LYR_MAIN_0, 0, 0, TRUE, HEAP_ID_37);
    {
        NNSG2dScreenData *sp10;
        void *r5 = GfGfxLoader_GetScrnDataFromOpenNarc(pokedexApp->unk_0854, 0, TRUE, &sp10, HEAP_ID_37);
        BG_LoadScreenTilemapData(pokedexApp->unk_0004, GF_BG_LYR_MAIN_0, sp10->rawData, 0x1000);
        Heap_Free(r5);
    }
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->unk_0854, 4, pokedexApp->unk_0004, GF_BG_LYR_MAIN_2, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->unk_0854, 3, pokedexApp->unk_0004, GF_BG_LYR_MAIN_3, 0, 0, TRUE, HEAP_ID_37);
    PaletteData_LoadOpenNarc(pokedexApp->unk_0850, pokedexApp->unk_0854, 2, HEAP_ID_37, PLTTBUF_MAIN_BG, 0, 0);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->unk_0854, 17, pokedexApp->unk_0004, GF_BG_LYR_SUB_0, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 16, pokedexApp->unk_0004, GF_BG_LYR_SUB_0, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->unk_0854, 19, pokedexApp->unk_0004, GF_BG_LYR_SUB_3, 0, 0, TRUE, HEAP_ID_37);
    if (pokedexApp->unk_185C == 2) {
        GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 20, pokedexApp->unk_0004, GF_BG_LYR_SUB_3, 0, 0, TRUE, HEAP_ID_37);
    } else {
        GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 21, pokedexApp->unk_0004, GF_BG_LYR_SUB_3, 0, 0, TRUE, HEAP_ID_37);
    }
    PaletteData_LoadOpenNarc(pokedexApp->unk_0850, pokedexApp->unk_0854, 18, HEAP_ID_37, PLTTBUF_SUB_BG, 0, 0);
    if (!pokedexApp->unk_1860) {
        FillBgTilemapRect(pokedexApp->unk_0004, GF_BG_LYR_MAIN_0, 0x16, 3, 15, 26, 2, TILEMAP_FILL_KEEP_PAL);
    }
    ov18_021E6A70(pokedexApp);
    sub_020196E8(pokedexApp->unk_0008, 0, 0, 19);
    ov18_021E6C98(pokedexApp);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_0);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_1);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_2);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_3);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_0);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_1);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_2);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_3);
}

void ov18_021E6A70(PokedexAppData *pokedexApp) {
    if (pokedexApp->unk_1858 == 0) {
        sub_020196E8(pokedexApp->unk_0008, 2, 5, 3);
    } else {
        sub_020196E8(pokedexApp->unk_0008, 3, 5, 3);
    }
}

void ov18_021E6A98(u16 *a0, u16 a1, u16 a2) {
    u8 sp4[3] = { 100, 10, 1 };

    for (u8 i = 0; i < 3; ++i) {
        a0[i] = (a2 + (a1 / sp4[i])) | 0x1000;
        a1 %= sp4[i];
    }
}

u16 *ov18_021E6AEC(PokedexAppData *pokedexApp, u32 a1) {
    u16 *ret = Heap_AllocAtEnd(HEAP_ID_37, 160 * 10 * sizeof(u16));
    u16 *sp14 = sub_02019B08(pokedexApp->unk_0008, 5);
    u32 sp10 = ov18_021F891C(pokedexApp, TRUE);

    for (u16 i = 0; i < 10; ++i) {
        MI_CpuCopy16(sp14, &ret[160 * i], 160 * sizeof(u16));
        for (u16 j = 0; j < 5; ++j) {
            u32 r1 = a1 + 5 * i + j;
            if (r1 >= sp10) {
                break;
            }
            if (pokedexApp->unk_1030[r1].unk_2 == 2) {
                ret[160 * i + 36 + 5 * j] = 0x1002;
                ov18_021E6A98(&ret[160 * i + 37 + 5 * j], r1 + 1, 3);
            } else {
                ov18_021E6A98(&ret[160 * i + 37 + 5 * j], r1 + 1, 14);
            }
        }
    }

    return ret;
}

u16 *ov18_021E6BB8(PokedexAppData *pokedexApp, u32 a1) {
    u16 *ret = Heap_AllocAtEnd(HEAP_ID_37, 160 * 10 * sizeof(u16));
    u16 *sp14 = sub_02019B08(pokedexApp->unk_0008, 5);

    for (u16 i = 0; i < 10; ++i) {
        MI_CpuCopy16(sp14, &ret[160 * i], 160 * sizeof(u16));
        for (u16 j = 0; j < 5; ++j) {
            u32 sp4 = a1 + 5 * i + j;
            if (pokedexApp->unk_1030[sp4].unk_0 == SPECIES_NONE) {
                continue;
            }
            u32 r1 = Pokedex_ConvertToCurrentDexNo(pokedexApp->unk_1858, pokedexApp->unk_1030[sp4].unk_0);
            if (pokedexApp->unk_1030[sp4].unk_2 == 2) {
                ret[160 * i + 36 + 5 * j] = 0x1002;
                ov18_021E6A98(&ret[160 * i + 37 + 5 * j], r1, 3);
            } else {
                ov18_021E6A98(&ret[160 * i + 37 + 5 * j], r1, 14);
            }
        }
    }

    return ret;
}

void ov18_021E6C90(u16 *a0) {
    Heap_Free(a0);
}

void ov18_021E6C98(PokedexAppData *pokedexApp) {
    u16 *r5 = ov18_021E6AEC(pokedexApp, 15 * pokedexApp->unk_1859);
    ov18_021E6CE8(pokedexApp, r5);
    ov18_021E6C90(r5);
}

void ov18_021E6CC0(PokedexAppData *pokedexApp) {
    u16 *r5 = ov18_021E6BB8(pokedexApp, 15 * pokedexApp->unk_1859);
    ov18_021E6CE8(pokedexApp, r5);
    ov18_021E6C90(r5);
}

void ov18_021E6CE8(PokedexAppData *pokedexApp, u16 *a1) {
    LoadRectToBgTilemapRect(pokedexApp->unk_0004, GF_BG_LYR_MAIN_3, a1, 0, 0, 32, 24);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_3);
}

BOOL ov18_021E6D10(PokedexAppData *pokedexApp, u16 species, u16 language) {
    // explicit comparison to FALSE required to match
    if (Pokedex_GetInternationalViewFlag(pokedexApp->unk_0000->pokedex) == FALSE) {
        return FALSE;
    }

    return Pokedex_HasCaughtMonWithLanguage(pokedexApp->unk_0000->pokedex, species, language);
}

BOOL ov18_021E6D38(PokedexAppData *pokedexApp, u16 species) {
    for (int i = 0; i < NELEMS(ov18_021F9C18); ++i) {
        if (ov18_021F9C18[i] != GAME_LANGUAGE && ov18_021E6D10(pokedexApp, species, ov18_021F9C18[i]) == TRUE) {
            return TRUE;
        }
    }

    return FALSE;
}

void ov18_021E6D68(PokedexAppData *pokedexApp, u16 species, s16 a2) {
    if (Pokedex_GetInternationalViewFlag(pokedexApp->unk_0000->pokedex) == FALSE) {
        return;
    }

    s16 r7 = LanguageToDexFlag(pokedexApp->unk_185C);
    for (u32 i = 0; i < 6; ++i) {
        r7 = sub_020912D0(r7, a2);
        s16 r4 = sub_02091294(r7);
        if (r4 == pokedexApp->unk_185C) {
            return;
        }
        if (ov18_021E6D10(pokedexApp, species, r4) == TRUE || r4 == GAME_LANGUAGE) {
            int r6 = ov18_021F8824(pokedexApp);
            pokedexApp->unk_185C = r4;
            ov18_021EE638(pokedexApp, species, 6);
            ov18_021E6F6C(pokedexApp->unk_0004, GF_BG_LYR_SUB_3, pokedexApp->unk_185C, pokedexApp->unk_0854, HEAP_ID_37);
            ov18_021EE8B8(pokedexApp, species, r6);
            ov18_021F24E0(pokedexApp, species, 8);
            ov18_021F2530(pokedexApp, species, 18);
            ov18_021F209C(pokedexApp, species, r6, 14);
            ov18_021F1DE4(pokedexApp, species, r6, 13);
            ov18_021F2EC8(pokedexApp, r6, 9);
            PlaySE(SEQ_SE_GS_ZKN03);
            return;
        }
    }
}

void ov18_021E6E44(PokedexAppData *pokedexApp) {
    u32 r6 = ov18_021F8824(pokedexApp);
    u16 species = ov18_021F8838(pokedexApp);

    if (species == 0) {
        ov18_021F2A2C(pokedexApp, 6, 0);
        ov18_021F2A84(pokedexApp, 8, 0);
    } else {
        if (ov18_021E6D38(pokedexApp, species) == TRUE) {
            ov18_021F2A2C(pokedexApp, 6, 1);
        } else {
            ov18_021F2A2C(pokedexApp, 6, 0);
        }
        ov18_021F2A84(pokedexApp, 8, 1);
    }
    if (!ov18_021E6D10(pokedexApp, species, pokedexApp->unk_185C)) {
        pokedexApp->unk_185C = GAME_LANGUAGE;
    }
    ov18_021EE638(pokedexApp, species, 6);
    ov18_021EE6BC(pokedexApp, species, r6);
    ov18_021EE8B8(pokedexApp, species, r6);
    ov18_021F1CAC(pokedexApp, species, 11, 10);
    ov18_021F24E0(pokedexApp, species, 8);
    ov18_021F2530(pokedexApp, species, 18);
    ov18_021F209C(pokedexApp, species, r6, 14);
    ov18_021F1DE4(pokedexApp, species, r6, 13);
    ov18_021F2EC8(pokedexApp, r6, 9);
    if (r6 >= ov18_021F891C(pokedexApp, TRUE)) {
        ov18_021E6FB8(pokedexApp->unk_0004, GF_BG_LYR_SUB_3, pokedexApp->unk_0854, HEAP_ID_37);
        ClearWindowTilemapAndScheduleTransfer(&pokedexApp->unk_007C);
        ov18_021F11C0(pokedexApp, 10, 0);
    } else {
        ov18_021E6F6C(pokedexApp->unk_0004, GF_BG_LYR_SUB_3, pokedexApp->unk_185C, pokedexApp->unk_0854, HEAP_ID_37);
        ScheduleWindowCopyToVram(&pokedexApp->unk_007C);
    }
}

void ov18_021E6F6C(BgConfig *bgConfig, u8 bgId, u8 language, NARC *narc, enum HeapID heapId) {
    NNSG2dScreenData *spC;

    void *r6 = GfGfxLoader_GetScrnDataFromOpenNarc(narc, language == GAME_LANGUAGE ? 20 : 21, TRUE, &spC, heapId);
    LoadRectToBgTilemapRect(bgConfig, bgId, spC->rawData, 0, 0, 32, 24);
    ScheduleBgTilemapBufferTransfer(bgConfig, bgId);
    Heap_Free(r6);
}

void ov18_021E6FB8(BgConfig *bgConfig, u8 bgId, NARC *narc, enum HeapID heapId) {
    NNSG2dScreenData *spC;

    void *r6 = GfGfxLoader_GetScrnDataFromOpenNarc(narc, 22, TRUE, &spC, heapId);
    LoadRectToBgTilemapRect(bgConfig, bgId, spC->rawData, 0, 0, 32, 24);
    ScheduleBgTilemapBufferTransfer(bgConfig, bgId);
    Heap_Free(r6);
}

void ov18_021E6FFC(PokedexAppData *pokedexApp) {
    pokedexApp->unk_1868 = 0;
    pokedexApp->unk_186C = 0x1A;
    pokedexApp->unk_1870 = 0x11;
    pokedexApp->unk_1874 = 0x11;
    pokedexApp->unk_1878 = 0;
    pokedexApp->unk_187C = 0x98;
    pokedexApp->unk_1880 = 0;
    pokedexApp->unk_1884 = 0x98;
    pokedexApp->unk_1888 = 3;
    pokedexApp->unk_188C = 14;
}

void ov18_021E7048(PokedexAppData *pokedexApp) {
    ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_0);
    ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_1);
    ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_3);
    ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_0);
    ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_1);

    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->unk_0854, 4, pokedexApp->unk_0004, GF_BG_LYR_MAIN_1, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->unk_0854, 3, pokedexApp->unk_0004, GF_BG_LYR_MAIN_3, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->unk_0854, 58, pokedexApp->unk_0004, GF_BG_LYR_MAIN_2, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 57, pokedexApp->unk_0004, GF_BG_LYR_MAIN_2, 0, 0, TRUE, HEAP_ID_37);
    PaletteData_LoadOpenNarc(pokedexApp->unk_0850, pokedexApp->unk_0854, 2, HEAP_ID_37, PLTTBUF_MAIN_BG, 0, 0);

    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->unk_0854, 58, pokedexApp->unk_0004, GF_BG_LYR_SUB_2, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->unk_0854, 58, pokedexApp->unk_0004, GF_BG_LYR_SUB_3, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 59, pokedexApp->unk_0004, GF_BG_LYR_SUB_3, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 60, pokedexApp->unk_0004, GF_BG_LYR_SUB_2, 0, 0, TRUE, HEAP_ID_37);
    PaletteData_LoadOpenNarc(pokedexApp->unk_0850, pokedexApp->unk_0854, 18, HEAP_ID_37, PLTTBUF_SUB_BG, 0, 0);

    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_0);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_1);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_2);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_3);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_0);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_1);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_2);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_3);
}

void ov18_021E71D0(PokedexAppData *pokedexApp, int a1, int a2) {
    switch (a1) {
    case 0:
        GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 57, pokedexApp->unk_0004, GF_BG_LYR_MAIN_2, 0, 0, TRUE, HEAP_ID_37);
        ov18_021F6DE0(pokedexApp, a2);
        ov18_021EEED0(pokedexApp, 0);
        ov18_021EF45C(pokedexApp);
        ov18_021EF528(pokedexApp);
        ov18_021F3618(pokedexApp, 0);
        break;
    case 1:
        GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 62, pokedexApp->unk_0004, GF_BG_LYR_MAIN_2, 0, 0, TRUE, HEAP_ID_37);
        ov18_021E7448(pokedexApp, &ov18_021F9780[pokedexApp->unk_1868], TRUE);
        ov18_021F6EC0(pokedexApp);
        ov18_021EEED0(pokedexApp, 2);
        ov18_021EF5D8(pokedexApp);
        ov18_021F3618(pokedexApp, 4);
        break;
    case 2:
        GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 63, pokedexApp->unk_0004, GF_BG_LYR_MAIN_2, 0, 0, TRUE, HEAP_ID_37);
        ov18_021E76A4(pokedexApp, pokedexApp->unk_186C, 1);
        ov18_021F6FA0(pokedexApp);
        ov18_021EEED0(pokedexApp, 3);
        ov18_021EF764(pokedexApp);
        ov18_021F3618(pokedexApp, 4);
        break;
    case 3:
        GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 64, pokedexApp->unk_0004, GF_BG_LYR_MAIN_2, 0, 0, TRUE, HEAP_ID_37);
        ov18_021E74E4(pokedexApp);
        ov18_021F7124(pokedexApp);
        ov18_021EEED0(pokedexApp, 4);
        ov18_021EF848(pokedexApp);
        ov18_021F3618(pokedexApp, 4);
        break;
    case 4:
        GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 65, pokedexApp->unk_0004, GF_BG_LYR_MAIN_2, 0, 0, TRUE, HEAP_ID_37);
        ov18_021F7354(pokedexApp);
        ov18_021EEED0(pokedexApp, 5);
        ov18_021EF91C(pokedexApp);
        ov18_021F3618(pokedexApp, 2);
        break;
    case 5:
        GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 66, pokedexApp->unk_0004, GF_BG_LYR_MAIN_2, 0, 0, TRUE, HEAP_ID_37);
        ov18_021F74D8(pokedexApp);
        ov18_021EEED0(pokedexApp, 6);
        ov18_021EF9B4(pokedexApp);
        ov18_021F3618(pokedexApp, 3);
        break;
    case 6:
        GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 67, pokedexApp->unk_0004, GF_BG_LYR_MAIN_2, 0, 0, TRUE, HEAP_ID_37);
        ov18_021E7448(pokedexApp, &ov18_021F9770[pokedexApp->unk_1888], TRUE);
        ov18_021F7668(pokedexApp);
        ov18_021EEED0(pokedexApp, 7);
        ov18_021EFA50(pokedexApp);
        ov18_021F3618(pokedexApp, 4);
        ov18_021E7564(pokedexApp);
        break;
    case 7:
        GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 68, pokedexApp->unk_0004, GF_BG_LYR_MAIN_2, 0, 0, TRUE, HEAP_ID_37);
        ov18_021E7628(pokedexApp, pokedexApp->unk_188C, TRUE);
        ov18_021F7748(pokedexApp);
        ov18_021EEED0(pokedexApp, 8);
        ov18_021EFB88(pokedexApp);
        ov18_021F3618(pokedexApp, 1);
        break;
    }
}

void ov18_021E7448(PokedexAppData *pokedexApp, const UnkStruct_ov18_021F9780 *a1, BOOL a2) {
    if (a2 == TRUE) {
        BgTilemapRectChangePalette(pokedexApp->unk_0004, GF_BG_LYR_MAIN_2, a1->x, a1->y, a1->width, a1->height, 3);
    } else {
        BgTilemapRectChangePalette(pokedexApp->unk_0004, GF_BG_LYR_MAIN_2, a1->x, a1->y, a1->width, a1->height, 2);
    }
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_2);
}

void ov18_021E7490(PokedexAppData *pokedexApp, const UnkStruct_ov18_021F9780 *a1, int *a2, int a3) {
    ov18_021E7448(pokedexApp, &a1[*a2], FALSE);
    *a2 = a3;
    ov18_021E7448(pokedexApp, &a1[a3], TRUE);
}

void ov18_021E74B8(PokedexAppData *pokedexApp, int a1) {
    ov18_021E7490(pokedexApp, ov18_021F9780, &pokedexApp->unk_1868, a1);
    ov18_021EFBE8(pokedexApp, 37);
    ScheduleWindowCopyToVram(&pokedexApp->unk_025C);
}

void ov18_021E74E4(PokedexAppData *pokedexApp) {
    for (int i = 0; i < NELEMS(ov18_021F990C); ++i) {
        ov18_021E7448(pokedexApp, &ov18_021F990C[i], FALSE);
    }
    ov18_021E7448(pokedexApp, &ov18_021F990C[pokedexApp->unk_1870], TRUE);
    ov18_021E7448(pokedexApp, &ov18_021F990C[pokedexApp->unk_1874], TRUE);
}

void ov18_021E7534(PokedexAppData *pokedexApp, int a1) {
    ov18_021E7490(pokedexApp, ov18_021F9770, &pokedexApp->unk_1888, a1);
    ov18_021EFE70(pokedexApp, 75);
    ScheduleWindowCopyToVram(&pokedexApp->unk_04BC);
}

void ov18_021E7564(PokedexAppData *pokedexApp) {
    if (pokedexApp->unk_1860 == 1) {
        return;
    }
    GridInputHandler_ClearEnabledFlag(pokedexApp->unk_1864, 1);

    const UnkStruct_ov18_021F9780 *r5 = &ov18_021F9770[1];
    u16 *r4 = GetBgTilemapBuffer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_2);
    MI_CpuCopy16(
        &r4[32 * (r5->y - 2) + (r5->x - 1)],
        &r4[32 * (r5->y - 1) + (r5->x - 1)],
        sizeof(u16) * (r5->width + 2));
    MI_CpuCopy16(
        &r4[32 * (r5->y - 2) + (r5->x - 1)],
        &r4[32 * (r5->y) + (r5->x - 1)],
        sizeof(u16) * (r5->width + 2));
    MI_CpuCopy16(
        &r4[32 * (r5->y - 2) + (r5->x - 1)],
        &r4[32 * (r5->y + 1) + (r5->x - 1)],
        sizeof(u16) * (r5->width + 2));
    MI_CpuCopy16(
        &r4[32 * (r5->y - 3) + (r5->x - 1)],
        &r4[32 * (r5->y + 2) + (r5->x - 1)],
        sizeof(u16) * (r5->width + 2));
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_2);
}

void ov18_021E7628(PokedexAppData *pokedexApp, u32 a1, BOOL a2) {
    UnkStruct_ov18_021F9780 sp0;

    sp0.width = 4;
    sp0.height = 4;
    sp0.x = 6 * (a1 % 5) + 2;
    sp0.y = 5 * (a1 / 5 + 1);

    ov18_021E7448(pokedexApp, &sp0, a2);
}

void ov18_021E766C(PokedexAppData *pokedexApp, u32 a1) {
    ov18_021E7628(pokedexApp, pokedexApp->unk_188C, FALSE);
    pokedexApp->unk_188C = a1;
    ov18_021E7628(pokedexApp, pokedexApp->unk_188C, TRUE);
    ov18_021F3494(pokedexApp);
}

u8 ov18_021E7698(int a0) {
    return ov18_021F9C20[a0];
}

void ov18_021E76A4(PokedexAppData *pokedexApp, u32 a1, BOOL a2) {
    UnkStruct_ov18_021F9780 sp0;

    sp0.width = 2;
    sp0.height = 2;
    sp0.x = 4 * (ov18_021F9C20[a1] % 7) + 3;
    sp0.y = 4 * (ov18_021F9C20[a1] / 7) + 5;

    ov18_021E7448(pokedexApp, &sp0, a2);
}

void ov18_021E76EC(PokedexAppData *pokedexApp, u32 a1) {
    ov18_021E76A4(pokedexApp, pokedexApp->unk_186C, FALSE);
    pokedexApp->unk_186C = a1;
    ov18_021E76A4(pokedexApp, pokedexApp->unk_186C, TRUE);
    ov18_021EFC3C(pokedexApp, 66);
    ScheduleWindowCopyToVram(&pokedexApp->unk_042C);
}

void ov18_021E7724(PokedexAppData *pokedexApp) {
    NNSG2dScreenData *sp1C;
    void *sp14;
    u16 *r4;
    u16 *r5;
    u16 *sp10;
    u16 sp1A;
    u16 sp18;
    u32 i;
    u32 j;

    r4 = sub_02019B08(pokedexApp->unk_0008, 15);
    r5 = sub_02019B08(pokedexApp->unk_0008, 14);

    sp14 = GfGfxLoader_GetScrnDataFromOpenNarc(pokedexApp->unk_0854, 0, TRUE, &sp1C, HEAP_ID_37);
    sp10 = (u16 *)sp1C->rawData;
    for (i = 0; i < 24; ++i) {
        memcpy(&r4[32 * i], &sp10[32 * i], 32 * sizeof(u16));
        memcpy(&r5[3 * i], &sp10[32 * i + 0x400], 3 * sizeof(u16));
    }
    Heap_Free(sp14);

    if (pokedexApp->unk_1860 == 0) {
        for (i = 0; i < 2; ++i) {
            for (j = 0; j < 26; ++j) {
                sp10 = &r4[(i + 15) * 32 + 3 + j];
                *sp10 = (*sp10 & 0xF000) | 0x16;
            }
        }
    }

    if (pokedexApp->unk_1858 == 0) {
        r5 = sub_02019B08(pokedexApp->unk_0008, 2);
        sub_02019B44(pokedexApp->unk_0008, 2, &sp1A, &sp18);
        for (i = 0; i < sp18; ++i) {
            for (j = 0; j < sp1A; ++j) {
                r4[32 * (i + 3) + j + 5] = r5[i * sp1A + j];
            }
        }
    } else {
        r5 = sub_02019B08(pokedexApp->unk_0008, 3);
        sub_02019B44(pokedexApp->unk_0008, 2, &sp1A, &sp18); // typo? should be 3 not 2
        for (i = 0; i < sp18; ++i) {
            for (j = 0; j < sp1A; ++j) {
                r4[32 * (i + 3) + j + 5] = r5[i * sp1A + j];
            }
        }
    }

    ov18_021EFFEC(pokedexApp);
}

void ov18_021E78AC(PokedexAppData *pokedexApp) {
    int r6 = ov18_021F8824(pokedexApp);
    if (r6 == 0) {
        ov18_021F2A2C(pokedexApp, 22, 0);
        ov18_021F2A84(pokedexApp, 24, 0);
        ov18_021F3B60(pokedexApp, 0);
        ov18_021EE638(pokedexApp, SPECIES_NONE, 94);
        ov18_021F014C(pokedexApp);
        ov18_021F0118(pokedexApp, 1);
        ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_1);
        pokedexApp->unk_1898 = 1;
    } else {
        ov18_021F0118(pokedexApp, 0);
        u16 species = ov18_021F8838(pokedexApp);
        if (!ov18_021E6D10(pokedexApp, species, pokedexApp->unk_185C)) {
            pokedexApp->unk_185C = GAME_LANGUAGE;
        }
        ov18_021EE638(pokedexApp, species, 94);
        ov18_021EE6EC(pokedexApp, species, r6);
        ov18_021EED70(pokedexApp, species, r6);
        ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_3);
        ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_1);
        pokedexApp->unk_1898 = 2;
        ov18_021F3B60(pokedexApp, 1);
        ov18_021F1CAC(pokedexApp, species, 46, 45);
        ov18_021F24E0(pokedexApp, species, 24);
        ov18_021F2530(pokedexApp, species, 53);
        ov18_021F209C(pokedexApp, species, r6, 49);
        ov18_021F1DE4(pokedexApp, species, r6, 48);
        ov18_021F2EC8(pokedexApp, r6, 44);
        if (species == SPECIES_NONE) {
            ov18_021F2A2C(pokedexApp, 22, 0);
            ov18_021F2A84(pokedexApp, 24, 0);
            ov18_021E6FB8(pokedexApp->unk_0004, GF_BG_LYR_SUB_3, pokedexApp->unk_0854, HEAP_ID_37);
            ClearWindowTilemapAndScheduleTransfer(&pokedexApp->unk_051C);

            ov18_021F11C0(pokedexApp, 45, 0);
        } else {
            if (ov18_021E6D38(pokedexApp, species) == TRUE) {
                ov18_021F2A2C(pokedexApp, 22, 1);
            } else {
                ov18_021F2A2C(pokedexApp, 22, 0);
            }
            ov18_021F2A84(pokedexApp, 24, 1);
            ov18_021E6F6C(pokedexApp->unk_0004, GF_BG_LYR_SUB_3, pokedexApp->unk_185C, pokedexApp->unk_0854, HEAP_ID_37);
            ScheduleWindowCopyToVram(&pokedexApp->unk_051C);
        }
    }
}

void ov18_021E7A3C(PokedexAppData *pokedexApp) {
    switch (pokedexApp->unk_1898) {
    case 0:
        return;
    case 1:
        SetBgPriority(GF_BG_LYR_SUB_2, 2);
        SetBgPriority(GF_BG_LYR_SUB_3, 3);
        break;
    case 2:
        SetBgPriority(GF_BG_LYR_SUB_2, 3);
        SetBgPriority(GF_BG_LYR_SUB_3, 2);
        break;
    }
    pokedexApp->unk_1898 = 0;
}

void ov18_021E7A80(PokedexAppData *pokedexApp, u16 species, u16 a2) {
    if (!Pokedex_GetInternationalViewFlag(pokedexApp->unk_0000->pokedex)) {
        return;
    }

    int spC = ov18_021F8824(pokedexApp);
    if (spC == 0) {
        return;
    }

    s16 dexLangFlag = LanguageToDexFlag(pokedexApp->unk_185C);
    for (int i = 0; i < 6u; ++i) {
        dexLangFlag += a2;
        if (dexLangFlag < 0) {
            dexLangFlag = 5;
        } else if (dexLangFlag >= 6) {
            dexLangFlag = 0;
        }
        s16 language = sub_02091294(dexLangFlag);
        if (language == pokedexApp->unk_185C) {
            break;
        }
        if (ov18_021E6D10(pokedexApp, species, language) == TRUE || language == GAME_LANGUAGE) {
            pokedexApp->unk_185C = language;
            ov18_021EE638(pokedexApp, species, 94);
            ov18_021E6F6C(pokedexApp->unk_0004, GF_BG_LYR_SUB_3, pokedexApp->unk_185C, pokedexApp->unk_0854, HEAP_ID_37);
            ov18_021EED70(pokedexApp, species, spC);
            ov18_021F24E0(pokedexApp, species, 24);
            ov18_021F2530(pokedexApp, species, 53);
            ov18_021F209C(pokedexApp, species, spC, 49);
            ov18_021F1DE4(pokedexApp, species, spC, 48);
            ov18_021F2EC8(pokedexApp, spC, 44);
            PlaySE(SEQ_SE_GS_ZKN03);
            break;
        }
    }
}

void ov18_021E7B6C(BOOL a0) {
    if (a0 == TRUE) {
        GXS_SetVisibleWnd(GX_WNDMASK_W0);
        G2S_SetWnd0InsidePlane(GX_PLANEMASK_BG0 | GX_PLANEMASK_BG1 | GX_PLANEMASK_BG2 | GX_PLANEMASK_BG3, TRUE);
        G2S_SetWndOutsidePlane(GX_PLANEMASK_ALL, TRUE);
        G2S_SetWnd0Position(0, 0x98, 0xFF, 0xC0);
    } else {
        GXS_SetVisibleWnd(GX_WNDMASK_NONE);
    }
}

void ov18_021E7BD0(PokedexAppData *pokedexApp) {
    ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_0);
    ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_2);
    ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_1);
    ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_2);

    GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 82, pokedexApp->unk_0004, GF_BG_LYR_MAIN_3, 0, 0, TRUE, HEAP_ID_37);
    if (pokedexApp->unk_1860 == 1) {
        GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 81, pokedexApp->unk_0004, GF_BG_LYR_MAIN_0, 0, 0, TRUE, HEAP_ID_37);
    } else {
        GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 80, pokedexApp->unk_0004, GF_BG_LYR_MAIN_0, 0, 0, TRUE, HEAP_ID_37);
    }
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->unk_0854, 83, pokedexApp->unk_0004, GF_BG_LYR_MAIN_0, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->unk_0854, 83, pokedexApp->unk_0004, GF_BG_LYR_MAIN_3, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->unk_0854, 4, pokedexApp->unk_0004, GF_BG_LYR_MAIN_1, 0, 0, TRUE, HEAP_ID_37);
    PaletteData_LoadOpenNarc(pokedexApp->unk_0850, pokedexApp->unk_0854, 2, HEAP_ID_37, PLTTBUF_MAIN_BG, 0, 0);

    GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 84, pokedexApp->unk_0004, GF_BG_LYR_SUB_3, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->unk_0854, 85, pokedexApp->unk_0004, GF_BG_LYR_SUB_3, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 86, pokedexApp->unk_0004, GF_BG_LYR_SUB_0, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->unk_0854, 87, pokedexApp->unk_0004, GF_BG_LYR_SUB_0, 0, 0, TRUE, HEAP_ID_37);
    PaletteData_LoadOpenNarc(pokedexApp->unk_0850, pokedexApp->unk_0854, 18, HEAP_ID_37, PLTTBUF_SUB_BG, 0, 0);

    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_0);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_1);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_2);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_3);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_0);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_1);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_2);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_3);
}

void ov18_021E7D90(PokedexAppData *pokedexApp) {
    ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_0);
    ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_1);
    ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_2);
    ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_0);
    ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_1);
    ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_3);

    GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 89, pokedexApp->unk_0004, GF_BG_LYR_MAIN_3, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->unk_0854, 90, pokedexApp->unk_0004, GF_BG_LYR_MAIN_3, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->unk_0854, 4, pokedexApp->unk_0004, GF_BG_LYR_MAIN_1, 0, 0, TRUE, HEAP_ID_37);
    PaletteData_LoadOpenNarc(pokedexApp->unk_0850, pokedexApp->unk_0854, 2, HEAP_ID_37, PLTTBUF_MAIN_BG, 0, 0);

    GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 91, pokedexApp->unk_0004, GF_BG_LYR_SUB_2, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->unk_0854, 92, pokedexApp->unk_0004, GF_BG_LYR_SUB_2, 0, 0, TRUE, HEAP_ID_37);
    PaletteData_LoadOpenNarc(pokedexApp->unk_0850, pokedexApp->unk_0854, 18, HEAP_ID_37, PLTTBUF_SUB_BG, 0, 0);

    sub_020196E8(pokedexApp->unk_0008, 16, 0, 20);

    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_0);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_1);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_2);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_3);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_0);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_1);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_2);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_3);
}

void ov18_021E7ED8(PokedexAppData *pokedexApp) {
    ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_0);
    ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_2);
    ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_0);
    ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_1);
    ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_3);

    GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 101, pokedexApp->unk_0004, GF_BG_LYR_MAIN_3, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->unk_0854, 102, pokedexApp->unk_0004, GF_BG_LYR_MAIN_3, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->unk_0854, 4, pokedexApp->unk_0004, GF_BG_LYR_MAIN_1, 0, 0, TRUE, HEAP_ID_37);
    PaletteData_LoadOpenNarc(pokedexApp->unk_0850, pokedexApp->unk_0854, 2, HEAP_ID_37, PLTTBUF_MAIN_BG, 0, 0);

    GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 103, pokedexApp->unk_0004, GF_BG_LYR_SUB_2, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->unk_0854, 104, pokedexApp->unk_0004, GF_BG_LYR_SUB_2, 0, 0, TRUE, HEAP_ID_37);
    PaletteData_LoadOpenNarc(pokedexApp->unk_0850, pokedexApp->unk_0854, 18, HEAP_ID_37, PLTTBUF_SUB_BG, 0, 0);

    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_0);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_1);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_2);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_3);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_0);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_1);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_2);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_3);
}

void ov18_021E800C(PokedexAppData *pokedexApp) {
    ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_2);
    ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_0);
    ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_1);
    ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_2);

    GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 96, pokedexApp->unk_0004, GF_BG_LYR_MAIN_3, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->unk_0854, 93, pokedexApp->unk_0004, GF_BG_LYR_MAIN_3, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 95, pokedexApp->unk_0004, GF_BG_LYR_MAIN_0, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->unk_0854, 93, pokedexApp->unk_0004, GF_BG_LYR_MAIN_0, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->unk_0854, 4, pokedexApp->unk_0004, GF_BG_LYR_MAIN_1, 0, 0, TRUE, HEAP_ID_37);
    PaletteData_LoadOpenNarc(pokedexApp->unk_0850, pokedexApp->unk_0854, 2, HEAP_ID_37, PLTTBUF_MAIN_BG, 0, 0);

    GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 97, pokedexApp->unk_0004, GF_BG_LYR_SUB_3, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->unk_0854, 94, pokedexApp->unk_0004, GF_BG_LYR_SUB_3, 0, 0, TRUE, HEAP_ID_37);
    PaletteData_LoadOpenNarc(pokedexApp->unk_0850, pokedexApp->unk_0854, 18, HEAP_ID_37, PLTTBUF_SUB_BG, 0, 0);

    if (pokedexApp->unk_18C4 == 1) {
        void *r4;
        NNSG2dScreenData *sp10;

        r4 = GfGfxLoader_GetScrnDataFromOpenNarc(pokedexApp->unk_0854, 100, TRUE, &sp10, HEAP_ID_37);
        LoadRectToBgTilemapRect(pokedexApp->unk_0004, GF_BG_LYR_MAIN_0, sp10->rawData, 16, 16, 16, 4);
        Heap_Free(r4);
    }

    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_0);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_1);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_2);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_3);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_0);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_1);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_2);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_3);
}

void ov18_021E81A8(PokedexAppData *pokedexApp) {
    ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_0);
    ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_2);

    GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 98, pokedexApp->unk_0004, GF_BG_LYR_MAIN_3, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->unk_0854, 93, pokedexApp->unk_0004, GF_BG_LYR_MAIN_3, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 99, pokedexApp->unk_0004, GF_BG_LYR_SUB_3, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->unk_0854, 94, pokedexApp->unk_0004, GF_BG_LYR_SUB_3, 0, 0, TRUE, HEAP_ID_37);

    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_0);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_2);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_3);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_3);
}

void ov18_021E8254(PokedexAppData *pokedexApp) {
    memset(pokedexApp->unk_18A4, 0, sizeof(pokedexApp->unk_18A4));

    switch (pokedexApp->unk_18A2) {
    case SPECIES_UNOWN:
    case SPECIES_PICHU:
    case SPECIES_DEOXYS:
    case SPECIES_BURMY:
    case SPECIES_WORMADAM:
    case SPECIES_SHELLOS:
    case SPECIES_GASTRODON:
    case SPECIES_ROTOM:
    case SPECIES_GIRATINA:
    case SPECIES_SHAYMIN:
        pokedexApp->unk_18C4 = Pokedex_GetSeenFormNum(pokedexApp->unk_0000->pokedex, pokedexApp->unk_18A2);
        for (u32 i = 0; i < pokedexApp->unk_18C4; ++i) {
            pokedexApp->unk_18A4[i] = Pokedex_GetSeenFormByIdx(pokedexApp->unk_0000->pokedex, pokedexApp->unk_18A2, i) | 0x80;
        }
        break;
    case SPECIES_CASTFORM:
        pokedexApp->unk_18C4 = 4;
        for (u32 i = 0; i < pokedexApp->unk_18C4; ++i) {
            pokedexApp->unk_18A4[i] = i | 0x80;
        }
        break;
    case SPECIES_CHERRIM:
        pokedexApp->unk_18C4 = 2;
        for (u32 i = 0; i < pokedexApp->unk_18C4; ++i) {
            pokedexApp->unk_18A4[i] = i | 0x80;
        }
        break;
    default:
        pokedexApp->unk_18A4[0] = ov18_021E83D0(pokedexApp, 0);
        pokedexApp->unk_18A4[1] = ov18_021E83D0(pokedexApp, 1);
        if (pokedexApp->unk_18A4[1] == 0) {
            pokedexApp->unk_18C4 = 1;
        } else {
            pokedexApp->unk_18C4 = 2;
        }
        break;
    }
}

u8 ov18_021E83D0(PokedexAppData *pokedexApp, u8 a1) {
    switch (Pokedex_SpeciesGetLastSeenGender(pokedexApp->unk_0000->pokedex, pokedexApp->unk_18A2, a1)) {
    case MON_MALE:
        return 1;
    case MON_FEMALE:
        return 2;
    case MON_GENDERLESS:
        return 3;
    default:
        if (a1 == 0) {
            return 3;
        } else {
            return 0;
        }
    }
}

void ov18_021E8410(PokedexAppData *pokedexApp) {
    NARC *narc; // forward decl fixes regswap
    PokedexAppData_UnkSub18CC *r5 = &pokedexApp->unk_18CC;
    narc = NARC_New(GetPokedexDataNarcID(), HEAP_ID_37);
    if (PlayerProfile_GetTrainerGender(pokedexApp->unk_0000->playerProfile) == TRAINER_MALE) {
        r5->unk_0 = GfGfxLoader_LoadFromOpenNarc(narc, 9, FALSE, HEAP_ID_37, FALSE);
        r5->unk_4 = GfGfxLoader_LoadFromOpenNarc(narc, 5, FALSE, HEAP_ID_37, FALSE);
        r5->unk_8 = GfGfxLoader_LoadFromOpenNarc(narc, 10, FALSE, HEAP_ID_37, FALSE);
        r5->unk_C = GfGfxLoader_LoadFromOpenNarc(narc, 6, FALSE, HEAP_ID_37, FALSE);
    } else {
        r5->unk_0 = GfGfxLoader_LoadFromOpenNarc(narc, 7, FALSE, HEAP_ID_37, FALSE);
        r5->unk_4 = GfGfxLoader_LoadFromOpenNarc(narc, 3, FALSE, HEAP_ID_37, FALSE);
        r5->unk_8 = GfGfxLoader_LoadFromOpenNarc(narc, 8, FALSE, HEAP_ID_37, FALSE);
        r5->unk_C = GfGfxLoader_LoadFromOpenNarc(narc, 4, FALSE, HEAP_ID_37, FALSE);
    }
    pokedexApp->unk_1848 = GfGfxLoader_LoadFromOpenNarc(narc, 0, FALSE, HEAP_ID_37, FALSE);
    pokedexApp->unk_184C = GfGfxLoader_LoadFromOpenNarc(narc, 1, FALSE, HEAP_ID_37, FALSE);
    NARC_Delete(narc);
}

void ov18_021E84EC(PokedexAppData *pokedexApp) {
    PokedexAppData_UnkSub18CC *r5 = &pokedexApp->unk_18CC;

    Heap_Free(pokedexApp->unk_1848);
    Heap_Free(pokedexApp->unk_184C);
    Heap_Free(r5->unk_0);
    Heap_Free(r5->unk_4);
    Heap_Free(r5->unk_8);
    Heap_Free(r5->unk_C);
}
