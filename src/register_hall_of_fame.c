#include "gf_3d_vramman.h"
#include "global.h"
#include "follow_mon.h"
#include "gf_gfx_loader.h"
#include "register_hall_of_fame.h"
#include "camera.h"
#include "bg_window.h"
#include "font.h"
#include "gf_gfx_planes.h"
#include "heap.h"
#include "math_util.h"
#include "msgdata.h"
#include "message_format.h"
#include "overlay_manager.h"
#include "pokemon.h"
#include "sound_02004A44.h"
#include "sys_task_api.h"
#include "system.h"
#include "constants/sndseq.h"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0180.h"
#include "text.h"
#include "touchscreen.h"
#include "unk_02005D10.h"
#include "unk_0200CF18.h"
#include "unk_0200FA24.h"
#include "unk_02013FDC.h"
#include "unk_02026E84.h"
#include "unk_0206D494.h"
#include "unk_02007FD8.h"
#include "constants/map_sections.h"
#include "data/mmodel/mmodel.naix"

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
    u8 tsure_param[4];
    u32 personality;
    u16 species;
    u16 level;
    u8 form;
    u8 gender;
    u8 printGender;
    u8 unk_0013;
    u32 metLocation;
    int partyIndex;
    struct UnkStruct_02072914_sub_sub unk_001C[10];
    struct UnkStruct_02072914_sub_sub unk_0044[10];
    u16 unk_006C[1600];
    u16 unk_0CEC[1600];
    u16 unk_196C[1600];
    u16 unk_25EC[1600];
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
    Window unk_00014[7];
    MsgData *msgData; // 00084
    MessageFormat *msgFormat; // 00088
    String *unk_0008C;
    String *unk_00090;
    NARC *unk_00094;
    NARC *unk_00098;
    SpriteRenderer *spriteRenderer;  // 0009C
    SpriteGfxHandler *spriteGfxHandler;  // 000A0
    UnkImageStruct *unk_000A4[15];
    Camera *unk_000E0;
    VecFx32 unk_000E4;
    CameraAngle unk_000F0;
    SysTask *unk_000F8;
    SysTask *unk_000FC;
    RegisterHofMon unk_00100[PARTY_SIZE];
    u32 unk_13048;
    RegisterHallOfFameScene currentScene;  // 1304C
    RegisterHallOfFameScene nextScene;  // 13050
    u16 unk_13054;
    u16 unk_13056;
    f32 unk_13058;
    f32 unk_1305C;
    u32 unk_13060_0:1;
    u32 unk_13060_1:1;
    u32 unk_13060_2:1;
    u32 unk_13060_3:1;
    u32 unk_13060_4:1;
    u32 unk_13060_5:1;
    u32 unk_13060_6:1;
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
void ov63_0221CA1C(RegisterHallOfFameData *data, RegisterHofMon *mon);
void ov63_0221CB48(RegisterHallOfFameData *data);
void ov63_0221CB94(RegisterHallOfFameData *data, RegisterHofMon *hofMon, int a2);
void ov63_0221CC78(RegisterHallOfFameData *data);
void ov63_0221CE94(RegisterHallOfFameData *data, u16 a1, int a2);
void ov63_0221D20C(RegisterHallOfFameData *data, int a1);
void ov63_0221D21C(RegisterHallOfFameData *data);
void ov63_0221D240(RegisterHallOfFameData *data, int a1);
void ov63_0221D2F8(RegisterHallOfFameData *data, RegisterHofMon *mon);
void ov63_0221CD40(RegisterHallOfFameData *data);
void ov63_0221CD68(RegisterHallOfFameData *data);
void ov63_0221CDF8(RegisterHallOfFameData *data);
void ov63_0221CE7C(RegisterHallOfFameData *data);
void ov63_0221D21C(RegisterHallOfFameData *data);
void ov63_0221D344(RegisterHallOfFameData *data);
BOOL RegisterHallOfFame_ShowMon_LeftSide(RegisterHallOfFameData *data);
BOOL RegisterHallOfFame_ShowMon_RightSide(RegisterHallOfFameData *data);
void ov63_0221E114(RegisterHallOfFameData *data);
int ov63_0221E310(RegisterHallOfFameData *data, Pokemon *pokemon, PlayerProfile *profile);
int ov63_0221E404(int a0, u8 a1, u8 a2);
void ov63_0221E450(RegisterHallOfFameData *data, int a1, int a2, int a3, int a4);
void ov63_0221E4E0(SysTask *task, void *taskData);
void ov63_0221E55C(RegisterHallOfFameData *data, u16 a1, u16 a2);
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
void ov63_0221F130(RegisterHallOfFameData *data);
void ov63_0221F1C4(RegisterHallOfFameData *data);
void ov63_0221F1D0(RegisterHallOfFameData *data);
SysTask *ov63_0221F238(RegisterHallOfFameData *data);
void ov63_0221F324(SysTask *task, int a1, fx32 a2);
void ov63_0221F580(SysTask *task);
void ov63_0221F5B4(SysTask *task);
BOOL ov63_0221F600(RegisterHallOfFameData *data);
SysTask *ov63_0221F614(RegisterHallOfFameData *data);
void ov63_0221F7DC(SysTask *task);
void ov63_0221F7C4(SysTask *task);
void ov63_0221FAA0(SysTask *task);

extern const WindowTemplate ov63_0221FB20[2];
extern const u16 ov63_0221FC58[16];
extern const u16 ov63_0221FC78[16];
extern const u16 ov63_0221FC98[16];
extern RegisterHallOfFameScene (*const sSceneFuncs[])(RegisterHallOfFameData *data);  // 0221FD18
extern const GraphicsBanks ov63_0221FD58;
extern const WindowTemplate ov63_0221FD80[7];
extern const UnkStruct_0221C610 ov63_0221FDB8[27];
extern const UnkTemplate_0200D748 ov63_0221FF68[6];
extern const UnkTemplate_0200D748 ov63_022200A0[15];

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
            UnkImageStruct_SetSpriteVisibleFlag(data->unk_000A4[12], TRUE);
            UnkImageStruct_SetSpriteVisibleFlag(data->unk_000A4[13], TRUE);
            for (int i = 0; i < data->unk_13048; ++i) {
                ov63_0221C9E0(data, i, i);
                sub_0200E024(data->unk_000A4[i], 1.0f, 1.0f);
                UnkImageStruct_SetSpriteVisibleFlag(data->unk_000A4[6 + i], TRUE);
                sub_0200E0FC(data->unk_000A4[i], GX_OAM_MODE_NORMAL);
                sub_0200E0FC(data->unk_000A4[6 + i], GX_OAM_MODE_XLU);
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
    if (mon->tsure_param[1]) {
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
    int sp10 = hofMon->tsure_param[1] ? 8 : 4;
    u32 size = 32 * sp10 * sp10;
    int fileno = ov63_0221E404(hofMon->species, hofMon->form, hofMon->gender);
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

void ov63_0221CC78(RegisterHallOfFameData *data) {
    {
        extern const GraphicsModes ov63_0221FB10;
        GraphicsModes graphicsModes = ov63_0221FB10;
        SetBothScreensModesAndDisable(&graphicsModes);
    }

    {
        extern const BgTemplate ov63_0221FBAC;
        BgTemplate bgTemplate = ov63_0221FBAC;
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_MAIN_0, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_MAIN_0);
        BG_ClearCharDataRange(GF_BG_LYR_MAIN_0, 0x20, 0x0000, HEAP_ID_REGISTER_HALL_OF_FAME);
    }

    {
        extern const BgTemplate ov63_0221FBC8;
        BgTemplate bgTemplate = ov63_0221FBC8;
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_MAIN_1, &bgTemplate, GF_BG_TYPE_TEXT);
    }

    {
        extern const BgTemplate ov63_0221FB74;
        BgTemplate bgTemplate = ov63_0221FB74;
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_MAIN_2, &bgTemplate, GF_BG_TYPE_TEXT);
    }

    {
        extern const BgTemplate ov63_0221FC1C;
        BgTemplate bgTemplate = ov63_0221FC1C;
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_MAIN_3, &bgTemplate, GF_BG_TYPE_TEXT);
    }
}

