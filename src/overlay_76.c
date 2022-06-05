#include "gf_gfx_loader.h"
#include "msgdata.h"
#include "overlay_76.h"
#include "overlay_manager.h"
#include "system.h"
#include "unk_02009D48.h"
#include "unk_0200A090.h"
#include "unk_0200ACF0.h"
#include "unk_0200E320.h"
#include "unk_02023694.h"
#include "window.h"

// DON'T FORGET TO CHECK SOULSILVER!

typedef struct {
    int unk0;
    int unk4;
    int unk8;
    SysTask *unkC;
    BGCONFIG *unk10;
} UnkOv76_021E6944;

typedef struct {
    u8 unk0;
    u8 unk1;
    u8 unk2;
    u8 unk3;
} MiniState;

typedef struct {
    int unk0;
    int unk4;
} ParentWork;

typedef struct {
    int unk0[6];
} SomeStruct;

typedef struct {
    void *unk0;
    void *unk4;
    int unk8;
    void *unkC;
} OtherStruct;

typedef struct {
    struct _2DGfxResObj *unk0;
    struct _2DGfxResObj *unk4;
    struct _2DGfxResObj *unk8;
    struct _2DGfxResObj *unkC;
} UnkOv76_021E6170;

typedef struct {
    u16 unk0;
    u16 unk2;
    int unk4;
    struct Sprite *unk8;
} UnkOv76_021E683C_sub;

typedef struct {
    UnkOv76_021E683C_sub unk0[0x10]; // MIGHT NOT USE ALL THIS SPACE!
    int unkC0;
} UnkOv76_021E683C;

// TODO: RENAME OFFSETS! These names are no longer correct!
typedef struct {
    u8 unk8[0x4];
    u32 unkC;
    u32 unk10;
    NNSG2dImagePaletteProxy *unk14;
    NNSG2dImageProxy *unk18;
    u8 unk1C[0x8];
    NNSG2dCellDataBank *unk24;
    NNSG2dAnimBankData *unk28;
    u8 unk2C[0x8];
    void *unk34;
    void *unk38;
} UnkOv76_021E6B2C;

typedef struct {
    NARC *unk0;
    u16 unk4;
    u16 unk6;
    UnkOv76_021E6B2C unk8[6];
    // This seems to be unrelated to Narc, so maybe it's not in this
    // struct...?
    UnkOv76_021E683C unk140;
    int unk204;
} NarcStruct;

typedef struct {
    u16 unk0;
    u16 unk2;
    SysTask *unk4;
} UnkOv76_021E68C8;

typedef struct {
    MSGDATA *unk0; // 0
    WINDOW unk4;   // 4
    STRING *unk14;  // 14
    UnkOv76_021E6944 unk18;
    MiniState unk2C;
    UnkOv76_021E68C8 unk30;
} Ov76_Data_021E5AA0;

typedef struct {
    struct Sprite *unk0[0xc];
    struct Sprite *unk30[0xc];
    u8 unk60[0x4];
} UnkOv76_021E664C;

typedef struct {
    OVY_MANAGER *unk0;
    BGCONFIG *unk4;
    u32 unk8;
    int unkC;
    ParentWork *unk10; // parent work
    int unk14;
    SpriteList *unk18;
    GF_G2dRenderer unk1C; // figure out sizeof!
    struct _2DGfxResMan *unk144[4];
    struct _2DGfxResObj *unk154[4];
    UnkOv76_021E6170 unk164[6];
    UnkOv76_021E664C unk1C4;
    Ov76_Data_021E5AA0 unk228;
    NarcStruct unk260;
    OtherStruct *unk468[6]; // might be SomeStruct?
    OtherStruct *unk480[6];
    NNSG2dScreenData *unk498[6];
    NNSG2dScreenData *unk4B0[6];
} Ov76_Work;

typedef struct {
    int unk0[4];
} UnkOv021E607C;

typedef struct {
    u16 unk0;
    u8 unk2;
    u8 unk3;
    int unk4;
} UnkOv76_21E6A94;

typedef struct {
    int unk0; // palMemberNo
    int unk4; // charMemberNo
    int unk8;
    int unkC;
} UnkOv76_021E6B8C;

typedef struct {
    u16 unk0;
    u8 unk2;
    u8 unk3;
    s16 unk4;
    s16 unk6;
    u32 unk8;
} UnkOv76_021E6CF4;

typedef struct {
    u8 unk0;
    u8 unk1;
    u8 unk2[6];
    UnkOv76_021E6CF4 unk8[16];
} UnkOv76_021E6D80;

// extern const WINDOWTEMPLATE ov76_021E6E98;

// NOTE TO SELF: Keep extern!
extern const UnkOv021E60F6 ov76_021E6E88[4];
extern const u8 ov76_021E878C[8];

static const WINDOWTEMPLATE ov76_021E6E98;
static const UnkOv021E607C ov76_021E6EA0;
static const struct GFBgModeSet ov76_021E6EB0;
static const int ov76_021E6EC0[5];
static const int ov76_021E6ED4[5];
static const SomeStruct ov76_021E6EE8;
static const SomeStruct ov76_021E6F00;
static const BGTEMPLATE ov76_021E6F18;
static const BGTEMPLATE ov76_021E6F34;
static const BGTEMPLATE ov76_021E6F50;
static const BGTEMPLATE ov76_021E6F6C;
static const BGTEMPLATE ov76_021E6F88;
static const BGTEMPLATE ov76_021E6FA4;
static const GF_GXBanksConfig ov76_021E6FC0;
static const u16 ov76_021E6FE8[43][2];
static const UnkOv76_021E6B8C ov76_021E7094[42];
static const UnkOv76_21E6A94 ov76_021E7334[251];
static const UnkOv76_021E6D80 ov76_021E7B0C[16];

static void ov76_021E5D94(void *data);
static void ov76_021E5DA4(void);
static void ov76_021E5DC4(Ov76_Work *a0);
static void ov76_021E5EE0(Ov76_Work *a0);
static void ov76_021E5F1C(Ov76_Work *a0);
static void ov76_021E607C(Ov76_Work *a0);
static void ov76_021E613C(Ov76_Work *a0);
static void ov76_021E6170(Ov76_Work *a0);
static void ov76_021E62B4(Ov76_Work *a0);
static void ov76_021E62F4(Ov76_Work *a0);
static void ov76_021E6440(int a0, Ov76_Work *a1, int a2, int a3, struct SpriteTemplate *a4, struct SpriteResourcesHeader *a5);
static void ov76_021E650C(Ov76_Work *a0);
static void ov76_021E6544(Ov76_Work *a0);
static void ov76_021E656C(Ov76_Work *a0);
static void ov76_021E664C(Ov76_Work *a0);
static void ov76_021E6810(Ov76_Work *a0);
static void ov76_021E683C(Ov76_Work *a0);
static void ov76_021E68B4(struct Sprite *a0);
static void ov76_021E68C8(Ov76_Work *a0);
static void ov76_021E68DC(int a0, u16 *a1);
static void ov76_021E6904(Ov76_Work *a0);
static void ov76_021E6944(UnkOv76_021E6944 *a0, BGCONFIG *a1, int a2);
static int ov76_021E69C0(UnkOv76_021E6944 *a0);
static void ov76_021E69C4(int a0, UnkOv76_021E6944 *a1, int a2);
static void ov76_021E6A34(int a0, int a1, int a2, int a3);
static void ov76_021E6A94(Ov76_Data_021E5AA0 *a0);
static void ov76_021E6B2C(Ov76_Work *a0);
static void ov76_021E6B8C(NarcStruct *a0, int a1);
static void ov76_021E6D80(Ov76_Work *a0);
static void ov76_021E6E20(Ov76_Work *a0);

BOOL ov76_021E5900(OVY_MANAGER *a0, int *a1) {
    Ov76_Work *data;

    switch(*a1) {
    case 0: // inst 0x1a
        CreateHeap(3, 0x49, 1 << 18);
        Ov76_Work *work = OverlayManager_CreateAndGetData(a0, sizeof(Ov76_Work), 0x49);
        if (work != NULL) {
            MI_CpuFill8(work, 0, sizeof(Ov76_Work));
            Main_SetVBlankIntrCB(NULL, NULL);
            HBlankInterruptDisable();
            GX_DisableEngineALayers();
            GX_DisableEngineBLayers();
            reg_GX_DISPCNT &= 0xffffe0ff;
            reg_GXS_DB_DISPCNT &= 0xffffe0ff;
            ov76_021E5DA4();
            work->unk10 = OverlayManager_GetParentWork(a0);
            work->unk14 = 0;
            gSystem.screensFlipped = 1;
            GX_SwapDisplay();
            ov76_021E607C(work);
            ov76_021E6170(work);
            ov76_021E6B2C(work);
            G2dRenderer_SetSubSurfaceCoords(&work->unk1C, 0, 0);
            G2dRenderer_SetMainSurfaceCoords(&work->unk1C, 0, 256 * FX32_ONE); // this is fx32
            work->unk0 = a0;
            *a1 += 1;
        }
        break;
    case 1: // inst 0xb6
        data = OverlayManager_GetData(a0);
        ov76_021E5DC4(data);
        ov76_021E62F4(data);
        data->unk228.unk0 = NewMsgDataFromNarc(0, 0x1b, 0x1b8, 0x49);
        data->unk228.unk14 = String_ctor(1 << 8, 0x49);
        ov76_021E6904(data);
        ov76_021E650C(data);

        // DO NOT SUBMIT until cleaning up with an ifdef'd constant!
        #ifdef HEARTGOLD
        ReadMsgDataIntoString(data->unk228.unk0, 0, data->unk228.unk14);
        #else
        ReadMsgDataIntoString(data->unk228.unk0, 1, data->unk228.unk14);
        #endif //HEARTGOLD

        FillWindowPixelBuffer(&data->unk228.unk4, 0);
        AddTextPrinterParameterized2(&data->unk228.unk4, 0, data->unk228.unk14, 0, 0x46, 0xff, 0x00010200, 0);
        CopyWindowToVram(&data->unk228.unk4);
        data->unk228.unk2C.unk3 = 1;
        sub_02004EC4(0xe, 0x3f8, 1);
        Main_SetVBlankIntrCB(ov76_021E5D94, data);
        *a1 += 1;
        break;
    case 2: // inst 0x15c
        data = OverlayManager_GetData(a0);
        BeginNormalPaletteFade(0, 1, 1, 0, 0x1e, 1, 0x49);
        return TRUE;
    }
    return FALSE;
}

