#ifndef POKEHEARTGOLD_UNK_0200A090_H
#define POKEHEARTGOLD_UNK_0200A090_H

#include "filesystem.h"
#include "unk_02025534.h"

struct CharResource_0200A090 {
    NNSG2dCharacterData *charData;
    int vram;
};

struct PlttResource_0200A090 {
    NNSG2dPaletteData  *plttData;
    int vram;
    int pltt_num;
};

struct CellDataBankResource_0200A090 {
    NNSG2dCellDataBank *cellDataBank;
};

struct AnimBankDataResource_0200A090 {
    NNSG2dAnimBankData *animBankData;
};

struct MultiCellDataBankResource_0200A090 {
    NNSG2dMultiCellDataBank *multiCellDataBank;
};

struct MultiAnimBankDataResource_0200A090 {
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

struct UnkStruct_0200A090_sub4 {
    struct UnkStruct_02025534_sub *unk0;
    GfGfxResType type;
    void *unk8;
};

struct UnkStruct_0200A090 {
    struct UnkStruct_02025534 *resourceMgr;
    struct UnkStruct_0200A090_sub4 *objects;
    int max;
    int num;
    GfGfxResType type;
};

struct UnkStruct_0200A110_sub {
    int id;
    char filename[0x40];
    int extra[2];
};

struct UnkStruct_0200A110_sub2 {
    int narcId;
    int fileId;
    BOOL compressed;
    int id;
    int extra[2];
};

struct UnkStruct_0200A110 {
    void *table;
    int num;
    GfGfxResType type;
    u8 isNarc;
};

struct UnkStruct_0200A674 {
    struct UnkStruct_0200A090_sub4 **obj;
    int max;
    int num;
};

struct UnkStruct_0200A090 *sub_0200A090(int num, GfGfxResType type, HeapID heapId);
void sub_0200A0D0(struct UnkStruct_0200A090 *mgr);
struct UnkStruct_0200A090_sub4 *sub_0200A110(struct UnkStruct_0200A090 *mgr, const struct UnkStruct_0200A110 *header, int idx, HeapID heapId);
struct UnkStruct_0200A090_sub4 *sub_0200A1D8(struct UnkStruct_0200A090 *mgr, NarcId narcId, int fileId, BOOL compressed, int id, int vram, HeapID heapId);
struct UnkStruct_0200A090_sub4 *sub_0200A234(struct UnkStruct_0200A090 *mgr, NarcId narcId, int fileId, BOOL compressed, int id, int vram, int pltt_num, HeapID heapId);
struct UnkStruct_0200A090_sub4 *sub_0200A294(struct UnkStruct_0200A090 *mgr, NarcId narcId, int fileId, BOOL compressed, int id, int type, HeapID heapId);
void sub_0200A2E4(struct UnkStruct_0200A090 *mgr, struct UnkStruct_0200A090_sub4 *obj, NarcId narcId, int fileId, BOOL compressed, HeapID heapId);
void sub_0200A350(struct UnkStruct_0200A090 *mgr, struct UnkStruct_0200A090_sub4 *obj, NarcId narcId, int fileId, BOOL compressed, HeapID heapId);
struct UnkStruct_0200A090_sub4 *sub_0200A3C8(struct UnkStruct_0200A090 *mgr, NARC *narc, int fileId, BOOL compressed, int id, int vram, HeapID heapId);
struct UnkStruct_0200A090_sub4 *sub_0200A424(struct UnkStruct_0200A090 *mgr, NARC *narc, int fileId, BOOL compressed, int id, int vram, HeapID heapId, BOOL atEnd);
struct UnkStruct_0200A090_sub4 *sub_0200A480(struct UnkStruct_0200A090 *mgr, NARC *narc, int fileId, BOOL compressed, int id, int vram, int pltt_num, HeapID heapId);
struct UnkStruct_0200A090_sub4 *sub_0200A4E0(struct UnkStruct_0200A090 *mgr, NARC *narc, int fileId, BOOL compressed, int id, int vram, int pltt_num, HeapID heapId, BOOL atEnd);
struct UnkStruct_0200A090_sub4 *sub_0200A540(struct UnkStruct_0200A090 *a0, NARC *narc, int fileId, BOOL compressed, int id, GfGfxResType type, HeapID heapId);
void sub_0200A590(struct UnkStruct_0200A090 *mgr, struct UnkStruct_0200A090_sub4 *obj, NARC *narc, int fileId, BOOL compressed, HeapID heapId);
void sub_0200A5FC(struct UnkStruct_0200A090 *mgr, struct UnkStruct_0200A090_sub4 *obj, NARC *narc, int fileId, BOOL compressed, HeapID heapId);
int sub_0200A674(struct UnkStruct_0200A090 *mgr, const struct UnkStruct_0200A110 *header, struct UnkStruct_0200A674 *list, HeapID heapId);
struct UnkStruct_0200A674 *sub_0200A6F0(int num, HeapID heapId);
void sub_0200A714(struct UnkStruct_0200A674 *list);
BOOL sub_0200A728(struct UnkStruct_0200A090 *mgr, int a1);
void sub_0200A740(struct UnkStruct_0200A090_sub4 *obj);
void sub_0200A75C(struct UnkStruct_0200A090 *a0, struct UnkStruct_0200A090_sub4 *a1);
struct UnkStruct_0200A090_sub4 *sub_0200A7BC(struct UnkStruct_0200A090 *mgr, int id);
int sub_0200A7FC(struct UnkStruct_0200A090_sub4 *obj);
NNSG2dCharacterData *sub_0200A810(struct UnkStruct_0200A090_sub4 *obj);
NNSG2dPaletteData *sub_0200A828(struct UnkStruct_0200A090_sub4 *obj);
NNSG2dCellDataBank *sub_0200A840(struct UnkStruct_0200A090_sub4 *obj);
NNSG2dAnimBankData *sub_0200A858(struct UnkStruct_0200A090_sub4 *obj);
NNSG2dMultiCellDataBank *sub_0200A870(struct UnkStruct_0200A090_sub4 *obj);
NNSG2dAnimBankData *sub_0200A888(struct UnkStruct_0200A090_sub4 *obj);
GfGfxResType sub_0200A8A0(struct UnkStruct_0200A090_sub4 *obj);
int sub_0200A8B0(struct UnkStruct_0200A090_sub4 *obj);
int sub_0200A8DC(struct UnkStruct_0200A090_sub4 *obj);
u32 sub_0200A8FC(void);
struct UnkStruct_0200A110 *sub_0200A900(struct UnkStruct_0200A110 *headers, int num);
void sub_0200A908(const void *a0, struct UnkStruct_0200A110 *header, HeapID heapId);
void sub_0200A954(struct UnkStruct_0200A110 *header);
int sub_0200A96C(const struct UnkStruct_0200A110 *header);
int sub_0200A97C(struct UnkStruct_0200A110 *header, int idx);
int sub_0200A9B0(struct UnkStruct_0200A110 *header, int idx);
BOOL sub_0200A9DC(struct UnkStruct_0200A110 *header, int idx);
int sub_0200AA08(struct UnkStruct_0200A110 *header, int idx);
int sub_0200AA3C(struct UnkStruct_0200A110 *header, int idx);
void sub_0200AA9C(struct UnkStruct_0200A090_sub4 *obj, GfGfxResType type, int vram, int pltt_num, HeapID heapId);

#endif //POKEHEARTGOLD_UNK_0200A090_H
