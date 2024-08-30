#ifndef POKEHEARTGOLD_OVERLAY_80_0222BDF4_H
#define POKEHEARTGOLD_OVERLAY_80_0222BDF4_H

#include "frontier/frontier_system.h"

#include "message_format.h"

typedef struct FrontierContext {
    FrontierSystem *frontierSystem;
    u32 unk4;
    SaveData *saveData;
    u8 unkC[0x10];
    u8 *scriptPtr;
    u8 unk20[0x58];
    u16 unk78[2];
} FrontierContext;

u8 inline FrontierScript_ReadShort(FrontierContext *ctx) {
    return *(ctx->scriptPtr++);
}

typedef BOOL (*FrontierFunction)(FrontierContext *);

u16 *FrontierScript_ReadVarPtr(FrontierContext *ctx);
u32 FrontierScript_ReadVar(FrontierContext *ctx);
void ov80_0222F210(FrontierMap *map);
void ov80_0222F278(FrontierMap *map);
void ov80_0222F33C(FrontierMap *map);
void ov80_0222F3CC(FrontierMap *map);
void ov80_0222BE9C(FrontierContext *ctx, u16 a1);
void ov80_0222F44C(FrontierContext *ctx, u16 *a1);

#endif