BOOL ov76_021E5AA0(OVY_MANAGER *a0, int *a1) {
    Ov76_Work *data = OverlayManager_GetData(a0);

    switch (*a1) {
    case 0: // inst 0x26
        Main_SetVBlankIntrCB(NULL, NULL);
        *a1 += 1;
        break;
    case 1: // inst 0x36
        Ov76_Data_021E5AA0 *unknownData = &data->unk228;
        RemoveWindow(&unknownData->unk4);
        DestroyMsgData(unknownData->unk0);
        String_dtor(unknownData->unk14);
        ov76_021E5EE0(data);
        for (u8 i = 0; i < 6; i++) {
            FreeToHeap(data->unk468[i]);
            FreeToHeap(data->unk480[i]);
        }
        ov76_021E6544(data);
        *a1 += 1;
        break;
    case 2: // inst 0x88
        NARC_dtor(data->unk260.unk0);
        ov76_021E62B4(data);
        ov76_021E613C(data);
        *a1 += 1;
        break;
    case 3: // inst 0xa6
        OverlayManager_FreeData(a0);
        DestroyHeap(0x49);
        return TRUE;
    }
    return FALSE;
}

BOOL ov76_021E5B60(OVY_MANAGER *a0, int *a1) {
    Ov76_Work *data = OverlayManager_GetData(a0);
    GF_ASSERT(data->unk8 < 0xffffffff);

    switch (*a1) {
    case 0: // inst 0x3a
        if (IsPaletteFadeFinished() != 0) {
            *a1 += 1;
        }
        break;
    case 1: // inst 0x4a
        if (data->unk10->unk4 != 0 && ((gSystem.newKeys & 0x8) || gSystem.touchNew != 0)) {
            data->unk14 = 1;
            BeginNormalPaletteFade(0, 0, 0, 0, 0x1e, 1, 0x49);
            GF_SndStartFadeOutBGM(0, 0x1a);
            *a1 += 1;
            break;
        }
        data->unk8++;
        ov76_021E656C(data);
        ov76_021E664C(data);
        ov76_021E6810(data);
        ov76_021E683C(data);
        if (data->unk8 < 0x00001370) {
            break;
        }
        BeginNormalPaletteFade(0, 0, 0, 0, 0x1e, 1, 0x49);
        *a1 += 1;
        break;
    case 2: // inst 0xd4
        if (IsPaletteFadeFinished() != 0) {
            if (data->unk14 != 0) {
                ov76_021E6E20(data);
            }
            GfGfxLoader_LoadCharData(0x49 + 0xc0, 6, data->unk4, 1, 0, 0, 1, 0x49);
            GfGfxLoader_LoadScrnData(0x49 + 0xc0, 0x13, data->unk4, 1, 0, 6 << 8, 1, 0x49);
            BgCommitTilemapBufferToVram(data->unk4, 1);
            GX_EngineAToggleLayers(1, 0);
            GX_EngineAToggleLayers(4, 0);
            GX_EngineAToggleLayers(8, 0);
            GX_EngineAToggleLayers(16, 0);
            GX_EngineAToggleLayers(2, 1);
            gSystem.screensFlipped = 0;
            GX_SwapDisplay();
            BeginNormalPaletteFade(3, 1, 1, 0, 1, 1, 0x49);
            *a1 += 1;
        }
        break;
    case 3: // inst 0x174
        if (IsPaletteFadeFinished() != 0) {
            data->unkC = 0;
            *a1 += 1;
        }
        break;
    case 4: // inst 0x188
        if ((gSystem.newKeys & 0x9) || gSystem.touchNew != 0) {
            BeginNormalPaletteFade(3, 0, 0, 0, 0x3c, 1, 0x49);
            *a1 = 6;
            break;
        }
        if (++data->unkC >= 0x17c) {
            PlayBGM(0x000003f9);
            *a1 += 1;
        }
        break;
    case 5: // inst 0x1d4
        if ((gSystem.newKeys & 0x9) || gSystem.touchNew != 0) {
            BeginNormalPaletteFade(3, 0, 0, 0, 0x3c, 1, 0x49);
            *a1 += 1;
        }
        break;
    case 6: // inst 0x206
        if (IsPaletteFadeFinished() != 0) {
            return TRUE;
        }
        break;
    }
    sub_0202457C(data->unk18);
    return FALSE;
}

static void ov76_021E5D94(void *data) {
    Ov76_Work *ovy_data = data;
    BgConfig_HandleScheduledScrollAndTransferOps(ovy_data->unk4);
    OamManager_ApplyAndResetBuffers();
}

static void ov76_021E5DA4(void) {
    GF_GXBanksConfig banks = ov76_021E6FC0;
    GX_SetBanks(&banks);
}

static void ov76_021E5DC4(Ov76_Work *a0) {
    struct GFBgModeSet modeSet;
    BGTEMPLATE template1;
    BGTEMPLATE template2;
    BGTEMPLATE template3;
    BGTEMPLATE template4;
    BGTEMPLATE template5;
    BGTEMPLATE template6;

    a0->unk4 = BgConfig_Alloc(0x49);
    reg_G2_BLDCNT = 0;
    reg_G2S_DB_BLDCNT = 0;
    modeSet = ov76_021E6EB0;
    SetBothScreensModesAndDisable(&modeSet);
    template1 = ov76_021E6F18;
    InitBgFromTemplate(a0->unk4, 2, &template1, 0);
    template2 = ov76_021E6F34;
    InitBgFromTemplate(a0->unk4, 3, &template2, 0);
    template3 = ov76_021E6F50;
    InitBgFromTemplate(a0->unk4, 1, &template3, 0);
    template4 = ov76_021E6F6C;
    InitBgFromTemplate(a0->unk4, 5, &template4, 0);
    template5 = ov76_021E6F88;
    InitBgFromTemplate(a0->unk4, 6, &template5, 0);
    template6 = ov76_021E6FA4;
    InitBgFromTemplate(a0->unk4, 7, &template6, 0);
    ov76_021E5F1C(a0);
}

static void ov76_021E5EE0(Ov76_Work *a0) {
    FreeBgTilemapBuffer(a0->unk4, 1);
    FreeBgTilemapBuffer(a0->unk4, 2);
    FreeBgTilemapBuffer(a0->unk4, 3);
    FreeBgTilemapBuffer(a0->unk4, 5);
    FreeBgTilemapBuffer(a0->unk4, 6);
    FreeBgTilemapBuffer(a0->unk4, 7);
    FreeToHeap(a0->unk4);
}

static void ov76_021E5F1C(Ov76_Work *a0) {
    SomeStruct local1 = ov76_021E6EE8;
    SomeStruct local2 = ov76_021E6F00;
    BGCONFIG *bgConfig = a0->unk4;

    GfGfxLoader_LoadCharData(0x49 + 0xc0, 5, bgConfig, 3, 0, 0, 1, 0x49);
    GfGfxLoader_LoadCharData(0x49 + 0xc0, 5, bgConfig, 7, 0, 0, 1, 0x49);
    GfGfxLoader_GXLoadPal(0x49 + 0xc0, 4, 4, 0, 0xe0, 0x49);
    GfGfxLoader_GXLoadPal(0x49 + 0xc0, 4, 0, 0, 0xe0, 0x49);
    for (u8 i = 0; i < 6; i++) {
        a0->unk468[i] = (OtherStruct *)GfGfxLoader_GetScrnData(0xc0 + 0x49, local1.unk0[i], 1, &a0->unk498[i], 0x49);
        a0->unk480[i] = (OtherStruct *)GfGfxLoader_GetScrnData(0xc0 + 0x49, local2.unk0[i], 1, &a0->unk4B0[i], 0x49);
    }

    BG_LoadScreenTilemapData(bgConfig, 2, a0->unk498[0]->rawData, a0->unk498[0]->szByte);
    BG_LoadScreenTilemapData(bgConfig, 3, a0->unk4B0[0]->rawData, a0->unk4B0[0]->szByte);
    BG_LoadScreenTilemapData(bgConfig, 6, a0->unk498[0]->rawData, a0->unk498[0]->szByte);
    BG_LoadScreenTilemapData(bgConfig, 7, a0->unk4B0[0]->rawData, a0->unk4B0[0]->szByte);
    ScheduleBgTilemapBufferTransfer(bgConfig, 2);
    ScheduleBgTilemapBufferTransfer(bgConfig, 3);
    ScheduleBgTilemapBufferTransfer(bgConfig, 6);
    ScheduleBgTilemapBufferTransfer(bgConfig, 7);
    GX_EngineAToggleLayers(2, 0);
}

static void ov76_021E607C(Ov76_Work *a0) {
    UnkOv021E607C temp;
    UnkOv021E60F6 temp2;

    reg_GX_DISPCNT = (reg_GX_DISPCNT & 0xffcfffef) | 0x00200010;
    reg_GXS_DB_DISPCNT = (reg_GXS_DB_DISPCNT & 0xffcfffef) | 0x00200010;
    temp = ov76_021E6EA0;
    sub_020215A0(&temp);
    sub_02022588(0xd, 0x49);
    sub_020216C8();
    sub_02022638();
    NNS_G2dInitOamManagerModule();
    OamManager_Create(0, 0x80, 0, 0x20, 0, 0x80, 0, 0x20, 0x49);
    a0->unk18 = G2dRenderer_Init(0x28, &a0->unk1C, 0x49);

    temp2 = ov76_021E6E88[3];
    u8 *ptr =  (u8 *)&temp2;

    for (u8 i = 0; i < 4; i++) {
        a0->unk144[i] = Create2DGfxResObjMan(ptr[i], i, 0x49);
    }
}

