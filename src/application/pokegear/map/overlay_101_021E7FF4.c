#include "global.h"

#include "application/pokegear/map/pokegear_map_internal.h"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0273.h"

#include "gf_gfx_loader.h"
#include "text.h"
#include "unk_02005D10.h"
#include "unk_0200FA24.h"
#include "unk_0208805C.h"

void ov101_021E8264(PokegearMapAppData *mapApp);
void ov101_021E8354(PokegearMapAppData *mapApp);
void ov101_021E8370(PokegearMapAppData *mapApp, u8 a1);
void ov101_021E84B8(PokegearMapAppData *mapApp);
void ov101_021E84FC(PokegearMapAppData *mapApp);
void ov101_021E857C(PokegearMapAppData *mapApp);
void ov101_021E85A8(PokegearMapAppData *mapApp);
void ov101_021E862C(PokegearMapAppData *mapApp);
void ov101_021E8674(PokegearMapAppData *mapApp);
void ov101_021E8774(PokegearMapAppData *mapApp);
void ov101_021E8790(PokegearMapAppData *mapApp, u8 a1);
void ov101_021E886C(PokegearMapAppData *mapApp);
void ov101_021E88A8(PokegearMapAppData *mapApp);
void ov101_021E88D8(PokegearMapAppData *mapApp);
void ov101_021E8A88(PokegearMapAppData *mapApp);
void ov101_021E8AE4(PokegearMapAppData *mapApp);
void ov101_021E8BB8(PokegearMapAppData *mapApp);
void ov101_021E8E20(PokegearMapAppData *mapApp);
void ov101_021E8E34(PokegearMapAppData *mapApp);
void ov101_021E8E3C(PokegearMapAppData *mapApp);
void ov101_021E8E4C(PokegearMapAppData *mapApp);
void ov101_021E8E58(PokegearMapAppData *mapApp);
void ov101_021E90A8(PokegearMapAppData *mapApp);
void ov101_021E9264(PokegearMapAppData *mapApp, int a1);
void ov101_021E933C(PokegearMapAppData *mapApp);
void ov101_021E9FDC(PokegearMapAppData *mapApp, int a1);
BOOL ov101_021EA0D8(PokegearMapAppData *mapApp, int a1);

extern const WindowTemplate ov101_021F7B64[];
extern const PokegearAppSwitchButtonSpec ov101_021F7C04[9];
extern const PokegearAppSwitchButtonSpec ov101_021F7BA4[8];
extern const PokegearAppSwitchButtonSpec ov101_021F7B30;
extern const UnmanagedSpriteTemplate ov101_021F7DB8[5];
extern const UnmanagedSpriteTemplate ov101_021F7B3C;

BOOL ov101_021E7FF4(PokegearMapAppData *mapApp) {
    switch (mapApp->substate) {
    case 0:
        ov101_021E8264(mapApp);
        break;
    case 1:
        ov101_021E8370(mapApp, mapApp->pokegear->unk_008);
        ov101_021E84FC(mapApp);
        ov101_021E85A8(mapApp);
        break;
    case 2:
        ov101_021E886C(mapApp);
        ov101_021E8790(mapApp, mapApp->pokegear->unk_008);
        ov101_021E8E34(mapApp);
        break;
    case 3:
        if (mapApp->unk_00C == 1) {
            ov101_021E90A8(mapApp);
        } else {
            ov101_021E8E58(mapApp);
        }
        mapApp->pokegear->unk_058 = ov101_021E9270;
        mapApp->substate = 0;
        return TRUE;
    }

    ++mapApp->substate;
    return FALSE;
}

BOOL ov101_021E8070(PokegearMapAppData *mapApp) {
    mapApp->pokegear->unk_058 = NULL;
    if (mapApp->pokegear->appReturnCode == GEAR_RETURN_CANCEL) {
        ov101_021E8774(mapApp);
        ov101_021E8E20(mapApp);
    }
    ov101_021E8E4C(mapApp);
    ov101_021E88A8(mapApp);
    ov101_021E862C(mapApp);
    ov101_021E857C(mapApp);
    ov101_021E84B8(mapApp);
    ov101_021E8354(mapApp);
    return TRUE;
}

