#ifndef POKEHEARTGOLD_OVERLAY_80_0222BDF4_H
#define POKEHEARTGOLD_OVERLAY_80_0222BDF4_H

typedef struct FrontierContextSub_0 {
    void *unk0;
} FrontierContextSub_0;

typedef struct FrontierContext {
    FrontierContextSub_0 *unk0;
} FrontierContext;

u32 FrontierScript_ReadVarPtr(FrontierContext *a0);
u32 FrontierScript_ReadVar(FrontierContext *a0);

#endif