static void ov76_021E613C(Ov76_Work *a0) {
    for (u8 i = 0; i < 4; i++) {
        Destroy2DGfxResObjMan(a0->unk144[i]);
    }
    sub_02024504(a0->unk18);
    OamManager_Free();
    sub_0202168C();
    sub_02022608();
}

static void ov76_021E6170(Ov76_Work *a0) {
    a0->unk154[0] = AddCharResObjFromNarc(a0->unk144[0], 0x49 + 0xc0, 1, 1, 1, 3, 0x49);
    a0->unk154[1] = AddPlttResObjFromNarc(a0->unk144[1], 0x49 + 0xc0, 0, 0, 1, 3, 7, 0x49);
    a0->unk154[2] = AddCellOrAnimResObjFromNarc(a0->unk144[2], 0x49 + 0xc0, 2, 1, 1, 2, 0x49);
    a0->unk154[3] = AddCellOrAnimResObjFromNarc(a0->unk144[3], 0x49 + 0xc0, 3, 1, 1, 3, 0x49);
    a0->unk260.unk0 = NARC_ctor(0x109, 0x49);

    NarcStruct *temp = &a0->unk260;
    NARC **narc = &temp->unk0;
    temp->unk204 = a0->unk10->unk0;

    for (u8 i = 0; i < 6; i++) {
        a0->unk164[i].unk0 = AddCharResObjFromOpenNarc(a0->unk144[0], *narc, 0x14, 1, i + 2, 1, 0x49);
        a0->unk164[i].unk4 = AddPlttResObjFromOpenNarc(a0->unk144[1], *narc, 0x95, 0, i + 2, 1, 1, 0x49);
    }

    sub_0200ACF0(a0->unk154[0]);
    sub_0200AF94(a0->unk154[1]);

    for (u8 i = 0; i < 6; i++) {
        sub_0200ACF0(a0->unk164[i].unk0);
        sub_0200AF94(a0->unk164[i].unk4);
    }

    GX_EngineAToggleLayers(16, 1);
    GX_EngineBToggleLayers(16, 1);
}

static void ov76_021E62B4(Ov76_Work *a0) {
    sub_0200AEB0(a0->unk154[0]);
    sub_0200B0A8(a0->unk154[1]);

    for (u8 i = 0; i < 6; i++) {
        sub_0200AEB0(a0->unk164[i].unk0);
        sub_0200B0A8(a0->unk164[i].unk4);
    }
}

// Probably initializes the dancing Pokémon sprites
static void ov76_021E62F4(Ov76_Work *a0) {
    struct SpriteResourcesHeader temp2;
    struct SpriteTemplate temp1; 
    
    u8 var2;

    UnkOv76_021E664C *temp3 = &a0->unk1C4;
    ov76_021E6440(1, a0, 1, 3, &temp1, &temp2);
    for (u8 i = 0; i < 6; i++) {
        if (i < 3) {
            var2 = i;
            temp1.position.x = (1 << 16);
        } else {
            var2 = i - 3;
            temp1.position.x = (0xf << 16);
        }
    
        temp1.position.y = (var2 * 0x50 + 16) * FX32_ONE;
        temp1.priority = 1;
        temp3->unk0[i] = CreateSprite(&temp1);
        GF_ASSERT(temp3->unk0[i] != NULL);
        Set2dSpriteAnimActiveFlag(temp3->unk0[i], 1);
        Set2dSpriteVisibleFlag(temp3->unk0[i], 1);
        Set2dSpriteAnimSeqNo(temp3->unk0[i], 6);
        
        temp1.priority = 0;
        temp3->unk30[i] = CreateSprite(&temp1);
        GF_ASSERT(temp3->unk30[i] != NULL);
        Set2dSpriteAnimActiveFlag(temp3->unk30[i], 1);
        Set2dSpriteVisibleFlag(temp3->unk30[i], 0);
        Set2dSpriteAnimSeqNo(temp3->unk30[i], 7);
    }

    for (u8 i = 0; i < 6; i++) {
        if (i < 3) {
            var2 = i;
            temp1.position.x = 1 << 16;
        } else {
            var2 = i - 3;
            temp1.position.x = 0xf << 16;
        }
        temp1.position.y = (var2 * 0x50 + 0x50 + 0xc0) * FX32_ONE;
        temp1.priority = 1;
        u8 idx = i + 6;
        temp3->unk0[idx] = CreateSprite(&temp1);
        Set2dSpriteAnimActiveFlag(temp3->unk0[idx], 1);
        Set2dSpriteVisibleFlag(temp3->unk0[idx], 1);
        Set2dSpriteAnimSeqNo(temp3->unk0[idx], 6);

        temp1.priority = 0;
        temp3->unk30[idx] = CreateSprite(&temp1);
        Set2dSpriteAnimActiveFlag(temp3->unk30[idx], 1);
        Set2dSpriteVisibleFlag(temp3->unk30[idx], 0);
        Set2dSpriteAnimSeqNo(temp3->unk30[idx], 7);
    }

    ov76_021E6D80(a0);
    GX_EngineAToggleLayers(16, 1);
    GX_EngineBToggleLayers(16, 1);
}

static void ov76_021E6440(int a0, Ov76_Work *a1, int a2, int a3, struct SpriteTemplate *a4, struct SpriteResourcesHeader *a5) {
    CreateSpriteResourcesHeader(a5, a0, a0, a0, a0, -1, -1, 0, a2, a1->unk144[0], a1->unk144[1], a1->unk144[2], a1->unk144[3], 0, 0);
    a4->spriteList = a1->unk18;
    a4->header = a5;
    a4->position.x = 0;
    a4->position.y = 0;
    a4->position.z = 0;
    a4->scale.x = FX32_ONE;
    a4->scale.y = FX32_ONE;
    a4->scale.z = FX32_ONE;
    a4->rotation = 0;
    a4->priority = 0;
    a4->whichScreen = a3;
    a4->heapId = 0x49;
}

static void ov76_021E64B0(u8 a0, Ov76_Work *a1, u8 a2, int a3, struct SpriteTemplate *a4, SpriteResourcesHeader *a5) {
    UnkOv76_021E6B2C *ptr = &a1->unk260.unk8[a0];

    a5->charData = 0;
    a5->plttProxy = ptr->unk14; // *(r6 + 12);
    a5->imageProxy = ptr->unk18; // *(r6 + 16);
    a5->cellData = ptr->unk24; // *(r6 + 0x1c);
    a5->cellAnim = ptr->unk28; // *(r6 + 32);
    a5->multiCellData = 0;
    a5->multiCellAnim = 0;
    a5->flag = 0;
    a5->priority = a2;

    a4->spriteList = a1->unk18;
    a4->header = a5;
    a4->position.x = 0;
    a4->position.y = 0;
    a4->position.z = 0;
    a4->scale.x = FX32_ONE;
    a4->scale.y = FX32_ONE;
    a4->scale.z = FX32_ONE;
    a4->rotation = 0;
    a4->priority = 0;
    a4->whichScreen = a3;
    a4->heapId = 0x49;
}

// DO NOT SUBMIT until adding external functions!!
static void ov76_021E650C(Ov76_Work *a0) {
    Ov76_Data_021E5AA0 *ptr = &a0->unk228;
    ptr->unk18.unkC = sub_0200E33C(ov76_021E69C4, &ptr->unk18, 0);
    a0->unk228.unk30.unk4 = sub_0200E33C(ov76_021E68DC, &a0->unk228.unk30, 1);
}

static void ov76_021E6544(Ov76_Work *a0) {
    Ov76_Data_021E5AA0 *ptr = &a0->unk228;
    DestroySysTask(ptr->unk18.unkC);
    ptr->unk18.unkC = NULL;

    DestroySysTask(a0->unk228.unk30.unk4);
    a0->unk228.unk30.unk4 = NULL;
}

static void ov76_021E656C(Ov76_Work *a0) {
    int temp;
    Ov76_Data_021E5AA0 *ptr;
    UnkOv76_021E6944 *ptr18;

    ptr = &a0->unk228;
    ptr18 = &ptr->unk18;
    temp = 0;

    if (ptr->unk2C.unk2 < 43) {
        if (a0->unk8 == ov76_021E6FE8[ptr->unk2C.unk2][0]) {
            temp = 1;
        }

        switch (ptr->unk2C.unk1) {
        case 0: // inst 0x44
            ptr->unk2C.unk0 += 1;
            if (ptr->unk2C.unk0 >= ov76_021E6FE8[ptr->unk2C.unk2][1]) {
                ov76_021E6944(ptr18, a0->unk4, 1);
                ptr->unk2C.unk1 = 3;
                return;
            }
            break;
        case 1: // inst 0x7c
            if (temp != 0) {
                ov76_021E6944(ptr18, a0->unk4, 0);
                ptr->unk2C.unk1 = 2;
                return;
            }
            break;
        case 2: // inst 0x94
            if (ov76_021E69C0(ptr18) == 0) {
                ptr->unk2C.unk0 = 0;
                ptr->unk2C.unk1 = 0;
                return;
            }
            break;
        case 3: // inst 0xae
            if (ov76_021E69C0(ptr18) == 0) {
                ov76_021E6A94(ptr);
                ptr->unk2C.unk2 += 1;
                ptr->unk2C.unk1 = 1;
            }
            break;
        }
    }
}