void ov63_0221CD40(RegisterHallOfFameData *data) {
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_MAIN_3);
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_MAIN_2);
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_MAIN_1);
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_MAIN_0);
}

void ov63_0221CD68(RegisterHallOfFameData *data) {
    GfGfxLoader_LoadScrnDataFromOpenNarc(data->unk_00094, 0, data->bgConfig, GF_BG_LYR_MAIN_1, 0, 0, TRUE, HEAP_ID_REGISTER_HALL_OF_FAME);
    GfGfxLoader_LoadScrnDataFromOpenNarc(data->unk_00094, 1, data->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, TRUE, HEAP_ID_REGISTER_HALL_OF_FAME);
    GfGfxLoader_LoadScrnDataFromOpenNarc(data->unk_00094, 2, data->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, TRUE, HEAP_ID_REGISTER_HALL_OF_FAME);
    GfGfxLoader_LoadCharDataFromOpenNarc(data->unk_00094, 3, data->bgConfig, GF_BG_LYR_MAIN_1, 0, 0, TRUE, HEAP_ID_REGISTER_HALL_OF_FAME);
    GfGfxLoader_GXLoadPalFromOpenNarc(data->unk_00094, 4, GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)0, 0x20, HEAP_ID_REGISTER_HALL_OF_FAME);
}

void ov63_0221CDF8(RegisterHallOfFameData *data) {
    for (int i = 0; i < 7u; ++i) {
        AddWindow(data->bgConfig, &data->unk_00014[i], &ov63_0221FD80[i]);
    }

    FillWindowPixelBuffer(&data->unk_00014[0], 0);
    ReadMsgDataIntoString(data->msgData, msg_0180_00000, data->unk_0008C);  // The Hall of Fame!
    AddTextPrinterParameterizedWithColor(&data->unk_00014[0], 0, data->unk_0008C, 128 - FontID_String_GetWidth(0, data->unk_0008C, 0) / 2, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 2, 0), NULL);
    CopyWindowPixelsToVram_TextMode(&data->unk_00014[0]);
}

void ov63_0221CE7C(RegisterHallOfFameData *data) {
    for (int i = 0; i < 7u; ++i) {
        RemoveWindow(&data->unk_00014[i]);
    }
}

void ov63_0221CE94(RegisterHallOfFameData *data, u16 a1, int a2) {
    Window *windows = &data->unk_00014[a2];
    RegisterHofMon *hofMon = &data->unk_00100[a1];
    Pokemon *mon = hofMon->mon;
    BoxPokemon *boxmon = Mon_GetBoxMon(mon);

    FillWindowPixelBuffer(&windows[0], 0);
    ReadMsgDataIntoString(data->msgData, msg_0180_00004, data->unk_0008C);
    BufferBoxMonNickname(data->msgFormat, 0, boxmon);
    StringExpandPlaceholders(data->msgFormat, data->unk_00090, data->unk_0008C);
    AddTextPrinterParameterizedWithColor(&windows[0], 0, data->unk_00090, 2, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 2, 0), NULL);
    CopyWindowPixelsToVram_TextMode(&windows[0]);

    FillWindowPixelBuffer(&windows[1], 0);
    if (hofMon->gender == 2 || hofMon->printGender == 0) {
        ReadMsgDataIntoString(data->msgData, msg_0180_00003, data->unk_0008C);
    } else if (hofMon->gender == 0) {
        ReadMsgDataIntoString(data->msgData, msg_0180_00001, data->unk_0008C);
    } else if (hofMon->gender == 1) {
        ReadMsgDataIntoString(data->msgData, msg_0180_00002, data->unk_0008C);
    } else {
        ReadMsgDataIntoString(data->msgData, msg_0180_00003, data->unk_0008C);
    }
    BufferBoxMonSpeciesName(data->msgFormat, 0, boxmon);
    StringExpandPlaceholders(data->msgFormat, data->unk_00090, data->unk_0008C);
    AddTextPrinterParameterizedWithColor(&windows[1], 0, data->unk_00090, 2, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 2, 0), NULL);

    ReadMsgDataIntoString(data->msgData, msg_0180_00005, data->unk_0008C);
    BufferIntegerAsString(data->msgFormat, 0, hofMon->level, 3, PRINTING_MODE_LEFT_ALIGN, TRUE);
    StringExpandPlaceholders(data->msgFormat, data->unk_00090, data->unk_0008C);
    AddTextPrinterParameterizedWithColor(&windows[1], 0, data->unk_00090, 2, 16, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 2, 0), NULL);
    CopyWindowPixelsToVram_TextMode(&windows[1]);

    FillWindowPixelBuffer(&windows[2], 0);
    ReadMsgDataIntoString(data->msgData, msg_0180_00006, data->unk_0008C);
    BufferBoxMonOTName(data->msgFormat, 0, boxmon);
    StringExpandPlaceholders(data->msgFormat, data->unk_00090, data->unk_0008C);
    AddTextPrinterParameterizedWithColor(&windows[2], 0, data->unk_00090, 2, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 2, 0), NULL);

    switch (ov63_0221E310(data, mon, data->args->profile)) {
    case 0:
        ReadMsgDataIntoString(data->msgData, msg_0180_00007, data->unk_0008C);
        BufferLandmarkName(data->msgFormat, 0, hofMon->metLocation);
        StringExpandPlaceholders(data->msgFormat, data->unk_00090, data->unk_0008C);
        break;
    case 1:
        ReadMsgDataIntoString(data->msgData, msg_0180_00008, data->unk_0008C);
        BufferLandmarkName(data->msgFormat, 0, hofMon->metLocation);
        StringExpandPlaceholders(data->msgFormat, data->unk_00090, data->unk_0008C);
        break;
    case 2:
        ReadMsgDataIntoString(data->msgData, msg_0180_00009, data->unk_00090);
        break;
    case 3:
        ReadMsgDataIntoString(data->msgData, msg_0180_00010, data->unk_00090);
        break;
    case 4:
        ReadMsgDataIntoString(data->msgData, msg_0180_00011, data->unk_00090);
        break;
    case 5:
        ReadMsgDataIntoString(data->msgData, msg_0180_00014, data->unk_00090);
        break;
    case 6:
        ReadMsgDataIntoString(data->msgData, msg_0180_00012, data->unk_00090);
        break;
    case 7:
        ReadMsgDataIntoString(data->msgData, msg_0180_00013, data->unk_00090);
        break;
    case 8:
    case 9:
        ReadMsgDataIntoString(data->msgData, msg_0180_00015, data->unk_0008C);
        BufferLandmarkName(data->msgFormat, 0, hofMon->metLocation);
        StringExpandPlaceholders(data->msgFormat, data->unk_00090, data->unk_0008C);
        break;
    }
    AddTextPrinterParameterizedWithColor(&windows[2], 0, data->unk_00090, 2, 24, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 2, 0), NULL);
    CopyWindowPixelsToVram_TextMode(&windows[2]);
}

void ov63_0221D20C(RegisterHallOfFameData *data, int a1) {
    ov63_0221D240(data, a1);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
}

void ov63_0221D21C(RegisterHallOfFameData *data) {
    for (u32 i = 0; i < 15u; ++i) {
        ov63_0221C134(data, i);
    }
    ov63_0221CB48(data);
    ov63_0221C85C(data);
}

