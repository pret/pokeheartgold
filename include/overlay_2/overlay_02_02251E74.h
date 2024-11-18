#ifndef POKEHEARTGOLD_OVERLAY_02_02251E74_H
#define POKEHEARTGOLD_OVERLAY_02_02251E74_H

#include "field/overlay_01_021FB878.h"

#include "field_system.h"
#include "gear_phone.h"

String *GetPhoneBookEntryName(GearPhoneRingManager *gearPhone, HeapID heapId);
void ov02_02251EB8(GearPhoneRingManager *phoneRingManager, u8 a1, u8 a2, u8 a3, u8 a4, u8 a5);
u8 ov02_02251EE8(GearPhoneRingManager *gearPhone, u8 *a1);
BOOL ov02_02251F20(GearPhoneRingManager *gearPhone);
u32 ov02_02251FDC(GearPhoneRingManager *gearPhone, PhoneBook *phoneBook, u32 mapId);
u32 ov02_022521C0(GearPhoneRingManager *gearPhone, PhoneBook *phoneBook, u32 mapId);
u8 ov02_02252218(GearPhoneRingManager *gearPhone, PhoneBook *phoneBook, u32 mapId);
void ov02_022522AC(GearPhoneRingManager *gearPhone, BOOL a1);
int GetRadioMusicPlayingSeq(void);
BOOL ov02_02252334(FieldSystem *fieldSystem);
void ov02_022523B4(TaskManager *taskMan);
BOOL ov02_022523D0(TaskManager *taskMan);
void FieldSystem_BeginCelebiTimeTravelCutsceneTask(FieldSystem *fieldSystem);
void FieldSystem_BeginSinjohCutsceneTask(FieldSystem *fieldSystem);
void FieldSystem_BeginSinjohGetEggCutsceneTask(FieldSystem *fieldSystem, u8 a1);
BOOL ov02_02253134(SaveData *saveData);

// the following is as of yet not decompiled
BOOL Task_CelebiTimeTravelCutscene(TaskManager *taskMan);

// the following functions are static
typedef struct CelebiTimeTravelCutsceneTaskData {
    u16 unk0;
    u8 unk2;
    u8 isSwirlFinished;
    u32 unk4;
    FieldSystem *fieldSystem; // 0x8
    NNSFndAllocator alloc;    // 0xC
    Field3dModel model;       // 0x1C
    Field3DModelAnimation animations[3];
    Field3dObject object3d;
    s32 unkE0;
    u16 unkE4;
    u16 unkE6;
    u16 unkE8;
    u16 perspective;
    u16 unkEC;
    u16 unkEE;
    u8 unkF0;
    u8 unkF1;
    u8 unkF2;
    u8 unkF3;
} CelebiTimeTravelCutsceneTaskData;

typedef struct UnkStruct_02253CE0 {
    u32 unk0;
    u32 unk4;
    u16 unk8;
    u16 unkA;
} UnkStruct_02253CE0;

typedef struct SinjohCutsceneData {
    FieldSystem *fieldSystem;
    struct NNSFndAllocator alloc;
    Field3dModel model[2];
    Field3DModelAnimation animations[2][2];
    Field3dObject object84[2];
    Field3dModel model174;
    Field3DModelAnimation animation184[2];
    Field3dObject object1AC;
    u8 unk224;
    u8 unk225;
    u8 unk226;
    u8 unk227;
} SinjohCutsceneData;

typedef struct SinjohGetEggCutsceneData {
    FieldSystem *fieldSystem;
    NNSFndAllocator alloc;
    Field3dModel model;
    Field3DModelAnimation animations[4];
    Field3dObject object;
    u8 unkEC;
    u8 unkED;
    u8 unkEE;
    u8 unkEF;
} SinjohGetEggCutsceneData;

void CelebiCutscene_StartSwirlTask(CelebiTimeTravelCutsceneTaskData *data);
BOOL ov02_022526EC(CelebiTimeTravelCutsceneTaskData *data);
void Task_CelebiCutsceneSwirl(SysTask *task, void *data);
void CelebiCutscene_InitSwirlData(CelebiTimeTravelCutsceneTaskData *a0, UnkStruct_02253CE0 *a1);
BOOL CelebiCutscene_SwirlEffect(CelebiTimeTravelCutsceneTaskData *data);
void Task_CelebiCutsceneSwirlEffect(SysTask *task, void *data);
BOOL CelebiCutscene_IsSwirlFinished(CelebiTimeTravelCutsceneTaskData *data);
void CelebiCutscene_LoadResources(CelebiTimeTravelCutsceneTaskData *data);
void CelebiCutscene_UnloadResources(CelebiTimeTravelCutsceneTaskData *data);
void CelebiCutsceneAnimations_FrameSet(Field3DModelAnimation *animations, u32 frame);
BOOL CelebiCutsceneAnimations_FrameAdvanceAndCheck(Field3DModelAnimation *animations);
BOOL Task_SinjohCutscene(TaskManager *taskMan);
void SinjohCutscene_LoadResources(SinjohCutsceneData *data);
void SinjohCutscene_FreeResources(SinjohCutsceneData *data);
void ov02_02252E80(Field3DModelAnimation *animation, u32 a1, u32 a2);
BOOL ov02_02252EA8(Field3DModelAnimation *animation, u32 a1);
BOOL Task_SinjohGetEggCutscene(TaskManager *taskMan);
u8 ov02_0225316C();
BOOL ov02_02253188(SaveData *saveData);
u8 ov02_022531B4(SaveData *saveData);
BOOL ov02_02253188(SaveData *saveData);
// the following functions are static and not decompiled
void ov01_021F46DC(u32 *a0);
BOOL Task_SinjohCutscene(TaskManager *taskMan);
void SinjohGetEggCutscene_LoadResources(SinjohGetEggCutsceneData *data);
void SinjohGetEggCutscene_FreeResources(SinjohGetEggCutsceneData *data);

#endif // POKEHEARTGOLD_OVERLAY_02_02251E74_H