BOOL ov101_021E80B4(PokegearMapAppData *mapApp) {
    BOOL r5;
    BOOL r0;

    switch (mapApp->substate) {
    case 0:
        ov101_021E933C(mapApp);
        ov101_021E9D74(mapApp, 1);
        BeginNormalPaletteFade(3, 0, 0, RGB_BLACK, 6, 1, mapApp->heapId);
        break;
    case 1:
        r5 = IsPaletteFadeFinished();
        r0 = ov101_021E9E90(mapApp, 1);
        if (!r5 || !r0) {
            return FALSE;
        }
        ov101_021E8E3C(mapApp);
        break;
    case 2:
        ov101_021E9264(mapApp, 1);
        ov101_021E90A8(mapApp);
        BeginNormalPaletteFade(3, 1, 1, RGB_BLACK, 6, 1, mapApp->heapId);
        ov101_021E9FDC(mapApp, 0);
        break;
    case 3:
        if (!IsPaletteFadeFinished()) {
            return FALSE;
        }
        PlaySE(SEQ_SE_GS_GEARYBUTTON);
        break;
    case 4:
        if (!ov101_021EA0D8(mapApp, 0)) {
            return FALSE;
        }
        mapApp->substate = 0;
        return TRUE;
    }

    ++mapApp->substate;
    return FALSE;
}

BOOL ov101_021E818C(PokegearMapAppData *mapApp) {
    BOOL r5;
    BOOL r0;

    switch (mapApp->substate) {
    case 0:
        ov101_021E9FDC(mapApp, 1);
        PlaySE(SEQ_SE_GS_GEARYBUTTON);
        break;
    case 1:
        if (!ov101_021EA0D8(mapApp, 1)) {
            return FALSE;
        }
        BeginNormalPaletteFade(3, 0, 0, RGB_BLACK, 6, 1, mapApp->heapId);
        break;
    case 2:
        if (!IsPaletteFadeFinished()) {
            return FALSE;
        }
        ov101_021E8774(mapApp);
        ov101_021E8E20(mapApp);
        break;
    case 3:
        ov101_021E9264(mapApp, 0);
        ov101_021E8E58(mapApp);
        ov101_021E9D74(mapApp, 0);
        BeginNormalPaletteFade(3, 1, 1, RGB_BLACK, 6, 1, mapApp->heapId);
        break;
    case 4:
        r5 = IsPaletteFadeFinished();
        r0 = ov101_021E9E90(mapApp, 0);
        if (!r5 || !r0) {
            return FALSE;
        }
        mapApp->substate = 0;
        return TRUE;
    }

    ++mapApp->substate;
    return FALSE;
}

void ov101_021E8264(PokegearMapAppData *mapApp) {
    int i;

    GX_SetGraphicsMode(GX_DISPMODE_GRAPHICS, GX_BGMODE_5, GX_BG0_AS_2D);

    {
        extern const BgTemplate ov101_021F7D10[6];
        BgTemplate bgTemplates[6];
        ARRAY_ASSIGN(bgTemplates, ov101_021F7D10);

        InitBgFromTemplateEx(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1, &bgTemplates[0], GF_BG_TYPE_TEXT, FALSE);
        InitBgFromTemplateEx(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2, &bgTemplates[1], GF_BG_TYPE_256x16PLTT, FALSE);
        InitBgFromTemplateEx(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3, &bgTemplates[2], GF_BG_TYPE_256x16PLTT, FALSE);
        InitBgFromTemplateEx(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_1, &bgTemplates[3], GF_BG_TYPE_TEXT, FALSE);
        InitBgFromTemplateEx(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_2, &bgTemplates[4], GF_BG_TYPE_TEXT, FALSE);
        InitBgFromTemplateEx(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_3, &bgTemplates[5], GF_BG_TYPE_TEXT, FALSE);
    }

    for (i = 0; i < 3; ++i) {
        BgClearTilemapBufferAndCommit(mapApp->pokegear->bgConfig, i + GF_BG_LYR_MAIN_1);
        BG_ClearCharDataRange(i + GF_BG_LYR_MAIN_1, 0x40, 0, mapApp->heapId);
        BgClearTilemapBufferAndCommit(mapApp->pokegear->bgConfig, i + GF_BG_LYR_SUB_1);
        BG_ClearCharDataRange(i + GF_BG_LYR_SUB_1, 0x20, 0, mapApp->heapId);
        BgCommitTilemapBufferToVram(mapApp->pokegear->bgConfig, i + GF_BG_LYR_MAIN_1);
        BgCommitTilemapBufferToVram(mapApp->pokegear->bgConfig, i + GF_BG_LYR_SUB_1);
    }
}

