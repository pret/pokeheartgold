#include <stdlib.h>
#include "gf_gfx_loader.h"
#include "global.h"
#include "register_hall_of_fame.h"
#include "camera.h"
#include "bg_window.h"
#include "font.h"
#include "gf_gfx_planes.h"
#include "heap.h"
#include "msgdata.h"
#include "message_format.h"
#include "overlay_manager.h"
#include "pokemon.h"
#include "sound_02004A44.h"
#include "sys_task_api.h"
#include "system.h"
#include "constants/sndseq.h"
#include "msgdata/msg.naix"
#include "unk_02005D10.h"
#include "unk_0200CF18.h"
#include "unk_0200FA24.h"
#include "unk_02013FDC.h"
#include "unk_02026E84.h"

typedef enum RegisterHallOfFameScene {
    REGHOF_SCENE_0,
    REGHOF_SCENE_1,
    REGHOF_SCENE_2,
    REGHOF_SCENE_3,
    REGHOF_SCENE_4,
    REGHOF_SCENE_5,
    REGHOF_SCENE_6,
    REGHOF_SCENE_7,
    REGHOF_SCENE_MAX,
} RegisterHallOfFameScene;

typedef struct RegisterHofMon {
    Pokemon *mon;
    u8 unk_0004;
    u8 unk_0005;
    u8 filler_0006[0x6];
    u16 unk_000C;
    u8 filler_000E[0x2];
    u8 unk_0010;
    u8 unk_0011;
    u8 filler_0012[0x5A];
    u16 unk_006C[3200];
    u16 unk_196C[3200];
    u16 unk_326C[16];
} RegisterHofMon;

typedef struct RegisterHofSpotlight {} RegisterHofSpotlight;

typedef struct RegisterHofConfettiEmitter {} RegisterHofConfettiEmitter;

typedef struct RegisterHallOfFameData {
    RegisterHallOfFameArgs *args;  // 00000
    SysTask *vblankTask;  // 00004
    BOOL (*unk_00008)(struct RegisterHallOfFameData *);
    u16 unk_0000C;
    u16 unk_0000E;
    BgConfig *bgConfig; // 00010
    Window unk_00014[2];
    Window unk_00034;
    Window unk_00044;
    Window unk_00054;
    Window unk_00064;
    Window unk_00074;
    MsgData *msgData; // 00084
    MessageFormat *msgFormat; // 00088
    String *unk_0008C;
    String *unk_00090;
    NARC *unk_00094;
    NARC *unk_00098;
    SpriteRenderer *spriteRenderer;  // 0009C
    SpriteGfxHandler *spriteGfxHandler;  // 000A0
    UnkImageStruct *unk_000A4[6];
    UnkImageStruct *unk_000BC[6];
    UnkImageStruct *unk_000D4;
    UnkImageStruct *unk_000D8;
    UnkImageStruct *unk_000DC;
    Camera *unk_000E0;
    VecFx32 unk_000E4;
    VecFx16 unk_000F0;
    SysTask *unk_000F8;
    SysTask *unk_000FC;
    RegisterHofMon unk_00100[PARTY_SIZE];
    u32 unk_13048;
    RegisterHallOfFameScene currentScene;  // 1304C
    RegisterHallOfFameScene nextScene;  // 13050
    u16 unk_13054;
    u16 unk_13056;
    int unk_13058;
    int unk_1305C;
    u32 unk_13060_0:1;
    u32 unk_13060_1:1;
    u32 unk_13060_2:1;
    u32 unk_13060_3:1;
    u32 unk_13060_4:1;
    u32 unk_13060_5:1;
    int unk_13064;
    u16 unk_13068;
    u16 unk_1306A;
} RegisterHallOfFameData;

typedef struct UnkStruct_0221C610 {
    s16 unk_00;
    s16 unk_02;
    s16 unk_04;
    s16 unk_06;
    f32 unk_08;
    f32 unk_0C;
} UnkStruct_0221C610;