static void ov76_021E664C(Ov76_Work *a0) {
    UnkOv76_021E664C *ptr= &a0->unk1C4;
    int temp = 0;

    if (ptr->unk60[3] >= 5) {
        return;
    }
    if (a0->unk8 == ov76_021E6EC0[ptr->unk60[3]]) {
        temp = 1;
    }
    if (temp != 0 && ptr->unk60[1] == 0) {
        ptr->unk60[1] = 1;
    }

    switch (ptr->unk60[1]) {
    case 0: // inst 0x1b2
        break;
    case 1: // inst 0x5c
        for (u8 i = 0; i < 12; i++) {
            Set2dSpriteVisibleFlag(ptr->unk30[i], 1);
            Set2dSpriteAnimSeqNo(ptr->unk30[i], 7);
        }
        ptr->unk60[0] = 0;
        ptr->unk60[1] = 2;
        return;
    case 2: // inst 0x90
        ptr->unk60[0] += 1;
        if (ptr->unk60[0] >= 1) {
            ptr->unk60[2] = (ptr->unk60[2] + 1) % 6;
            // inst 0xbe
            u8 idx = ptr->unk60[2];
            for (u8 i = 0; i < 12; i++) {
                Set2dSpriteAnimSeqNo(ptr->unk0[i], ov76_021E878C[idx]);
            }

            BG_LoadScreenTilemapData(a0->unk4, 7, a0->unk4B0[idx]->rawData, a0->unk4B0[idx]->szByte);
            ScheduleBgTilemapBufferTransfer(a0->unk4, 7);

            BG_LoadScreenTilemapData(a0->unk4, 6, a0->unk498[idx]->rawData, a0->unk498[idx]->szByte);
            ScheduleBgTilemapBufferTransfer(a0->unk4, 6);

            BG_LoadScreenTilemapData(a0->unk4, 3, a0->unk4B0[idx]->rawData, a0->unk4B0[idx]->szByte);
            ScheduleBgTilemapBufferTransfer(a0->unk4, 3);

            BG_LoadScreenTilemapData(a0->unk4, 2, a0->unk498[idx]->rawData, a0->unk498[idx]->szByte);
            ScheduleBgTilemapBufferTransfer(a0->unk4, 2);

            ptr->unk60[0] = 0;
            ptr->unk60[1] = 3;
            break;
        }

        break;
    case 3: // inst 0x166
        ptr->unk60[0] += 1;
        if (ptr->unk60[0] >= 0x1e) {
            for (u8 i = 0; i < 12; i++) {
                Set2dSpriteVisibleFlag(ptr->unk30[i], 0);
            }
            ptr->unk60[0] = 0;
            ptr->unk60[1] = 0;
            ptr->unk60[3] += 1;
        }
        break;
    }
}

static void ov76_021E6810(Ov76_Work *a0) {
    int temp = 0;
    if (a0->unk228.unk30.unk2 < 5) {
        if (a0->unk8 == ov76_021E6ED4[a0->unk228.unk30.unk2]) {
            temp = 1;
        }
        if (temp != 0) {
            ov76_021E68C8(a0);
        }
    }
}

static void ov76_021E683C(Ov76_Work *a0) {
    UnkOv76_021E683C *ptr = &a0->unk260.unk140;

    if (a0->unk260.unk6 >= 16) {
        return;
    }

    u8 count = 0;
    for (u8 i = 0; i < ptr->unkC0; i++) {
        // if (a0->unk8 == *(ptr + 12 * i + 4)) {
        if (a0->unk8 == ptr->unk0[i].unk4) {
            ov76_021E68B4(ptr->unk0[i].unk8);
        }
        if (sub_02024B68(ptr->unk0[i].unk8) == 0) {
            count++;
        }
    }
    if (count == ptr->unkC0) {
        ov76_021E6E20(a0);
        a0->unk260.unk6 += 1;
        ov76_021E6D80(a0);
    }
}

static void ov76_021E68B4(struct Sprite *a0) {
    Set2dSpriteAnimActiveFlag(a0, 1);
    Set2dSpriteVisibleFlag(a0, 1);
}

static void ov76_021E68C8(Ov76_Work *a0) {
    UnkOv76_021E68C8 *ptr = &a0->unk228.unk30;
    ptr->unk0 = 1;
    ptr->unk2 += 1;
}

static void ov76_021E68DC(int a0, u16 *a1) {
    if (*a1 != 0) {
        *a1 = 0;
        if (gSystem.screensFlipped == 1) {
            gSystem.screensFlipped = 0;
        } else {
            gSystem.screensFlipped = 1;
        }
        GX_SwapDisplay();
    }
}

static void ov76_021E6904(Ov76_Work *a0) {
    AddWindow(a0->unk4, &a0->unk228.unk4, &ov76_021E6E98);
    BG_FillCharDataRange(a0->unk4, 5, 0, 1, 0);
    LoadFontPal0(4, 0x1e0, 0x49);
    GX_EngineBToggleLayers(2, 1);
}

static void ov76_021E6944(UnkOv76_021E6944 *a0, BGCONFIG *a1, int a2) {
    u32 val;

    GF_ASSERT(a0->unk4 == 0);
    reg_GXS_DB_DISPCNT = (reg_GXS_DB_DISPCNT & 0xffff1fff) | 0x6000;
    val = ((reg_G2S_DB_WININ & ~0x3f) | 0x1e);
    reg_G2S_DB_WININ = val | 0x20;
    val = ((reg_G2S_DB_WININ & 0xffffc0ff) | 0x1e00);
    reg_G2S_DB_WININ = val | 0x2000;
    val = ((reg_G2S_DB_WINOUT & ~0x3f) | 0x1c);
    reg_G2S_DB_WINOUT = val | 0x20;
    a0->unk0 = 0;
    a0->unk4 = 1;
    a0->unk8 = a2;
    a0->unk10 = a1;

    GX_EngineBToggleLayers(2, 1);
}

static int ov76_021E69C0(UnkOv76_021E6944 *a0) {
    return a0->unk4;
}

static void ov76_021E69C4(int a0, UnkOv76_021E6944 *a1, int a2) {
    int temp;
    int temp2;
    int temp3;

    if (a1->unk4 == 0) {
        return;
    }

    a1->unk0++;
    if (a1->unk8 == 0) {
        temp2 = 0xff;
        temp = (1 - a1->unk0) * temp2;
    } else {
        temp = 0;
        temp2 = (1 - a1->unk0) * 0xff;
    }

    temp3 = 0xff * a1->unk0;
    if (a1->unk0 >= 1) {
        a1->unk4 = 0;
        if (a1->unk8 == 0) {
            GX_EngineBToggleLayers(2, 1);
        } else {
            GX_EngineBToggleLayers(2, 0);
        }
    }
    ov76_021E6A34(temp, 0, temp2, 0xc0);
    BgSetPosTextAndCommit(a1->unk10, 5, 0, temp3);
}

static void ov76_021E6A34(int a0, int a1, int a2, int a3) {
    u16 temp;

    if (a0 == 0 && a2 == 0xff) {
        reg_G2S_DB_WIN1H = 1;
        temp = ((a1 << 8) & 0xff00) | (u8)a3;
        reg_G2S_DB_WIN1V = temp;
        reg_G2S_DB_WIN0H = 0x0100;
        reg_G2S_DB_WIN0V = temp;
        return;
    }

    reg_G2S_DB_WIN0H = ((a0 << 8) & 0xff00) | (u8)a2;
    reg_G2S_DB_WIN0V = (a1 << 8) & 0xff00 | (u8)a3;
}

static void ov76_021E6A94(Ov76_Data_021E5AA0 *a0) {
    u32 var4;

    u16 var = a0->unk2C.unk2 + 1;
    if (var >= 0x2b) {
        return;
    }

    u16 var2 = ov76_021E7334[a0->unk2C.unk3].unk0;
    FillWindowPixelBuffer(&a0->unk4, 0);
    if (var2 == var) {
        do {
            int temp1 = ov76_021E7334[a0->unk2C.unk3].unk4;
            u8 temp2 = ov76_021E7334[a0->unk2C.unk3].unk2;
            u8 temp3 = ov76_021E7334[a0->unk2C.unk3].unk3;
            ReadMsgDataIntoString(a0->unk0, temp1, a0->unk14);
            AddTextPrinterParameterized2(&a0->unk4, 0, a0->unk14, temp2, temp3, 0xff, 0x00010200, 0);
            a0->unk2C.unk3 += 1;
            if (a0->unk2C.unk3 >= 0xfb) {
                break;
            }
            var4 = ov76_021E7334[a0->unk2C.unk3].unk0;
        } while (var4 == var);
    }
    CopyWindowToVram(&a0->unk4);
}

static void ov76_021E6B2C(Ov76_Work *a0) {
    NarcStruct *temp = &a0->unk260;
    for (u8 i = 0; i < 6; i++) {
        struct _2DGfxResObj *temp2 = a0->unk164[i].unk0;
        struct _2DGfxResObj *temp3 = a0->unk164[i].unk4;
        NNSG2dImageProxy *var1 = sub_0200AF00(temp2);
        NNSG2dImagePaletteProxy *var2 = sub_0200B0F8(temp3, var1);

        temp->unk8[i].unk18 = var1;
        temp->unk8[i].unk14 = var2;
        temp->unk8[i].unkC = NNS_G2dGetImageLocation(var1, 1);
        temp->unk8[i].unk10 = NNS_G2dGetImagePaletteLocation(var2, 1);
    }
}

