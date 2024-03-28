#ifndef POKEHEARTGOLD_OVERLAY_80_0222BDF4_H
#define POKEHEARTGOLD_OVERLAY_80_0222BDF4_H

#include "message_format.h"
#include "frontier/frontier_system.h"

typedef struct FrontierContext {
    FrontierSystem *frontierSystem;
    u32 unk4;
    SaveData *saveData;
    u8 unkC[0x10];
    u8 *scriptPtr;
} FrontierContext;

u8 inline FrontierScript_ReadShort(FrontierContext *ctx) {
    return *(ctx->scriptPtr++);
}

u16 *FrontierScript_ReadVarPtr(FrontierContext *a0);
u32 FrontierScript_ReadVar(FrontierContext *a0);
void ov80_0222F210(FrontierMap *map);
void ov80_0222F278(FrontierMap *map);
void ov80_0222F33C(FrontierMap *map);
void ov80_0222F3CC(FrontierMap *map);

#endif
