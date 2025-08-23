#ifndef POKEHEARTGOLD_UNK_0200A090_H
#define POKEHEARTGOLD_UNK_0200A090_H

#include "filesystem.h"
#include "gf_3d_loader.h"

struct CharResExtraData {
    NNSG2dCharacterData *charData;
    NNS_G2D_VRAM_TYPE vram;
};

struct PlttResExtraData {
    NNSG2dPaletteData *plttData;
    NNS_G2D_VRAM_TYPE vram;
    int pltt_num;
};

struct CellResExtraData {
    NNSG2dCellDataBank *cellDataBank;
};

struct AnimResExtraData {
    NNSG2dAnimBankData *animBankData;
};

struct MulticellResExtraData {
    NNSG2dMultiCellDataBank *multiCellDataBank;
};

struct MultianimResExtraData {
    NNSG2dAnimBankData *animBankData;
};

typedef enum GF_GraphicsResourceType {
    GF_GFX_RES_TYPE_CHAR = 0,
    GF_GFX_RES_TYPE_PLTT = 1,
    GF_GFX_RES_TYPE_CELL = 2,
    GF_GFX_RES_TYPE_ANIM = 3,
    GF_GFX_RES_TYPE_MCEL = 4,
    GF_GFX_RES_TYPE_MANM = 5,
    GF_GFX_RES_TYPE_MAX = 6,
} GfGfxResType;

typedef struct SpriteResource {
    GF_2DGfxRawResObj *resource;
    GfGfxResType type;
    void *extra;
} SpriteResource;

typedef struct GF_2DGfxResMan {
    GF_2DGfxRawResMan *resourceMgr;
    SpriteResource *objects;
    int max;
    int num;
    GfGfxResType type;
} GF_2DGfxResMan;

typedef struct GF_2DGfxResHeaderFile {
    int id;
    char filename[0x40];
    int extra[2];
} GF_2DGfxResHeaderFile;

typedef struct GF_2DGfxResHeaderNarc {
    int narcId;
    int fileId;
    BOOL compressed;
    int id;
    int extra[2];
} GF_2DGfxResHeaderNarc;

typedef struct GF_2DGfxResHeaderNarcList {
    GfGfxResType type;
    GF_2DGfxResHeaderNarc internal[]; // arbitrary length
} GF_2DGfxResHeaderNarcList;

typedef struct GF_2DGfxResHeader {
    void *table;
    int num;
    GfGfxResType type;
    u8 isNarc;
} GF_2DGfxResHeader;

typedef struct GF_2DGfxResObjList {
    SpriteResource **obj;
    int max;
    int num;
} GF_2DGfxResObjList;

