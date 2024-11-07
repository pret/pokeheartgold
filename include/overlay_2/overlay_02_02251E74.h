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
void ov02_02252534(FieldSystem *fieldSystem);

// the following is as of yet not decompiled
BOOL ov02_0225255C(TaskManager *taskMan);

// the following functions are static
typedef struct UnkStruct_02252534 {
    u16 unk0;
    u8 unk2;
    u8 unk3;
    u32 unk4;
    FieldSystem *fieldSystem;
    u8 unkC[0x20];
    u32 unk2C;
    u8 unk30[0x38];
    Field3dObject object3d;
    u32 unkE0;
    u16 unkE4;
    u16 unkE6;
    u16 unkE8;
    u16 unkEA;
    u16 unkEC;
    u16 unkEE;
    u8 unkF0;
    u8 unkF1;
    u8 unkF2;
    u8 unkF3;
} UnkStruct_02252534;

typedef struct UnkStruct_02253CE0 {
    u32 unk0;
    u32 unk4;
    u16 unk8;
    u16 unkA;
} UnkStruct_02253CE0;
void ov02_022526C8(UnkStruct_02252534 *data);
BOOL ov02_022526EC(UnkStruct_02252534 *data);
void ov02_022526FC(SysTask *task, void *data);
void ov02_02252764(UnkStruct_02252534 *a0, UnkStruct_02253CE0 *a1);

// the following functions are static and not decompiled
void ov02_02252898(UnkStruct_02252534 *data);
void ov02_0225296C(UnkStruct_02252534 *data);
void ov01_021F46DC(u32 *a0);
void ov02_022529C4(u32 *a0);
void ov02_0225286C(SysTask *task, void *data);
BOOL ov02_02252888(UnkStruct_02252534 *data);

#endif // POKEHEARTGOLD_OVERLAY_02_02251E74_H