void ov101_021E8354(PokegearMapAppData *mapApp) {
    Pokegear_ClearAppBgLayers(mapApp->pokegear);
    G2_SetBlendAlpha(0, 0, 0, 0);
}

void ov101_021E8370(PokegearMapAppData *mapApp, u8 a1) {
    NARC *narc = NARC_New(NARC_a_1_4_4, mapApp->heapId);
    sub_0208820C(mapApp->pokegear->bgConfig, mapApp->heapId, narc, NARC_a_1_4_4, a1 + 26, GF_BG_LYR_MAIN_1, 0, 0, 0);
    sub_0208820C(mapApp->pokegear->bgConfig, mapApp->heapId, narc, NARC_a_1_4_4, 10, GF_BG_LYR_MAIN_2, 0, 0, 0);
    sub_0208820C(mapApp->pokegear->bgConfig, mapApp->heapId, narc, NARC_a_1_4_4, a1 + 50, GF_BG_LYR_SUB_2, 0, 0, 0);
    sub_0208820C(mapApp->pokegear->bgConfig, mapApp->heapId, narc, NARC_a_1_4_4, 12, GF_BG_LYR_SUB_3, 0, 0, 0);
    mapApp->unk_154[0] = GfGfxLoader_GetScrnDataFromOpenNarc(narc, a1 + 56, FALSE, &mapApp->unk_16C[0], mapApp->heapId);
    mapApp->unk_154[1] = GfGfxLoader_GetScrnDataFromOpenNarc(narc, 11, FALSE, &mapApp->unk_16C[1], mapApp->heapId);
    mapApp->unk_154[2] = GfGfxLoader_GetScrnDataFromOpenNarc(narc, 13, FALSE, &mapApp->unk_16C[2], mapApp->heapId);
    mapApp->unk_154[3] = GfGfxLoader_GetScrnDataFromOpenNarc(narc, a1 + 32, FALSE, &mapApp->unk_16C[3], mapApp->heapId);
    mapApp->unk_154[4] = GfGfxLoader_GetScrnDataFromOpenNarc(narc, a1 + 38, FALSE, &mapApp->unk_16C[4], mapApp->heapId);
    mapApp->unk_154[5] = GfGfxLoader_GetScrnDataFromOpenNarc(narc, a1 + 44, FALSE, &mapApp->unk_16C[5], mapApp->heapId);
    NARC_Delete(narc);
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1);
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2);
}

void ov101_021E84B8(PokegearMapAppData *mapApp) {
    FreeToHeap(mapApp->unk_154[5]);
    FreeToHeap(mapApp->unk_154[4]);
    FreeToHeap(mapApp->unk_154[3]);
    FreeToHeap(mapApp->unk_154[2]);
    FreeToHeap(mapApp->unk_154[1]);
    FreeToHeap(mapApp->unk_154[0]);
}

void ov101_021E84FC(PokegearMapAppData *mapApp) {
    int i;

    for (i = 0; i <= 7; ++i) {
        AddWindowParameterized(mapApp->pokegear->bgConfig, &mapApp->unk_184[i], ov101_021F7B64[i].bgId, ov101_021F7B64[i].left, ov101_021F7B64[i].top, ov101_021F7B64[i].width, ov101_021F7B64[i].height, ov101_021F7B64[i].palette, ov101_021F7B64[i].baseTile);
        FillWindowPixelBuffer(&mapApp->unk_184[i], 0);
    }
    InitWindow(&mapApp->unk_204);
    AddTextWindowTopLeftCorner(mapApp->pokegear->bgConfig, &mapApp->unk_204, 11, 2, 0x3C5, 0);
    FillWindowPixelBufferText_AssumeTileSize32(&mapApp->unk_204, 0);
}