static void ov76_021E6B8C(NarcStruct *a0, int a1) {
    int temp;
    int temp3;
    BOOL isCompressed = FALSE;
    int temp2 = 0;

    NNSG2dCharacterData *ppCharData;
    NNSG2dPaletteData *ppPlttData;
    void *data;
    void *data2;

    if (a1 == 5) {
        isCompressed = TRUE;
        if (a0->unk204 == 1) {
            temp = 7;
        } else {
            temp = 5;
        }
    } else {
        if (a1 == 7) {
            temp2 = 1;
            if (a0->unk204 == 1) {
                temp3 = 5;
            } else {
                temp3 = 7;
            }
        }
    }

    if (isCompressed != 0) {
        data = GfGfxLoader_GetCharDataFromOpenNarc(a0->unk0, ov76_021E7094[temp].unk4, 1, &ppCharData, 0x49);
        data2 = GfGfxLoader_GetPlttDataFromOpenNarc(a0->unk0, ov76_021E7094[temp].unk0, &ppPlttData, 0x49);
    } else {
        if (temp2 != 0) {
            data = GfGfxLoader_GetCharDataFromOpenNarc(a0->unk0, ov76_021E7094[temp3].unk4, 1, &ppCharData, 0x49);
            data2 = GfGfxLoader_GetPlttDataFromOpenNarc(a0->unk0, ov76_021E7094[temp3].unk0, &ppPlttData, 0x49);
        } else {
            data = GfGfxLoader_GetCharDataFromOpenNarc(a0->unk0, ov76_021E7094[a1].unk4, 1, &ppCharData, 0x49); 
            data2 = GfGfxLoader_GetPlttDataFromOpenNarc(a0->unk0, ov76_021E7094[a1].unk0, &ppPlttData, 0x49);
        }
    }

    DC_FlushRange(ppCharData->pRawData, ppCharData->szByte);
    int idx = a0->unk4; 
    GX_LoadOBJ(ppCharData->pRawData, a0->unk8[idx].unkC, ppCharData->szByte);
    DC_FlushRange(ppPlttData->pRawData, ppPlttData->szByte);
    idx = a0->unk4;
    GX_LoadOBJPltt(ppPlttData->pRawData, a0->unk8[idx].unk10, 0x20);

    a0->unk8[a0->unk4].unk34 = GfGfxLoader_GetCellBankFromOpenNarc(a0->unk0, ov76_021E7094[a1].unk8, 1, &a0->unk8[a0->unk4].unk24, 0x49);
    a0->unk8[a0->unk4].unk38 = GfGfxLoader_GetAnimBankFromOpenNarc(a0->unk0, ov76_021E7094[a1].unkC, 1, &a0->unk8[a0->unk4].unk28, 0x49);
    FreeToHeap(data);
    FreeToHeap(data2);
    a0->unk4++;
}

void ov76_021E6CF4(Ov76_Work *a0, const UnkOv76_021E6CF4 *a1) {
    SpriteResourcesHeader spriteRsrcHeader;
    struct SpriteTemplate spriteTemplate;

    ov76_021E64B0(a1->unk2, a0, 3, 1, &spriteTemplate, &spriteRsrcHeader);
    UnkOv76_021E683C *temp2 = &a0->unk260.unk140;
    int idx = temp2->unkC0;
    UnkOv76_021E683C_sub *temp3 = &temp2->unk0[idx];
    temp3->unk0 = 1;
    temp3->unk2 = a1->unk0;
    spriteTemplate.position.x = a1->unk4 * FX32_ONE;
    spriteTemplate.position.y = (a1->unk6 + 256) * FX32_ONE;
    spriteTemplate.priority = 1;

    struct Sprite *sprite = CreateSprite(&spriteTemplate);
    temp3->unk8 = sprite;
    GF_ASSERT(sprite != NULL);

    Set2dSpriteAnimActiveFlag(temp3->unk8, 0);
    Set2dSpriteVisibleFlag(temp3->unk8, 0);
    Set2dSpriteAnimSeqNo(temp3->unk8, a1->unk3);
    temp3->unk4 = a1->unk8;
    temp2->unkC0 += 1;
}

static void ov76_021E6D80(Ov76_Work *a0) {
    NarcStruct *temp = &a0->unk260;
    u8 temp2 = temp->unk6;

    if (temp2 >= 16) {
        return;
    }

    const UnkOv76_021E6D80 *temp3 = &ov76_021E7B0C[temp2];

    GF_ASSERT(temp3->unk0 <= 6);
    for (u8 i = 0; i < temp3->unk0; i++) {
        ov76_021E6B8C(temp, temp3->unk2[i]);
    }
    int temp4 = -1;
    GF_ASSERT(temp3->unk1 <= 16);
    for (u8 i = 0; i < temp3->unk1; i++) {
        ov76_021E6CF4(a0, &temp3->unk8[i]);
        if (temp4 > temp3->unk8[i].unk8) {
            temp4 = temp3->unk8[i].unk8;
        }
    }
    GF_ASSERT(temp4 > a0->unk8);
}

static void ov76_021E6E20(Ov76_Work *a0) {
    u8 i;
    NarcStruct *temp = &a0->unk260;
    UnkOv76_021E683C *temp2 = &temp->unk140;

    for (i = 0; i < 16; i++) {
        if (temp2->unk0[i].unk0 != 0) {
            sub_02024758(temp2->unk0[i].unk8);
            temp2->unk0[i].unk0 = 0;
            temp2->unk0[i].unk2 = 0;
        }
    }

    temp2->unkC0 = 0;
    for (i = 0; i < temp->unk4; i++) {
        FreeToHeap(temp->unk8[i].unk34);
        FreeToHeap(temp->unk8[i].unk38);
        temp->unk8[i].unk24 = NULL;
        temp->unk8[i].unk28 = NULL;
    }
    temp->unk4 = 0;
}

static const WINDOWTEMPLATE ov76_021E6E98 = {
    .bgId      = 0x05,
    .left      = 0x03,
    .top       = 0x00,
    .width     = 0x18,
    .height    = 0x18,
    .palette   = 0x0F,
    .baseBlock = 0x0001,
};

static const UnkOv021E607C ov76_021E6EA0 = { 0x28, 0, 0, 0x49 };

static const struct GFBgModeSet ov76_021E6EB0 = {
    .dispMode    = 1,
    .bgModeMain  = 0,
    .bgModeSub   = 0,
    ._2d3dSwitch = 0,
};

static const int ov76_021E6EC0[5] = { 0x037A, 0x06F4, 0x0A37, 0x0BD6, 0x10C7 };

static const int ov76_021E6ED4[5] = { 0x037A, 0x06F4, 0x0A37, 0x0BD6, 0x10C7 };

static const SomeStruct ov76_021E6F00 = {
    { 0x08, 0x12, 0x0A, 0x10, 0x0E, 0x0C },
};

static const SomeStruct ov76_021E6EE8 = {
    { 0x07, 0x11, 0x09, 0x0F, 0x0D, 0x0B },
};

static const BGTEMPLATE ov76_021E6F50 = {
    .x          = 0,
    .y          = 0,
    .bufferSize = 0x0800,
    .baseTile   = 0,
    .size       = 1,
    .colorMode  = 0,
    .screenBase = 0x1B,
    .charBase   = 0,
    .bgExtPltt  = 0,
    .priority   = 1,
    .areaOver   = 0,
    .dummy      = 0,
    .mosaic     = 0,
};

static const BGTEMPLATE ov76_021E6F6C = {
    .x          = 0,
    .y          = 0,
    .bufferSize = 0x0800,
    .baseTile   = 0,
    .size       = 1,
    .colorMode  = 0,
    .screenBase = 0x1D,
    .charBase   = 2,
    .bgExtPltt  = 0,
    .priority   = 2,
    .areaOver   = 0,
    .dummy      = 0,
    .mosaic     = 0,
};

static const BGTEMPLATE ov76_021E6F88 = {
    .x = 0,
    .y = 0,
    .bufferSize = 0x0800,
    .baseTile = 0,
    .size = 1,
    .colorMode = 0,
    .screenBase = 0x1C,
    .charBase = 0,
    .bgExtPltt = 0,
    .priority = 1,
    .areaOver = 0,
    .dummy = 0,
    .mosaic = 0,
};

static const BGTEMPLATE ov76_021E6FA4 = {
    .x          = 0,
    .y          = 0,
    .bufferSize = 0x0800,
    .baseTile   = 0,
    .size       = 1,
    .colorMode  = 0,
    .screenBase = 0x1B,
    .charBase   = 0,
    .bgExtPltt  = 0,
    .priority   = 3,
    .areaOver   = 0,
    .dummy      = 0,
    .mosaic     = 0,
};

static const BGTEMPLATE ov76_021E6F18 = {
    .x          = 0,
    .y          = 0,
    .bufferSize = 0x0800,
    .baseTile   = 0,
    .size       = 1,
    .colorMode  = 0,
    .screenBase = 0x1D,
    .charBase   = 0,
    .bgExtPltt  = 0,
    .priority   = 2,
    .areaOver   = 0,
    .dummy      = 0,
    .mosaic     = 0,
};

static const BGTEMPLATE ov76_021E6F34 = {
    .x = 0,
    .y = 0,
    .bufferSize = 0x0800,
    .baseTile = 0,
    .size = 1,
    .colorMode = 0,
    .screenBase = 0x1C,
    .charBase = 0,
    .bgExtPltt = 0,
    .priority = 3,
    .areaOver = 0,
    .dummy = 0,
    .mosaic = 0,
};

static const GF_GXBanksConfig ov76_021E6FC0 = {
    .bg = 2,
    .bgextpltt = 0,
    .subbg = 4,
    .subbgextpltt = 0,
    .obj = 1,
    .objextpltt = 0,
    .subobj = 0x0100,
    .subobjextpltt = 0,
    .tex = 0,
    .texpltt = 0,
};

static const u16 ov76_021E6FE8[43][2] = {
    { 0x0000, 0x0069 },
    { 0x006E, 0x0069 },
    { 0x00DC, 0x0069 },
    { 0x014A, 0x0069 },
    { 0x01B8, 0x0069 },
    { 0x0226, 0x0069 },
    { 0x0294, 0x0073 },
    { 0x030B, 0x006D },
    { 0x037E, 0x0073 },
    { 0x03F4, 0x006D },
    { 0x0465, 0x0066 },
    { 0x04D0, 0x0066 },
    { 0x053B, 0x006E },
    { 0x05AE, 0x0069 },
    { 0x061D, 0x0069 },
    { 0x068C, 0x0064 },
    { 0x06FB, 0x0069 },
    { 0x076A, 0x0069 },
    { 0x07D9, 0x0069 },
    { 0x0848, 0x0078 },
    { 0x08C5, 0x0078 },
    { 0x0942, 0x0078 },
    { 0x09BF, 0x006E },
    { 0x0A3C, 0x007D },
    { 0x0ABE, 0x006E },
    { 0x0B31, 0x00A0 },
    { 0x0BDB, 0x0064 },
    { 0x0C44, 0x0064 },
    { 0x0CAD, 0x007D },
    { 0x0D2F, 0x0064 },
    { 0x0D98, 0x0073 },
    { 0x0E0E, 0x0073 },
    { 0x0E84, 0x0073 },
    { 0x0EFA, 0x0073 },
    { 0x0F70, 0x0073 },
    { 0x0FE6, 0x0073 },
    { 0x105C, 0x0069 },
    { 0x10CC, 0x006E },
    { 0x113F, 0x006E },
    { 0x11B2, 0x007F },
    { 0x1234, 0x006B },
    { 0x12A2, 0x006B },
    { 0x1310, 0x006B },
};