void ov63_0221D240(RegisterHallOfFameData *data, int a1) {
    RegisterHofMon *hofMon = &data->unk_00100[a1];
    ov63_0221C6FC(data);
    ov63_0221CA1C(data, hofMon);
    for (int i = 0; i <= 5u; ++i) {
        data->unk_000A4[i] = SpriteRenderer_LoadResourcesAndCreateSprite(data->spriteRenderer, data->spriteGfxHandler, &ov63_0221FF68[i]);
    }
    ov63_0221C8E8(data, hofMon, 2, 0);
    ov63_0221C8E8(data, hofMon, 0, 2);
    ov63_0221CB94(data, hofMon, 4);
    if (hofMon->species == SPECIES_KRABBY || hofMon->species == SPECIES_KINGLER) {
        ov63_0221C16C(data, 4, 2);
        ov63_0221C16C(data, 5, 2);
    }
    ov63_0221C954(data, 1, 0);
    ov63_0221C954(data, 3, 0);
    ov63_0221C954(data, 5, 0);
}

void ov63_0221D2F8(RegisterHallOfFameData *data, RegisterHofMon *mon) {
    if (mon->tsure_param[1]) {
        UnkImageStruct_AddSpritePositionXY(data->unk_000A4[4], -32, -32);
        UnkImageStruct_AddSpritePositionXY(data->unk_000A4[5], -32, -32);
    } else {
        UnkImageStruct_AddSpritePositionXY(data->unk_000A4[4], -16, -16);
        UnkImageStruct_AddSpritePositionXY(data->unk_000A4[5], -16, -16);
    }
}

void ov63_0221D344(RegisterHallOfFameData *data) {
    RegisterHofMon *hofMon = &data->unk_00100[data->unk_13056];

    ov63_0221D20C(data, data->unk_13056);
    BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_MAIN_0);
    ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_SET_X, 0);
    ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_SET_Y, 0);
    if ((data->unk_13056 & 1) == 0) {
        ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_1, BG_POS_OP_SET_X, 0);
        ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_1, BG_POS_OP_SET_Y, 0);
        ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_X, 0);
        ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_Y, 0);
        ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SET_X, 0);
        ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SET_Y, 0);
        UnkImageStruct_SetSpritePositionXY(data->unk_000A4[0], 256, -40);
        UnkImageStruct_SetSpritePositionXY(data->unk_000A4[1], 296, -80);
        UnkImageStruct_SetSpritePositionXY(data->unk_000A4[2], 288, 152 + hofMon->unk_0013);
        UnkImageStruct_SetSpritePositionXY(data->unk_000A4[3], 296, 152 + hofMon->unk_0013);
        UnkImageStruct_SetSpritePositionXY(data->unk_000A4[4], -82, -2);
        UnkImageStruct_SetSpritePositionXY(data->unk_000A4[5], -89, -3);
        ov63_0221CE94(data, data->unk_13056, 1);
    } else {
        ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_1, BG_POS_OP_SET_X, 0);
        ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_1, BG_POS_OP_SET_Y, 256);
        ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_X, -184);
        ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_Y, 0);
        ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SET_X, 256);
        ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SET_Y, 0);
        UnkImageStruct_SetSpritePositionXY(data->unk_000A4[0], 0, -40);
        UnkImageStruct_SetSpritePositionXY(data->unk_000A4[1], -40, -80);
        UnkImageStruct_SetSpritePositionXY(data->unk_000A4[2], -80, 152 + hofMon->unk_0013);
        UnkImageStruct_SetSpritePositionXY(data->unk_000A4[3], -92, 152 + hofMon->unk_0013);
        UnkImageStruct_SetSpritePositionXY(data->unk_000A4[4], 338, -2);
        UnkImageStruct_SetSpritePositionXY(data->unk_000A4[5], 345, -3);
        ov63_0221CE94(data, data->unk_13056, 4);
    }
    sub_0200DF98(data->unk_000A4[0], 2);
    sub_0200DF98(data->unk_000A4[1], 2);
    sub_0200E024(data->unk_000A4[1], 1.5, 1.5);
    ov63_0221D2F8(data, hofMon);
    ScheduleBgTilemapBufferTransfer(data->bgConfig, GF_BG_LYR_MAIN_0);
}

// Lord help me with this, just under 700 lines of asm
BOOL RegisterHallOfFame_ShowMon_LeftSide(RegisterHallOfFameData *data) {
    switch (data->unk_0000E) {
    case 0:
        if (data->unk_0000C == 10) {
            u8 r5 = data->unk_00100[data->unk_13056].unk_0013;
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_1, BG_POS_OP_SET_X, -72);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_X, 72);
            UnkImageStruct_SetSpritePositionXY(data->unk_000A4[2], 48, r5 + 152);
            UnkImageStruct_SetSpritePositionXY(data->unk_000A4[3], 46, r5 + 152);
            data->unk_0000C = 0;
            ++data->unk_0000E;
        } else {
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_1, BG_POS_OP_SUB_X, 7);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_ADD_X, 7);
            UnkImageStruct_AddSpritePositionXY(data->unk_000A4[2], -24, 0);
            UnkImageStruct_AddSpritePositionXY(data->unk_000A4[3], -25, 0);
            ++data->unk_0000C;
        }
        break;
    case 1:
        data->unk_13060_1 = TRUE;
        ++data->unk_0000E;
        break;
    case 2:
        if (data->unk_0000C == 50) {
            data->unk_0000C = 0;
            ++data->unk_0000E;
        } else {
            ++data->unk_0000C;
        }
        break;
    case 3:
        if (data->unk_0000C == 6) {
            UnkImageStruct_SetSpritePositionXY(data->unk_000A4[4], 32, 40);
            UnkImageStruct_SetSpritePositionXY(data->unk_000A4[5], 31, 39);
            ov63_0221D2F8(data, &data->unk_00100[data->unk_13056]);
            data->unk_0000C = 0;
            ++data->unk_0000E;
        } else {
            UnkImageStruct_AddSpritePositionXY(data->unk_000A4[4], 19, 7);
            UnkImageStruct_AddSpritePositionXY(data->unk_000A4[5], 20, 7);
            ++data->unk_0000C;
        }
        break;
    case 4:
        if (data->unk_00100[data->unk_13056].species == SPECIES_KRABBY || data->unk_00100[data->unk_13056].species == SPECIES_KINGLER) {
            ov63_0221C16C(data, 4, 3);
            ov63_0221C16C(data, 5, 3);
        } else {
            ov63_0221C16C(data, 4, 1);
            ov63_0221C16C(data, 5, 1);
        }
        ++data->unk_0000E;
        break;
    case 5:
        if (data->unk_0000C == 20) {
            data->unk_0000C = 0;
            ++data->unk_0000E;
        } else {
            ++data->unk_0000C;
        }
        break;
    case 6:
        ScheduleWindowCopyToVram(&data->unk_00014[0]);
        ++data->unk_0000E;
        break;
    case 7:
        if (data->unk_0000C == 60) {
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_X, -16);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_Y, 256);
            UnkImageStruct_SetSpritePriority(data->unk_000A4[2], 2);
            UnkImageStruct_SetSpritePriority(data->unk_000A4[3], 2);
            data->unk_0000C = 0;
            ++data->unk_0000E;
        } else {
            ++data->unk_0000C;
        }
        break;
    case 8:
        if (data->unk_0000C == 8) {
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_X, 112);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_Y, 192);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SET_Y, 256);
            UnkImageStruct_SetSpritePositionXY(data->unk_000A4[0], 88, 88);
            UnkImageStruct_SetSpritePositionXY(data->unk_000A4[1], 104, 72);
            data->unk_0000C = 0;
            ++data->unk_0000E;
        } else {
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_ADD_X, 16);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SUB_Y, 8);
            UnkImageStruct_AddSpritePositionXY(data->unk_000A4[0], -21, 16);
            UnkImageStruct_AddSpritePositionXY(data->unk_000A4[1], -24, 19);
            ++data->unk_0000C;
        }
        break;
    case 9:
        ScheduleWindowCopyToVram(&data->unk_00014[1]);
        ov63_0221C954(data, 2, 0);
        ov63_0221C954(data, 4, 0);
        ov63_0221C954(data, 3, 2);
        ov63_0221C954(data, 5, 2);
        ++data->unk_0000E;
        break;
    case 10:
        if (data->unk_0000C == 40) {
            data->unk_0000C = 0;
            ++data->unk_0000E;
        } else {
            ++data->unk_0000C;
        }
        break;
    case 11:
        ScheduleWindowCopyToVram(&data->unk_00014[2]);
        data->unk_13060_0 = TRUE;
        ++data->unk_0000E;
        break;
    case 12:
        if (data->unk_0000C == 20) {
            data->unk_0000C = 0;
            ++data->unk_0000E;
        } else {
            ++data->unk_0000C;
        }
        break;
    case 13:
        ScheduleWindowCopyToVram(&data->unk_00014[3]);
        ++data->unk_0000E;
        break;
    case 14:
        if (data->unk_0000C == 240) {
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_X, 72);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_Y, 0);
            UnkImageStruct_SetSpritePriority(data->unk_000A4[0], 3);
            UnkImageStruct_SetSpritePriority(data->unk_000A4[1], 3);
            UnkImageStruct_SetSpritePriority(data->unk_000A4[2], 3);
            UnkImageStruct_SetSpritePriority(data->unk_000A4[3], 3);
            UnkImageStruct_SetSpritePriority(data->unk_000A4[4], 3);
            UnkImageStruct_SetSpritePriority(data->unk_000A4[5], 3);
            data->unk_13058 = 1.0f;
            data->unk_1305C = 1.5f;
            data->unk_0000C = 0;
            ++data->unk_0000E;
        } else {
            ++data->unk_0000C;
        }
        break;
    case 15:
        if (data->unk_0000C == 10) {
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_SET_X, -80);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_SET_Y, -200);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_1, BG_POS_OP_SET_X, 0);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_X, 0);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SET_X, 60);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SET_Y, 226);
            UnkImageStruct_SetSpritePositionXY(data->unk_000A4[2], 148, 252);
            UnkImageStruct_SetSpritePositionXY(data->unk_000A4[3], 64, 192);
            UnkImageStruct_SetSpritePositionXY(data->unk_000A4[4], -28, -30);
            UnkImageStruct_SetSpritePositionXY(data->unk_000A4[5], -29, -31);
            UnkImageStruct_SetSpritePositionXY(data->unk_000A4[0], 48, 128);
            UnkImageStruct_SetSpritePositionXY(data->unk_000A4[1], 64, 112);
            sub_0200E024(data->unk_000A4[0], 1.8f, 1.8f);
            sub_0200E024(data->unk_000A4[1], 2.0f, 2.0f);
            data->unk_0000C = 0;
            ++data->unk_0000E;
        } else {
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_SUB_X, 8);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_ADD_Y, 20);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_1, BG_POS_OP_ADD_X, 7);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SUB_X, 7);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_ADD_X, 6);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SUB_Y, 3);
            UnkImageStruct_AddSpritePositionXY(data->unk_000A4[2], 10, 10);
            UnkImageStruct_AddSpritePositionXY(data->unk_000A4[3], 10, 10);
            UnkImageStruct_AddSpritePositionXY(data->unk_000A4[4], -6, -7);
            UnkImageStruct_AddSpritePositionXY(data->unk_000A4[5], -6, -7);
            UnkImageStruct_AddSpritePositionXY(data->unk_000A4[0], -4, 4);
            UnkImageStruct_AddSpritePositionXY(data->unk_000A4[1], -4, 4);
            data->unk_13058 += 0.08;
            data->unk_1305C += 0.05;
            sub_0200E024(data->unk_000A4[0], data->unk_13058, data->unk_13058);
            sub_0200E024(data->unk_000A4[1], data->unk_1305C, data->unk_1305C);
            ++data->unk_0000C;
        }
        break;
    case 16:
        if (data->unk_0000C == 60) {
            return FALSE;
        } else {
            ++data->unk_0000C;
        }
        break;
    }

    return TRUE;
}

