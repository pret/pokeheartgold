#include "naming_screen.h"

#include "global.h"

#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0197.h"
#include "msgdata/msg/msg_0249.h"
#include "msgdata/msg/msg_0254.h"

#include "bg_window.h"
#include "filesystem.h"
#include "font.h"
#include "gf_gfx_loader.h"
#include "gf_gfx_planes.h"
#include "launch_application.h"
#include "math_util.h"
#include "message_format.h"
#include "msgdata.h"
#include "obj_char_transfer.h"
#include "obj_pltt_transfer.h"
#include "pokemon_icon_idx.h"
#include "sound_02004A44.h"
#include "systask_environment.h"
#include "system.h"
#include "text.h"
#include "unk_02005D10.h"
#include "unk_0200ACF0.h"
#include "unk_0200B150.h"
#include "unk_0200FA24.h"
#include "unk_020163E0.h"
#include "vram_transfer_manager.h"

typedef struct NamingScreenAppData {
    NameScreenType type;
    int unk_004;
    int unk_008;
    int maxLen;
    int unk_010;
    int unk_014;
    Options *unk_018;
    int unk_01C;
    int unk_020;
    int unk_024;
    int unk_028;
    int unk_02C;
    int unk_030;
    int unk_034;
    u8 unk_038[0x2];
    u16 unk_03A[6][13];
    u8 filler_0D6[2];
    u16 unk_0D8[0x20];
    u16 unk_118[0x20];
    u16 unk_158;
    u16 unk_15A;
    u8 filler_15C[0x4];
    BgConfig *bgConfig; // 0x160
    u8 filler_164[4];
    MessageFormat *msgFormat; // 0x168
    MsgData *msgData_249;     // 0x16C
    MsgData *msgData_254;     // 0x170
    MsgData *msgData_197;     // 0x174
    String *unk_178;
    String *unk_17C;
    String *unk_180;
    String *unk_184;
    SpriteList *unk_188;
    GF_G2dRenderer unk_18C;
    GF_2DGfxResMan *unk_2B4[4];
    GF_2DGfxResObj *unk_2C4[2][4];
    SpriteResourcesHeader unk_2E4;
    SpriteResourcesHeader unk_308;
    Sprite *unk_32C[14];
    Sprite *unk_364[12];
    Sprite *unk_394[2];
    SysTask *unk_39C[7];
    Window unk_3B8[10];
    int unk_458;
    int unk_45C;
    int unk_460;
    GFBgLayer unk_464;
    VecFx32 unk_468[2];
    u8 filler_480[4];
    int unk_484;
    int unk_488;
    int unk_48C;
    int unk_490[7];
    void *unk_4AC;
    NNSG2dCharacterData *unk_4B0;
    void *unk_4B4;
    NNSG2dCharacterData *unk_4B8;
    void *unk_4BC;
    NNSG2dPaletteData *unk_4C0;
    u8 unk_4C4[0x100];
    UnkStruct_020163E0 *unk_5C4;
    BOOL unk_5C8;
    int unk_5CC;
    int *unk_5D0;
} NamingScreenAppData; // size: 0x5D4

BOOL NamingScreenApp_Init(OVY_MANAGER *ovyMan, int *pState);
void sub_02082AEC(NNSG2dCharacterData *pCharData, NNSG2dPaletteData *pPlttData, int species, int form);
BOOL NamingScreenApp_Main(OVY_MANAGER *ovyMan, int *pState);
int sub_02082CF8(NamingScreenAppData *data, int a1);
void sub_02082E28(NamingScreenAppData *data, NamingScreenArgs *args);
BOOL sub_02082EC0(const u16 *s);
BOOL NamingScreenApp_Exit(OVY_MANAGER *ovyMan, int *pState);
void sub_02083140(void *param);
BOOL sub_02082EC0(const u16 *s);
void sub_02083160(NamingScreenAppData *data, NamingScreenArgs *args);
void sub_02083184(void);
void sub_020831A4(BgConfig *bgConfig);
void sub_020832E4(GFPlaneToggle enable);
void sub_02083334(NamingScreenAppData *data, OVY_MANAGER *ovyMan);
void sub_020834FC(NamingScreenAppData *data, OVY_MANAGER *ovyMan);
void sub_02083614(BgConfig *bgConfig, Window *a1);
void sub_02083654(NamingScreenAppData *data, NARC *narc);
void sub_0208377C(void);
void sub_020837AC(NamingScreenAppData *data, NARC *narc);
void sub_020839B8(SysTask *task, void *taskData);
void sub_020839EC(NamingScreenAppData *data);
void sub_02083BB4(NamingScreenAppData *data, SpriteTemplate *tmplate);
void sub_02083CAC(SysTask *task, void *taskData);
void sub_02083D34(BgConfig *bgConfig, Window *windows, int *pState, int pageNum, GFBgLayer *pBgId, VecFx32 *posVecs, Sprite **pSprites, void *pRawData);
void sub_02083F18(Window *window, int unused, String *msg);
void sub_02083F48(Window *window, int unused, String *msg);
void sub_02083F9C(NamingScreenAppData *data, OVY_MANAGER *ovyMan, NARC *narc);
sub_0208421C(BgConfig *bgConfig, GFBgLayer bgId, VecFx32 *pos);
void sub_0208423C(VecFx32 *posVecs, GFBgLayer bgId);
void sub_0208432C(NamingScreenAppData *data);
void sub_02084E54(Window *window, u16 fillVal, int pageNum, u32 textColor, u8 *pRawData);
void sub_02084740(Window *a0, u16 *a1, u16 a2, void *a3, void *a4, String *a5);
void sub_02084830(u16 (*a0)[13], int a1);
int sub_02084884(NamingScreenAppData *data, int key, BOOL a2);
void sub_02084E18(Sprite **sprites, int a1);
void sub_02084F3C(int *a0, Sprite **a1, int a2);
void sub_02084FCC(NamingScreenAppData *data);
void sub_02084500(void *a0);

static NamingScreenAppData *_021D43B0;

extern const int _021020B4[8];
extern const int _021021E8[][4];
extern const u8 _02101D40[];