void ov101_021E857C(PokegearMapAppData *mapApp) {
    int i;

    for (i = 0; i < 8; ++i) {
        ClearWindowTilemapAndCopyToVram(&mapApp->unk_184[i]);
        RemoveWindow(&mapApp->unk_184[i]);
    }
    RemoveWindow(&mapApp->unk_204);
}

void ov101_021E85A8(PokegearMapAppData *mapApp) {
    mapApp->unk_088 = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0273_bin, mapApp->heapId);
    mapApp->unk_08C = MessageFormat_New_Custom(2, 91, mapApp->heapId);
    mapApp->unk_090 = String_New(91, mapApp->heapId);
    mapApp->unk_09C = NewString_ReadMsgData(mapApp->unk_088, msg_0273_00001);
    mapApp->unk_0A0 = NewString_ReadMsgData(mapApp->unk_088, msg_0273_00000);
    mapApp->unk_0A4 = String_New(40, mapApp->heapId);
    mapApp->unk_0B4 = NewString_ReadMsgData(mapApp->unk_088, msg_0273_00003);
    mapApp->unk_0B8 = 2;
}

void ov101_021E862C(PokegearMapAppData *mapApp) {
    String_Delete(mapApp->unk_0B4);
    String_Delete(mapApp->unk_0A4);
    String_Delete(mapApp->unk_0A0);
    String_Delete(mapApp->unk_09C);
    String_Delete(mapApp->unk_090);
    MessageFormat_Delete(mapApp->unk_08C);
    DestroyMsgData(mapApp->unk_088);
}

void ov101_021E8674(PokegearMapAppData *mapApp) {
    UnkStruct_ov100_021E6E20_Sub8 *r4 = mapApp->unk_084->unk_08;

    PokegearAppSwitch_AddButtons(mapApp->pokegear->appSwitch, ov101_021F7C04, NELEMS(ov101_021F7C04), 0, FALSE, mapApp->heapId, r4[12].sprite, r4[13].sprite, r4[14].sprite, r4[15].sprite);
    PokegearAppSwitch_AddButtons(mapApp->pokegear->appSwitch, ov101_021F7BA4, NELEMS(ov101_021F7BA4), 0, FALSE, mapApp->heapId, r4[16].sprite, r4[17].sprite, r4[18].sprite, r4[19].sprite);
    PokegearAppSwitch_AddButtons(mapApp->pokegear->appSwitch, &ov101_021F7B30, 1, 0, FALSE, mapApp->heapId, r4[16].sprite, r4[17].sprite, r4[18].sprite, r4[19].sprite);

    PokegearAppSwitchCursor_SetCursorSpritesDrawState(mapApp->pokegear->appSwitch, 1, FALSE);
    PokegearAppSwitchCursor_SetCursorSpritesDrawState(mapApp->pokegear->appSwitch, 2, FALSE);
    PokegearAppSwitchCursor_SetCursorSpritesDrawState(mapApp->pokegear->appSwitch, 3, FALSE);

    if (mapApp->unk_00C == 1) {
        PokegearAppSwitch_SetSpecIndexAndCursorPos(mapApp->pokegear->appSwitch, 1, mapApp->unk_014.unk_02 * 2 + 1);
    } else {
        PokegearAppSwitch_SetSpecIndexAndCursorPos(mapApp->pokegear->appSwitch, 1, 0);
    }
}

void ov101_021E8774(PokegearMapAppData *mapApp) {
    int i;

    for (i = 0; i < 3; ++i) {
        PokegearAppSwitch_RemoveButtons(mapApp->pokegear->appSwitch, i + 1);
    }
}