static const UnkOv76_021E6B8C ov76_021E7094[42] = {
    { 0x96, 0x17, 0x18, 0x19 },
    { 0x97, 0x1A, 0x1B, 0x1C },
    { 0x98, 0x1D, 0x1E, 0x1F },
    { 0x99, 0x20, 0x21, 0x22 },
    { 0x9A, 0x23, 0x24, 0x25 },
    { 0x9B, 0x26, 0x27, 0x28 },
    { 0x9C, 0x29, 0x2A, 0x2B },
    { 0x9D, 0x2C, 0x2D, 0x2E },
    { 0x9E, 0x2F, 0x30, 0x31 },
    { 0x9F, 0x32, 0x33, 0x34 },
    { 0xA0, 0x35, 0x36, 0x37 },
    { 0xA1, 0x38, 0x39, 0x3A },
    { 0xA2, 0x3B, 0x3C, 0x3D },
    { 0xA3, 0x3E, 0x3F, 0x40 },
    { 0xA4, 0x41, 0x42, 0x43 },
    { 0xA5, 0x44, 0x45, 0x46 },
    { 0xA6, 0x47, 0x48, 0x49 },
    { 0xA7, 0x4A, 0x4B, 0x4C },
    { 0xA8, 0x4D, 0x4E, 0x4F },
    { 0xA9, 0x50, 0x51, 0x52 },
    { 0xAA, 0x53, 0x54, 0x55 },
    { 0xAB, 0x56, 0x57, 0x58 },
    { 0xAC, 0x59, 0x5A, 0x5B },
    { 0xAD, 0x5C, 0x5D, 0x5E },
    { 0xAE, 0x5F, 0x60, 0x61 },
    { 0xAF, 0x62, 0x63, 0x64 },
    { 0xB0, 0x65, 0x66, 0x67 },
    { 0xB1, 0x68, 0x69, 0x6A },
    { 0xB2, 0x6B, 0x6C, 0x6D },
    { 0xB3, 0x6E, 0x6F, 0x70 },
    { 0xB4, 0x71, 0x72, 0x73 },
    { 0xB5, 0x74, 0x75, 0x76 },
    { 0xB6, 0x77, 0x78, 0x79 },
    { 0xB7, 0x7A, 0x7B, 0x7C },
    { 0xB8, 0x7D, 0x7E, 0x7F },
    { 0xB9, 0x80, 0x81, 0x82 },
    { 0xBA, 0x83, 0x84, 0x85 },
    { 0xBB, 0x86, 0x87, 0x88 },
    { 0xBC, 0x89, 0x8A, 0x8B },
    { 0xBD, 0x8C, 0x8D, 0x8E },
    { 0xBE, 0x8F, 0x90, 0x91 },
    { 0xBF, 0x92, 0x93, 0x94 },
};

