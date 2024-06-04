#ifndef POKEHEARTGOLD_MIC_TEST_H
#define POKEHEARTGOLD_MIC_TEST_H

#include "msgdata.h"
#include "overlay_manager.h"
#include "system.h"
#include "unk_0200CF18.h"

//Should be static, but not fully decompiled yet
typedef struct MicTestData MicTestData;
typedef struct MicTestSub_12C MicTestSub_12C;

typedef void (*MicTestFuncPtr_12C)(MicTestSub_12C *, u32 *);

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

struct MicTestSub_12C {
    MicTestData *micTest;
    MicTestFuncPtr_12C unk4;
    u32 unk8;
    u32 unkC;
};

struct MicTestData {
    SpriteRenderer *spriteRenderer;
    SpriteGfxHandler *unk4;
    UnkImageStruct *unk8[7];
    struct {
        u8 unk0[0x2C];
        u32 unk2C;
    } unk24[3];
    u32 unkB4;
    MicTestSub_B8 unkB8;
    MicTestSub_F0 unkF0;
    MicTestSub_12C unk12C;
    HeapID heapId;
};

BOOL MicTest_Init(OVY_MANAGER *overlayMan);
BOOL MicTest_Main(OVY_MANAGER *overlayMan);
BOOL MicTest_Exit(OVY_MANAGER *overlayMan);
void ov62_021E5A5C(MicTestSub_12C *a0, MicTestData *data, MicTestFuncPtr_12C a2);
void ov62_021E5A6C(MicTestSub_12C *a0);
void ov62_021E5A84(MicTestSub_12C *a0, MicTestFuncPtr_12C a1);
MicTestData *ov62_021E5A8C(MicTestSub_12C *a0);
u32 ov62_021E5A90(MicTestSub_12C *a0);
void ov62_021E5A94(MicTestSub_12C *a0);
void ov62_021E5A9C(MicTestSub_12C *a0, u32 *state);
void ov62_021E5B04(MicTestSub_12C *a0, u32 *state);
void ov62_021E5B6C(MicTestSub_12C *a0, u32 *state);
void ov62_021E5BB8(MicTestSub_12C *a0, u32 *state);
void ov62_021E5C20(MicTestSub_12C *a0, u32 *state);
void ov62_021E5C34(HeapID heapId);
void ov62_021E5C80();
void ov62_021E5CB8();
void ov62_021E5CC8(void *data);
void ov62_021E5CF4(MicTestData *micTest, HeapID heapId);
void ov62_021E5D54(MicTestData *micTest);
void ov62_021E5D64(MicTestData *micTest);
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
void ov62_021E62B8(MICResult result, void *data);
u32 MicTest_GetVolumeBracket(u8);
u32 ov62_021E63D0(MicTestData *micTest);

//Still in asm
void ov62_021E604C(MicTestSub_B8 *a0, HeapID heapId);
BOOL ov62_021E6630(MicTestData *micTest);
void ov62_021E6600(MicTestData *micTest);


void ov62_021E63E8(MicTestData *micTest, HeapID heapId, u32 a2, u32 a3);

#endif //POKEHEARTGOLD_MIC_TEST_H