void ov101_021E8790(PokegearMapAppData *mapApp, u8 a1) {
    NARC *narc = NARC_New(NARC_a_1_4_4, mapApp->heapId);

    PaletteData_LoadFromOpenNarc(mapApp->pokegear->plttData, narc, 20 + a1, mapApp->heapId, PLTTBUF_MAIN_BG, 0x1C0, 0, 0);
    PaletteData_LoadFromOpenNarc(mapApp->pokegear->plttData, narc, 14 + a1, mapApp->heapId, PLTTBUF_SUB_BG, 0x180, 0, 0);
    PaletteData_LoadFromOpenNarc(mapApp->pokegear->plttData, narc, 0, mapApp->heapId, PLTTBUF_MAIN_OBJ, 0x160, 0x40, 0);
    PaletteData_LoadFromOpenNarc(mapApp->pokegear->plttData, narc, 0, mapApp->heapId, PLTTBUF_SUB_OBJ, 0x160, 0x40, 0);

    PaletteData_SetAutoTransparent(mapApp->pokegear->plttData, TRUE);
    PaletteData_BlendPalette(mapApp->pokegear->plttData, PLTTBUF_MAIN_BG, 0, 0xE0, 16, RGB_BLACK);
    PaletteData_BlendPalette(mapApp->pokegear->plttData, PLTTBUF_MAIN_OBJ, 0x40, 0xC0, 16, RGB_BLACK);
    PaletteData_PushTransparentBuffers(mapApp->pokegear->plttData);
    PaletteData_SetAutoTransparent(mapApp->pokegear->plttData, FALSE);
    NARC_Delete(narc);
}

void ov101_021E886C(PokegearMapAppData *mapApp) {
    PokegearApp_CreateSpriteManager(mapApp->pokegear, 2);
    mapApp->unk_084 = ov100_021E6E20(111, mapApp->heapId);
    G2dRenderer_SetSubSurfaceCoords(SpriteSystem_GetRenderer(mapApp->pokegear->spriteSystem), 0, FX32_CONST(240));
    mapApp->unk_03C = sub_02013534(4, mapApp->heapId);
}

void ov101_021E88A8(PokegearMapAppData *mapApp) {
    G2dRenderer_SetSubSurfaceCoords(SpriteSystem_GetRenderer(mapApp->pokegear->spriteSystem), 0, FX32_CONST(192));
    sub_020135AC(mapApp->unk_03C);
    ov100_021E6E58(mapApp->unk_084);
    PokegearApp_DestroySpriteManager(mapApp->pokegear);
}

void ov101_021E88D8(PokegearMapAppData *mapApp) {
    int i;
    UnkStruct_ov100_021E6E20_Sub8 *r4 = mapApp->unk_084->unk_08;

    for (i = 0; i < 4; ++i) {
        ov100_021E6EC4(mapApp->unk_084, SpriteSystem_CreateSpriteFromResourceHeader(mapApp->pokegear->spriteSystem, mapApp->pokegear->spriteManager, &ov101_021F7DB8[0]));
        Sprite_SetPositionXY(r4[i].sprite.sprite, 0x68 * (i % 2) + 0x20, 0x15 * (i / 2) + 0xCB);
        thunk_Sprite_SetPriority(r4[i].sprite.sprite, 0);
    }

    ov100_021E6EC4(mapApp->unk_084, SpriteSystem_CreateSpriteFromResourceHeader(mapApp->pokegear->spriteSystem, mapApp->pokegear->spriteManager, &ov101_021F7DB8[1]));
    thunk_Sprite_SetPriority(r4[4].sprite.sprite, 0);

    ov100_021E6EC4(mapApp->unk_084, SpriteSystem_CreateSpriteFromResourceHeader(mapApp->pokegear->spriteSystem, mapApp->pokegear->spriteManager, &ov101_021F7DB8[2]));

    ov100_021E6EC4(mapApp->unk_084, SpriteSystem_CreateSpriteFromResourceHeader(mapApp->pokegear->spriteSystem, mapApp->pokegear->spriteManager, &ov101_021F7DB8[3]));

    for (i = 0; i < 4; ++i) {
        ov100_021E6EC4(mapApp->unk_084, SpriteSystem_CreateSpriteFromResourceHeader(mapApp->pokegear->spriteSystem, mapApp->pokegear->spriteManager, &ov101_021F7DB8[4]));
        Sprite_UpdateAnim(r4[i + 7].sprite.sprite, FX32_CONST(i));
    }

    for (i = 0; i < 11; ++i) {
        UnkStruct_ov100_021E6E20_Sub8 *r6 = &r4[(u16)i];
        Sprite_GetPositionXY(r6->sprite.sprite, &r6->unk_04, &r6->unk_06);
        Sprite_SetDrawFlag(r6->sprite.sprite, FALSE);
    }

    Sprite_SetAnimActiveFlag(r4[5].sprite.sprite, TRUE);
    Sprite_SetAnimActiveFlag(r4[6].sprite.sprite, FALSE);
    Sprite_SetAnimationFrame(r4[6].sprite.sprite, mapApp->pokegear->args->playerGender);
    Sprite_SetAffineOverwriteMode(r4[5].sprite.sprite, 2);
}

