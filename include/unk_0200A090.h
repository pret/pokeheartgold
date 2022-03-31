#ifndef POKEHEARTGOLD_UNK_0200A090_H
#define POKEHEARTGOLD_UNK_0200A090_H

#include "filesystem.h"
#include "unk_02025534.h"

struct CharResExtraData {
    NNSG2dCharacterData *charData;
    int vram;
};

struct PlttResExtraData {
    NNSG2dPaletteData  *plttData;
    int vram;
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
} GfGfxResType;

struct _2DGfxResObj {
    struct _2DGfxRawResObj *resource;
    GfGfxResType type;
    void *extra;
};

struct _2DGfxResMan {
    struct _2DGfxRawResMan *resourceMgr;
    struct _2DGfxResObj *objects;
    int max;
    int num;
    GfGfxResType type;
};

struct _2DGfxResHeaderFile {
    int id;
    char filename[0x40];
    int extra[2];
};

struct _2DGfxResHeaderNarc {
    int narcId;
    int fileId;
    BOOL compressed;
    int id;
    int extra[2];
};

struct _2DGfxResHeader {
    void *table;
    int num;
    GfGfxResType type;
    u8 isNarc;
};

struct _2DGfxResObjList {
    struct _2DGfxResObj **obj;
    int max;
    int num;
};

struct _2DGfxResMan *Create2DGfxResObjMan(int num, GfGfxResType type, HeapID heapId);
void Destroy2DGfxResObjMan(struct _2DGfxResMan *mgr);
struct _2DGfxResObj *Add2DGfxResObjFromHeader(struct _2DGfxResMan *mgr, const struct _2DGfxResHeader *header, int idx, HeapID heapId);
struct _2DGfxResObj *AddCharResObjFromNarc(struct _2DGfxResMan *mgr, NarcId narcId, int fileId, BOOL compressed, int id, int vram, HeapID heapId);
struct _2DGfxResObj *AddPlttResObjFromNarc(struct _2DGfxResMan *mgr, NarcId narcId, int fileId, BOOL compressed, int id, int vram, int pltt_num, HeapID heapId);
struct _2DGfxResObj *AddCellOrAnimResObjFromNarc(struct _2DGfxResMan *mgr, NarcId narcId, int fileId, BOOL compressed, int id, int type, HeapID heapId);
void ReplaceCharResObjFromNarc(struct _2DGfxResMan *mgr, struct _2DGfxResObj *obj, NarcId narcId, int fileId, BOOL compressed, HeapID heapId);
void ReplacePlttResObjFromNarc(struct _2DGfxResMan *mgr, struct _2DGfxResObj *obj, NarcId narcId, int fileId, BOOL compressed, HeapID heapId);
struct _2DGfxResObj *AddCharResObjFromOpenNarc(struct _2DGfxResMan *mgr, NARC *narc, int fileId, BOOL compressed, int id, int vram, HeapID heapId);
struct _2DGfxResObj *AddCharResObjFromOpenNarcWithAtEndFlag(struct _2DGfxResMan *mgr, NARC *narc, int fileId, BOOL compressed, int id, int vram, HeapID heapId, BOOL atEnd);
struct _2DGfxResObj *AddPlttResObjFromOpenNarc(struct _2DGfxResMan *mgr, NARC *narc, int fileId, BOOL compressed, int id, int vram, int pltt_num, HeapID heapId);
struct _2DGfxResObj *AddPlttResObjFromOpenNarcWithAtEndFlag(struct _2DGfxResMan *mgr, NARC *narc, int fileId, BOOL compressed, int id, int vram, int pltt_num, HeapID heapId, BOOL atEnd);
struct _2DGfxResObj *AddCellOrAnimResObjFromOpenNarc(struct _2DGfxResMan *resMan, NARC *narc, int fileId, BOOL compressed, int id, GfGfxResType type, HeapID heapId);
void ReplaceCharResObjFromOpenNarc(struct _2DGfxResMan *mgr, struct _2DGfxResObj *obj, NARC *narc, int fileId, BOOL compressed, HeapID heapId);
void ReplacePlttResObjFromOpenNarc(struct _2DGfxResMan *mgr, struct _2DGfxResObj *obj, NARC *narc, int fileId, BOOL compressed, HeapID heapId);
int LoadAll2DGfxResObjsFromHeader(struct _2DGfxResMan *mgr, const struct _2DGfxResHeader *header, struct _2DGfxResObjList *list, HeapID heapId);
struct _2DGfxResObjList *Create2DGfxResObjList(int num, HeapID heapId);
void Delete2DGfxResObjList(struct _2DGfxResObjList *list);
BOOL _2DGfxResObjExistsById(struct _2DGfxResMan *mgr, int a1);
void sub_0200A740(struct _2DGfxResObj *obj);
void DestroySingle2DGfxResObj(struct _2DGfxResMan *a0, struct _2DGfxResObj *a1);
struct _2DGfxResObj *Get2DGfxResObjById(struct _2DGfxResMan *mgr, int id);
int sub_0200A7FC(struct _2DGfxResObj *obj);
NNSG2dCharacterData *sub_0200A810(struct _2DGfxResObj *obj);
NNSG2dPaletteData *sub_0200A828(struct _2DGfxResObj *obj);
NNSG2dCellDataBank *sub_0200A840(struct _2DGfxResObj *obj);
NNSG2dAnimBankData *sub_0200A858(struct _2DGfxResObj *obj);
NNSG2dMultiCellDataBank *sub_0200A870(struct _2DGfxResObj *obj);
NNSG2dAnimBankData *sub_0200A888(struct _2DGfxResObj *obj);
GfGfxResType sub_0200A8A0(struct _2DGfxResObj *obj);
int sub_0200A8B0(struct _2DGfxResObj *obj);
int sub_0200A8DC(struct _2DGfxResObj *obj);
u32 sub_0200A8FC(void);
struct _2DGfxResHeader *sub_0200A900(struct _2DGfxResHeader *headers, int num);
void sub_0200A908(const void *a0, struct _2DGfxResHeader *header, HeapID heapId);
void sub_0200A954(struct _2DGfxResHeader *header);
int sub_0200A96C(const struct _2DGfxResHeader *header);
int sub_0200A97C(struct _2DGfxResHeader *header, int idx);
int sub_0200A9B0(struct _2DGfxResHeader *header, int idx);
BOOL sub_0200A9DC(struct _2DGfxResHeader *header, int idx);
int sub_0200AA08(struct _2DGfxResHeader *header, int idx);
int sub_0200AA3C(struct _2DGfxResHeader *header, int idx);
void sub_0200AA9C(struct _2DGfxResObj *obj, GfGfxResType type, int vram, int pltt_num, HeapID heapId);

#endif //POKEHEARTGOLD_UNK_0200A090_H