BOOL NamingScreenApp_Init(OVY_MANAGER *ovyMan, int *pState) {
    NamingScreenAppData *data;
    NARC *narc;
    switch (*pState) {
    case 0:
        Main_SetVBlankIntrCB(NULL, NULL);
        HBlankInterruptDisable();
        GfGfx_DisableEngineAPlanes();
        GfGfx_DisableEngineBPlanes();
        GX_SetVisiblePlane(0);
        GXS_SetVisiblePlane(0);
        CreateHeap(HEAP_ID_3, HEAP_ID_NAMING_SCREEN, 0x28000);

        data = OverlayManager_CreateAndGetData(ovyMan, sizeof(NamingScreenAppData), HEAP_ID_NAMING_SCREEN);
        memset(data, 0, sizeof(NamingScreenAppData));
        data->bgConfig    = BgConfig_Alloc(HEAP_ID_NAMING_SCREEN);
        narc              = NARC_New(NARC_a_0_3_1, HEAP_ID_NAMING_SCREEN);
        data->msgFormat   = MessageFormat_New(HEAP_ID_NAMING_SCREEN);
        data->msgData_249 = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0249_bin, HEAP_ID_NAMING_SCREEN);
        data->msgData_254 = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0254_bin, HEAP_ID_NAMING_SCREEN);
        data->msgData_197 = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0197_bin, HEAP_ID_NAMING_SCREEN);
        SetKeyRepeatTimers(4, 8);
        sub_02083184();
        sub_020831A4(data->bgConfig);
        sub_02083160(data, OverlayManager_GetArgs(ovyMan));
        sub_02083654(data, narc);
        FontID_Alloc(2, HEAP_ID_NAMING_SCREEN);
        Main_SetVBlankIntrCB(sub_02083140, NULL);
        sub_02083334(data, ovyMan);
        FontID_SetAccessDirect(0, HEAP_ID_NAMING_SCREEN);
        sub_0208377C();
        sub_020837AC(data, narc);
        sub_020839EC(data);
        sub_02083F9C(data, ovyMan, narc);
        sub_02084740(&data->unk_3B8[4], data->unk_0D8, data->unk_158, &data->unk_15A, data->unk_4C4, data->unk_17C);
        sub_02004EC4(0x34, 0, 0);
        BeginNormalPaletteFade(0, 1, 1, RGB_BLACK, 16, 1, HEAP_ID_NAMING_SCREEN);
        sub_020832E4(GF_PLANE_TOGGLE_ON);
        GfGfx_SetMainDisplay(PM_LCD_BOTTOM);
        NARC_Delete(narc);
        ++(*pState);
        break;
    case 1:
        data = OverlayManager_GetData(ovyMan);
        if (data->type == NAME_SCREEN_POKEMON) {
            sub_02082AEC(data->unk_4B8, data->unk_4C0, data->unk_004, data->unk_008);
        }
        _021D43B0     = data;
        data->unk_5C4 = sub_020163E0(NULL, PM_LCD_BOTTOM, 12, HEAP_ID_NAMING_SCREEN);
        *pState       = 0;
        return TRUE;
    }

    return FALSE;
}

void sub_02082AEC(NNSG2dCharacterData *pCharData, NNSG2dPaletteData *pPlttData, int species, int form) {
    GX_LoadOBJ(pCharData->pRawData, 0x57E0, 0x200);
    const u16 *rawPltt = pPlttData->pRawData;
    u32 plttNo         = GetMonIconPaletteEx(species, form, FALSE);
    GX_LoadOBJPltt(rawPltt + 16 * plttNo, 0xC0, 0x20);
}

BOOL NamingScreenApp_Main(OVY_MANAGER *ovyMan, int *pState) {
    NamingScreenAppData *data = OverlayManager_GetData(ovyMan);

    switch (*pState) {
    case 0:
        if (IsPaletteFadeFinished()) {
            *pState       = 1;
            data->unk_5CC = 0;
        }
        break;
    case 1:
        ++data->unk_5CC;
        sub_02084FCC(data);
        sub_02084F3C(data->unk_490, data->unk_32C, data->unk_460);
        if (data->unk_5CC > 5) {
            *pState       = 2;
            data->unk_5CC = 0;
        }
        break;
    case 2:
        switch (data->unk_45C) {
        case 0:
        case 1:
        case 2:
        case 3:
            break;
        case 4:
            if (data->unk_034 == 0) {
                *pState = sub_02082CF8(data, *pState);
            }
            sub_02084FCC(data);
            break;
        case 5:
            sub_020834FC(data, ovyMan);
            FillWindowPixelBuffer(&data->unk_3B8[9], 15);
            DrawFrameAndWindow2(&data->unk_3B8[9], FALSE, 256, 10);
            data->unk_458 = AddTextPrinterParameterized(&data->unk_3B8[9], 1, data->unk_180, 0, 0, 1, NULL);
            CopyWindowToVram(&data->unk_3B8[9]);
            data->unk_45C = 6;
            break;
        case 6:
            if (!TextPrinterCheckActive(data->unk_458)) {
                PlaySE(SEQ_SE_DP_PIRORIRO);
                ++data->unk_490[6];
                data->unk_5CC = 0;
                data->unk_45C = 7;
            }
            break;
        case 7:
            ++data->unk_5CC;
            if (data->unk_5CC > 30) {
                BeginNormalPaletteFade(2, 0, 0, RGB_BLACK, 16, 1, HEAP_ID_NAMING_SCREEN);
                *pState = 3;
            }
            break;
        }
        sub_02083D34(data->bgConfig, data->unk_3B8, &data->unk_45C, data->unk_460, &data->unk_464, data->unk_468, data->unk_32C, data->unk_4B0->pRawData);
        sub_02084F3C(data->unk_490, data->unk_32C, data->unk_460);
        sub_02084500(data->unk_038);
        break;
    case 3:
        if (IsPaletteFadeFinished()) {
            return TRUE;
        }
        break;
    }

    SpriteList_RenderAndAnimateSprites(data->unk_188);
    return FALSE;
}

int sub_02082CF8(NamingScreenAppData *data, int a1) {
    int ret = a1;

    sub_0208432C(data);
    if (gSystem.newKeys & PAD_BUTTON_SELECT) {
        if (!Sprite_GetVisibleFlag(data->unk_32C[8])) {
            Sprite_SetVisibleFlag(data->unk_32C[8], TRUE);
            return ret;
        }
        if (data->type != 4) {
            data->unk_45C = 0;
            ++data->unk_460;
            if (data->unk_460 >= 3) {
                data->unk_460 = 0;
            }
            ++data->unk_490[data->unk_460];
            sub_02084830(data->unk_03A, data->unk_460);
            PlaySE(SEQ_SE_DP_SYU03);
            data->unk_030 = 1;
        }
        ++data->unk_490[data->unk_460];
        sub_02084830(data->unk_03A, data->unk_460);
        PlaySE(SEQ_SE_DP_SYU03);
    } else if (gSystem.newKeys & PAD_BUTTON_A) {
        ret           = sub_02084884(data, data->unk_03A[data->unk_020][data->unk_01C], TRUE);
        data->unk_030 = 1;
    } else if (data->unk_5C8 == TRUE) {
        ret = sub_02084884(data, data->unk_03A[data->unk_020][data->unk_01C], FALSE);
    } else if (gSystem.newKeys & PAD_BUTTON_B) {
        ret = sub_02084884(data, 0xE007, TRUE);
    } else if (gSystem.newKeys & PAD_BUTTON_R) {
        ret = sub_02084884(data, 0xE006, TRUE);
    }
    return ret;
}

