#ifndef POKEHEARTGOLD_GF_3D_VRAMMAN_H
#define POKEHEARTGOLD_GF_3D_VRAMMAN_H

#include "heap.h"

#define GF_3D_TEXALLOC_LNK  0
#define GF_3D_TEXALLOC_FRM  1
#define GF_3D_PLTTALLOC_LNK 0
#define GF_3D_PLTTALLOC_FRM 1

typedef struct GF3DVramMan {
    HeapID heapId;
    void *plttWork;
    void *texWork;
} GF3DVramMan;

typedef void (*GF3DVramManInitFunc)(void);

GF3DVramMan *GF_3DVramMan_Create(HeapID heapId, int texMode, int numTex, int plttMode, int numPltt, GF3DVramManInitFunc initializer);
void GF_3DVramMan_Delete(GF3DVramMan *vramMan);
void GF_3DVramMan_DefaultInitializer(void);
void GF_3DVramMan_InitLinkedListTexVramManager(u32 szByte, u32 szByteFor4x4, void *pManagementWork, u32 szByteManagementWork, BOOL useAsDefault);
void GF_3DVramMan_InitLinkedListPlttVramManager(u32 szByte, void *pManagementWork, u32 szByteManagementWork, BOOL useAsDefault);
void GF_3DVramMan_InitFrameTexVramManager(u16 numSlot, BOOL useAsDefault);
void GF_3DVramMan_InitFramePlttVramManager(u32 numSlot, BOOL useAsDefault);

#endif // POKEHEARTGOLD_GF_3D_VRAMMAN_H