void ov63_0221BFBC(void);
void ov63_0221BFCC(SysTask *task, void *taskData);
void ov63_0221C00C(const void *pSrc, u32 offset, u32 size);
void ov63_0221C028(const void *pSrc, u32 offset, u32 size);
void ov63_0221C044(RegisterHallOfFameData *data);
void ov63_0221C05C(RegisterHallOfFameData *data);
void ov63_0221C068(RegisterHallOfFameData *data);
void ov63_0221C118(RegisterHallOfFameData *data);
void ov63_0221C134(RegisterHallOfFameData *data, u32 whichPic);
void ov63_0221C14C(RegisterHallOfFameData *data);
void ov63_0221C14C(RegisterHallOfFameData *data);
void ov63_0221C16C(RegisterHallOfFameData *data, u32 whichPic, int animSeqNo);
RegisterHallOfFameScene ov63_0221C188(RegisterHallOfFameData *data, RegisterHallOfFameScene nextScene);
RegisterHallOfFameScene ov63_0221C1B4(RegisterHallOfFameData *data, RegisterHallOfFameScene nextScene);
BOOL ov63_0221C1E4(RegisterHallOfFameData *data, BOOL (*a1)(RegisterHallOfFameData *), RegisterHallOfFameScene nextScene);
RegisterHallOfFameScene RegisterHallOfFame_Scene0(RegisterHallOfFameData *data);
RegisterHallOfFameScene RegisterHallOfFame_Scene1(RegisterHallOfFameData *data);
RegisterHallOfFameScene RegisterHallOfFame_Scene2(RegisterHallOfFameData *data);
RegisterHallOfFameScene RegisterHallOfFame_Scene3(RegisterHallOfFameData *data);
RegisterHallOfFameScene RegisterHallOfFame_Scene4(RegisterHallOfFameData *data);
RegisterHallOfFameScene RegisterHallOfFame_Scene5(RegisterHallOfFameData *data);
RegisterHallOfFameScene RegisterHallOfFame_Scene6(RegisterHallOfFameData *data);
RegisterHallOfFameScene RegisterHallOfFame_Scene7(RegisterHallOfFameData *data);
void ov63_0221C610(UnkImageStruct *unkImageStruct, const UnkStruct_0221C610 *a1, u32 a2, u32 a3);
void ov63_0221C6FC(RegisterHallOfFameData *data);
void ov63_0221C85C(RegisterHallOfFameData *data);
void ov63_0221C8E8(RegisterHallOfFameData *data, RegisterHofMon *mon, u8 whichFacing, int a3);
void ov63_0221C954(RegisterHallOfFameData *data, int a1, int a2);
void ov63_0221C99C(RegisterHallOfFameData *data, int a1, int a2);
void ov63_0221C9E0(RegisterHallOfFameData *data, int a1, int a2);
void ov63_0221CC78(RegisterHallOfFameData *data);
void ov63_0221C9E0(RegisterHallOfFameData *data, int a1, int a2);
void ov63_0221CA1C(RegisterHallOfFameData *data, RegisterHofMon *mon);
void ov63_0221CB48(RegisterHallOfFameData *data);
void ov63_0221CB94(RegisterHallOfFameData *data, RegisterHofMon *hofMon, int a2);
void ov63_0221CD40(RegisterHallOfFameData *data);
void ov63_0221CDF8(RegisterHallOfFameData *data);
void ov63_0221CD68(RegisterHallOfFameData *data);
void ov63_0221CE7C(RegisterHallOfFameData *data);
void ov63_0221D21C(RegisterHallOfFameData *data);
void ov63_0221D344(RegisterHallOfFameData *data);
BOOL RegisterHallOfFame_ShowMon_LeftSide(RegisterHallOfFameData *data);
BOOL RegisterHallOfFame_ShowMon_RightSide(RegisterHallOfFameData *data);
void ov63_0221E114(RegisterHallOfFameData *data);
int ov63_0221E404(u16 a0, u8 a1, u8 a2);
void ov63_0221E450(RegisterHallOfFameData *data, int a1, int a2, int a3, int a4);
BOOL ov63_0221E5A0(RegisterHallOfFameData *data);
void ov63_0221E8AC(RegisterHallOfFameData *data);
void ov63_0221E8D4(RegisterHallOfFameData *data);
void ov63_0221E8FC(SysTask *task, void *taskData);
void ov63_0221E940(RegisterHallOfFameData *data);
void ov63_0221E9FC(RegisterHallOfFameData *data);
void ov63_0221EA24(RegisterHallOfFameData *data);
void ov63_0221EAA8(RegisterHallOfFameData *data);
void ov63_0221EC04(RegisterHallOfFameData *data);
void ov63_0221EC1C(RegisterHallOfFameData *data);
void ov63_0221EFD8(RegisterHallOfFameData *data);
void ov63_0221F088(RegisterHallOfFameData *data);
void ov63_0221F1C4(RegisterHallOfFameData *data);
SysTask *ov63_0221F238(RegisterHallOfFameData *data);
void ov63_0221F324(SysTask *task, int a1, fx32 a2);
void ov63_0221F5B4(SysTask *task);
BOOL ov63_0221F600(RegisterHallOfFameData *data);
SysTask *ov63_0221F614(RegisterHallOfFameData *data);
void ov63_0221F7DC(SysTask *task);
void ov63_0221F7C4(SysTask *task);