// Lord help me with this, just under 700 lines of asm
BOOL RegisterHallOfFame_ShowMon_RightSide(RegisterHallOfFameData *data) {
    switch (data->unk_0000E) {
    case 0:
        if (data->unk_0000C == 10) {
            u8 r5 = data->unk_00100[data->unk_13056].unk_0013;
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_1, BG_POS_OP_SET_X, 72);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_X, -256);
            UnkImageStruct_SetSpritePositionXY(data->unk_000A4[2], 160, r5 + 152);
            UnkImageStruct_SetSpritePositionXY(data->unk_000A4[3], 158, r5 + 152);
            data->unk_0000C = 0;
            ++data->unk_0000E;
        } else {
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_1, BG_POS_OP_ADD_X, 7);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SUB_X, 7);
            UnkImageStruct_AddSpritePositionXY(data->unk_000A4[2], 24, 0);
            UnkImageStruct_AddSpritePositionXY(data->unk_000A4[3], 25, 0);
            ++data->unk_0000C;
        }
        break;
    case 1:
        data->unk_13060_1 = TRUE;
        ++data->unk_0000E;
        break;
    case 2:
        if (data->unk_0000C == 50) {
            data->unk_0000C = 0;
            ++data->unk_0000E;
        } else {
            ++data->unk_0000C;
        }
        break;
    case 3:
        if (data->unk_0000C == 6) {
            UnkImageStruct_SetSpritePositionXY(data->unk_000A4[4], 224, 40);
            UnkImageStruct_SetSpritePositionXY(data->unk_000A4[5], 225, 39);
            ov63_0221D2F8(data, &data->unk_00100[data->unk_13056]);
            data->unk_0000C = 0;
            ++data->unk_0000E;
        } else {
            UnkImageStruct_AddSpritePositionXY(data->unk_000A4[4], -19, 7);
            UnkImageStruct_AddSpritePositionXY(data->unk_000A4[5], -20, 7);
            ++data->unk_0000C;
        }
        break;
    case 4:
        if (data->unk_00100[data->unk_13056].species == 98 || data->unk_00100[data->unk_13056].species == 99) {
            ov63_0221C16C(data, 4, 3);
            ov63_0221C16C(data, 5, 3);
        } else {
            ov63_0221C16C(data, 4, 1);
            ov63_0221C16C(data, 5, 1);
        }
        ++data->unk_0000E;
        break;
    case 5:
        if (data->unk_0000C == 20) {
            data->unk_0000C = 0;
            ++data->unk_0000E;
        } else {
            ++data->unk_0000C;
        }
        break;
    case 6:
        ScheduleWindowCopyToVram(&data->unk_00014[0]);
        ++data->unk_0000E;
        break;
    case 7:
        if (data->unk_0000C == 60) {
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_X, 272);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_Y, 256);
            UnkImageStruct_SetSpritePriority(data->unk_000A4[2], 2);
            UnkImageStruct_SetSpritePriority(data->unk_000A4[3], 2);
            data->unk_0000C = 0;
            ++data->unk_0000E;
        } else {
            ++data->unk_0000C;
        }
        break;
    case 8:
        if (data->unk_0000C == 8) {
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_X, 144);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_Y, 192);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SET_Y, 256);
            UnkImageStruct_SetSpritePositionXY(data->unk_000A4[0], 168, 88);
            UnkImageStruct_SetSpritePositionXY(data->unk_000A4[1], 152, 72);
            data->unk_0000C = 0;
            ++data->unk_0000E;
        } else {
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SUB_X, 16);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SUB_Y, 8);
            UnkImageStruct_AddSpritePositionXY(data->unk_000A4[0], 21, 16);
            UnkImageStruct_AddSpritePositionXY(data->unk_000A4[1], 24, 19);
            ++data->unk_0000C;
        }
        break;
    case 9:
        ScheduleWindowCopyToVram(&data->unk_00014[4]);
        ov63_0221C954(data, 2, 0);
        ov63_0221C954(data, 4, 0);
        ov63_0221C954(data, 3, 2);
        ov63_0221C954(data, 5, 2);
        ++data->unk_0000E;
        break;
    case 10:
        if (data->unk_0000C == 40) {
            data->unk_0000C = 0;
            ++data->unk_0000E;
        } else {
            ++data->unk_0000C;
        }
        break;
    case 11:
        ScheduleWindowCopyToVram(&data->unk_00014[5]);
        data->unk_13060_0 = TRUE;
        ++data->unk_0000E;
        break;
    case 12:
        if (data->unk_0000C == 20) {
            data->unk_0000C = 0;
            ++data->unk_0000E;
        } else {
            ++data->unk_0000C;
        }
        break;
    case 13:
        ScheduleWindowCopyToVram(&data->unk_00014[6]);
        ++data->unk_0000E;
        break;
    case 14:
        if (data->unk_0000C == 240) {
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_X, -256);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_Y, 0);
            UnkImageStruct_SetSpritePriority(data->unk_000A4[0], 3);
            UnkImageStruct_SetSpritePriority(data->unk_000A4[1], 3);
            UnkImageStruct_SetSpritePriority(data->unk_000A4[2], 3);
            UnkImageStruct_SetSpritePriority(data->unk_000A4[3], 3);
            UnkImageStruct_SetSpritePriority(data->unk_000A4[4], 3);
            UnkImageStruct_SetSpritePriority(data->unk_000A4[5], 3);
            data->unk_13058 = 1.0f;
            data->unk_1305C = 1.5f;
            data->unk_0000C = 0;
            ++data->unk_0000E;
        } else {
            ++data->unk_0000C;
        }
        break;
    case 15:
        if (data->unk_0000C == 10) {
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_SET_X, 80);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_SET_Y, -200);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_1, BG_POS_OP_SET_X, 0);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_X, -184);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SET_X, 196);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SET_Y, 226);
            UnkImageStruct_SetSpritePositionXY(data->unk_000A4[2], 260, 252);
            UnkImageStruct_SetSpritePositionXY(data->unk_000A4[3], 192, 192);
            UnkImageStruct_SetSpritePositionXY(data->unk_000A4[4], 164, -30);
            UnkImageStruct_SetSpritePositionXY(data->unk_000A4[5], 165, -31);
            UnkImageStruct_SetSpritePositionXY(data->unk_000A4[0], 208, 128);
            UnkImageStruct_SetSpritePositionXY(data->unk_000A4[1], 192, 112);
            sub_0200E024(data->unk_000A4[0], 1.8f, 1.8f);
            sub_0200E024(data->unk_000A4[1], 2.0f, 2.0f);
            data->unk_0000C = 0;
            ++data->unk_0000E;
        } else {
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_ADD_X, 8);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_ADD_Y, 20);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_1, BG_POS_OP_SUB_X, 7);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_ADD_X, 7);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SUB_X, 6);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SUB_Y, 3);
            UnkImageStruct_AddSpritePositionXY(data->unk_000A4[2], -10, 10);
            UnkImageStruct_AddSpritePositionXY(data->unk_000A4[3], -10, 10);
            UnkImageStruct_AddSpritePositionXY(data->unk_000A4[4], 6, -7);
            UnkImageStruct_AddSpritePositionXY(data->unk_000A4[5], 6, -7);
            UnkImageStruct_AddSpritePositionXY(data->unk_000A4[0], 4, 4);
            UnkImageStruct_AddSpritePositionXY(data->unk_000A4[1], 4, 4);
            data->unk_13058 += 0.08;
            data->unk_1305C += 0.05;
            sub_0200E024(data->unk_000A4[0], data->unk_13058, data->unk_13058);
            sub_0200E024(data->unk_000A4[1], data->unk_1305C, data->unk_1305C);
            ++data->unk_0000C;
        }
        break;
    case 16:
        if (data->unk_0000C == 60) {
            return FALSE;
        } else {
            ++data->unk_0000C;
        }
        break;
    }

    return TRUE;
}