#ifdef HEARTGOLD
#define FIRST_DEFAULT_NAME_MALE   msg_0254_00000
#define FIRST_DEFAULT_NAME_FEMALE msg_0254_00018
#define FIRST_DEFAULT_NAME_RIVAL  msg_0254_00084
#else
#define FIRST_DEFAULT_NAME_MALE   msg_0254_00042
#define FIRST_DEFAULT_NAME_FEMALE msg_0254_00060
#define FIRST_DEFAULT_NAME_RIVAL  msg_0254_00085
#endif // HEARTGOLD

void sub_02082E28(NamingScreenAppData *data, NamingScreenArgs *args) {
    String *string;

    if (data->type == NAME_SCREEN_PLAYER) {
        if (data->unk_004 == PLAYER_GENDER_MALE) {
            string = NewString_ReadMsgData(data->msgData_254, FIRST_DEFAULT_NAME_MALE + (LCRandom() % 18));
        } else if (data->unk_004 == PLAYER_GENDER_FEMALE) {
            string = NewString_ReadMsgData(data->msgData_254, FIRST_DEFAULT_NAME_FEMALE + (LCRandom() % 18));
        }
        // UB: Nonbinary players will not initialize string.
        String_Copy(args->nameInputString, string);
        String_Delete(string);
        CopyStringToU16Array(args->nameInputString, args->unk1C, 10);
    } else if (data->type == NAME_SCREEN_RIVAL) {
        string = NewString_ReadMsgData(data->msgData_254, FIRST_DEFAULT_NAME_RIVAL);
        String_Copy(args->nameInputString, string);
        String_Delete(string);
        CopyStringToU16Array(args->nameInputString, args->unk1C, 10);
    } else {
        args->unk14 = 1;
    }
}

BOOL sub_02082EC0(const u16 *s) {
    BOOL ret = TRUE;
    int i;

    for (i = 0;; ++i) {
        if (s[i] == EOS) {
            break;
        }
        if (s[i] != CHAR_SPACE) {
            ret = FALSE;
        }
    }
    return ret;
}

BOOL NamingScreenApp_Exit(OVY_MANAGER *ovyMan, int *pState) {
    NamingScreenAppData *data = OverlayManager_GetData(ovyMan);
    NamingScreenArgs *args    = OverlayManager_GetArgs(ovyMan);

    data->unk_0D8[data->unk_158] = EOS;
    if (data->type == NAME_SCREEN_POKEMON) {
        Pokemon *mon = AllocMonZeroed(HEAP_ID_NAMING_SCREEN);
        CreateMon(mon, data->unk_004, 5, 10, 10, 10, 10, 10);
        // wtf
        FreeToHeap(mon);
    }
    if (data->unk_158 == 0 || !StringNotEqual(data->unk_0D8, data->unk_118) || sub_02082EC0(data->unk_0D8)) {
        sub_02082E28(data, args);
    } else {
        CopyU16StringArray(data->unk_118, data->unk_0D8);
        CopyU16StringArray(args->unk1C, data->unk_0D8);
        CopyU16ArrayToString(args->nameInputString, data->unk_0D8);
    }
    String_Delete(data->unk_184);
    for (int i = 0; i < 7; ++i) {
        DestroySysTaskAndEnvironment(data->unk_39C[i]);
    }
    sub_0200AEB0(data->unk_2C4[PM_LCD_TOP][GF_GFX_RES_TYPE_CHAR]);
    sub_0200AEB0(data->unk_2C4[PM_LCD_BOTTOM][GF_GFX_RES_TYPE_CHAR]);
    sub_0200B0A8(data->unk_2C4[PM_LCD_TOP][GF_GFX_RES_TYPE_PLTT]);
    sub_0200B0A8(data->unk_2C4[PM_LCD_BOTTOM][GF_GFX_RES_TYPE_PLTT]);
    for (int i = 0; i < 4; ++i) {
        Destroy2DGfxResObjMan(data->unk_2B4[i]);
    }
    SpriteList_Delete(data->unk_188);
    OamManager_Free();
    FreeToHeapExplicit(HEAP_ID_NAMING_SCREEN, data->unk_4AC);
    if (data->type == NAME_SCREEN_POKEMON) {
        FreeToHeapExplicit(HEAP_ID_NAMING_SCREEN, data->unk_4B4);
        FreeToHeapExplicit(HEAP_ID_NAMING_SCREEN, data->unk_4BC);
    }
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_SUB_3);
    ObjCharTransfer_Destroy();
    ObjPlttTransfer_Destroy();
    sub_02083614(data->bgConfig, data->unk_3B8);
    FontID_SetAccessLazy(0);
    GX_SetVisibleWnd(GX_WNDMASK_NONE);
    FontID_Release(2);
    if (data->unk_180 != NULL) {
        String_Delete(data->unk_180);
    }
    String_Delete(data->unk_178);
    String_Delete(data->unk_17C);
    DestroyMsgData(data->msgData_197);
    DestroyMsgData(data->msgData_254);
    DestroyMsgData(data->msgData_249);
    MessageFormat_Delete(data->msgFormat);
    OverlayManager_FreeData(ovyMan);
    Main_SetVBlankIntrCB(NULL, NULL);
    DestroyHeap(HEAP_ID_NAMING_SCREEN);
    GfGfx_SetMainDisplay(PM_LCD_TOP);
    return TRUE;
}

// -------------------------------
// Public functions
// -------------------------------

NamingScreenArgs *NamingScreen_CreateArgs(HeapID heapId, NameScreenType kind, int param, int maxLen, Options *options, int *a5) {
    NamingScreenArgs *ret = AllocFromHeap(heapId, sizeof(NamingScreenArgs));
    ret->kind             = kind;
    ret->playerGender     = param;
    ret->maxLen           = maxLen;
    ret->unk14            = 0;
    ret->unk1C[0]         = EOS;
    ret->nameInputString  = String_New(32, heapId);
    ret->unk44            = 0;
    ret->unk48            = 0;
    ret->monGender        = 0;
    ret->options          = options;
    ret->monForm          = 0;
    ret->unk50            = a5;
    return ret;
}