extern const u16 ov63_0221FC58[16];
extern const u16 ov63_0221FC78[16];
extern const u16 ov63_0221FC98[16];
extern RegisterHallOfFameScene (*const sSceneFuncs[])(RegisterHallOfFameData *data);  // 0221FD18
extern const GraphicsBanks ov63_0221FD58;

BOOL RegisterHallOfFame_Init(OVY_MANAGER *man, int *state) {
    Main_SetVBlankIntrCB(NULL, NULL);
    HBlankInterruptDisable();
    GfGfx_EngineASetPlanes(0);
    GfGfx_EngineBSetPlanes(0);
    G2_BlendNone();
    G2S_BlendNone();
    GX_SetDispSelect(GX_DISP_SELECT_MAIN_SUB);
    CreateHeap(HEAP_ID_3, HEAP_ID_REGISTER_HALL_OF_FAME, 0x50000);
    RegisterHallOfFameData *data = (RegisterHallOfFameData *)OverlayManager_CreateAndGetData(man, sizeof(RegisterHallOfFameData), HEAP_ID_REGISTER_HALL_OF_FAME);
    MI_CpuFill8(data, 0, sizeof(RegisterHallOfFameData));
    data->args = OverlayManager_GetArgs(man);
    data->msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0180_bin, HEAP_ID_REGISTER_HALL_OF_FAME);
    data->msgFormat = MessageFormat_New(HEAP_ID_REGISTER_HALL_OF_FAME);
    data->unk_0008C = String_New(500, HEAP_ID_REGISTER_HALL_OF_FAME);
    data->unk_00090 = String_New(500, HEAP_ID_REGISTER_HALL_OF_FAME);
    data->unk_00094 = NARC_New(NARC_a_1_0_1, HEAP_ID_REGISTER_HALL_OF_FAME);
    data->unk_00098 = NARC_New(NARC_a_1_8_0, HEAP_ID_REGISTER_HALL_OF_FAME);
    ov63_0221E114(data);
    ov63_0221BFBC();
    ov63_0221C044(data);
    ov63_0221C068(data);
    sub_02004EC4(8, SEQ_GS_E_DENDOUIRI, 1);
    sub_02004EC4(71, 0, 0);
    LoadFontPal0(GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)0x1E0, HEAP_ID_REGISTER_HALL_OF_FAME);
    data->currentScene = REGHOF_SCENE_2;
    return TRUE;
}

BOOL RegisterHallOfFame_Exit(OVY_MANAGER *man, int *state) {
    RegisterHallOfFameData *data = OverlayManager_GetData(man);
    ov63_0221C118(data);
    ov63_0221C05C(data);
    NARC_Delete(data->unk_00098);
    NARC_Delete(data->unk_00094);
    String_Delete(data->unk_0008C);
    String_Delete(data->unk_00090);
    MessageFormat_Delete(data->msgFormat);
    DestroyMsgData(data->msgData);
    OverlayManager_FreeData(man);
    DestroyHeap(HEAP_ID_REGISTER_HALL_OF_FAME);
    return TRUE;
}

BOOL RegisterHallOfFame_Main(OVY_MANAGER *man, int *state) {
    RegisterHallOfFameData *data = OverlayManager_GetData(man);
    data->currentScene = sSceneFuncs[data->currentScene](data);
    if (data->currentScene == REGHOF_SCENE_MAX) {
        return TRUE;
    }
    ov63_0221C14C(data);
    return FALSE;
}

void ov63_0221BFBC(void) {
    GfGfx_SetBanks(&ov63_0221FD58);
}

void ov63_0221BFCC(SysTask *task, void *taskData) {
    RegisterHallOfFameData *data = (RegisterHallOfFameData *)taskData;
    if (data->unk_00008 != NULL && !data->unk_00008(data)) {
        data->unk_00008 = NULL;
    }
    DoScheduledBgGpuUpdates(data->bgConfig);
    sub_0200D020(data->spriteGfxHandler);
    thunk_OamManager_ApplyAndResetBuffers();
    OS_SetIrqCheckFlag(OS_IE_V_BLANK);
}