void ov63_0221E114(RegisterHallOfFameData *data) {
    extern const UnkStruct_02014E30 ov63_0221FC38[2];

    u32 i;
    SomeDrawPokemonStruct sp40;
    UnkStruct_02014E30 sp20[2];
    {
        struct tmp {
            UnkStruct_02014E30 _[2];
        };
        *(struct tmp *)sp20 = *(const struct tmp *)ov63_0221FC38;
    }
    NARC *narc = NARC_New(NARC_a_1_8_0, HEAP_ID_REGISTER_HALL_OF_FAME);
    BOOL encry;
    Pokemon *pokemon;
    RegisterHofMon *hofMon;

    for (i = 0; i < Party_GetCount(data->args->party); ++i) {
        pokemon = Party_GetMonByIndex(data->args->party, i);
        encry = AcquireMonLock(pokemon);
        if (!GetMonData(pokemon, MON_DATA_IS_EGG, NULL)) {
            hofMon = &data->unk_00100[data->unk_13048];
            hofMon->mon = pokemon;
            hofMon->species = GetMonData(pokemon, MON_DATA_SPECIES, NULL);
            hofMon->personality = GetMonData(pokemon, MON_DATA_PERSONALITY, NULL);
            hofMon->form = GetMonData(pokemon, MON_DATA_FORM, NULL);
            hofMon->gender = GetMonData(pokemon, MON_DATA_GENDER, NULL);
            hofMon->unk_0013 = sub_020708D8(hofMon->species, hofMon->gender, 0, hofMon->form, hofMon->personality) + 8;
            hofMon->metLocation = GetMonData(pokemon, MON_DATA_MET_LOCATION, NULL);
            hofMon->level = GetMonData(pokemon, MON_DATA_LEVEL, NULL);
            hofMon->partyIndex = i;
            if (hofMon->species == SPECIES_NIDORAN_F || hofMon->species == SPECIES_NIDORAN_M) {
                hofMon->printGender = FALSE;
            } else {
                hofMon->printGender = TRUE;
            }
            ReadWholeNarcMemberByIdPair(hofMon->tsure_param, NARC_fielddata_tsurepoke_tp_param, SpeciesToOverworldModelIndexOffset(hofMon->species));
            GetPokemonSpriteCharAndPlttNarcIds(&sp40, pokemon, 2);
            sub_02014510((NarcId)sp40.narcID, sp40.charDataID, HEAP_ID_REGISTER_HALL_OF_FAME, &sp20[0], hofMon->unk_006C, hofMon->personality, 1, 2, hofMon->species);
            sub_02014510((NarcId)sp40.narcID, sp40.charDataID, HEAP_ID_REGISTER_HALL_OF_FAME, &sp20[1], hofMon->unk_0CEC, hofMon->personality, 1, 2, hofMon->species);
            GetPokemonSpriteCharAndPlttNarcIds(&sp40, pokemon, 0);
            sub_02014510((NarcId)sp40.narcID, sp40.charDataID, HEAP_ID_REGISTER_HALL_OF_FAME, &sp20[0], hofMon->unk_196C, hofMon->personality, 1, 0, hofMon->species);
            sub_02014510((NarcId)sp40.narcID, sp40.charDataID, HEAP_ID_REGISTER_HALL_OF_FAME, &sp20[1], hofMon->unk_25EC, hofMon->personality, 1, 0, hofMon->species);
            sub_02072914(narc, hofMon->unk_001C, hofMon->species, 1);
            sub_02072914(narc, hofMon->unk_0044, hofMon->species, 0);
            ++data->unk_13048;
        }
        ReleaseMonLock(pokemon, encry);
    }
    NARC_Delete(narc);
}