void NamingScreen_DeleteArgs(NamingScreenArgs *namingScreenArgs) {
    GF_ASSERT(namingScreenArgs->nameInputString != NULL);
    GF_ASSERT(namingScreenArgs != NULL); // UB: should check this first
    String_Delete(namingScreenArgs->nameInputString);
    FreeToHeap(namingScreenArgs);
}

// -------------------------------
// Back to private scope
// -------------------------------

void sub_02083140(void *param) {
    GF_RunVramTransferTasks();
    OamManager_ApplyAndResetBuffers();
    OS_SetIrqCheckFlag(OS_IE_V_BLANK);
}

void sub_02083160(NamingScreenAppData *data, NamingScreenArgs *args) {
    data->type    = args->kind;
    data->unk_004 = args->playerGender;
    data->unk_008 = args->monForm;
    data->maxLen  = args->maxLen;
    data->unk_010 = args->monGender;
    data->unk_018 = args->options;
    data->unk_5D0 = args->unk50;
}

void sub_02083184(void) {
    extern const GraphicsBanks _02102140;
    GraphicsBanks graphicsBanks = _02102140;
    GfGfx_SetBanks(&graphicsBanks);
}

void sub_020831A4(BgConfig *bgConfig) {
    {
        extern const GraphicsModes _02101D60;
        GraphicsModes graphicsModes = _02101D60;
        SetBothScreensModesAndDisable(&graphicsModes);
    }

    {
        extern const BgTemplate _02101ED4;
        BgTemplate bgTemplate = _02101ED4;
        InitBgFromTemplate(bgConfig, GF_BG_LYR_MAIN_0, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_MAIN_0);
    }

    {
        extern const BgTemplate _02101FB4;
        BgTemplate bgTemplate = _02101FB4;
        InitBgFromTemplate(bgConfig, GF_BG_LYR_MAIN_1, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_MAIN_1);
    }

    {
        extern const BgTemplate _02102078;
        BgTemplate bgTemplate = _02102078;
        InitBgFromTemplate(bgConfig, GF_BG_LYR_MAIN_2, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_MAIN_2);
    }

    {
        extern const BgTemplate _02101E10;
        BgTemplate bgTemplate = _02101E10;
        InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_0, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_SUB_0);
    }

    sub_020832E4(GF_PLANE_TOGGLE_OFF);
    BG_ClearCharDataRange(GF_BG_LYR_MAIN_0, 0x20, 0, HEAP_ID_NAMING_SCREEN);
    BG_ClearCharDataRange(GF_BG_LYR_SUB_0, 0x20, 0, HEAP_ID_NAMING_SCREEN);
    GX_SetVisibleWnd(GX_WNDMASK_W0);
    G2_SetWnd0InsidePlane(GX_WND_PLANEMASK_BG2 | GX_WND_PLANEMASK_OBJ, 1);
    G2_SetWndOutsidePlane(GX_WND_PLANEMASK_BG0 | GX_WND_PLANEMASK_BG1 | GX_WND_PLANEMASK_BG2 | GX_WND_PLANEMASK_BG3 | GX_WND_PLANEMASK_OBJ,
        1);
    G2_SetWnd0Position(0, 0, 255, 64);
    G2S_BlendNone();
}

void sub_020832E4(GFPlaneToggle enable) {
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG0, enable);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG1, enable);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG2, enable);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG3, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, enable);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG0, enable);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_OFF);
}

void sub_02083334(NamingScreenAppData *data, OVY_MANAGER *ovyMan) {
    NamingScreenArgs *args = OverlayManager_GetArgs(ovyMan);

    data->unk_45C = 4;
    sub_0208423C(data->unk_468, GF_BG_LYR_MAIN_0);
    BgSetPosTextAndCommit(data->bgConfig, data->unk_464, BG_POS_OP_SET_X, data->unk_468[data->unk_464].x);
    BgSetPosTextAndCommit(data->bgConfig, data->unk_464, BG_POS_OP_SET_Y, data->unk_468[data->unk_464].y);
    BgSetPosTextAndCommit(data->bgConfig, data->unk_464 ^ 1, BG_POS_OP_SET_X, data->unk_468[data->unk_464 ^ 1].x);
    BgSetPosTextAndCommit(data->bgConfig, data->unk_464 ^ 1, BG_POS_OP_SET_Y, data->unk_468[data->unk_464 ^ 1].y);
    data->unk_118[0] = EOS;
    if (args->nameInputString != NULL) {
        CopyStringToU16Array(args->nameInputString, data->unk_118, 32);
    }
    MI_CpuFill16(data->unk_0D8, 1, sizeof(data->unk_0D8));
    if (data->type == NAME_SCREEN_POKEMON) {
        Pokemon *mon = AllocMonZeroed(HEAP_ID_NAMING_SCREEN);
        CreateMon(mon, data->unk_004, 5, 10, 10, 10, 10, 10);
        BufferBoxMonSpeciesName(data->msgFormat, 0, Mon_GetBoxMon(mon));
        FreeToHeap(mon);
    }
    if (args->unk44) {
        data->unk_014 = 1;
    }
    data->unk_178               = ReadMsgData_ExpandPlaceholders(data->msgFormat, data->msgData_249, _021020B4[data->type], HEAP_ID_NAMING_SCREEN);
    data->unk_17C               = ReadMsgData_ExpandPlaceholders(data->msgFormat, data->msgData_249, msg_0249_00009, HEAP_ID_NAMING_SCREEN);
    data->unk_184               = NewString_ReadMsgData(data->msgData_249, msg_0249_00007);
    data->unk_158               = StringLength(data->unk_118);
    data->unk_01C               = 0;
    data->unk_020               = 1;
    data->unk_024               = -1;
    data->unk_028               = -1;
    data->unk_030               = 1;
    data->unk_034               = 0;
    data->unk_484               = -1;
    data->unk_488               = 0;
    data->unk_48C               = 0;
    data->unk_0D8[data->maxLen] = EOS;
    for (int i = 0; i < 7; ++i) {
        data->unk_490[i] = 0;
    }
    if (data->type == NAME_SCREEN_UNK4) {
        data->unk_490[3] = 1;
    } else {
        data->unk_490[0] = 1;
    }
}

