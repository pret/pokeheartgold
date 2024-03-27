#ifndef POKEHEARTGOLD_UNK_020965A4_H
#define POKEHEARTGOLD_UNK_020965A4_H

#include "overlay_manager.h"

typedef struct UnkStruct_02096808 {
    u32 unk0;
    u32 unk4;
    SaveData *saveData;
} UnkStruct_02096808;

extern const OVY_MGR_TEMPLATE _02108584;

typedef void (UnkFuncPtr_020965A4)(void); //almost certainly wrong

UnkStruct_02096808 *sub_02096808(void *a0);
void sub_02096818(void *a0, u32 a1);
void *sub_02096810(void *a0);
void sub_02096820(void *a0, const OVY_MGR_TEMPLATE *ovyTemp, void *args, u32 a3, UnkFuncPtr_020965A4 func);

#endif //POKEHEARTGOLD_UNK_020965A4_H
