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

typedef struct GF_2DGfxResObj {
    GF_2DGfxRawResObj *resource;
    GfGfxResType type;
    void *extra;
} GF_2DGfxResObj;

typedef struct GF_2DGfxResMan {
    GF_2DGfxRawResMan *resourceMgr;
    GF_2DGfxResObj *objects;
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
    GF_2DGfxResObj **obj;
    int max;
    int num;
} GF_2DGfxResObjList;

GF_2DGfxResMan *Create2DGfxResObjMan(int num, GfGfxResType type, HeapID heapId);
void Destroy2DGfxResObjMan(GF_2DGfxResMan *mgr);
GF_2DGfxResObj *Add2DGfxResObjFromHeader(GF_2DGfxResMan *mgr, const GF_2DGfxResHeader *header, int idx, HeapID heapId);
GF_2DGfxResObj *AddCharResObjFromNarc(GF_2DGfxResMan *mgr, NarcId narcId, int fileId, BOOL compressed, int id, NNS_G2D_VRAM_TYPE vram, HeapID heapId);
GF_2DGfxResObj *AddPlttResObjFromNarc(GF_2DGfxResMan *mgr, NarcId narcId, int fileId, BOOL compressed, int id, NNS_G2D_VRAM_TYPE vram, int pltt_num, HeapID heapId);
GF_2DGfxResObj *AddCellOrAnimResObjFromNarc(GF_2DGfxResMan *mgr, NarcId narcId, int fileId, BOOL compressed, int id, GfGfxResType type, HeapID heapId);
void ReplaceCharResObjFromNarc(GF_2DGfxResMan *mgr, GF_2DGfxResObj *obj, NarcId narcId, int fileId, BOOL compressed, HeapID heapId);
void ReplacePlttResObjFromNarc(GF_2DGfxResMan *mgr, GF_2DGfxResObj *obj, NarcId narcId, int fileId, BOOL compressed, HeapID heapId);
GF_2DGfxResObj *AddCharResObjFromOpenNarc(GF_2DGfxResMan *mgr, NARC *narc, int fileId, BOOL compressed, int id, NNS_G2D_VRAM_TYPE vram, HeapID heapId);
GF_2DGfxResObj *AddCharResObjFromOpenNarcWithAtEndFlag(GF_2DGfxResMan *mgr, NARC *narc, int fileId, BOOL compressed, int id, NNS_G2D_VRAM_TYPE vram, HeapID heapId, BOOL atEnd);
GF_2DGfxResObj *AddPlttResObjFromOpenNarc(GF_2DGfxResMan *mgr, NARC *narc, int fileId, BOOL compressed, int id, NNS_G2D_VRAM_TYPE vram, int pltt_num, HeapID heapId);
GF_2DGfxResObj *AddPlttResObjFromOpenNarcWithAtEndFlag(GF_2DGfxResMan *mgr, NARC *narc, int fileId, BOOL compressed, int id, NNS_G2D_VRAM_TYPE vram, int pltt_num, HeapID heapId, BOOL atEnd);
GF_2DGfxResObj *AddCellOrAnimResObjFromOpenNarc(GF_2DGfxResMan *resMan, NARC *narc, int fileId, BOOL compressed, int id, GfGfxResType type, HeapID heapId);
void ReplaceCharResObjFromOpenNarc(GF_2DGfxResMan *mgr, GF_2DGfxResObj *obj, NARC *narc, int fileId, BOOL compressed, HeapID heapId);
void ReplacePlttResObjFromOpenNarc(GF_2DGfxResMan *mgr, GF_2DGfxResObj *obj, NARC *narc, int fileId, BOOL compressed, HeapID heapId);
int LoadAll2DGfxResObjsFromHeader(GF_2DGfxResMan *mgr, const GF_2DGfxResHeader *header, GF_2DGfxResObjList *list, HeapID heapId);
GF_2DGfxResObjList *Create2DGfxResObjList(int num, HeapID heapId);
void Delete2DGfxResObjList(GF_2DGfxResObjList *list);
BOOL GF2DGfxResObjExistsById(GF_2DGfxResMan *mgr, int a1);
void sub_0200A740(GF_2DGfxResObj *obj);
void DestroySingle2DGfxResObj(GF_2DGfxResMan *a0, GF_2DGfxResObj *a1);
GF_2DGfxResObj *Get2DGfxResObjById(GF_2DGfxResMan *mgr, int id);
int GF2DGfxResObj_GetResID(GF_2DGfxResObj *obj);
NNSG2dCharacterData *GF2DGfxResObj_GetCharDataPtr(GF_2DGfxResObj *obj);
NNSG2dPaletteData *GF2DGfxResObj_GetPlttDataPtr(GF_2DGfxResObj *obj);
NNSG2dCellDataBank *GF2DGfxResObj_GetCellDataPtr(GF_2DGfxResObj *obj);
NNSG2dAnimBankData *GF2DGfxResObj_GetAnimDataPtr(GF_2DGfxResObj *obj);
NNSG2dMultiCellDataBank *GF2DGfxResObj_GetMultiCellDataPtr(GF_2DGfxResObj *obj);
NNSG2dAnimBankData *GF2DGfxResObj_GetMultiAnimDataPtr(GF_2DGfxResObj *obj);
GfGfxResType GF2DGfxResObj_GetResType(GF_2DGfxResObj *obj);
NNS_G2D_VRAM_TYPE GF2DGfxResObj_GetLoadAddress(GF_2DGfxResObj *obj);
int GF2DGfxResObj_GetPlttNum(GF_2DGfxResObj *obj);
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
void GF2DGfxResObj_LoadExDat(GF_2DGfxResObj *obj, GfGfxResType type, NNS_G2D_VRAM_TYPE vram, int pltt_num, HeapID heapId);

#endif // POKEHEARTGOLD_UNK_0200A090_H