void sub_020834FC(NamingScreenAppData *data, OVY_MANAGER *ovyMan) {
    NamingScreenArgs *args = OverlayManager_GetArgs(ovyMan);
    if (args->unk44 != 0) {
        String *string    = String_New(200, HEAP_ID_NAMING_SCREEN);
        data->unk_180     = NULL;
        int boxno         = PCStorage_GetActiveBox(args->unk48);
        int nextOpenBoxNo = PCStorage_FindFirstBoxWithEmptySlot(args->unk48);
        BufferPCBoxName(data->msgFormat, 1, args->unk48, boxno);
        if (boxno != nextOpenBoxNo) {
            BufferPCBoxName(data->msgFormat, 2, args->unk48, nextOpenBoxNo);
            args->unk44 += 2;
        } else {
            BufferPCBoxName(data->msgFormat, 2, args->unk48, boxno);
        }
        if (data->unk_158 == 0 || sub_02082EC0(data->unk_0D8)) {
            Pokemon *mon = AllocMonZeroed(HEAP_ID_NAMING_SCREEN);
            CreateMon(mon, data->unk_004, 1, 0, 0, 0, 0, 0);
            BufferBoxMonSpeciesName(data->msgFormat, 0, Mon_GetBoxMon(mon));
            FreeToHeap(mon);
        } else {
            data->unk_0D8[data->unk_158] = EOS;
            CopyU16ArrayToString(string, data->unk_0D8);
            BufferString(data->msgFormat, 0, string, 0, 0, 0);
        }
        data->unk_180 = ReadMsgData_ExpandPlaceholders(data->msgFormat, data->msgData_197, args->unk44, HEAP_ID_NAMING_SCREEN);
        data->unk_014 = 1;
        String_Delete(string);
    }
}

void sub_02083614(BgConfig *bgConfig, Window *a1) {
    for (int i = 0; i < 10; ++i) {
        RemoveWindow(&a1[i]);
    }
    FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_SUB_0);
    FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_MAIN_2);
    FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_MAIN_1);
    FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_MAIN_0);
    FreeToHeapExplicit(HEAP_ID_NAMING_SCREEN, bgConfig);
}

void sub_02083654(NamingScreenAppData *data, NARC *narc) {
    BgConfig *bgConfig = data->bgConfig;

    GfGfxLoader_GXLoadPalFromOpenNarc(narc, 0, GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)0, 0x60, HEAP_ID_NAMING_SCREEN);
    GfGfxLoader_GXLoadPal(NARC_a_0_1_4, 71, GF_PAL_LOCATION_SUB_BG, (enum GFPalSlotOffset)0, 0x20, HEAP_ID_NAMING_SCREEN);
    BG_SetMaskColor(GF_BG_LYR_SUB_0, RGB_BLACK);

    GfGfxLoader_LoadCharDataFromOpenNarc(narc, 2, bgConfig, GF_BG_LYR_MAIN_2, 0, 0x2000, TRUE, HEAP_ID_NAMING_SCREEN);
    GfGfxLoader_LoadScrnDataFromOpenNarc(narc, 4, bgConfig, GF_BG_LYR_MAIN_2, 0, 0x600, TRUE, HEAP_ID_NAMING_SCREEN);

    GfGfxLoader_LoadCharDataFromOpenNarc(narc, 2, bgConfig, GF_BG_LYR_MAIN_1, 0, 0x2000, TRUE, HEAP_ID_NAMING_SCREEN);
    GfGfxLoader_LoadScrnDataFromOpenNarc(narc, 6, bgConfig, GF_BG_LYR_MAIN_1, 0, 0x380, TRUE, HEAP_ID_NAMING_SCREEN);

    GfGfxLoader_LoadScrnDataFromOpenNarc(narc, 7, bgConfig, GF_BG_LYR_MAIN_0, 0, 0x380, TRUE, HEAP_ID_NAMING_SCREEN);

    LoadFontPal1(GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)0x180, HEAP_ID_NAMING_SCREEN);
    LoadUserFrameGfx2(data->bgConfig, GF_BG_LYR_SUB_0, 0x100, 10, Options_GetFrame(data->unk_018), HEAP_ID_NAMING_SCREEN);
    LoadFontPal1(GF_PAL_LOCATION_SUB_BG, (enum GFPalSlotOffset)0x180, HEAP_ID_NAMING_SCREEN);

    data->unk_4AC = GfGfxLoader_GetCharDataFromOpenNarc(narc, 16, TRUE, &data->unk_4B0, HEAP_ID_NAMING_SCREEN);
}

void sub_0208377C(void) {
    extern const ObjCharTransferTemplate _02101D70;
    ObjCharTransferTemplate tmplate = _02101D70;
    ObjCharTransfer_Init(&tmplate);
    ObjPlttTransfer_Init(20, HEAP_ID_NAMING_SCREEN);
    ObjCharTransfer_ClearBuffers();
    ObjPlttTransfer_Reset();
}

