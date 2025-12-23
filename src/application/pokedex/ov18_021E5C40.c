#include "application/pokedex/pokedex_internal.h"
#include "msgdata/msg.naix"

#include "gf_gfx_loader.h"
#include "sprite_system.h"

void ov18_021E5C40(void *cb_arg);
void ov18_021E5FA4(void);
void ov18_021E5FE8(void);
void ov18_021E602C(void);
void ov18_021E6070(void);
void ov18_021E60B4(void);
void ov18_021E60F8(void);

extern const GraphicsBanks ov18_021F98B0;

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