void ov63_0221C00C(const void *pSrc, u32 offset, u32 size) {
    DC_FlushRange(pSrc, size);
    GX_LoadOBJ(pSrc, offset, size);
}

void ov63_0221C028(const void *pSrc, u32 offset, u32 size) {
    DC_FlushRange(pSrc, size);
    GX_LoadOBJPltt(pSrc, offset, size);
}

void ov63_0221C044(RegisterHallOfFameData *data) {
    data->bgConfig = BgConfig_Alloc(HEAP_ID_REGISTER_HALL_OF_FAME);
    BG_SetMaskColor(GF_BG_LYR_SUB_0, RGB_BLACK);
}

void ov63_0221C05C(RegisterHallOfFameData *data) {
    FreeToHeap(data->bgConfig);
}

void ov63_0221C068(RegisterHallOfFameData *data) {
    data->spriteRenderer = SpriteRenderer_Create(HEAP_ID_REGISTER_HALL_OF_FAME);
    data->spriteGfxHandler = SpriteRenderer_CreateGfxHandler(data->spriteRenderer);

    { 
        extern const Unk122_021E92FC ov63_0221FCB8;
        Unk122_021E92FC sp2C = ov63_0221FCB8;

        extern const Unk122_021E92D0 ov63_0221FB30;
        Unk122_021E92D0 sp18 = ov63_0221FB30;
        sub_0200CF70(data->spriteRenderer, &sp2C, &sp18, 0x20);
    }

    {
        extern const SpriteResourceCountsListUnion ov63_0221FB5C;
        SpriteResourceCountsListUnion sp00 = ov63_0221FB5C;
        sub_0200CFF4(data->spriteRenderer, data->spriteGfxHandler, 15);
        SpriteRenderer_Init2DGfxResManagersFromCountsArray(data->spriteRenderer, data->spriteGfxHandler, &sp00);
    }
    G2dRenderer_SetSubSurfaceCoords(SpriteRenderer_GetG2dRendererPtr(data->spriteRenderer), 0, FX32_CONST(1024));
}

void ov63_0221C118(RegisterHallOfFameData *data) {
    SpriteRenderer_UnloadResourcesAndRemoveGfxHandler(data->spriteRenderer, data->spriteGfxHandler);
    SpriteRenderer_Delete(data->spriteRenderer);
}

void ov63_0221C134(RegisterHallOfFameData *data, u32 whichPic) {
    if (data->unk_000A4[whichPic] != NULL) {
        sub_0200D9DC(data->unk_000A4[whichPic]);
        data->unk_000A4[whichPic] = NULL;
    }
}

void ov63_0221C14C(RegisterHallOfFameData *data) {
    for (u32 i = 0; i < 15; ++i) {
        if (data->unk_000A4[i] != NULL) {
            UnkImageStruct_TickSpriteAnimation1Frame(data->unk_000A4[i]);
        }
    }
}

void ov63_0221C16C(RegisterHallOfFameData *data, u32 whichPic, int animSeqNo) {
    UnkImageStruct_SetSpriteAnimCtrlCurrentFrame(data->unk_000A4[whichPic], 0);
    UnkImageStruct_SetSpriteAnimSeqNo(data->unk_000A4[whichPic], animSeqNo);
}

RegisterHallOfFameScene ov63_0221C188(RegisterHallOfFameData *data, RegisterHallOfFameScene nextScene) {
    BeginNormalPaletteFade(0, 1, 1, RGB_BLACK, 6, 1, HEAP_ID_REGISTER_HALL_OF_FAME);
    data->nextScene = nextScene;
    return REGHOF_SCENE_0;
}

RegisterHallOfFameScene ov63_0221C1B4(RegisterHallOfFameData *data, RegisterHallOfFameScene nextScene) {
    BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 6, 1, HEAP_ID_REGISTER_HALL_OF_FAME);
    data->nextScene = nextScene;
    return REGHOF_SCENE_0;
}

BOOL ov63_0221C1E4(RegisterHallOfFameData *data, BOOL (*a1)(RegisterHallOfFameData *), RegisterHallOfFameScene nextScene) {
    data->nextScene = nextScene;
    data->unk_0000C = 0;
    data->unk_0000E = 0;
    data->unk_00008 = a1;
    return TRUE;
}