void ov101_021E8A88(PokegearMapAppData *mapApp) {
    UnkStruct_ov100_021E6E20_Sub8 *r7 = mapApp->unk_084->unk_08;
    UnkStruct_ov100_021E6E20_Sub8 *r4;
    u16 i;

    for (i = 0; i < 100; ++i) {
        r4 = &r7[ov100_021E6EC4(mapApp->unk_084, SpriteSystem_CreateSpriteFromResourceHeader(mapApp->pokegear->spriteSystem, mapApp->pokegear->spriteManager, &ov101_021F7B3C))];
        Sprite_GetPositionXY(r4->sprite.sprite, &r4->unk_04, &r4->unk_06);
        Sprite_SetDrawFlag(r4->sprite.sprite, FALSE);
        Sprite_SetAnimActiveFlag(r4->sprite.sprite, FALSE);
    }
}

void ov101_021E8AE4(PokegearMapAppData *mapApp) {
    UnkTemplate_02013950 sp18;
    u32 sp14;
    int i;

    mapApp->unk_040 = sub_02013910(&mapApp->unk_204, mapApp->heapId);
    sp14 = sub_02013948(mapApp->unk_040, NNS_G2D_VRAM_TYPE_2DMAIN);
    AddTextPrinterParameterizedWithColor(&mapApp->unk_204, 0, mapApp->unk_0A0, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);

    sp18.unk_00 = mapApp->unk_03C;
    sp18.unk_04 = &mapApp->unk_204;
    sp18.unk_08 = SpriteManager_GetSpriteList(mapApp->pokegear->spriteManager);
    sp18.unk_0C = SpriteManager_FindPlttResourceProxy(mapApp->pokegear->spriteManager, 0);
    sp18.unk_20 = 0;
    sp18.unk_24 = 3;
    sp18.unk_18 = 4;
    sp18.unk_1C = -6;
    sp18.unk_28 = 1;
    sp18.unk_2C = mapApp->heapId;

    for (i = 0; i < 4; ++i) {
        sub_02021AC8(sp14, TRUE, NNS_G2D_VRAM_TYPE_2DMAIN, &mapApp->unk_044[i].unk_4);
        sp18.unk_14 = mapApp->unk_044[i].unk_4.offset;
        sp18.unk_10 = mapApp->unk_084->unk_08[24 + i].sprite.sprite;
        mapApp->unk_044[i].unk_0 = sub_02013950(&sp18, mapApp->unk_040);
        sub_020137C0(mapApp->unk_044[i].unk_0, 0);
        sub_02013850(mapApp->unk_044[i].unk_0, 7);
    }
}

void ov101_021E8BB8(PokegearMapAppData *mapApp) {
    int i;

    for (i = 0; i < 4; ++i) {
        sub_020139C8(mapApp->unk_044[i].unk_0);
        sub_02021B5C(&mapApp->unk_044[i].unk_4);
        mapApp->unk_044[i].unk_0 = NULL;
    }
    sub_02013938(mapApp->unk_040);
}