void sub_020837AC(NamingScreenAppData *data, NARC *narc) {
    NNS_G2dInitOamManagerModule();
    GX_SetOBJVRamModeChar(GX_OBJVRAMMODE_CHAR_1D_32K);
    GXS_SetOBJVRamModeChar(GX_OBJVRAMMODE_CHAR_1D_32K);
    OamManager_Create(0, 128, 0, 32, 0, 128, 0, 32, HEAP_ID_NAMING_SCREEN);
    data->unk_188 = G2dRenderer_Init(44, &data->unk_18C, HEAP_ID_NAMING_SCREEN);
    G2dRenderer_SetSubSurfaceCoords(&data->unk_18C, 0, FX32_CONST(256));

    for (int i = 0; i < 4; ++i) {
        data->unk_2B4[i] = Create2DGfxResObjMan(2, (GfGfxResType)i, HEAP_ID_NAMING_SCREEN);
    }

    data->unk_2C4[PM_LCD_TOP][GF_GFX_RES_TYPE_CHAR] = AddCharResObjFromOpenNarc(data->unk_2B4[GF_GFX_RES_TYPE_CHAR], narc, 10, TRUE, 0, NNS_G2D_VRAM_TYPE_2DMAIN, HEAP_ID_NAMING_SCREEN);
    data->unk_2C4[PM_LCD_TOP][GF_GFX_RES_TYPE_PLTT] = AddPlttResObjFromOpenNarc(data->unk_2B4[GF_GFX_RES_TYPE_PLTT], narc, 1, FALSE, 0, NNS_G2D_VRAM_TYPE_2DMAIN, 9, HEAP_ID_NAMING_SCREEN);
    data->unk_2C4[PM_LCD_TOP][GF_GFX_RES_TYPE_CELL] = AddCellOrAnimResObjFromOpenNarc(data->unk_2B4[GF_GFX_RES_TYPE_CELL], narc, 12, TRUE, 0, GF_GFX_RES_TYPE_CELL, HEAP_ID_NAMING_SCREEN);
    data->unk_2C4[PM_LCD_TOP][GF_GFX_RES_TYPE_ANIM] = AddCellOrAnimResObjFromOpenNarc(data->unk_2B4[GF_GFX_RES_TYPE_ANIM], narc, 14, TRUE, 0, GF_GFX_RES_TYPE_ANIM, HEAP_ID_NAMING_SCREEN);
    if (data->type == NAME_SCREEN_POKEMON) {
        data->unk_4B4 = GfGfxLoader_GetCharData(NARC_poketool_icongra_poke_icon, GetMonIconNaixEx(data->unk_004, FALSE, data->unk_008), FALSE, &data->unk_4B8, HEAP_ID_NAMING_SCREEN);
        DC_FlushRange(data->unk_4B8, 0x200);
        data->unk_4BC = GfGfxLoader_GetPlttData(NARC_poketool_icongra_poke_icon, sub_02074490(), &data->unk_4C0, HEAP_ID_NAMING_SCREEN);
        DC_FlushRange(data->unk_4C0, 0x80);
    }

    data->unk_2C4[PM_LCD_BOTTOM][GF_GFX_RES_TYPE_CHAR] = AddCharResObjFromOpenNarc(data->unk_2B4[GF_GFX_RES_TYPE_CHAR], narc, 11, TRUE, 1, NNS_G2D_VRAM_TYPE_2DSUB, HEAP_ID_NAMING_SCREEN);
    data->unk_2C4[PM_LCD_BOTTOM][GF_GFX_RES_TYPE_PLTT] = AddPlttResObjFromOpenNarc(data->unk_2B4[GF_GFX_RES_TYPE_PLTT], narc, 1, FALSE, 1, NNS_G2D_VRAM_TYPE_2DSUB, 3, HEAP_ID_NAMING_SCREEN);
    data->unk_2C4[PM_LCD_BOTTOM][GF_GFX_RES_TYPE_CELL] = AddCellOrAnimResObjFromOpenNarc(data->unk_2B4[GF_GFX_RES_TYPE_CELL], narc, 13, TRUE, 1, GF_GFX_RES_TYPE_CELL, HEAP_ID_NAMING_SCREEN);
    data->unk_2C4[PM_LCD_BOTTOM][GF_GFX_RES_TYPE_ANIM] = AddCellOrAnimResObjFromOpenNarc(data->unk_2B4[GF_GFX_RES_TYPE_ANIM], narc, 15, TRUE, 1, GF_GFX_RES_TYPE_ANIM, HEAP_ID_NAMING_SCREEN);

    sub_0200ACF0(data->unk_2C4[PM_LCD_TOP][GF_GFX_RES_TYPE_CHAR]);
    sub_0200ACF0(data->unk_2C4[PM_LCD_BOTTOM][GF_GFX_RES_TYPE_CHAR]);
    sub_0200AF94(data->unk_2C4[PM_LCD_TOP][GF_GFX_RES_TYPE_PLTT]);
    sub_0200AF94(data->unk_2C4[PM_LCD_BOTTOM][GF_GFX_RES_TYPE_PLTT]);
}

typedef struct SysTaskData_020839B8 {
    Sprite *sprite;
    Sprite *sprite2;
    fx32 dx;
    int i;
} SysTaskData_020839B8;

void sub_020839B8(SysTask *task, void *taskData) {
    SysTaskData_020839B8 *data = taskData;
    VecFx32 *pMatrix           = Sprite_GetMatrixPtr(data->sprite);
    VecFx32 matrix;
    matrix.x = pMatrix->x + data->dx;
    matrix.y = FX32_ONE * _021021E8[data->i][1];
    matrix.z = 0;
    Sprite_SetMatrix(data->sprite2, &matrix);
}

