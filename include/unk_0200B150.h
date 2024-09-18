#ifndef POKEHEARTGOLD_UNK_0200B150_H
#define POKEHEARTGOLD_UNK_0200B150_H

#include "heap.h"

void sub_0200B27C(NNSG2dRenderSurface *surface, NNSG2dViewRect *rect, NNS_G2D_VRAM_TYPE type, NNSG2dRendererInstance *instance);
void OamManager_ApplyAndResetBuffers(void);
void OamManager_Free(void);
void OamManager_Create(int, int, int, int, int, int, int, int, HeapID);
void sub_0200B2E0(HeapID heapId);
void sub_0200B2E8(HeapID heapId);

#endif // POKEHEARTGOLD_UNK_0200B150_H
