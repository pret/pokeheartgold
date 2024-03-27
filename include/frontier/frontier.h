#ifndef POKEHEARTGOLD_FRONTIER_H
#define POKEHEARTGOLD_FRONTIER_H

#include "overlay_manager.h"

typedef struct UnkStruct_02096808 {
    u32 unk0;
    u32 unk4;
    SaveData *saveData;
} UnkStruct_02096808;

extern const OVY_MGR_TEMPLATE _02108584;

typedef void (UnkFuncPtr_020965A4)(void); //almost certainly wrong

UnkStruct_02096808 *sub_02096808(void *a0);
void Frontier_SetData(void *a0, u32 a1);
void *Frontier_GetData(void *a0);
void Frontier_LaunchApplication(void *a0, const OVY_MGR_TEMPLATE *ovyTemp, void *args, u32 a3, UnkFuncPtr_020965A4 func);

#endif //POKEHEARTGOLD_FRONTIER_H