GF_2DGfxResMan *Create2DGfxResObjMan(int num, GfGfxResType type, HeapID heapId);
void Destroy2DGfxResObjMan(GF_2DGfxResMan *mgr);
SpriteResource *Add2DGfxResObjFromHeader(GF_2DGfxResMan *mgr, const GF_2DGfxResHeader *header, int idx, HeapID heapId);
SpriteResource *AddCharResObjFromNarc(GF_2DGfxResMan *mgr, NarcId narcId, int fileId, BOOL compressed, int id, NNS_G2D_VRAM_TYPE vram, HeapID heapId);
SpriteResource *AddPlttResObjFromNarc(GF_2DGfxResMan *mgr, NarcId narcId, int fileId, BOOL compressed, int id, NNS_G2D_VRAM_TYPE vram, int pltt_num, HeapID heapId);
SpriteResource *AddCellOrAnimResObjFromNarc(GF_2DGfxResMan *mgr, NarcId narcId, int fileId, BOOL compressed, int id, GfGfxResType type, HeapID heapId);
void ReplaceCharResObjFromNarc(GF_2DGfxResMan *mgr, SpriteResource *obj, NarcId narcId, int fileId, BOOL compressed, HeapID heapId);
void ReplacePlttResObjFromNarc(GF_2DGfxResMan *mgr, SpriteResource *obj, NarcId narcId, int fileId, BOOL compressed, HeapID heapId);
SpriteResource *AddCharResObjFromOpenNarc(GF_2DGfxResMan *mgr, NARC *narc, int fileId, BOOL compressed, int id, NNS_G2D_VRAM_TYPE vram, HeapID heapId);
SpriteResource *AddCharResObjFromOpenNarcWithAtEndFlag(GF_2DGfxResMan *mgr, NARC *narc, int fileId, BOOL compressed, int id, NNS_G2D_VRAM_TYPE vram, HeapID heapId, BOOL atEnd);
SpriteResource *AddPlttResObjFromOpenNarc(GF_2DGfxResMan *mgr, NARC *narc, int fileId, BOOL compressed, int id, NNS_G2D_VRAM_TYPE vram, int pltt_num, HeapID heapId);
SpriteResource *AddPlttResObjFromOpenNarcWithAtEndFlag(GF_2DGfxResMan *mgr, NARC *narc, int fileId, BOOL compressed, int id, NNS_G2D_VRAM_TYPE vram, int pltt_num, HeapID heapId, BOOL atEnd);
SpriteResource *AddCellOrAnimResObjFromOpenNarc(GF_2DGfxResMan *resMan, NARC *narc, int fileId, BOOL compressed, int id, GfGfxResType type, HeapID heapId);
void ReplaceCharResObjFromOpenNarc(GF_2DGfxResMan *mgr, SpriteResource *obj, NARC *narc, int fileId, BOOL compressed, HeapID heapId);
void ReplacePlttResObjFromOpenNarc(GF_2DGfxResMan *mgr, SpriteResource *obj, NARC *narc, int fileId, BOOL compressed, HeapID heapId);
int LoadAll2DGfxResObjsFromHeader(GF_2DGfxResMan *mgr, const GF_2DGfxResHeader *header, GF_2DGfxResObjList *list, HeapID heapId);
GF_2DGfxResObjList *Create2DGfxResObjList(int num, HeapID heapId);
void Delete2DGfxResObjList(GF_2DGfxResObjList *list);
BOOL GF2DGfxResObjExistsById(GF_2DGfxResMan *mgr, int a1);
void sub_0200A740(SpriteResource *obj);
void DestroySingle2DGfxResObj(GF_2DGfxResMan *a0, SpriteResource *a1);
SpriteResource *SpriteResourceCollection_Find(GF_2DGfxResMan *mgr, int id);
int GF2DGfxResObj_GetResID(SpriteResource *obj);
NNSG2dCharacterData *GF2DGfxResObj_GetCharDataPtr(SpriteResource *obj);
NNSG2dPaletteData *GF2DGfxResObj_GetPlttDataPtr(SpriteResource *obj);
NNSG2dCellDataBank *GF2DGfxResObj_GetCellDataPtr(SpriteResource *obj);
NNSG2dAnimBankData *GF2DGfxResObj_GetAnimDataPtr(SpriteResource *obj);
NNSG2dMultiCellDataBank *GF2DGfxResObj_GetMultiCellDataPtr(SpriteResource *obj);
NNSG2dAnimBankData *GF2DGfxResObj_GetMultiAnimDataPtr(SpriteResource *obj);
GfGfxResType GF2DGfxResObj_GetResType(SpriteResource *obj);
NNS_G2D_VRAM_TYPE GF2DGfxResObj_GetLoadAddress(SpriteResource *obj);
int GF2DGfxResObj_GetPlttNum(SpriteResource *obj);
u32 GF2DGfxResHeader_sizeof(void);
GF_2DGfxResHeader *GF2DGfxResHeader_GetByIndex(GF_2DGfxResHeader *headers, int num);
void GF2DGfxResHeader_Init(const GF_2DGfxResHeaderNarcList *a0, GF_2DGfxResHeader *header, HeapID heapId);
void GF2DGfxResHeader_Reset(GF_2DGfxResHeader *header);
int GF2dGfxResHeader_GetNumObjects(const GF_2DGfxResHeader *header);
int GF2dGfxResHeader_GetObjIdByIndex(GF_2DGfxResHeader *header, int idx);
int GF2DGfxResHeader_GetNarcMemberIdByIndex(GF_2DGfxResHeader *header, int idx);
BOOL GF2DGfxResHeader_GetCompressFlagByIndex(GF_2DGfxResHeader *header, int idx);
int GF2DGfxResHeader_GetExDat0ByIndex(GF_2DGfxResHeader *header, int idx);
int GF2DGfxResHeader_GetExDat1ByIndex(GF_2DGfxResHeader *header, int idx);
void GF2DGfxResObj_LoadExDat(SpriteResource *obj, GfGfxResType type, NNS_G2D_VRAM_TYPE vram, int pltt_num, HeapID heapId);

#endif // POKEHEARTGOLD_UNK_0200A090_H
