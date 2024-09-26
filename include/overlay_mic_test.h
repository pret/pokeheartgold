#ifndef POKEHEARTGOLD_MIC_TEST_H
#define POKEHEARTGOLD_MIC_TEST_H

#include "bg_window.h"
#include "msgdata.h"
#include "overlay_manager.h"
#include "system.h"
#include "unk_0200CF18.h"

// Should be static, but not fully decompiled yet
typedef struct MicTestData MicTestData;
typedef struct MicTestTaskManager MicTestTaskManager;

typedef void (*MicTestTask)(MicTestTaskManager *, u32 *);

typedef struct MicTestSub_F0 {
    MICAutoParam mic;
    void *unk1C;
    s32 curVolume;
    u32 unk24;
    u32 unk28;
    u32 unk2C;
    u32 unk30;
    u32 unk34;
} MicTestSub_F0;

typedef struct MicTestSub_B8 {
    BgConfig *bgConfig;
    Window window[3];
    MsgData *msgData;
} MicTestSub_B8;

struct MicTestTaskManager {
    MicTestData *micTest;
    MicTestTask task;
    u32 state;
    u32 isFinished;
};

typedef struct MicTestSub_24 {
    UnkImageStruct *unk0;
    u32 unk4;
    VecFx32 unk8;
    VecFx32 unk14;
    fx32 unk20; // angle?
    fx32 unk24; // dTheta?
    fx32 unk28; // magnitude?
    SysTask *task;
} MicTestSub_24;

struct MicTestData {
    SpriteRenderer *spriteRenderer;
    SpriteGfxHandler *gfxHandler;
    UnkImageStruct *unk8[7];
    MicTestSub_24 unk24[3];
    u32 unkB4;
    MicTestSub_B8 unkB8;
    MicTestSub_F0 unkF0;
    MicTestTaskManager taskMan;
    HeapID heapId;
};

BOOL MicTest_Init(OVY_MANAGER *overlayMan, int *state);
BOOL MicTest_Exit(OVY_MANAGER *overlayMan, int *state);
BOOL MicTest_Main(OVY_MANAGER *overlayMan, int *state);
void MicTest_StartTask(MicTestTaskManager *a0, MicTestData *data, MicTestTask a2);
void MicTestTaskMan_Run(MicTestTaskManager *a0);
void MicTest_SetTask(MicTestTaskManager *a0, MicTestTask a1);
MicTestData *MicTestTaskMan_GetMicTestData(MicTestTaskManager *a0);
u32 MicTestTaskMan_IsFinished(MicTestTaskManager *a0);
void MicTestTaskMan_Finish(MicTestTaskManager *a0);
void MicTestTask_FadeIn(MicTestTaskManager *a0, u32 *state);
void ov62_021E5B04(MicTestTaskManager *a0, u32 *state);
void ov62_021E5B6C(MicTestTaskManager *a0, u32 *state);
void ov62_021E5BB8(MicTestTaskManager *a0, u32 *state);
void ov62_021E5C20(MicTestTaskManager *a0, u32 *state);
void ov62_021E5C34(HeapID heapId);
void ov62_021E5C80();
void MicTest_SetBanks();
void MicTest_VBlankIntrCB(void *data);
void ov62_021E5CF4(MicTestData *micTest, HeapID heapId);
void ov62_021E5D54(MicTestData *micTest);
void MicTest_UpdateAnimations(MicTestData *micTest);
void MicTest_LoadResources(MicTestData *micTest);
void ov62_021E5FA0(MicTestData *micTest);
void ov62_021E5FC4(MicTestData *micTest);
void ov62_021E5FD4(MicTestSub_B8 *a0, HeapID heapId);
void ov62_021E6024(MicTestSub_B8 *a0);
void ov62_021E6048(MicTestSub_B8 *a0);
void ov62_021E60D4(MicTestSub_B8 *a0);
void ov62_021E60E4(MicTestSub_B8 *a0, HeapID heapId);
void ov62_021E6178(MicTestSub_B8 *a0);
void ov62_021E61AC(MicTestSub_F0 *a0, HeapID heapId, MICCallback a2, MicTestData *micTest);
void ov62_021E61FC(MicTestSub_F0 *a0);
void ov62_021E620C(MicTestSub_F0 *a0);
void ov62_021E625C(MicTestSub_F0 *a0);
void ov62_021E6278(MicTestSub_F0 *a0);
s32 MicTest_AverageMicInput(MicTestSub_F0 *a0);
void MicTest_MicrophoneCallback(MICResult result, void *data);
u32 MicTest_GetVolumeBracket(u8);
u32 ov62_021E63D0(MicTestData *micTest);
BOOL ov62_021E63E8(MicTestData *micTest, HeapID heapId, s16 x, s16 y);
void ov62_021E6480(UnkImageStruct *a0, MicTestSub_24 *args, s16 x, s16 y, s32 z, s32 r1, s32 r2, BOOL a7);
void ov62_021E6570(SysTask *, void *);
int ov62_021E6620();

// Still in asm
void MicTest_LoadTextResources(MicTestSub_B8 *a0, HeapID heapId);
BOOL ov62_021E6630(MicTestData *micTest);
void ov62_021E6600(MicTestData *micTest);

extern const OVY_MGR_TEMPLATE gApplication_MicTest;

#endif // POKEHEARTGOLD_MIC_TEST_H