RegisterHallOfFameScene RegisterHallOfFame_Scene0(RegisterHallOfFameData *data) {
    if (IsPaletteFadeFinished() == TRUE) {
        return data->nextScene;
    } else {
        return REGHOF_SCENE_0;
    }
}

RegisterHallOfFameScene RegisterHallOfFame_Scene1(RegisterHallOfFameData *data) {
    if (data->unk_00008 == NULL) {
        return data->nextScene;
    } else {
        return REGHOF_SCENE_1;
    }
}

RegisterHallOfFameScene RegisterHallOfFame_Scene2(RegisterHallOfFameData *data) {
    ov63_0221CC78(data);
    ov63_0221CDF8(data);
    ov63_0221CD68(data);
    data->unk_13054 = 0;
    data->unk_13056 = 0;
    data->vblankTask = SysTask_CreateOnVBlankQueue(ov63_0221BFCC, data, 0);
    return ov63_0221C188(data, REGHOF_SCENE_3);
}

RegisterHallOfFameScene RegisterHallOfFame_Scene3(RegisterHallOfFameData *data) {
    switch (data->unk_13054) {
    case 0:
        ov63_0221D344(data);
        ++data->unk_13054;
        break;
    case 1:
        ++data->unk_13054;
        if ((data->unk_13056 & 1) == 0) {
            ov63_0221C1E4(data, RegisterHallOfFame_ShowMon_LeftSide, REGHOF_SCENE_3);
        } else {
            ov63_0221C1E4(data, RegisterHallOfFame_ShowMon_RightSide, REGHOF_SCENE_3);
        }
        break;
    case 2:
        if (data->unk_00008 == NULL) {
            ++data->unk_13054;
        } else {
            if (data->unk_13060_1 == TRUE) {
                ov63_0221E450(data, data->unk_13056, 2, 1, 0);
                data->unk_13060_1 = FALSE;
            }
            if (data->unk_13060_0 == TRUE) {
                ov63_0221E450(data, data->unk_13056, 0, 1, 2);
                data->unk_13060_0 = FALSE;
            }
        }
        break;
    case 3:
        ov63_0221D21C(data);
        ++data->unk_13056;
        if (data->unk_13048 == data->unk_13056) {
            ++data->unk_13054;
        } else {
            data->unk_13054 = 0;
        }
        break;
    case 4:
        return ov63_0221C1B4(data, REGHOF_SCENE_4);
    }
    return REGHOF_SCENE_3;
}

RegisterHallOfFameScene RegisterHallOfFame_Scene4(RegisterHallOfFameData *data) {
    SysTask_Destroy(data->vblankTask);
    ov63_0221CE7C(data);
    ov63_0221CD40(data);
    return REGHOF_SCENE_5;
}

RegisterHallOfFameScene RegisterHallOfFame_Scene5(RegisterHallOfFameData *data) {
    data->unk_13056 = 0;
    data->unk_13054 = 0;
    ov63_0221E940(data);
    ov63_0221EA24(data);
    ov63_0221EAA8(data);
    ov63_0221EC1C(data);
    ov63_0221F088(data);
    data->vblankTask = SysTask_CreateOnVBlankQueue(ov63_0221E8FC, data, 4);
    return ov63_0221C188(data, REGHOF_SCENE_6);
}

