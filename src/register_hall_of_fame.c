#include "global.h"
#include "bg_window.h"
#include "font.h"
#include "gf_gfx_planes.h"
#include "register_hall_of_fame.h"
#include "heap.h"
#include "msgdata.h"
#include "message_format.h"
#include "overlay_manager.h"
#include "sound_02004A44.h"
#include "sys_task_api.h"
#include "system.h"
#include "constants/sndseq.h"
#include "msgdata/msg.naix"
#include "unk_0200CF18.h"
#include "unk_0200FA24.h"

typedef struct RegisterHallOfFameData {
    RegisterHallOfFameArgs *args;
    SysTask *vblankTask;
    BOOL (*unk_00008)(struct RegisterHallOfFameData *);
    u16 unk_0000C;
    u16 unk_0000E;
    BgConfig *bgConfig; // 00010
    u8 filler_00014[0x70];
    MsgData *msgData; // 00084
    MessageFormat *msgFormat; // 00088
    String *unk_0008C;
    String *unk_00090;
    NARC *unk_00094;
    NARC *unk_00098;
    SpriteRenderer *spriteRenderer;  // 0009C
    SpriteGfxHandler *spriteGfxHandler;  // 000A0
    UnkImageStruct *unk_000A4[15];
    u8 filler_000E0[0x12F68];
    int unk_13048;
    int unk_1304C;
    int unk_13050;
    u16 unk_13054;
    u16 unk_13056;
    u8 filler_13058[0x8];
    u32 unk_13060_0:1;
    u32 unk_13060_1:1;
    u8 filler_13064[0x8];
} RegisterHallOfFameData;

void ov63_0221BFBC(void);
void ov63_0221BFCC(SysTask *task, void *taskData);
void ov63_0221C00C(const void *pSrc, u32 offset, u32 size);
void ov63_0221C028(const void *pSrc, u32 offset, u32 size);
void ov63_0221C044(RegisterHallOfFameData *data);
void ov63_0221C05C(RegisterHallOfFameData *data);
void ov63_0221C068(RegisterHallOfFameData *data);
void ov63_0221C118(RegisterHallOfFameData *data);
void ov63_0221C134(RegisterHallOfFameData *data, u32 a1);
void ov63_0221C14C(RegisterHallOfFameData *data);
void ov63_0221C14C(RegisterHallOfFameData *data);
void ov63_0221C16C(RegisterHallOfFameData *data, u32 a1, int a2);
int ov63_0221C188(RegisterHallOfFameData *data, int a1);
int ov63_0221C1B4(RegisterHallOfFameData *data, int a1);
BOOL ov63_0221C1E4(RegisterHallOfFameData *data, BOOL (*a1)(RegisterHallOfFameData *), int a2);
int ov63_0221C1F8(RegisterHallOfFameData *data);
int ov63_0221C214(RegisterHallOfFameData *data);
int ov63_0221C228(RegisterHallOfFameData *data);
int ov63_0221C264(RegisterHallOfFameData *data);
int ov63_0221C368(RegisterHallOfFameData *data);
int ov63_0221C384(RegisterHallOfFameData *data);
int ov63_0221C3CC(RegisterHallOfFameData *data);
int ov63_0221C5A0(RegisterHallOfFameData *data);
void ov63_0221CC78(RegisterHallOfFameData *data);
void ov63_0221CD40(RegisterHallOfFameData *data);
void ov63_0221CDF8(RegisterHallOfFameData *data);
void ov63_0221CD68(RegisterHallOfFameData *data);
void ov63_0221CE7C(RegisterHallOfFameData *data);
void ov63_0221D21C(RegisterHallOfFameData *data);
void ov63_0221D344(RegisterHallOfFameData *data);
BOOL ov63_0221D55C(RegisterHallOfFameData *data);
BOOL ov63_0221DB38(RegisterHallOfFameData *data);
void ov63_0221E114(RegisterHallOfFameData *data);
void ov63_0221E450(RegisterHallOfFameData *data, int a1, int a2, int a3, int a4);

extern int (*const ov63_0221FD18[])(RegisterHallOfFameData *data);
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
    data->unk_1304C = 2;
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
    data->unk_1304C = ov63_0221FD18[data->unk_1304C](data);
    if (data->unk_1304C == 8) {
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

void ov63_0221C134(RegisterHallOfFameData *data, u32 a1) {
    if (data->unk_000A4[a1] != NULL) {
        sub_0200D9DC(data->unk_000A4[a1]);
        data->unk_000A4[a1] = NULL;
    }
}

void ov63_0221C14C(RegisterHallOfFameData *data) {
    for (u32 i = 0; i < 15; ++i) {
        if (data->unk_000A4[i] != NULL) {
            UnkImageStruct_TickSpriteAnimation1Frame(data->unk_000A4[i]);
        }
    }
}

void ov63_0221C16C(RegisterHallOfFameData *data, u32 a1, int a2) {
    UnkImageStruct_SetSpriteAnimCtrlCurrentFrame(data->unk_000A4[a1], 0);
    UnkImageStruct_SetSpriteAnimSeqNo(data->unk_000A4[a1], a2);
}

int ov63_0221C188(RegisterHallOfFameData *data, int a1) {
    BeginNormalPaletteFade(0, 1, 1, RGB_BLACK, 6, 1, HEAP_ID_REGISTER_HALL_OF_FAME);
    data->unk_13050 = a1;
    return 0;
}

int ov63_0221C1B4(RegisterHallOfFameData *data, int a1) {
    BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 6, 1, HEAP_ID_REGISTER_HALL_OF_FAME);
    data->unk_13050 = a1;
    return 0;
}

BOOL ov63_0221C1E4(RegisterHallOfFameData *data, BOOL (*a1)(RegisterHallOfFameData *), int a2) {
    data->unk_13050 = a2;
    data->unk_0000C = 0;
    data->unk_0000E = 0;
    data->unk_00008 = a1;
    return TRUE;
}

int ov63_0221C1F8(RegisterHallOfFameData *data) {
    if (IsPaletteFadeFinished() == TRUE) {
        return data->unk_13050;
    } else {
        return 0;
    }
}

int ov63_0221C214(RegisterHallOfFameData *data) {
    if (data->unk_00008 == NULL) {
        return data->unk_13050;
    } else {
        return 1;
    }
}

int ov63_0221C228(RegisterHallOfFameData *data) {
    ov63_0221CC78(data);
    ov63_0221CDF8(data);
    ov63_0221CD68(data);
    data->unk_13054 = 0;
    data->unk_13056 = 0;
    data->vblankTask = SysTask_CreateOnVBlankQueue(ov63_0221BFCC, data, 0);
    return ov63_0221C188(data, 3);
}

int ov63_0221C264(RegisterHallOfFameData *data) {
    switch (data->unk_13054) {
    case 0:
        ov63_0221D344(data);
        ++data->unk_13054;
        break;
    case 1:
        ++data->unk_13054;
        if ((data->unk_13056 & 1) == 0) {
            ov63_0221C1E4(data, ov63_0221D55C, 3);
        } else {
            ov63_0221C1E4(data, ov63_0221DB38, 3);
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
        return ov63_0221C1B4(data, 4);
    }
    return 3;
}

int ov63_0221C368(RegisterHallOfFameData *data) {
    SysTask_Destroy(data->vblankTask);
    ov63_0221CE7C(data);
    ov63_0221CD40(data);
    return 5;
}