static const UnkOv76_21E6A94 ov76_021E7334[251] = {
    { 0x0000, 0x00, 0x46, 0x00 },
    { 0x0001, 0x14, 0x50, 0x03 },
    { 0x0001, 0x28, 0x60, 0x04 },
    { 0x0002, 0x14, 0x14, 0x05 },
    { 0x0002, 0x28, 0x24, 0x06 },
    { 0x0002, 0x14, 0x3C, 0x07 },
    { 0x0002, 0x28, 0x4C, 0x08 },
    { 0x0002, 0x14, 0x64, 0x09 },
    { 0x0002, 0x28, 0x74, 0x0A },
    { 0x0002, 0x14, 0x8C, 0x0B },
    { 0x0002, 0x28, 0x9C, 0x0C },
    { 0x0003, 0x14, 0x28, 0x0D },
    { 0x0003, 0x28, 0x38, 0x0E },
    { 0x0003, 0x28, 0x48, 0x0F },
    { 0x0003, 0x28, 0x58, 0x10 },
    { 0x0003, 0x28, 0x68, 0x11 },
    { 0x0003, 0x28, 0x78, 0x12 },
    { 0x0003, 0x28, 0x88, 0x13 },
    { 0x0004, 0x14, 0x20, 0x14 },
    { 0x0004, 0x14, 0x30, 0x15 },
    { 0x0004, 0x14, 0x40, 0x16 },
    { 0x0004, 0x28, 0x50, 0x17 },
    { 0x0004, 0x28, 0x60, 0x18 },
    { 0x0004, 0x28, 0x70, 0x19 },
    { 0x0004, 0x28, 0x80, 0x1A },
    { 0x0004, 0x28, 0x90, 0x1B },
    { 0x0005, 0x28, 0x20, 0x1C },
    { 0x0005, 0x28, 0x30, 0x1D },
    { 0x0005, 0x28, 0x40, 0x1E },
    { 0x0005, 0x28, 0x50, 0x1F },
    { 0x0005, 0x28, 0x60, 0x20 },
    { 0x0005, 0x28, 0x70, 0x21 },
    { 0x0005, 0x28, 0x80, 0x22 },
    { 0x0005, 0x28, 0x90, 0x23 },
    { 0x0006, 0x14, 0x18, 0x24 },
    { 0x0006, 0x28, 0x28, 0x25 },
    { 0x0006, 0x28, 0x38, 0x26 },
    { 0x0006, 0x28, 0x48, 0x27 },
    { 0x0006, 0x28, 0x58, 0x28 },
    { 0x0006, 0x28, 0x68, 0x29 },
    { 0x0006, 0x28, 0x78, 0x2A },
    { 0x0006, 0x28, 0x88, 0x2B },
    { 0x0006, 0x28, 0x98, 0x2C },
    { 0x0007, 0x14, 0x08, 0x2D },
    { 0x0007, 0x28, 0x18, 0x2E },
    { 0x0007, 0x28, 0x28, 0x2F },
    { 0x0007, 0x28, 0x38, 0x30 },
    { 0x0007, 0x28, 0x48, 0x31 },
    { 0x0007, 0x14, 0x60, 0x32 },
    { 0x0007, 0x28, 0x70, 0x33 },
    { 0x0007, 0x28, 0x80, 0x34 },
    { 0x0007, 0x14, 0x98, 0x35 },
    { 0x0007, 0x28, 0xA8, 0x36 },
    { 0x0008, 0x14, 0x30, 0x37 },
    { 0x0008, 0x28, 0x40, 0x38 },
    { 0x0008, 0x28, 0x50, 0x39 },
    { 0x0008, 0x28, 0x60, 0x3A },
    { 0x0008, 0x28, 0x70, 0x3B },
    { 0x0008, 0x28, 0x80, 0x3C },
    { 0x0009, 0x28, 0x28, 0x3D },
    { 0x0009, 0x28, 0x38, 0x3E },
    { 0x0009, 0x28, 0x48, 0x3F },
    { 0x0009, 0x28, 0x58, 0x40 },
    { 0x0009, 0x28, 0x68, 0x41 },
    { 0x0009, 0x28, 0x78, 0x42 },
    { 0x0009, 0x28, 0x88, 0x43 },
    { 0x000A, 0x14, 0x40, 0x44 },
    { 0x000A, 0x28, 0x50, 0x45 },
    { 0x000A, 0x28, 0x60, 0x46 },
    { 0x000A, 0x28, 0x70, 0x47 },
    { 0x000B, 0x14, 0x40, 0x48 },
    { 0x000B, 0x28, 0x50, 0x49 },
    { 0x000B, 0x28, 0x60, 0x4A },
    { 0x000B, 0x28, 0x70, 0x4B },
    { 0x000C, 0x14, 0x48, 0x4C },
    { 0x000C, 0x28, 0x58, 0x4D },
    { 0x000C, 0x28, 0x68, 0x4E },
    { 0x000D, 0x14, 0x30, 0x4F },
    { 0x000D, 0x28, 0x40, 0x50 },
    { 0x000D, 0x28, 0x50, 0x51 },
    { 0x000D, 0x28, 0x60, 0x52 },
    { 0x000D, 0x28, 0x70, 0x53 },
    { 0x000D, 0x28, 0x80, 0x54 },
    { 0x000E, 0x14, 0x38, 0x55 },
    { 0x000E, 0x28, 0x48, 0x56 },
    { 0x000E, 0x28, 0x58, 0x57 },
    { 0x000E, 0x28, 0x68, 0x58 },
    { 0x000E, 0x28, 0x78, 0x59 },
    { 0x000F, 0x14, 0x28, 0x5A },
    { 0x000F, 0x28, 0x38, 0x5B },
    { 0x000F, 0x28, 0x48, 0x5C },
    { 0x000F, 0x28, 0x58, 0x5D },
    { 0x000F, 0x28, 0x68, 0x5E },
    { 0x000F, 0x28, 0x78, 0x5F },
    { 0x000F, 0x28, 0x88, 0x60 },
    { 0x0010, 0x28, 0x28, 0x61 },
    { 0x0010, 0x28, 0x38, 0x62 },
    { 0x0010, 0x28, 0x48, 0x63 },
    { 0x0010, 0x28, 0x58, 0x64 },
    { 0x0010, 0x28, 0x68, 0x65 },
    { 0x0010, 0x28, 0x78, 0x66 },
    { 0x0010, 0x28, 0x88, 0x67 },
    { 0x0011, 0x28, 0x28, 0x68 },
    { 0x0011, 0x28, 0x38, 0x69 },
    { 0x0011, 0x28, 0x48, 0x6A },
    { 0x0011, 0x28, 0x58, 0x6B },
    { 0x0011, 0x28, 0x68, 0x6C },
    { 0x0011, 0x28, 0x78, 0x6D },
    { 0x0011, 0x28, 0x88, 0x6E },
    { 0x0012, 0x14, 0x50, 0x6F },
    { 0x0012, 0x28, 0x60, 0x70 },
    { 0x0013, 0x14, 0x48, 0x71 },
    { 0x0013, 0x28, 0x58, 0x72 },
    { 0x0013, 0x28, 0x68, 0x73 },
    { 0x0014, 0x14, 0x24, 0x74 },
    { 0x0014, 0x28, 0x34, 0x75 },
    { 0x0014, 0x28, 0x44, 0x76 },
    { 0x0014, 0x14, 0x5C, 0x77 },
    { 0x0014, 0x28, 0x6C, 0x78 },
    { 0x0014, 0x28, 0x7C, 0x79 },
    { 0x0014, 0x28, 0x8C, 0x7A },
    { 0x0015, 0x14, 0x40, 0x7B },
    { 0x0015, 0x28, 0x50, 0x7C },
    { 0x0015, 0x28, 0x60, 0x7D },
    { 0x0015, 0x28, 0x70, 0x7E },
    { 0x0016, 0x14, 0x40, 0x7F },
    { 0x0016, 0x28, 0x50, 0x80 },
    { 0x0016, 0x28, 0x60, 0x81 },
    { 0x0016, 0x28, 0x70, 0x82 },
    { 0x0017, 0x14, 0x30, 0x83 },
    { 0x0017, 0x28, 0x40, 0x84 },
    { 0x0017, 0x28, 0x50, 0x85 },
    { 0x0017, 0x28, 0x60, 0x86 },
    { 0x0017, 0x28, 0x70, 0x87 },
    { 0x0017, 0x28, 0x80, 0x88 },
    { 0x0018, 0x28, 0x30, 0x89 },
    { 0x0018, 0x28, 0x40, 0x8A },
    { 0x0018, 0x28, 0x50, 0x8B },
    { 0x0018, 0x28, 0x60, 0x8C },
    { 0x0018, 0x28, 0x70, 0x8D },
    { 0x0018, 0x28, 0x80, 0x8E },
    { 0x0019, 0x14, 0x40, 0x8F },
    { 0x0019, 0x28, 0x50, 0x90 },
    { 0x0019, 0x28, 0x60, 0x91 },
    { 0x0019, 0x28, 0x70, 0x92 },
    { 0x001A, 0x14, 0x10, 0x93 },
    { 0x001A, 0x28, 0x20, 0x94 },
    { 0x001A, 0x28, 0x30, 0x95 },
    { 0x001A, 0x28, 0x40, 0x96 },
    { 0x001A, 0x28, 0x50, 0x97 },
    { 0x001A, 0x28, 0x60, 0x98 },
    { 0x001A, 0x28, 0x70, 0x99 },
    { 0x001A, 0x28, 0x80, 0x9A },
    { 0x001A, 0x28, 0x90, 0x9B },
    { 0x001A, 0x28, 0xA0, 0x9C },
    { 0x001B, 0x14, 0x3C, 0x9D },
    { 0x001B, 0x14, 0x54, 0x9E },
    { 0x001B, 0x28, 0x64, 0x9F },
    { 0x001B, 0x28, 0x74, 0xA0 },
    { 0x001C, 0x14, 0x50, 0xA1 },
    { 0x001C, 0x28, 0x60, 0xA2 },
    { 0x001D, 0x14, 0x18, 0xA3 },
    { 0x001D, 0x28, 0x28, 0xA4 },
    { 0x001D, 0x28, 0x38, 0xA5 },
    { 0x001D, 0x28, 0x48, 0xA6 },
    { 0x001D, 0x28, 0x58, 0xA7 },
    { 0x001D, 0x28, 0x68, 0xA8 },
    { 0x001D, 0x28, 0x78, 0xA9 },
    { 0x001D, 0x28, 0x88, 0xAA },
    { 0x001D, 0x28, 0x98, 0xAB },
    { 0x001E, 0x14, 0x14, 0xAC },
    { 0x001E, 0x28, 0x24, 0xAD },
    { 0x001E, 0x14, 0x3C, 0xAE },
    { 0x001E, 0x28, 0x4C, 0xAF },
    { 0x001E, 0x14, 0x64, 0xB0 },
    { 0x001E, 0x28, 0x74, 0xB1 },
    { 0x001E, 0x14, 0x8C, 0xB2 },
    { 0x001E, 0x28, 0x9C, 0xB3 },
    { 0x001F, 0x14, 0x0C, 0xB4 },
    { 0x001F, 0x28, 0x1C, 0xB5 },
    { 0x001F, 0x28, 0x2C, 0xB6 },
    { 0x001F, 0x28, 0x3C, 0xB7 },
    { 0x001F, 0x28, 0x4C, 0xB8 },
    { 0x001F, 0x28, 0x5C, 0xB9 },
    { 0x001F, 0x28, 0x6C, 0xBA },
    { 0x001F, 0x28, 0x7C, 0xBB },
    { 0x001F, 0x14, 0x94, 0xBC },
    { 0x001F, 0x28, 0xA4, 0xBD },
    { 0x0020, 0x14, 0x10, 0xBE },
    { 0x0020, 0x28, 0x20, 0xBF },
    { 0x0020, 0x28, 0x30, 0xC0 },
    { 0x0020, 0x28, 0x40, 0xC1 },
    { 0x0020, 0x28, 0x50, 0xC2 },
    { 0x0020, 0x28, 0x60, 0xC3 },
    { 0x0020, 0x28, 0x70, 0xC4 },
    { 0x0020, 0x28, 0x80, 0xC5 },
    { 0x0020, 0x28, 0x90, 0xC6 },
    { 0x0020, 0x28, 0xA0, 0xC7 },
    { 0x0021, 0x28, 0x10, 0xC8 },
    { 0x0021, 0x28, 0x20, 0xC9 },
    { 0x0021, 0x28, 0x30, 0xCA },
    { 0x0021, 0x28, 0x40, 0xCB },
    { 0x0021, 0x28, 0x50, 0xCC },
    { 0x0021, 0x28, 0x60, 0xCD },
    { 0x0021, 0x28, 0x70, 0xCE },
    { 0x0021, 0x28, 0x80, 0xCF },
    { 0x0021, 0x28, 0x90, 0xD0 },
    { 0x0021, 0x28, 0xA0, 0xD1 },
    { 0x0022, 0x28, 0x10, 0xD2 },
    { 0x0022, 0x28, 0x20, 0xD3 },
    { 0x0022, 0x28, 0x30, 0xD4 },
    { 0x0022, 0x28, 0x40, 0xD5 },
    { 0x0022, 0x28, 0x50, 0xD6 },
    { 0x0022, 0x28, 0x60, 0xD7 },
    { 0x0022, 0x28, 0x70, 0xD8 },
    { 0x0022, 0x28, 0x80, 0xD9 },
    { 0x0022, 0x28, 0x90, 0xDA },
    { 0x0022, 0x28, 0xA0, 0xDB },
    { 0x0023, 0x28, 0x28, 0xDC },
    { 0x0023, 0x28, 0x38, 0xDD },
    { 0x0023, 0x28, 0x48, 0xDE },
    { 0x0023, 0x28, 0x58, 0xDF },
    { 0x0023, 0x28, 0x68, 0xE0 },
    { 0x0023, 0x28, 0x78, 0xE1 },
    { 0x0023, 0x28, 0x88, 0xE2 },
    { 0x0024, 0x14, 0x38, 0xE3 },
    { 0x0024, 0x28, 0x48, 0xE4 },
    { 0x0024, 0x28, 0x58, 0xE5 },
    { 0x0024, 0x28, 0x68, 0xE6 },
    { 0x0024, 0x28, 0x78, 0xE7 },
    { 0x0025, 0x14, 0x38, 0xE8 },
    { 0x0025, 0x28, 0x48, 0xE9 },
    { 0x0025, 0x28, 0x58, 0xEA },
    { 0x0025, 0x28, 0x68, 0xEB },
    { 0x0025, 0x28, 0x78, 0xEC },
    { 0x0026, 0x14, 0x38, 0xED },
    { 0x0026, 0x28, 0x48, 0xEE },
    { 0x0026, 0x28, 0x58, 0xEF },
    { 0x0026, 0x28, 0x68, 0xF0 },
    { 0x0026, 0x28, 0x78, 0xF1 },
    { 0x0027, 0x14, 0x38, 0xF2 },
    { 0x0027, 0x28, 0x48, 0xF3 },
    { 0x0027, 0x28, 0x58, 0xF4 },
    { 0x0027, 0x28, 0x68, 0xF5 },
    { 0x0027, 0x28, 0x78, 0xF6 },
    { 0x0028, 0x14, 0x50, 0xF7 },
    { 0x0028, 0x28, 0x60, 0xF8 },
    { 0x0029, 0x14, 0x50, 0xF9 },
    { 0x0029, 0x28, 0x60, 0xFA },
    { 0x002A, 0x14, 0x50, 0xFB },
    { 0x002A, 0x28, 0x60, 0xFC },
};