RegisterHallOfFameScene RegisterHallOfFame_Scene6(RegisterHallOfFameData *data) {
    switch (data->unk_13054) {
    case 0:
        ++data->unk_13054;
        ov63_0221C1E4(data, ov63_0221E5A0, REGHOF_SCENE_6);
        break;
    case 1:
        if (data->unk_00008 == NULL) {
            ++data->unk_13054;
        }
        if (data->unk_13060_2 == TRUE) {
            data->unk_000F8 = ov63_0221F238(data);
            ov63_0221F324(data->unk_000F8, -2925, FX32_CONST(20));
            ov63_0221F324(data->unk_000F8, -1757, FX32_CONST(60));
            ov63_0221F324(data->unk_000F8, -586, FX32_CONST(40));
            ov63_0221F324(data->unk_000F8, 586, FX32_CONST(140));
            ov63_0221F324(data->unk_000F8, 1757, FX32_CONST(120));
            ov63_0221F324(data->unk_000F8, 2925, FX32_CONST(160));
            data->unk_000FC = ov63_0221F614(data);
            ov63_0221F7DC(data->unk_000FC);
            GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_ON);
            GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG2, GF_PLANE_TOGGLE_ON);
            GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG3, GF_PLANE_TOGGLE_ON);
            UnkImageStruct_SetSpriteVisibleFlag(data->unk_000D4, TRUE);
            UnkImageStruct_SetSpriteVisibleFlag(data->unk_000D8, TRUE);
            for (int i = 0; i < data->unk_13048; ++i) {
                ov63_0221C9E0(data, i, i);
                sub_0200E024(data->unk_000A4[i], 1.0f, 1.0f);
                UnkImageStruct_SetSpriteVisibleFlag(data->unk_000BC[i], TRUE);
                sub_0200E0FC(data->unk_000A4[i], GX_OAM_MODE_NORMAL);
                sub_0200E0FC(data->unk_000BC[i], GX_OAM_MODE_XLU);
            }
            data->unk_13060_2 = FALSE;
        }
        if (data->unk_13060_3 == TRUE) {
            ov63_0221E8AC(data);
            PlaySE(SEQ_SE_GS_DENDOUIRI_FLASH);
            PlaySE(SEQ_SE_GS_DENDOUIRI_KANSEI);
            data->unk_13060_3 = FALSE;
        }
        if (data->unk_13060_4 == TRUE) {
            ov63_0221E8D4(data);
            data->unk_13060_4 = FALSE;
        }
        break;
    case 2:
        data->unk_13054 = 0;
        return REGHOF_SCENE_7;
    }

    return REGHOF_SCENE_6;
}

RegisterHallOfFameScene RegisterHallOfFame_Scene7(RegisterHallOfFameData *data) {
    switch (data->unk_13054) {
    case 0:
        SysTask_Destroy(data->vblankTask);
        ov63_0221F7C4(data->unk_000FC);
        ov63_0221F5B4(data->unk_000F8);
        ++data->unk_13054;
        break;
    case 1:
        if (ov63_0221F600(data) == TRUE) {
            ++data->unk_13054;
        }
        break;
    case 2:
        ov63_0221F1C4(data);
        ov63_0221EFD8(data);
        ov63_0221EC04(data);
        ov63_0221E9FC(data);
        return REGHOF_SCENE_MAX;
    }

    return REGHOF_SCENE_7;
}

void ov63_0221C610(UnkImageStruct *unkImageStruct, const UnkStruct_0221C610 *a1, u32 a2, u32 a3) {
    if (a3 == 0) {
        UnkImageStruct_SetSpritePositionXY(unkImageStruct, a1->unk_00, a1->unk_02);
        sub_0200E024(unkImageStruct, a1->unk_08, a1->unk_08);
    } else if (a3 == a2) {
        UnkImageStruct_SetSpritePositionXY(unkImageStruct, a1->unk_04, a1->unk_06);
        sub_0200E024(unkImageStruct, a1->unk_0C, a1->unk_0C);
    } else {
        s16 dx = ((abs(a1->unk_00 - a1->unk_04) * 256) / a2 * a3) / 256;
        if (a1->unk_00 > a1->unk_04) {
            dx = a1->unk_00 - dx;
        } else {
            dx = a1->unk_00 + dx;
        }
        s16 dy = ((abs(a1->unk_02 - a1->unk_06) * 256) / a2 * a3) / 256;
        if (a1->unk_02 > a1->unk_06) {
            dy = a1->unk_02 - dy;
        } else {
            dy = a1->unk_02 + dy;
        }
        UnkImageStruct_SetSpritePositionXY(unkImageStruct, dx, dy);

        f32 fpos = a1->unk_08 + (a1->unk_0C - a1->unk_08) / (float)a2 * (float)a3;
        sub_0200E024(unkImageStruct, fpos, fpos);
    }
}

void ov63_0221C6FC(RegisterHallOfFameData *data) {
    NARC *narc = NARC_New(NARC_a_0_0_8, HEAP_ID_REGISTER_HALL_OF_FAME);
    SpriteRenderer_LoadCharResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, narc, 76, FALSE, NNS_G2D_VRAM_TYPE_2DMAIN, 55512);
    SpriteRenderer_LoadCellResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, narc, 77, FALSE, 55512);
    SpriteRenderer_LoadAnimResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, narc, 78, FALSE, 55512);
    SpriteRenderer_LoadPlttResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, narc, 75, FALSE, 1, NNS_G2D_VRAM_TYPE_2DMAIN, 55512);
    SpriteRenderer_LoadPlttResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, narc, 75, FALSE, 1, NNS_G2D_VRAM_TYPE_2DMAIN, 55513);
    SpriteRenderer_LoadCharResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, narc, 76, FALSE, NNS_G2D_VRAM_TYPE_2DMAIN, 55513);
    SpriteRenderer_LoadCellResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, narc, 77, FALSE, 55513);
    SpriteRenderer_LoadAnimResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, narc, 78, FALSE, 55513);
    SpriteRenderer_LoadPlttResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, narc, 75, FALSE, 1, NNS_G2D_VRAM_TYPE_2DMAIN, 55514);
    SpriteRenderer_LoadPlttResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, narc, 75, FALSE, 1, NNS_G2D_VRAM_TYPE_2DMAIN, 55515);
    NARC_Delete(narc);
}

