#include "application/pokedex/pokedex_internal.h"

#include "sprite_system.h"

void ov18_021E5C40(void *cb_arg);
void ov18_021E613C(PokedexAppData *pokedexApp, GFBgLayer layer);

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