#ifdef NONMATCHING
void sub_020839EC(NamingScreenAppData *data) {
    int i;
    CreateSpriteResourcesHeader(&data->unk_2E4, 0, 0, 0, 0, -1, -1, 0, 1, data->unk_2B4[GF_GFX_RES_TYPE_CHAR], data->unk_2B4[GF_GFX_RES_TYPE_PLTT], data->unk_2B4[GF_GFX_RES_TYPE_CELL], data->unk_2B4[GF_GFX_RES_TYPE_ANIM], NULL, NULL);
    CreateSpriteResourcesHeader(&data->unk_308, 1, 1, 1, 1, -1, -1, 0, 0, data->unk_2B4[GF_GFX_RES_TYPE_CHAR], data->unk_2B4[GF_GFX_RES_TYPE_PLTT], data->unk_2B4[GF_GFX_RES_TYPE_CELL], data->unk_2B4[GF_GFX_RES_TYPE_ANIM], NULL, NULL);
    {
        SpriteTemplate spriteTemplate;
        spriteTemplate.spriteList  = data->unk_188;
        spriteTemplate.header      = &data->unk_2E4;
        spriteTemplate.position.x  = FX32_CONST(32);
        spriteTemplate.position.y  = FX32_CONST(96);
        spriteTemplate.position.z  = 0;
        spriteTemplate.scale.x     = FX32_ONE;
        spriteTemplate.scale.y     = FX32_ONE;
        spriteTemplate.scale.z     = FX32_ONE;
        spriteTemplate.rotation    = 0;
        spriteTemplate.priority    = 1;
        spriteTemplate.whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN;
        spriteTemplate.heapId      = HEAP_ID_NAMING_SCREEN;

        for (i = 0; i < 9; ++i) {
            spriteTemplate.position.x = _021021E8[i][0] * FX32_ONE;
            spriteTemplate.position.y = _021021E8[i][1] * FX32_ONE;
            data->unk_32C[i]          = Sprite_CreateAffine(&spriteTemplate);
            Sprite_SetAnimActiveFlag(data->unk_32C[i], TRUE);
            Sprite_SetAnimCtrlSeq(data->unk_32C[i], _021021E8[i][2]);
            Sprite_SetDrawPriority(data->unk_32C[i], _021021E8[i][3]);
        }
        Sprite_SetVisibleFlag(data->unk_32C[4], FALSE);
        for (i = 0; i < 7; ++i) {
            data->unk_39C[i]               = CreateSysTaskAndEnvironment(sub_020839B8, sizeof(SysTaskData_020839B8), 5, HEAP_ID_NAMING_SCREEN);
            SysTaskData_020839B8 *taskData = SysTask_GetData(data->unk_39C[i]);
            taskData->sprite               = data->unk_32C[7];
            taskData->sprite2              = data->unk_32C[i];
            taskData->dx                   = _021021E8[i][0] * FX32_ONE;
            taskData->i                    = i;
        }
        // regswap: data->maxLen should be r2, instead r0
        for (i = 0; i < data->maxLen; ++i) {
            spriteTemplate.position.x = FX32_ONE * (80 + i * 12);
            spriteTemplate.position.y = FX32_ONE * 39;
            data->unk_364[i]          = Sprite_CreateAffine(&spriteTemplate);
            Sprite_SetAnimActiveFlag(data->unk_364[i], TRUE);
            Sprite_SetAnimCtrlSeq(data->unk_364[i], 43);
        }
        sub_02084E18(data->unk_364, data->unk_158);
        sub_02083BB4(data, &spriteTemplate);
    }
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
}
#else
// clang-format off
asm void sub_020839EC(NamingScreenAppData *data) {
    push {r4, r5, r6, r7, lr}
	sub sp, #0x5c
	mov r1, #0
	add r6, r0, #0
	str r1, [sp]
	sub r0, r1, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r2, #0xad
	str r1, [sp, #0xc]
	mov r0, #1
	lsl r2, r2, #2
	str r0, [sp, #0x10]
	ldr r0, [r6, r2]
	add r3, r1, #0
	str r0, [sp, #0x14]
	add r0, r2, #4
	ldr r0, [r6, r0]
	str r0, [sp, #0x18]
	add r0, r2, #0
	add r0, #8
	ldr r0, [r6, r0]
	str r0, [sp, #0x1c]
	add r0, r2, #0
	add r0, #0xc
	ldr r0, [r6, r0]
	add r2, #0x30
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	add r0, r6, r2
	add r2, r1, #0
	str r1, [sp, #0x28]
	bl CreateSpriteResourcesHeader
	mov r1, #1
	mov r3, #0xad
	str r1, [sp]
	sub r0, r1, #2
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	lsl r3, r3, #2
	ldr r2, [r6, r3]
	str r2, [sp, #0x14]
	add r2, r3, #4
	ldr r2, [r6, r2]
	str r2, [sp, #0x18]
	add r2, r3, #0
	add r2, #8
	ldr r2, [r6, r2]
	str r2, [sp, #0x1c]
	add r2, r3, #0
	add r2, #0xc
	ldr r2, [r6, r2]
	add r3, #0x54
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	add r0, r6, r3
	add r2, r1, #0
	add r3, r1, #0
	bl CreateSpriteResourcesHeader
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	mov r1, #2
	str r0, [sp, #0x2c]
	mov r0, #0xb9
	lsl r0, r0, #2
	add r0, r6, r0
	str r0, [sp, #0x30]
	mov r0, #6
	lsl r1, r1, #0x10
	lsl r0, r0, #0x10
	str r0, [sp, #0x38]
	lsr r0, r1, #5
	mov r7, #0
	str r1, [sp, #0x34]
	str r7, [sp, #0x3c]
	str r0, [sp, #0x40]
	str r0, [sp, #0x44]
	str r0, [sp, #0x48]
	add r0, sp, #0x2c
	strh r7, [r0, #0x20]
	mov r0, #1
	str r0, [sp, #0x50]
	str r0, [sp, #0x54]
	mov r0, #0x12
	ldr r4, =_021021E8
	str r0, [sp, #0x58]
	add r5, r6, #0
_02083AA8:
	ldr r0, [r4, #0]
	lsl r0, r0, #0xc
	str r0, [sp, #0x34]
	ldr r0, [r4, #4]
	lsl r0, r0, #0xc
	str r0, [sp, #0x38]
	add r0, sp, #0x2c
	bl Sprite_CreateAffine
	mov r1, #0xcb
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r1, #0
	ldr r0, [r5, r0]
	mov r1, #1
	bl Sprite_SetAnimActiveFlag
	mov r0, #0xcb
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r4, #8]
	bl Sprite_SetAnimCtrlSeq
	mov r0, #0xcb
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r4, #0xc]
	bl Sprite_SetDrawPriority
	add r7, r7, #1
	add r4, #0x10
	add r5, r5, #4
	cmp r7, #9
	blt _02083AA8
	mov r0, #0xcf
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	mov r1, #0
	bl Sprite_SetVisibleFlag
	ldr r7, =_021021E8
	mov r5, #0
	add r4, r6, #0
_02083AFE:
	ldr r0, =sub_020839B8
	mov r1, #0x10
	mov r2, #5
	mov r3, #0x12
	bl CreateSysTaskAndEnvironment
	mov r1, #0xe7
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r1, #0
	ldr r0, [r4, r0]
	bl SysTask_GetData
	mov r1, #0xd2
	lsl r1, r1, #2
	ldr r1, [r6, r1]
	str r1, [r0]
	mov r1, #0xcb
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r4, r4, #4
	str r1, [r0, #4]
	ldr r1, [r7, #0]
	add r7, #0x10
	lsl r1, r1, #0xc
	str r1, [r0, #8]
	str r5, [r0, #0xc]
	add r5, r5, #1
	cmp r5, #7
	blt _02083AFE
	ldr r2, [r6, #0xc]
	mov r7, #0
	cmp r2, #0
	ble _02083B7E
	mov r5, #0x50
	add r4, r6, #0
_02083B46:
	lsl r0, r5, #0xc
	str r0, [sp, #0x34]
	mov r0, #0x27
	lsl r0, r0, #0xc
	str r0, [sp, #0x38]
	add r0, sp, #0x2c
	bl Sprite_CreateAffine
	mov r1, #0xd9
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r1, #0
	ldr r0, [r4, r0]
	mov r1, #1
	bl Sprite_SetAnimActiveFlag
	mov r0, #0xd9
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x2b
	bl Sprite_SetAnimCtrlSeq
	ldr r2, [r6, #0xc]
	add r7, r7, #1
	add r5, #0xc
	add r4, r4, #4
	cmp r7, r2
	blt _02083B46
_02083B7E:
	mov r1, #0x56
	lsl r1, r1, #2
	mov r0, #0xd9
	lsl r0, r0, #2
	ldrh r1, [r6, r1]
	add r0, r6, r0
	bl sub_02084E18
	add r0, r6, #0
	add r1, sp, #0x2c
	bl sub_02083BB4
	mov r0, #0x10
	mov r1, #1
	bl GfGfx_EngineATogglePlanes
	mov r0, #0x10
	mov r1, #1
	bl GfGfx_EngineBTogglePlanes
	add sp, #0x5c
	pop {r4, r5, r6, r7, pc}
}
// clang-format on
#endif // NONMATCHING

void sub_02083BB4(NamingScreenAppData *data, SpriteTemplate *tmplate) {
    tmplate->position.x = FX32_CONST(24);
    tmplate->position.y = FX32_CONST(8);
    data->unk_394[0]    = Sprite_CreateAffine(tmplate);
    Sprite_SetAnimActiveFlag(data->unk_394[0], TRUE);

    switch (data->type) {
    case NAME_SCREEN_PLAYER:
        if (data->unk_004 == PLAYER_GENDER_MALE) {
            Sprite_SetAnimCtrlSeq(data->unk_394[0], 48);
        } else {
            Sprite_SetAnimCtrlSeq(data->unk_394[0], 49);
        }
        break;
    case NAME_SCREEN_RIVAL:
        Sprite_SetAnimCtrlSeq(data->unk_394[0], 51);
        break;
    case NAME_SCREEN_UNK6:
        Sprite_SetAnimCtrlSeq(data->unk_394[0], 55);
        break;
    case NAME_SCREEN_GROUP:
        Sprite_SetAnimCtrlSeq(data->unk_394[0], 54);
        break;
    case NAME_SCREEN_UNK4:
    case NAME_SCREEN_UNK7:
        Sprite_SetAnimCtrlSeq(data->unk_394[0], 53);
        break;
    case NAME_SCREEN_BOX:
        Sprite_SetAnimCtrlSeq(data->unk_394[0], 47);
        break;
    case NAME_SCREEN_POKEMON:
        Sprite_SetAnimCtrlSeq(data->unk_394[0], 50);
        if (data->unk_010 != 2) {
            tmplate->position.x = (13 * data->maxLen + 80) * FX32_ONE;
            tmplate->position.y = FX32_CONST(27);
            data->unk_394[1]    = Sprite_CreateAffine(tmplate);
            if (data->unk_010 == 0) {
                Sprite_SetAnimCtrlSeq(data->unk_394[1], 45);
            } else {
                Sprite_SetAnimCtrlSeq(data->unk_394[1], 46);
            }
        }
        break;
    }
}

typedef struct SysTaskData_02083CAC {
    Sprite *sprite;
    int state;
    fx32 x;
    int y;
} SysTaskData_02083CAC;

void sub_02083CAC(SysTask *task, void *taskData) {
    SysTaskData_02083CAC *data = taskData;

    VecFx32 matrix;

    matrix.y = data->y;
    matrix.z = 0;
    switch (data->state) {
    case 0:
        matrix.x = data->x + FX32_CONST(4);
        Sprite_SetMatrix(data->sprite, &matrix);
        break;
    case 2:
        matrix.x = data->x - FX32_CONST(3);
        Sprite_SetMatrix(data->sprite, &matrix);
        break;
    case 4:
        matrix.x = data->x + FX32_CONST(2);
        Sprite_SetMatrix(data->sprite, &matrix);
        break;
    case 6:
        matrix.x = data->x;
        Sprite_SetMatrix(data->sprite, &matrix);
        DestroySysTaskAndEnvironment(task); // invalidates data
        break;
    }
    ++data->state; // UB: potential use after free
}

void sub_02083D34(BgConfig *bgConfig, Window *windows, int *pState, int pageNum, GFBgLayer *pBgId, VecFx32 *posVecs, Sprite **pSprites, void *pRawData) {
    GFBgLayer bgId_prev = *pBgId;
    GFBgLayer bgId_curr = (GFBgLayer)(bgId_prev ^ 1);

    switch (*pState) {
    case 0: {
        u16 fillVal = _02101D40[pageNum] | (_02101D40[pageNum] << 4);
        GfGfxLoader_LoadScrnData(NARC_a_0_3_1, pageNum + 6, bgConfig, bgId_prev, 0, 0x380, TRUE, HEAP_ID_NAMING_SCREEN);
        sub_0208423C(posVecs, bgId_prev);
        sub_02084E54(&windows[bgId_prev], fillVal, pageNum, MAKE_TEXT_COLOR(14, 15, 0), pRawData);
        ++(*pState);
        break;
    }
    case 1:
        BgSetPosTextAndCommit(bgConfig, bgId_prev, BG_POS_OP_SET_X, 238);
        BgSetPosTextAndCommit(bgConfig, bgId_prev, BG_POS_OP_SET_Y, -80);
        ++*(pState);
        break;
    case 2:
        posVecs[bgId_prev].x -= 24;
        if (posVecs[bgId_prev].x < -1) {
            SysTaskData_02083CAC *data;
            SysTask *task;

            task                 = CreateSysTaskAndEnvironment(sub_02083CAC, sizeof(SysTaskData_02083CAC), 0, HEAP_ID_NAMING_SCREEN);
            data                 = SysTask_GetData(task);
            data->sprite         = pSprites[7];
            data->state          = 0;
            data->x              = Sprite_GetMatrixPtr(pSprites[7])->x;
            data->y              = Sprite_GetMatrixPtr(pSprites[7])->y;
            posVecs[bgId_prev].x = -11;
            ++(*pState);
        }
        posVecs[bgId_curr].y -= 10;
        if (posVecs[bgId_curr].y < -196) {
            posVecs[bgId_curr].y = -196;
        }
        BgSetPosTextAndCommit(bgConfig, bgId_prev, BG_POS_OP_SET_X, posVecs[bgId_prev].x);
        BgSetPosTextAndCommit(bgConfig, bgId_curr, BG_POS_OP_SET_Y, posVecs[bgId_curr].y);
        break;
    case 3:
        posVecs[bgId_curr].y -= 10;
        if (posVecs[bgId_curr].y < -196) {
            posVecs[bgId_curr].y = -196;
        }
        BgSetPosTextAndCommit(bgConfig, bgId_prev, BG_POS_OP_SET_X, posVecs[bgId_prev].x);
        BgSetPosTextAndCommit(bgConfig, bgId_curr, BG_POS_OP_SET_Y, posVecs[bgId_curr].y);
        if (posVecs[bgId_prev].x == -11 && posVecs[bgId_curr].y == -196) {
            ++(*pState);
            (*pBgId) ^= 1;
            sub_0208421C(bgConfig, *pBgId, posVecs);
            PlaySE(SEQ_SE_DP_NAMEIN_01);
        }
        break;
    case 4:
        break;
    }
}

void sub_02083F18(Window *window, int unused, String *msg) {
    DrawFrameAndWindow2(window, FALSE, 0x100, 10);
    AddTextPrinterParameterized(window, 1, msg, 0, 0, TEXT_SPEED_INSTANT, NULL);
    CopyWindowToVram(window);
}

void sub_02083F48(Window *window, int unused, String *msg) {
    int x           = 16;
    int width       = FontID_String_GetWidth(0, msg, 0);
    int windowWidth = GetWindowWidth(window) * 8;
    if (width + 16 > windowWidth) {
        x = windowWidth - width;
    }
    FillWindowPixelBuffer(window, 1);
    AddTextPrinterParameterizedWithColor(window, 0, msg, x, 0, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(14, 15, 1), NULL);
    CopyWindowToVram(window);
}
