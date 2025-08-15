#ifndef POKEHEARTGOLD_UNK_0200B150_H
#define POKEHEARTGOLD_UNK_0200B150_H

#include "heap.h"

void sub_0200B27C(NNSG2dRenderSurface *surface, NNSG2dViewRect *rect, NNS_G2D_VRAM_TYPE type, NNSG2dRendererInstance *instance);
void OamManager_ApplyAndResetBuffers(void);
void OamManager_Free(void);
void OamManager_Create(int, int, int, int, int, int, int, int, enum HeapID);
void sub_0200B2E0(enum HeapID heapID);
void sub_0200B2E8(enum HeapID heapID);

#endif // POKEHEARTGOLD_UNK_0200B150_H
