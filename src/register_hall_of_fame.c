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
#include "system.h"
#include "constants/sndseq.h"
#include "msgdata/msg.naix"
#include "unk_0200CF18.h"

typedef struct RegisterHallOfFameData {
    RegisterHallOfFameArgs *args;
    u8 filler_00004[0x4];
    BOOL (*unk_00008)(struct RegisterHallOfFameData *);
    u8 filler_0000C[0x4];
    BgConfig *bgConfig; // 00010
    u8 filler_00014[0x70];
    MsgData *msgData; // 00084
    MessageFormat *msgFormat; // 00088
    String *unk_0008C;
    String *unk_00090;
    NARC *unk_00094;
    NARC *unk_00098;
    u8 filler_0009C[0x4];
    SpriteGfxHandler *unk_000A0;
    u8 filler_000A4[0x12FA8];
    int unk_1304C;
    u8 filler_13050[0x1C];
} RegisterHallOfFameData;

void ov63_0221BFBC(void);
void ov63_0221BFCC(SysTask *task, void *taskData);
void ov63_0221C00C(const void *pSrc, u32 offset, u32 size);
void ov63_0221C028(const void *pSrc, u32 offset, u32 size);
void ov63_0221C044(RegisterHallOfFameData *data);
void ov63_0221C05C(RegisterHallOfFameData *data);
void ov63_0221C068(RegisterHallOfFameData *data);
void ov63_0221C118(RegisterHallOfFameData *data);
void ov63_0221C14C(RegisterHallOfFameData *data);
void ov63_0221E114(RegisterHallOfFameData *data);

extern int (*ov63_0221FD18[])(RegisterHallOfFameData *data);
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
    sub_0200D020(data->unk_000A0);
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
