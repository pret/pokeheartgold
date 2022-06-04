#include "gf_gfx_loader.h"
#include "msgdata.h"
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
    u8 unk0;
    u8 unk1;
    u8 unk2;
    u8 unk3;
} UnkOv021E60F6;

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
    int unk8;
} UnkOv76_021E6CF4;

typedef struct {
    u8 unk0[0x8];
    u32 unk8;
} UnkOv76_021E6D80_sub;

typedef struct {
    u8 unk0;
    u8 unk1;
    u8 unk2[6];
    UnkOv76_021E6D80_sub unk8[16];
} UnkOv76_021E6D80;

extern const GF_GXBanksConfig ov76_021E6FC0;
extern const struct GFBgModeSet ov76_021E6EB0;
extern const BGTEMPLATE ov76_021E6F18;
extern const BGTEMPLATE ov76_021E6F34;
extern const BGTEMPLATE ov76_021E6F50;
extern const BGTEMPLATE ov76_021E6F6C;
extern const BGTEMPLATE ov76_021E6F88;
extern const BGTEMPLATE ov76_021E6FA4;
extern const SomeStruct ov76_021E6EE8;
extern const SomeStruct ov76_021E6F00;
extern const UnkOv021E607C ov76_021E6EA0;
extern const u8 _021E6E88[];
extern const u16 ov76_021E6FE8[43][2];
extern const int ov76_021E6EC0[5];
extern const u8 ov76_021E878C[8];
extern const int ov76_021E6ED4[5];
extern const WINDOWTEMPLATE ov76_021E6E98;
extern UnkOv76_21E6A94 ov76_021E7334[];
extern const UnkOv76_021E6B8C ov76_021E7094[];
extern const UnkOv76_021E6D80 ov76_021E7B0C[];

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
static void ov76_021E6D80(Ov76_Work *a0);
static void ov76_021E6E20(Ov76_Work *a0);

// TODO: Update to `static` after matching.
void ov76_021E6B8C(NarcStruct *a0, int a1);

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

    // TODO: Condense into a single struct copy
    temp2.unk0 = _021E6E88[12];
    temp2.unk1 = _021E6E88[13];
    temp2.unk2 = _021E6E88[14];
    temp2.unk3 = _021E6E88[15];
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

