#ifndef POKEHEARTGOLD_UNK_0203BC10_H
#define POKEHEARTGOLD_UNK_0203BC10_H

#include "task.h"

struct BagViewAppWork {
    int unk_0000;
    u8 filler_0004[0x22];
    u16 unk_0026;
    u8 filler_0028[0x32C];
    TaskFunc unk_0354;
    u8 filler_0358[0x18];
    u32 unk_0370[4];
    void *unk_0380;
    void *unk_0384;
};

struct UnkStruct_0203D818 {
    u16 itemId;
    u8 unk2;
    u8 unk3;
};

void sub_0203C8F0(struct BagViewAppWork *env, TaskFunc func);
BOOL sub_0203D718(TaskManager *taskManager);
struct UnkStruct_0203D818 *sub_0203D818(u16 itemId, u8 a1, u8 a2);
BOOL sub_0203D830(TaskManager *taskManager);
BOOL sub_0203CA9C(TaskManager *taskManager);

#endif //POKEHEARTGOLD_UNK_0203BC10_H