int ov63_0221E310(RegisterHallOfFameData *data, Pokemon *pokemon, PlayerProfile *profile) {
    BOOL encry = AcquireMonLock(pokemon);
    int ret;
    int version = GetMonData(pokemon, MON_DATA_GAME_VERSION, NULL);
    if (version == VERSION_SAPPHIRE || version == VERSION_RUBY || version == VERSION_EMERALD) {
        ret = 4;
    } else if (version == VERSION_FIRE_RED || version == VERSION_LEAF_GREEN) {
        ret = 3;
    } else if (version == VERSION_GAMECUBE) {
        ret = 6;
    } else if (version == VERSION_DIAMOND || version == VERSION_PEARL || version == VERSION_PLATINUM) {
        ret = 5;
    } else if (GetMonData(pokemon, MON_DATA_FATEFUL_ENCOUNTER, NULL)) {
        ret = 7;
    } else if (MonIsInGameTradePoke(pokemon, NPC_TRADE_SHUCKIE_SHUCKLE) == TRUE) {
        ret = 8;
    } else if (MonIsInGameTradePoke(pokemon, NPC_TRADE_KENYA_SPEAROW) == TRUE) {
        ret = 9;
    } else if (PlayerProfile_GetTrainerID(profile) != GetMonData(pokemon, MON_DATA_OTID, NULL)) {
        ret = 2;
    } else {
        PlayerName_FlatToString(profile, data->unk_0008C);
        GetMonData(pokemon, MON_DATA_OT_NAME_2, data->unk_00090);
        if (String_Compare(data->unk_0008C, data->unk_00090)) {
            ret = 2;
        } else if (GetMonData(pokemon, MON_DATA_MET_LOCATION, NULL) >= METLOC_DAY_CARE_COUPLE) {
            ret = 7;
        } else if (GetMonData(pokemon, MON_DATA_EGG_MET_MONTH, NULL) == 0) {
            ret = 0;
        } else {
            ret = 1;
        }
    }
    ReleaseMonLock(pokemon, encry);
    return ret;
}

int ov63_0221E404(int species, u8 form, u8 gender) {
    int ret;

    if (species <= 0 || species > SPECIES_ARCEUS) {
        ret = NARC_mmodel_mmodel_00000001_bin;
    } else {
        ret = SpeciesToOverworldModelIndexOffset(species) + NARC_mmodel_mmodel_00000297_bin;
        if (OverworldModelLookupHasFemaleForm(species)) {
            if (gender == MON_FEMALE) {
                ++ret;
            }
        } else {
            if (form > OverworldModelLookupFormCount(species)) {
                form = 0;
            }
            ret += form;
        }
    }
    return ret;
}

typedef struct UnkStruct_ov63_0221E450 {
    RegisterHofMon *hofMon;
    UnkStruct_02009264 unk_04;
    NARC *unk_18;
    u16 *unk_1C;
    u32 unk_20;
    u16 unk_24;
    int unk_28;
} UnkStruct_ov63_0221E450;

void ov63_0221E450(RegisterHallOfFameData *data, int a1, int a2, int a3, int a4) {
    UnkStruct_ov63_0221E450 *r4 = AllocFromHeap(HEAP_ID_REGISTER_HALL_OF_FAME, sizeof(UnkStruct_ov63_0221E450));
    r4->hofMon = &data->unk_00100[a1];
    r4->unk_28 = a3;
    r4->unk_18 = data->unk_00098;
    r4->unk_20 = NNS_G2dGetImageLocation(sub_02024B1C(data->unk_000A4[a2]->sprite), NNS_G2D_VRAM_TYPE_2DMAIN);
    if (a4 == 2) {
        r4->unk_1C = r4->hofMon->unk_006C;
        r4->unk_24 = 1;
        sub_02009264(&r4->unk_04, r4->hofMon->unk_001C);
    } else {
        r4->unk_1C = r4->hofMon->unk_196C;
        r4->unk_24 = 0;
        sub_02009264(&r4->unk_04, r4->hofMon->unk_0044);
    }
    SysTask_CreateOnMainQueue(ov63_0221E4E0, r4, 0);
}

void ov63_0221E4E0(SysTask *task, void *taskData) {
    u8 sp4;
    UnkStruct_ov63_0221E450 *r4 = (UnkStruct_ov63_0221E450 *)taskData;
    if (r4->unk_28 == 1) {
        sub_020729A4(r4->unk_18, &sp4, r4->hofMon->species, r4->unk_24);
        if (r4->hofMon->species == SPECIES_CHATOT) {
            sub_02006EA0(NULL, 0, 100, 0, sp4);
        } else {
            sub_020062E0(r4->hofMon->species, sp4, r4->hofMon->form);
        }
        r4->unk_28 = 0;
    }
    int r0 = sub_02009284(&r4->unk_04);
    if (r0 >= 0) {
        ov63_0221C00C(&((u8 *)r4->unk_1C)[3200 * r0], r4->unk_20, 3200);
    } else {
        FreeToHeap(r4);
        SysTask_Destroy(task);
    }
}

void ov63_0221E55C(RegisterHallOfFameData *data, u16 a1, u16 a2) {
    if (a1 == a2) {
        G2_SetBlendAlpha(0, 28, 0, 0);
    } else {
        u32 ev = (0x100000u / a1 * a2) / 0x10000u;
        G2_SetBlendAlpha(4, 28, ev, 16 - ev);
    }
}

BOOL ov63_0221E5A0(RegisterHallOfFameData *data) {
    if (data->unk_13060_5 == TRUE) {
        ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SUB_X, 2);
    }
    if (data->unk_13060_6 == TRUE) {
        if (data->unk_1306A == data->unk_13068) {
            s16 x = LCRandom() % 224 + 16;
            s16 y = LCRandom() % 64 + 16;
            UnkImageStruct_SetSpritePositionXY(data->unk_000A4[14], x, y);
            ov63_0221C16C(data, 14, 0);
            data->unk_13068 = LCRandom() % 255 + 28;
            data->unk_1306A = 0;
        } else {
            ++data->unk_1306A;
        }
    }

    switch (data->unk_0000E) {
    case 0:
        if (data->unk_0000C == 20) {
            data->unk_0000C = 0;
            ++data->unk_0000E;
        } else {
            ++data->unk_0000C;
        }
        break;
    case 1:
        ov63_0221C610(data->unk_000A4[data->unk_13056], &ov63_0221FDB8[data->unk_13056], 6, data->unk_0000C);
        if (data->unk_0000C == 6) {
            sub_0200DF98(data->unk_000A4[data->unk_13056], 1);
            ++data->unk_13056;
            data->unk_0000C = 0;
            if (data->unk_13056 == 6) {
                data->unk_13056 = 0;
                ++data->unk_0000E;
            }
        } else {
            ++data->unk_0000C;
        }
        break;
    case 2:
        if (data->unk_0000C == 32) {
            data->unk_0000C = 0;
            ++data->unk_0000E;
        } else {
            ++data->unk_0000C;
        }
        break;
    case 3:
        data->unk_13064 = 40;
        data->unk_13060_3 = TRUE;
        data->unk_13060_2 = TRUE;
        data->unk_13060_5 = TRUE;
        data->unk_13060_6 = TRUE;
        UnkImageStruct_SetSpriteVisibleFlag(data->unk_000A4[14], TRUE);
        ++data->unk_0000E;
        break;
    case 4:
        ov63_0221E55C(data, 80, data->unk_0000C);
        for (int i = 0; i < data->unk_13048; ++i) {
            ov63_0221C610(data->unk_000A4[6 + i], &(ov63_0221FDB8 + 6)[i], 80, data->unk_0000C);
        }
        ov63_0221C610(data->unk_000A4[13], &ov63_0221FDB8[12], 80, data->unk_0000C);
        if (data->unk_0000C == 80) {
            data->unk_0000C = 0;
            ++data->unk_0000E;
        } else {
            ++data->unk_0000C;
        }
        break;
    case 5:
        if (IsPaletteFadeFinished() == TRUE) {
            if ((gSystem.newKeys & (PAD_BUTTON_A | PAD_BUTTON_B)) || System_GetTouchNew() == TRUE) {
                data->unk_13064 = 15;
                data->unk_13060_3 = TRUE;
                ++data->unk_0000E;
            }
        }
        break;
    case 6:
        ov63_0221E55C(data, 60, data->unk_0000C);
        if (data->unk_0000C == 30) {
            if (IsPaletteFadeFinished() == TRUE) {
                data->unk_13064 = 15;
                data->unk_13060_4 = TRUE;
                ++data->unk_0000E;
            }
        } else {
            ++data->unk_0000C;
        }
        // fallthrough
    case 7:
        for (int i = 0; i < data->unk_13048; ++i) {
            ov63_0221C610(data->unk_000A4[i], &(ov63_0221FDB8 + 13)[i], 60, data->unk_0000C);
            ov63_0221C610(data->unk_000A4[6 + i], &(ov63_0221FDB8 + 20)[i], 60, data->unk_0000C);
        }
        ov63_0221C610(data->unk_000A4[12], &ov63_0221FDB8[19], 60, data->unk_0000C);
        ov63_0221C610(data->unk_000A4[13], &ov63_0221FDB8[26], 60, data->unk_0000C);
        if (data->unk_0000E == 7) {
            if (data->unk_0000C == 60) {
                if (IsPaletteFadeFinished() == TRUE) {
                    data->unk_0000C = 0;
                    data->unk_0000E = 0;
                    return FALSE;
                }
            } else {
                ++data->unk_0000C;
            }
        }
        break;
    }

    return TRUE;
}