#ifdef NONMATCHING
// Probably initializes the dancing Pokémon sprites
static void ov76_021E62F4(Ov76_Work *a0) {
    // sp + 0x8 <- a0

    
    int temp4;
    // sp + 0x14 <- &temp4
    
    // int temp5;
    // sp + 0x18 <- &temp5

    // int temp6;
    // sp + 0x30 <- &temp6
    
    struct SpriteTemplate temp2; // THIS MIGHT NOT BE SpriteTemplate!
    // sp + 0x3c <- &temp2

    struct SpriteTemplate temp1; 
    // sp + 0xc <- &temp1
    
    u8 var2;

    // UnkOv76_021E62F4 is not the right structure...
    // It is either a single array or two single arrays back-to-back
    struct Sprite **temp3;
    
    temp3 = a0->unk1C4;
    // r4 <- temp3

    ov76_021E6440(1, a0, 1, 3, &temp1, &temp2);
    for (u8 i = 0; i < 6; i++) {
        // r6 <- i
        if (i < 3) {
            // r1 <- var2
            // var2 = i;
        
            temp4 = (1 << 16);
            temp1.position.x = temp4;
        } else {
            // r1 <- var2
            i -= 3;

            temp4 = (0xf << 16);
            temp1.position.x = temp4;
        }
    
        temp1.position.y = (i * 0x50 + 16) * FX32_ONE;
        temp1.priority = 1;
        temp3[i] = CreateSprite(&temp1);
        GF_ASSERT(temp3[i] != NULL);
        Set2dSpriteAnimActiveFlag(temp3[i], 1);
        Set2dSpriteVisibleFlag(temp3[i], 1);
        Set2dSpriteAnimSeqNo(temp3[i], 6);
        
        temp1.priority = 0;
        temp3[i + 12] = CreateSprite(&temp1); // offset by 12
        GF_ASSERT(temp3[i + 12] != NULL);
        Set2dSpriteAnimActiveFlag(temp3[i + 12], 1);
        Set2dSpriteVisibleFlag(temp3[i + 12], 0);
        Set2dSpriteAnimSeqNo(temp3[i + 12], 7);
    }

    for (u8 i = 0; i < 6; i++) {
        if (i < 3) {
            var2 = i;
            temp4 = 1 << 16;
            temp1.position.x = temp4;
        } else {
            var2 = i - 3;
            temp4 = 0xf << 16;
            temp1.position.x = temp4;
        }
        temp1.position.y = (var2 * 0x50 + 0x110) * FX32_ONE;
        temp1.priority = 1;
        var2 += 6;
        temp3[var2] = CreateSprite(&temp1);
        Set2dSpriteAnimActiveFlag(temp3[var2], 1);
        Set2dSpriteVisibleFlag(temp3[var2], 1);
        Set2dSpriteAnimSeqNo(temp3[var2], 6);

        temp1.priority = 0;
        temp3[var2 + 12] = CreateSprite(&temp1);
        Set2dSpriteAnimActiveFlag(temp3[var2 + 12], 1);
        Set2dSpriteVisibleFlag(temp3[var2 + 12], 0);
        Set2dSpriteAnimSeqNo(temp3[var2 + 12], 7);
    }

    ov76_021E6D80(a0);
    GX_EngineAToggleLayers(16, 1);
    GX_EngineBToggleLayers(16, 1);
}
#else
asm void ov76_021E62F4(Ov76_Work *a0) {
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x60
	mov r1, #0x71
	lsl r1, r1, #2
	str r0, [sp, #8]
	add r4, r0, r1
	add r0, sp, #0xc
	str r0, [sp, #0x00]
	add r0, sp, #0x3c
	str r0, [sp, #4]
	mov r0, #1
	ldr r1, [sp, #8]
	add r2, r0, #0
	mov r3, #3
	bl ov76_021E6440
	mov r6, #0
_021E6316:
	cmp r6, #3
	bhs _021E6324
	mov r0, #1
	lsl r0, r0, #0x10
	add r1, r6, #0
	str r0, [sp, #0x14]
	b _021E6330
_021E6324:
	sub r0, r6, #3
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	mov r0, #0xf
	lsl r0, r0, #0x10
	str r0, [sp, #0x14]
_021E6330:
	mov r0, #0x50
	mul r0, r1
	add r0, #0x10
	lsl r0, r0, #0xc
	str r0, [sp, #0x18]
	mov r0, #1
	str r0, [sp, #0x30]
	lsl r7, r6, #2
	add r0, sp, #0xc
	add r5, r4, r7
	bl CreateSprite
	str r0, [r4, r7]
	ldr r0, [r4, r7]
	cmp r0, #0
	bne _021E6354
	bl GF_AssertFail
_021E6354:
	ldr r0, [r5, #0x00]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	ldr r0, [r5, #0x00]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	ldr r0, [r5, #0x00]
	mov r1, #6
	bl Set2dSpriteAnimSeqNo
	mov r0, #0
	str r0, [sp, #0x30]
	add r0, sp, #0xc
	bl CreateSprite
	str r0, [r5, #0x30]
	cmp r0, #0
	bne _021E6380
	bl GF_AssertFail
_021E6380:
	ldr r0, [r5, #0x30]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	ldr r0, [r5, #0x30]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r5, #0x30]
	mov r1, #7
	bl Set2dSpriteAnimSeqNo
	add r0, r6, #1
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	cmp r6, #6
	blo _021E6316
	mov r5, #0
_021E63A4:
	cmp r5, #3
	bhs _021E63B2
	mov r0, #1
	lsl r0, r0, #0x10
	add r2, r5, #0
	str r0, [sp, #0x14]
	b _021E63BE
_021E63B2:
	sub r0, r5, #3
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	mov r0, #0xf
	lsl r0, r0, #0x10
	str r0, [sp, #0x14]
_021E63BE:
	mov r0, #0x50
	add r1, r2, #0
	mul r1, r0
	add r0, #0xc0
	add r0, r1, r0
	lsl r0, r0, #0xc
	str r0, [sp, #0x18]
	mov r0, #1
	str r0, [sp, #0x30]
	add r0, r5, #6
	lsl r0, r0, #0x18
	lsr r7, r0, #0x16
	add r0, sp, #0xc
	add r6, r4, r7
	bl CreateSprite
	str r0, [r4, r7]
	ldr r0, [r4, r7]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	ldr r0, [r4, r7]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	ldr r0, [r4, r7]
	mov r1, #6
	bl Set2dSpriteAnimSeqNo
	mov r0, #0
	str r0, [sp, #0x30]
	add r0, sp, #0xc
	bl CreateSprite
	str r0, [r6, #0x30]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	ldr r0, [r6, #0x30]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r6, #0x30]
	mov r1, #7
	bl Set2dSpriteAnimSeqNo
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #6
	blo _021E63A4
	ldr r0, [sp, #8]
	bl ov76_021E6D80
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	add sp, #0x60
	pop {r3, r4, r5, r6, r7, pc}
}
#endif

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

#ifdef NONMATCHING
void ov76_021E64B0(u8 a0, Ov76_Work *a1, u8 a2, int a3, struct SpriteTemplate *a4, SpriteResourcesHeader *a5) {
    UnkOv76_021E64B0 *ptr;
    struct SpriteTemplate *template;

    ptr = &a1->unk260.unk8[a0];
    template = a4;

    a5->charData = 0;
    a5->plttProxy = ptr->unkC; // *(r6 + 12);
    a5->imageProxy = ptr->unk10; // *(r6 + 16);
    a5->cellData = ptr->unk1C; // *(r6 + 0x1c);
    a5->cellAnim = ptr->unk20; // *(r6 + 32);
    a5->multiCellData = 0;
    a5->multiCellAnim = 0;
    a5->flag = 0;
    a5->priority = a2;

    a4->spriteList = a1->unk18;
    a4->header = a5;
    a4->position.x = a0;
    a4->position.y = a0;
    a4->position.z = a0;
    a4->scale.x = FX32_ONE;
    a4->scale.y = FX32_ONE;
    a4->scale.z = FX32_ONE;
    a4->rotation = a0;
    a4->priority = a0;
    a4->whichScreen = a3;
    a4->heapId = 0x49;
}
#else
asm void ov76_021E64B0(u8 a0, Ov76_Work *a1, u8 a2, int a3, struct SpriteTemplate *a4, SpriteResourcesHeader *a5) {
	push {r4, r5, r6, r7}
	mov r6, #0x9a
	add r4, r0, #0
	add r0, r1, #0
	lsl r6, r6, #2
	mov r7, #0x34
	mul r7, r4
	add r6, r0, r6
	ldr r1, [sp, #0x14]
	mov r4, #0
	add r6, r6, r7
	str r4, [r1, #4]
	ldr r7, [r6, #0xc]
	add r5, r2, #0
	str r7, [r1, #8]
	ldr r7, [r6, #0x10]
	ldr r2, [sp, #0x10]
	str r7, [r1]
	ldr r7, [r6, #0x1c]
	str r7, [r1, #0xc]
	ldr r6, [r6, #0x20]
	str r6, [r1, #0x10]
	str r4, [r1, #0x14]
	str r4, [r1, #0x18]
	add r6, r1, #0
	str r4, [r1, #0x1c]
	add r6, #0x20
	strb r5, [r6]
	ldr r0, [r0, #0x18]
	str r0, [r2]
	str r1, [r2, #4]
	str r4, [r2, #8]
	str r4, [r2, #0xc]
	mov r0, #1
	str r4, [r2, #0x10]
	lsl r0, r0, #0xc
	str r0, [r2, #0x14]
	str r0, [r2, #0x18]
	str r0, [r2, #0x1c]
	strh r4, [r2, #0x20]
	str r4, [r2, #0x24]
	str r3, [r2, #0x28]
	mov r0, #0x49
	str r0, [r2, #0x2c]
	pop {r4, r5, r6, r7}
	bx lr
}
#endif

// DO NOT SUBMIT until removing (SysTask *) casts!!
static void ov76_021E650C(Ov76_Work *a0) {
    Ov76_Data_021E5AA0 *ptr = &a0->unk228;
    ptr->unk18.unkC = (SysTask *) sub_0200E33C(ov76_021E69C4, &ptr->unk18, 0);
    a0->unk228.unk30.unk4 = (SysTask *) sub_0200E33C(ov76_021E68DC, &a0->unk228.unk30, 1);
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

#ifdef NONMATCHING
void ov76_021E6B8C(NarcStruct *a0, int a1) {
    // r6 <- a1
    // r4 <- a0
    // r3 <- a2

    int temp;
    // r0 <- temp
    int temp3;
    // r1 = temp3

    BOOL isCompressed = FALSE;
    // r2 <- isCompressed
    int temp2 = 0;
    // r3 <- temp2

    NNSG2dCharacterData *ppCharData;
    // sp + 0x10 <- ppCharData

    NNSG2dPaletteData *ppPlttData;
    // sp + 0xc <- ppPlttData

    void *data;
    // sp + 0x8 <- data
    void *data2;
    // sp + 0x4 <- data2

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
        data = GfGfxLoader_GetCharDataFromOpenNarc(a0->unk0[0].unk0, ov76_021E7094[temp].unk4, 1, &ppCharData, 0x49);
        data2 = GfGfxLoader_GetPlttDataFromOpenNarc(a0->unk0[0].unk0, ov76_021E7094[temp].unk0, &ppPlttData, 0x49);
    } else {
        // r3 <- sp + 0x10
        if (temp2 != 0) {
            data = GfGfxLoader_GetCharDataFromOpenNarc(a0->unk0[0].unk0, ov76_021E7094[temp3].unk4, 1, &ppCharData, 0x49);
            data2 = GfGfxLoader_GetPlttDataFromOpenNarc(a0->unk0[0].unk0, ov76_021E7094[temp3].unk0, &ppPlttData, 0x49);
        } else {
            data = GfGfxLoader_GetCharDataFromOpenNarc(a0->unk0[0].unk0, ov76_021E7094[a1].unk4, 1, &ppCharData, 0x49);
            data2 = GfGfxLoader_GetPlttDataFromOpenNarc(a0->unk0[0].unk0, ov76_021E7094[a1].unk0, &ppPlttData, 0x49);
        }
    }

    // inst 0xb6
    DC_FlushRange(ppCharData->pRawData, ppCharData->szByte);
    int idx = a0->unk0[0].unk4;
    GX_LoadOBJ(ppCharData->pRawData, a0->unk0[idx].unkC, ppCharData->szByte);
    DC_FlushRange(ppPlttData->pRawData, ppPlttData->szByte);
    idx = a0->unk0[0].unk4;
    GX_LoadOBJPltt(ppPlttData->pRawData, a0->unk0[idx].unk10, 0x20);

    // inst 0xf2
    // idx = a0->unk0[0].unk4;
    // UnkOv76_021E6B2C *temp4 = &a0->unk0[idx];
    a0->unk0[a0->unk0[0].unk4 + 1].unk0 = GfGfxLoader_GetCellBankFromOpenNarc(a0->unk0[0].unk0, ov76_021E7094[a1].unk8, 1, &a0->unk0[a0->unk0[0].unk4].unk24, 0x49);
    // This cast is incorrect! It's storing a 4-byte value
    a0->unk0[a0->unk0[0].unk4 + 1].unk4 = (u16)GfGfxLoader_GetAnimBankFromOpenNarc(a0->unk0[0].unk0, ov76_021E7094[a1].unkC, 1, &a0->unk0[a0->unk0[0].unk4].unk28, 0x49);
    FreeToHeap(data);
    FreeToHeap(data2);
    a0->unk0[0].unk4++;
}
#else
#pragma GLOBAL_ASM("asm/nonmatchings/ov76_021E6B8C.s")
#endif //NONMATCHING

// UNCOMMENT after asm_processor works!
// void ov76_021E6CF4(Ov76_Work *a0, UnkOv76_021E6CF4 *a1) {
//     SpriteResourcesHeader spriteRsrcHeader;
//     struct SpriteTemplate spriteTemplate;

//     ov76_021E64B0(a1->unk2, a0, 3, 1, &spriteTemplate, &spriteRsrcHeader);
//     UnkOv76_021E683C *temp2 = &a0->unk260.unk140;
//     int idx = temp2->unkC0;
//     UnkOv76_021E683C_sub *temp3 = &temp2->unk0[idx];
//     temp3->unk0 = 1;
//     temp3->unk2 = a1->unk0;
//     spriteTemplate.position.x = a1->unk4 * FX32_ONE;
//     spriteTemplate.position.y = (a1->unk6 + 256) * FX32_ONE;
//     spriteTemplate.priority = 1;

//     struct Sprite *sprite = CreateSprite(&spriteTemplate);
//     temp3->unk8 = sprite;
//     GF_ASSERT(sprite != NULL);

//     Set2dSpriteAnimActiveFlag(temp3->unk8, 0);
//     Set2dSpriteVisibleFlag(temp3->unk8, 0);
//     Set2dSpriteAnimSeqNo(temp3->unk8, a1->unk3);
//     temp3->unk4 = a1->unk8;
//     temp2->unkC0 += 1;
// }

// static void ov76_021E6E20(Ov76_Work *a0) {
//     u8 i;
//     NarcStruct *temp = &a0->unk260;
//     UnkOv76_021E683C *temp2 = &temp->unk140;

//     for (i = 0; i < 16; i++) {
//         if (temp2->unk0[i].unk0 != 0) {
//             sub_02024758(temp2->unk0[i].unk8);
//             temp2->unk0[i].unk0 = 0;
//             temp2->unk0[i].unk2 = 0;
//         }
//     }

//     temp2->unkC0 = 0;
//     for (i = 0; i < temp->unk4; i++) {
//         FreeToHeap(temp->unk8[i].unk34);
//         FreeToHeap(temp->unk8[i].unk38);
//         temp->unk8[i].unk24 = NULL;
//         temp->unk8[i].unk28 = NULL;
//     }
//     temp->unk4 = 0;
// }