void ov63_0221C85C(RegisterHallOfFameData *data) {
    SpriteGfxHandler_UnloadPlttObjById(data->spriteGfxHandler, 55512);
    SpriteGfxHandler_UnloadPlttObjById(data->spriteGfxHandler, 55513);
    SpriteGfxHandler_UnloadPlttObjById(data->spriteGfxHandler, 55514);
    SpriteGfxHandler_UnloadPlttObjById(data->spriteGfxHandler, 55515);
    SpriteGfxHandler_UnloadCharObjById(data->spriteGfxHandler, 55512);
    SpriteGfxHandler_UnloadCellObjById(data->spriteGfxHandler, 55512);
    SpriteGfxHandler_UnloadAnimObjById(data->spriteGfxHandler, 55512);
    SpriteGfxHandler_UnloadCharObjById(data->spriteGfxHandler, 55513);
    SpriteGfxHandler_UnloadCellObjById(data->spriteGfxHandler, 55513);
    SpriteGfxHandler_UnloadAnimObjById(data->spriteGfxHandler, 55513);
}

void ov63_0221C8E8(RegisterHallOfFameData *data, RegisterHofMon *hofMon, u8 whichFacing, int a3) {
    SomeDrawPokemonStruct sp8;
    GetPokemonSpriteCharAndPlttNarcIds(&sp8, hofMon->mon, whichFacing);
    ov63_0221C00C(
        whichFacing == 2 ? hofMon->unk_006C : hofMon->unk_196C,
        NNS_G2dGetImageLocation(sub_02024B1C(data->unk_000A4[a3]->sprite), NNS_G2D_VRAM_TYPE_2DMAIN),
        3200
    );
    GfGfxLoader_GXLoadPal(
        (NarcId)sp8.narcID,
        sp8.palDataID,
        GF_PAL_LOCATION_MAIN_OBJ,
        (enum GFPalSlotOffset)NNS_G2dGetImagePaletteLocation(sub_02024B34(data->unk_000A4[a3]->sprite), NNS_G2D_VRAM_TYPE_2DMAIN),
        0x20,
        HEAP_ID_REGISTER_HALL_OF_FAME
    );
}

void ov63_0221C954(RegisterHallOfFameData *data, int a1, int a2) {
    u32 dest = NNS_G2dGetImagePaletteLocation(sub_02024B34(data->unk_000A4[a1]->sprite), NNS_G2D_VRAM_TYPE_2DMAIN);
    const u16 *pltt;

    switch (a2) {
    case 0:
        pltt = ov63_0221FC58;
        break;
    case 1:
        pltt = ov63_0221FC78;
        break;
    case 2:
        pltt = ov63_0221FC98;
        break;
    }

    ov63_0221C028(pltt, dest, 0x20);
}

void ov63_0221C99C(RegisterHallOfFameData *data, int a1, int a2) {
    u32 dest = NNS_G2dGetImagePaletteLocation(sub_02024B34(data->unk_000A4[a2]->sprite), NNS_G2D_VRAM_TYPE_2DMAIN);
    u16 *src = GetMainObjPlttAddr();
    RegisterHofMon *mon = &data->unk_00100[a1];

    MI_CpuCopy8(src + (dest / 2), mon->unk_326C, 0x20);
}

void ov63_0221C9E0(RegisterHallOfFameData *data, int a1, int a2) {
    u32 dest = NNS_G2dGetImagePaletteLocation(sub_02024B34(data->unk_000A4[a2]->sprite), NNS_G2D_VRAM_TYPE_2DMAIN);
    RegisterHofMon *mon = &data->unk_00100[a1];

    ov63_0221C028(mon->unk_326C, dest, 0x20);
}