void ov63_0221E8AC(RegisterHallOfFameData *data) {
    BeginNormalPaletteFade(3, 1, 1, RGB_WHITE, data->unk_13064, 1, HEAP_ID_REGISTER_HALL_OF_FAME);
}

void ov63_0221E8D4(RegisterHallOfFameData *data) {
    BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, data->unk_13064, 1, HEAP_ID_REGISTER_HALL_OF_FAME);
}

void ov63_0221E8FC(SysTask *task, void *taskData) {
    RegisterHallOfFameData *data = (RegisterHallOfFameData *)taskData;
    if (data->unk_00008 != NULL && !data->unk_00008(data)) {
        data->unk_00008 = NULL;
    }
    ov63_0221F1D0(data);
    DoScheduledBgGpuUpdates(data->bgConfig);
    sub_0200D020(data->spriteGfxHandler);
    thunk_OamManager_ApplyAndResetBuffers();
    OS_SetIrqCheckFlag(OS_IE_V_BLANK);
}

void ov63_0221E940(RegisterHallOfFameData *data) {
    {
        extern const GraphicsModes ov63_0221FB00;
        GraphicsModes graphicsModes = ov63_0221FB00;
        SetBothScreensModesAndDisable(&graphicsModes);
    }

    {
        extern const BgTemplate ov63_0221FBE4;
        BgTemplate bgTemplate = ov63_0221FBE4;
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_MAIN_1, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_MAIN_1);
        BG_ClearCharDataRange(GF_BG_LYR_MAIN_1, 0x20, 0, HEAP_ID_REGISTER_HALL_OF_FAME);
    }

    {
        extern const BgTemplate ov63_0221FC00;
        BgTemplate bgTemplate = ov63_0221FC00;
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_MAIN_2, &bgTemplate, GF_BG_TYPE_TEXT);
    }

    {
        extern const BgTemplate ov63_0221FB90;
        BgTemplate bgTemplate = ov63_0221FB90;
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_MAIN_3, &bgTemplate, GF_BG_TYPE_TEXT);
    }

    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG2, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG3, GF_PLANE_TOGGLE_OFF);
}

void ov63_0221E9FC(RegisterHallOfFameData *data) {
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_MAIN_3);
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_MAIN_2);
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_MAIN_1);
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_MAIN_0);
}

void ov63_0221EA24(RegisterHallOfFameData *data) {
    GfGfxLoader_LoadScrnDataFromOpenNarc(data->unk_00094, 5, data->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, TRUE, HEAP_ID_REGISTER_HALL_OF_FAME);
    GfGfxLoader_LoadScrnDataFromOpenNarc(data->unk_00094, 6, data->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, TRUE, HEAP_ID_REGISTER_HALL_OF_FAME);
    GfGfxLoader_LoadCharDataFromOpenNarc(data->unk_00094, 7, data->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, TRUE, HEAP_ID_REGISTER_HALL_OF_FAME);
    GfGfxLoader_GXLoadPalFromOpenNarc(data->unk_00094, 8, GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)0, 0x20, HEAP_ID_REGISTER_HALL_OF_FAME);
    BG_SetMaskColor(GF_BG_LYR_MAIN_1, RGB_BLACK);
}

void ov63_0221EAA8(RegisterHallOfFameData *data) {
    for (int i = 0; i < 2u; ++i) {
        AddWindow(data->bgConfig, &data->unk_00014[i], &ov63_0221FB20[i]);
    }

    FillWindowPixelBuffer(&data->unk_00014[0], 1);
    ReadMsgDataIntoString(data->msgData, msg_0180_00016, data->unk_0008C);
    AddTextPrinterParameterizedWithColor(&data->unk_00014[0], 0, data->unk_0008C, 128 - FontID_String_GetWidth(0, data->unk_0008C, 0) / 2, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 2, 0), NULL);
    CopyWindowToVram(&data->unk_00014[0]);

    FillWindowPixelBuffer(&data->unk_00014[1], 1);
    ReadMsgDataIntoString(data->msgData, msg_0180_00017, data->unk_00090);
    BufferPlayersName(data->msgFormat, 0, data->args->profile);
    BufferIntegerAsString(data->msgFormat, 1, PlayerProfile_GetTrainerID_VisibleHalf(data->args->profile), 5, PRINTING_MODE_LEADING_ZEROS, TRUE);
    BufferIntegerAsString(data->msgFormat, 2, GetIGTHours(data->args->igt), 3, PRINTING_MODE_LEFT_ALIGN, TRUE);
    BufferIntegerAsString(data->msgFormat, 3, GetIGTMinutes(data->args->igt), 2, PRINTING_MODE_LEADING_ZEROS, TRUE);
    StringExpandPlaceholders(data->msgFormat, data->unk_0008C, data->unk_00090);
    AddTextPrinterParameterizedWithColor(&data->unk_00014[1], 0, data->unk_0008C, 128 - FontID_String_GetWidth(0, data->unk_0008C, 0) / 2, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 2, 0), NULL);
    CopyWindowToVram(&data->unk_00014[1]);
}

void ov63_0221EC04(RegisterHallOfFameData *data) {
    for (int i = 0; i < 2u; ++i) {
        RemoveWindow(&data->unk_00014[i]);
    }
}

