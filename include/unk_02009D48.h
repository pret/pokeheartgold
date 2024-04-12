#ifndef POKEHEARTGOLD_UNK_02009D48_H
#define POKEHEARTGOLD_UNK_02009D48_H

#include "unk_0200A090.h"

typedef struct SpriteResourcesHeader {
    const NNSG2dImageProxy* imageProxy;
    const NNSG2dCharacterData* charData;
    const NNSG2dImagePaletteProxy* plttProxy;
    NNSG2dCellDataBank* cellData;
    const NNSG2dCellAnimBankData* cellAnim;
    const NNSG2dMultiCellDataBank* multiCellData;
    const NNSG2dMultiCellAnimBankData* multiCellAnim;
    int flag;
    u8 priority;
} SpriteResourcesHeader;

typedef struct SpriteResourceHeaderList {
    SpriteResourcesHeader *headers;
    int num;
} SpriteResourceHeaderList;

struct ResdatNarcEntry {
    u32 charId;
    u32 plttId;
    u32 cellId;
    u32 animId;
    u32 mcelId;
    u32 manmId;
    u32 xferFlag;
    u32 priority;
};

typedef struct SpriteList SpriteList;

typedef struct GF_G2dRenderer {
    NNSG2dRendererInstance rendererInstance;
    NNSG2dRenderSurface renderSurface[2];
} GF_G2dRenderer;

struct SpriteListParam {
    int unk_0;
    NNSG2dRendererInstance *rendererInstance;
    HeapID heapId;
};

void CreateSpriteResourcesHeader(SpriteResourcesHeader *hdr, int charId, int plttId, int cellId, int cellAnmId, int multiCellId, int multiCellAnmId, int transfer, int priority, GF_2DGfxResMan *charMan, GF_2DGfxResMan *plttMan, GF_2DGfxResMan *cellMan, GF_2DGfxResMan *cellAnmMan, GF_2DGfxResMan *multiCellMan, GF_2DGfxResMan *multiCellAnmMan);
SpriteResourceHeaderList *SpriteResourceHeaderList_Create(const struct ResdatNarcEntry *resdatNarcEntry, HeapID heapId, GF_2DGfxResMan *charMan, GF_2DGfxResMan *plttMan, GF_2DGfxResMan *cellMan, GF_2DGfxResMan *animMan, GF_2DGfxResMan *mcelMan, GF_2DGfxResMan *manmMan);
void SpriteResourceHeaderList_Destroy(SpriteResourceHeaderList *list);
SpriteList *G2dRenderer_Init(int a0, GF_G2dRenderer *renderer, HeapID heapId);
void G2dRenderer_SetMainSurfaceCoords(GF_G2dRenderer *renderer, s32 x, s32 y);
void G2dRenderer_SetSubSurfaceCoords(GF_G2dRenderer *renderer, s32 x, s32 y);
void sub_02009FE8(NNS_G2D_VRAM_TYPE vram, GXOBJVRamModeChar mode);
void sub_0200A080(u32 a0);

#endif //POKEHEARTGOLD_UNK_02009D48_H