static const UnkOv76_021E6D80 ov76_021E7B0C[16] = {
    {
        0x04, 0x04,
        { 0x00, 0x01, 0x02, 0x03, 0xFF, 0xFF },
        {
            { 0x0000, 0x00, 0x02, 0x0080, 0x0060, 0x0032 },
            { 0x0001, 0x01, 0x02, 0x0080, 0x0060, 0x0032 },
            { 0x0002, 0x02, 0x02, 0x0080, 0x0060, 0x0032 },
            { 0x0003, 0x03, 0x02, 0x0080, 0x0060, 0x0032 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
        },
    },
    {
        0x02, 0x02,
        { 0x03, 0x04, 0xFF, 0xFF, 0xFF, 0xFF },
        {
            { 0x0003, 0x00, 0x03, 0x0080, 0x0060, 0x014D },
            { 0x0004, 0x01, 0x02, 0x0080, 0x0060, 0x014D },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
        },
    },
    {
        0x04, 0x04,
        { 0x05, 0x06, 0x07, 0x08, 0xFF, 0xFF },
        {
            { 0x0005, 0x00, 0x02, 0x0080, 0x0060, 0x02BC },
            { 0x0006, 0x01, 0x02, 0x0080, 0x0060, 0x02BC },
            { 0x0007, 0x02, 0x02, 0x0080, 0x0060, 0x02BC },
            { 0x0008, 0x03, 0x02, 0x0080, 0x0060, 0x02BC },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
        },
    },
    {
        0x06, 0x06,
        { 0x00, 0x01, 0x02, 0x03, 0x05, 0x06 },
        {
            { 0x0000, 0x00, 0x03, 0x0080, 0x0060, 0x037A },
            { 0x0001, 0x01, 0x03, 0x0080, 0x0060, 0x037A },
            { 0x0002, 0x02, 0x03, 0x0080, 0x0060, 0x037A },
            { 0x0003, 0x03, 0x04, 0x0080, 0x0060, 0x037A },
            { 0x0005, 0x04, 0x03, 0x0080, 0x0060, 0x037A },
            { 0x0006, 0x05, 0x03, 0x0080, 0x0060, 0x037A },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
        },
    },
    {
        0x03, 0x03,
        { 0x05, 0x07, 0x09, 0xFF, 0xFF, 0xFF },
        {
            { 0x0005, 0x00, 0x04, 0x0080, 0x0060, 0x0384 },
            { 0x0007, 0x01, 0x03, 0x0080, 0x0060, 0x0384 },
            { 0x0009, 0x02, 0x02, 0x0080, 0x0060, 0x0384 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
        },
    },
    {
        0x05, 0x0E,
        { 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x00 },
        {
            { 0x000A, 0x00, 0x02, 0x0080, 0x0060, 0x04CE },
            { 0x000B, 0x01, 0x02, 0x0080, 0x0060, 0x04CE },
            { 0x000C, 0x02, 0x04, 0x005A, 0x000A, 0x04EC },
            { 0x000D, 0x02, 0x03, 0x003C, 0x000F, 0x04EC },
            { 0x000E, 0x02, 0x04, 0x0050, 0x0014, 0x04EC },
            { 0x000F, 0x02, 0x04, 0x004B, 0x0019, 0x04EC },
            { 0x0010, 0x02, 0x04, 0x005F, 0x001E, 0x0500 },
            { 0x0011, 0x02, 0x02, 0x0046, 0x0023, 0x04EC },
            { 0x0012, 0x02, 0x03, 0x0064, 0x0028, 0x0500 },
            { 0x0013, 0x02, 0x03, 0x0041, 0x002D, 0x0500 },
            { 0x0014, 0x02, 0x05, 0x005A, 0x0032, 0x0546 },
            { 0x0015, 0x02, 0x04, 0x0055, 0x0037, 0x0500 },
            { 0x0016, 0x03, 0x02, 0x0080, 0x0060, 0x04D8 },
            { 0x0017, 0x04, 0x02, 0x0080, 0x0060, 0x04D8 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
        },
    },
    {
        0x04, 0x04,
        { 0x03, 0x10, 0x04, 0x0F, 0xFF, 0xFF },
        {
            { 0x0003, 0x00, 0x05, 0x0080, 0x0060, 0x060E },
            { 0x0019, 0x01, 0x02, 0x0080, 0x0060, 0x060E },
            { 0x0004, 0x02, 0x03, 0x0080, 0x0060, 0x060E },
            { 0x0018, 0x03, 0x02, 0x0080, 0x0060, 0x060E },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
        },
    },
    {
        0x04, 0x04,
        { 0x0F, 0x11, 0x12, 0x13, 0xFF, 0xFF },
        {
            { 0x0018, 0x00, 0x03, 0x0080, 0x0060, 0x0708 },
            { 0x001A, 0x01, 0x02, 0x0080, 0x0060, 0x0708 },
            { 0x001B, 0x02, 0x02, 0x0080, 0x0060, 0x0708 },
            { 0x001C, 0x03, 0x02, 0x0080, 0x0060, 0x0708 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
        },
    },
    {
        0x04, 0x0D,
        { 0x18, 0x19, 0x1A, 0x1B, 0xFF, 0xFF },
        {
            { 0x002A, 0x00, 0x02, 0x0080, 0x0060, 0x0898 },
            { 0x002B, 0x01, 0x02, 0x0080, 0x0060, 0x0898 },
            { 0x002C, 0x02, 0x02, 0x0074, 0x0050, 0x0898 },
            { 0x002D, 0x02, 0x02, 0x008E, 0x0055, 0x089B },
            { 0x002E, 0x02, 0x01, 0x0080, 0x0060, 0x0898 },
            { 0x002F, 0x02, 0x01, 0x0080, 0x0060, 0x0898 },
            { 0x0030, 0x02, 0x01, 0x0080, 0x0060, 0x0898 },
            { 0x0031, 0x02, 0x01, 0x0080, 0x0060, 0x0898 },
            { 0x0032, 0x02, 0x01, 0x0080, 0x0060, 0x0898 },
            { 0x0033, 0x02, 0x01, 0x0080, 0x0060, 0x0898 },
            { 0x0034, 0x02, 0x01, 0x0080, 0x0060, 0x0898 },
            { 0x0035, 0x02, 0x01, 0x0080, 0x0060, 0x0898 },
            { 0x0036, 0x03, 0x02, 0x0080, 0x0060, 0x0898 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
        },
    },
    {
        0x04, 0x0C,
        { 0x14, 0x15, 0x16, 0x17, 0xFF, 0xFF },
        {
            { 0x001D, 0x00, 0x02, 0x0080, 0x0060, 0x0A5A },
            { 0x001E, 0x01, 0x02, 0x0080, 0x0060, 0x0A5A },
            { 0x001F, 0x02, 0x03, 0x0078, 0x0050, 0x0A5B },
            { 0x0020, 0x02, 0x02, 0x007E, 0x005A, 0x0A5C },
            { 0x0021, 0x02, 0x03, 0x0082, 0x0048, 0x0A5D },
            { 0x0022, 0x02, 0x02, 0x006E, 0x005A, 0x0A5E },
            { 0x0023, 0x02, 0x03, 0x008C, 0x0064, 0x0A5F },
            { 0x0024, 0x02, 0x02, 0x007D, 0x006E, 0x0A60 },
            { 0x0025, 0x02, 0x03, 0x0087, 0x0048, 0x0A61 },
            { 0x0026, 0x02, 0x02, 0x0072, 0x003C, 0x0A62 },
            { 0x0027, 0x02, 0x03, 0x006E, 0x0050, 0x0A63 },
            { 0x0029, 0x03, 0x02, 0x0080, 0x0060, 0x0A5A },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
        },
    },
    {
        0x04, 0x04,
        { 0x1C, 0x1E, 0x1D, 0x21, 0xFF, 0xFF },
        {
            { 0x0037, 0x00, 0x02, 0x0080, 0x0060, 0x0BF4 },
            { 0x0039, 0x01, 0x02, 0x0080, 0x0060, 0x0BF4 },
            { 0x0038, 0x02, 0x02, 0x007E, 0x0060, 0x0BF4 },
            { 0x0040, 0x03, 0x02, 0x0080, 0x0060, 0x0BF4 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
        },
    },
    {
        0x05, 0x09,
        { 0x22, 0x23, 0x24, 0x25, 0x20, 0x00 },
        {
            { 0x0045, 0x00, 0x02, 0x0080, 0x006E, 0x0D1F },
            { 0x0046, 0x01, 0x02, 0x0080, 0x006E, 0x0D0C },
            { 0x0047, 0x02, 0x02, 0x0080, 0x006E, 0x0D32 },
            { 0x0048, 0x03, 0x02, 0x0080, 0x006E, 0x0D45 },
            { 0x003B, 0x04, 0x02, 0x0080, 0x006E, 0x0D58 },
            { 0x003C, 0x04, 0x03, 0x0080, 0x006E, 0x0D6B },
            { 0x003D, 0x04, 0x02, 0x0080, 0x006E, 0x0D7E },
            { 0x003E, 0x04, 0x03, 0x0080, 0x006E, 0x0D91 },
            { 0x003F, 0x04, 0x04, 0x0080, 0x006E, 0x0E42 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
        },
    },
    {
        0x06, 0x06,
        { 0x25, 0x24, 0x05, 0x1D, 0x23, 0x22 },
        {
            { 0x0048, 0x00, 0x03, 0x0080, 0x007D, 0x0EB0 },
            { 0x0047, 0x01, 0x03, 0x0080, 0x0064, 0x0E9C },
            { 0x0005, 0x02, 0x05, 0x0080, 0x0060, 0x0EE2 },
            { 0x0038, 0x03, 0x03, 0x0080, 0x0060, 0x0ED8 },
            { 0x0046, 0x04, 0x03, 0x0080, 0x0046, 0x0E92 },
            { 0x0045, 0x05, 0x03, 0x0080, 0x002D, 0x0EA6 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
        },
    },
    {
        0x04, 0x04,
        { 0x26, 0x27, 0x28, 0x29, 0xFF, 0xFF },
        {
            { 0x0049, 0x00, 0x02, 0x0080, 0x0060, 0x0F5F },
            { 0x004A, 0x01, 0x02, 0x0080, 0x0060, 0x0F87 },
            { 0x004B, 0x02, 0x02, 0x0080, 0x0060, 0x0FAF },
            { 0x004C, 0x03, 0x02, 0x0080, 0x0060, 0x0FD7 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
        },
    },
    {
        0x03, 0x03,
        { 0x05, 0x1D, 0x1E, 0xFF, 0xFF, 0xFF },
        {
            { 0x0005, 0x00, 0x06, 0x0080, 0x0060, 0x10CC },
            { 0x0038, 0x01, 0x04, 0x0080, 0x0060, 0x10CC },
            { 0x0039, 0x02, 0x04, 0x0080, 0x0060, 0x10CC },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
        },
    },
    {
        0x02, 0x02,
        { 0x05, 0x06, 0xFF, 0xFF, 0xFF, 0xFF },
        {
            { 0x0005, 0x00, 0x07, 0x0080, 0x0060, 0x11DA },
            { 0x0006, 0x01, 0x04, 0x0080, 0x0060, 0x11DA },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
        },
    },
};