void ov63_0221CA1C(RegisterHallOfFameData *data, RegisterHofMon *mon) {
    if (mon->unk_0005) {
        SpriteRenderer_LoadCharResObjFromOpenNarc(
            data->spriteRenderer,
            data->spriteGfxHandler,
            data->unk_00094,
            12,
            TRUE,
            NNS_G2D_VRAM_TYPE_2DMAIN,
            55518
        );
        SpriteRenderer_LoadCellResObjFromOpenNarc(
            data->spriteRenderer,
            data->spriteGfxHandler,
            data->unk_00094,
            13,
            TRUE,
            55514
        );
        SpriteRenderer_LoadAnimResObjFromOpenNarc(
            data->spriteRenderer,
            data->spriteGfxHandler,
            data->unk_00094,
            14,
            TRUE,
            55514
        );
    } else {
        SpriteRenderer_LoadCharResObjFromOpenNarc(
            data->spriteRenderer,
            data->spriteGfxHandler,
            data->unk_00094,
            9,
            TRUE,
            NNS_G2D_VRAM_TYPE_2DMAIN,
            55518
        );
        SpriteRenderer_LoadCellResObjFromOpenNarc(
            data->spriteRenderer,
            data->spriteGfxHandler,
            data->unk_00094,
            10,
            TRUE,
            55514
        );
        SpriteRenderer_LoadAnimResObjFromOpenNarc(
            data->spriteRenderer,
            data->spriteGfxHandler,
            data->unk_00094,
            11,
            TRUE,
            55514
        );
    }
    SpriteRenderer_LoadPlttResObjFromOpenNarc(
        data->spriteRenderer,
        data->spriteGfxHandler,
        data->unk_00094,
        15,
        FALSE,
        1,
        NNS_G2D_VRAM_TYPE_2DMAIN,
        55518
    );
    SpriteRenderer_LoadPlttResObjFromOpenNarc(
        data->spriteRenderer,
        data->spriteGfxHandler,
        data->unk_00094,
        15,
        FALSE,
        1,
        NNS_G2D_VRAM_TYPE_2DMAIN,
        55519
    );
}

void ov63_0221CB48(RegisterHallOfFameData *data) {
    SpriteGfxHandler_UnloadPlttObjById(data->spriteGfxHandler, 55518);
    SpriteGfxHandler_UnloadPlttObjById(data->spriteGfxHandler, 55519);
    SpriteGfxHandler_UnloadCharObjById(data->spriteGfxHandler, 55518);
    SpriteGfxHandler_UnloadCellObjById(data->spriteGfxHandler, 55514);
    SpriteGfxHandler_UnloadAnimObjById(data->spriteGfxHandler, 55514);
}

void ov63_0221CB94(RegisterHallOfFameData *data, RegisterHofMon *hofMon, int a2) {
    NNSG3dResTex *resTex;
    void *fileData;
    const void *sp18;
    u32 sp14 = NNS_G2dGetImageLocation(sub_02024B1C(data->unk_000A4[a2]->sprite), NNS_G2D_VRAM_TYPE_2DMAIN);
    int sp10 = hofMon->unk_0005 ? 8 : 4;
    u32 size = 32 * sp10 * sp10;
    int fileno = ov63_0221E404(hofMon->unk_000C, hofMon->unk_0010, hofMon->unk_0011);
    fileData = AllocAndReadWholeNarcMemberByIdPair(NARC_data_mmodel_mmodel, fileno, HEAP_ID_REGISTER_HALL_OF_FAME);
    resTex = NNS_G3dGetTex(fileData);
    sp18 = NNS_G3dGetTexData(resTex);
    void *buffer = AllocFromHeap(HEAP_ID_REGISTER_HALL_OF_FAME, size);
    for (u8 i = 0; i < 8; ++i) {
        sub_020145B4((const u8 *)sp18 + size * i, sp10, 0, 0, sp10, sp10, buffer);
        ov63_0221C00C(buffer, sp14 + size * i, size);
    }
    FreeToHeap(buffer);

    u32 plttLoc = NNS_G2dGetImagePaletteLocation(sub_02024B34(data->unk_000A4[a2]->sprite), NNS_G2D_VRAM_TYPE_2DMAIN);
    const void *loadPos = NNS_G3dGetPlttData(resTex);
    if (MonIsShiny(hofMon->mon) == TRUE) {
        loadPos = (const u8 *)loadPos + 0x20;
    }
    ov63_0221C028(loadPos, plttLoc, 0x20);
    FreeToHeap(fileData);
}