void ov63_0221EC1C(RegisterHallOfFameData *data) {
    extern const UnkStruct_02014E30 ov63_0221FAF0;

    struct UnkStruct_02070D3C sp2C;
    UnkStruct_02014E30 sp1C = ov63_0221FAF0;
    NARC *narc = NARC_New(NARC_a_0_0_8, HEAP_ID_REGISTER_HALL_OF_FAME);
    u32 i;
    int tag;
    void *r4;

    SpriteRenderer_LoadCellResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, narc, 77, FALSE, 55512);
    SpriteRenderer_LoadAnimResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, narc, 78, FALSE, 55512);
    for (i = 0; i < 6; ++i) {
        tag = 55512 + i;
        SpriteRenderer_LoadCharResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, narc, 76, FALSE, NNS_G2D_VRAM_TYPE_2DMAIN, tag);
        SpriteRenderer_LoadPlttResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, narc, 75, FALSE, 1, NNS_G2D_VRAM_TYPE_2DMAIN, tag);
    }
    SpriteRenderer_LoadCharResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, narc, 76, FALSE, NNS_G2D_VRAM_TYPE_2DMAIN, 55519);
    SpriteRenderer_LoadPlttResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, narc, 75, FALSE, 1, NNS_G2D_VRAM_TYPE_2DMAIN, 55520);
    SpriteRenderer_LoadPlttResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, narc, 75, FALSE, 1, NNS_G2D_VRAM_TYPE_2DMAIN, 55521);
    NARC_Delete(narc);

    SpriteRenderer_LoadCellResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, data->unk_00094, 17, TRUE, 55515);
    SpriteRenderer_LoadAnimResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, data->unk_00094, 18, TRUE, 55515);
    SpriteRenderer_LoadCharResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, data->unk_00094, 16, TRUE, NNS_G2D_VRAM_TYPE_2DMAIN, 55520);
    SpriteRenderer_LoadPlttResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, data->unk_00094, 19, FALSE, 1, NNS_G2D_VRAM_TYPE_2DMAIN, 55522);

    for (i = 0; i < 6; ++i) {
        data->unk_000A4[i] = SpriteRenderer_LoadResourcesAndCreateSprite(data->spriteRenderer, data->spriteGfxHandler, &ov63_022200A0[i]);
        data->unk_000A4[6 + i] = SpriteRenderer_LoadResourcesAndCreateSprite(data->spriteRenderer, data->spriteGfxHandler, &ov63_022200A0[i + 6]);
        if (i < data->unk_13048) {
            ov63_0221C8E8(data, &data->unk_00100[i], 2, i);
        } else {
            UnkImageStruct_SetSpriteVisibleFlag(data->unk_000A4[i], FALSE);
        }
        ov63_0221C99C(data, i, i);
        ov63_0221C954(data, i, 1);
        sub_0200DF98(data->unk_000A4[i], 1);
        sub_0200E024(data->unk_000A4[i], 1.0f, 1.0f);
        sub_0200E0FC(data->unk_000A4[i], GX_OAM_MODE_NORMAL);
        sub_0200E0FC(data->unk_000A4[6 + i], GX_OAM_MODE_XLU);
        UnkImageStruct_SetSpriteVisibleFlag(data->unk_000A4[6 + i], FALSE);
    }
    data->unk_000A4[12] = SpriteRenderer_LoadResourcesAndCreateSprite(data->spriteRenderer, data->spriteGfxHandler, &ov63_022200A0[12]);
    data->unk_000A4[13] = SpriteRenderer_LoadResourcesAndCreateSprite(data->spriteRenderer, data->spriteGfxHandler, &ov63_022200A0[13]);
    sub_0200DF98(data->unk_000A4[12], 1);
    sub_0200DF98(data->unk_000A4[13], 1);
    UnkImageStruct_SetSpriteVisibleFlag(data->unk_000A4[12], FALSE);
    UnkImageStruct_SetSpriteVisibleFlag(data->unk_000A4[13], FALSE);
    
    if (PlayerProfile_GetTrainerGender(data->args->profile) == TRAINER_FEMALE) {
        sub_02070D84(TRAINERCLASS_PKMN_TRAINER_LYRA, 2, &sp2C);
    } else {
        sub_02070D84(TRAINERCLASS_PKMN_TRAINER_ETHAN, 2, &sp2C);
    }
    r4 = AllocFromHeap(HEAP_ID_REGISTER_HALL_OF_FAME, 0x1900);
    sub_020143E0(sp2C.narcId, sp2C.ncbr_id, HEAP_ID_REGISTER_HALL_OF_FAME, &sp1C, r4);
    ov63_0221C00C(r4, NNS_G2dGetImageLocation(sub_02024B1C(data->unk_000A4[12]->sprite), NNS_G2D_VRAM_TYPE_2DMAIN), 3200);
    FreeToHeap(r4);

    GfGfxLoader_GXLoadPal(sp2C.narcId, sp2C.nclr_id, GF_PAL_LOCATION_MAIN_OBJ, (enum GFPalSlotOffset)NNS_G2dGetImagePaletteLocation(sub_02024B34(data->unk_000A4[12]->sprite), NNS_G2D_VRAM_TYPE_2DMAIN), 0x20, HEAP_ID_REGISTER_HALL_OF_FAME);

    data->unk_000A4[14] = SpriteRenderer_LoadResourcesAndCreateSprite(data->spriteRenderer, data->spriteGfxHandler, &ov63_022200A0[14]);
    UnkImageStruct_SetSpriteVisibleFlag(data->unk_000A4[14], FALSE);
    ov63_0221C954(data, 13, 0);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
}

void ov63_0221EFD8(RegisterHallOfFameData *data) {
    u32 i;
    int tag;

    for (i = 0; i < 15; ++i) {
        ov63_0221C134(data, i);
    }
    SpriteGfxHandler_UnloadPlttObjById(data->spriteGfxHandler, 55522);
    SpriteGfxHandler_UnloadCharObjById(data->spriteGfxHandler, 55520);
    SpriteGfxHandler_UnloadCellObjById(data->spriteGfxHandler, 55515);
    SpriteGfxHandler_UnloadAnimObjById(data->spriteGfxHandler, 55515);
    SpriteGfxHandler_UnloadPlttObjById(data->spriteGfxHandler, 55520);
    SpriteGfxHandler_UnloadCharObjById(data->spriteGfxHandler, 55519);
    for (i = 0; i < 6; ++i) {
        tag = 55512 + i;
        SpriteGfxHandler_UnloadPlttObjById(data->spriteGfxHandler, tag);
        SpriteGfxHandler_UnloadCharObjById(data->spriteGfxHandler, tag);
    }
    SpriteGfxHandler_UnloadCellObjById(data->spriteGfxHandler, 55514);
    SpriteGfxHandler_UnloadAnimObjById(data->spriteGfxHandler, 55514);
}

void ov63_0221F088(RegisterHallOfFameData *data) {
    NNS_G3dInit();
    G3X_InitMtxStack();
    G3X_SetShading(GX_SHADING_TOON);
    G3X_AntiAlias(TRUE);
    G3X_AlphaTest(FALSE, 0);
    G3X_AlphaBlend(TRUE);
    G3X_SetClearColor(RGB_BLACK, 0, 0x7FFF, 0x3F, FALSE);
    G3_SwapBuffers(GX_SORTMODE_AUTO, GX_BUFFERMODE_W);
    G3_ViewPort(0, 0, 255, 191);
    GF_3DVramMan_InitFrameTexVramManager(1, TRUE);
    GF_3DVramMan_InitFramePlttVramManager(0x4000, TRUE);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_ON);
    G2_SetBG0Priority(1);
    G2_SetBlendAlpha(0, 28, 0, 0);
    ov63_0221F130(data);
}

void ov63_0221F130(RegisterHallOfFameData *data) {
    data->unk_000E0 = Camera_New(HEAP_ID_REGISTER_HALL_OF_FAME);
    SetVec(data->unk_000E4, 0, 0, 0);
    SetVec(data->unk_000F0, 0, 0, 0);
    Camera_Init_FromTargetDistanceAndAngle(&data->unk_000E4, FX32_CONST(5), &data->unk_000F0, 0xFA4, 0, TRUE, data->unk_000E0);
    VecFx32 spC;
    SetVec(spC, 0, FX32_ONE, 0);
    Camera_SetLookAtCamUp(&spC, data->unk_000E0);
    Camera_SetStaticPtr(data->unk_000E0);
    Camera_SetPerspectiveClippingPlane(FX32_ONE, FX32_CONST(500), data->unk_000E0);
}

void ov63_0221F1C4(RegisterHallOfFameData *data) {
    Camera_Delete(data->unk_000E0);
}

void ov63_0221F1D0(RegisterHallOfFameData *data) {
    if (!G3X_IsGeometryBusy()) {
        G3X_Reset();
        NNS_G3dGePushMtx();
        ov63_0221F580(data->unk_000F8);
        NNS_G3dGePopMtx(1);
        NNS_G3dGePushMtx();
        ov63_0221FAA0(data->unk_000FC);
        NNS_G3dGePopMtx(1);
        G3_SwapBuffers(GX_SORTMODE_MANUAL, GX_BUFFERMODE_Z);
    }
}
