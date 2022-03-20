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
};

BOOL sub_0203CA9C(TaskManager *taskManager);
void sub_0203C8F0(struct BagViewAppWork *env, TaskFunc func);

#endif //POKEHEARTGOLD_UNK_0203BC10_H
