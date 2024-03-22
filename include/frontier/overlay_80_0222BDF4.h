#ifndef POKEHEARTGOLD_OVERLAY_80_H
#define POKEHEARTGOLD_OVERLAY_80_H

typedef struct FrontierContextSub_0 {
    void *unk0;
} FrontierContextSub_0;

typedef struct FrontierContext {
    FrontierContextSub_0 *unk0;
} FrontierContext; //this *might* be FrontierContext, currently unsure

u32 ov80_0222BDF4(FrontierContext *a0);
u32 ov80_0222BE10(FrontierContext *a0);

#endif
