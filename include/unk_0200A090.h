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
void sub_0200AEB0(void *a0);
void sub_0200B0A8(void *a0);
void sub_0200A75C(struct UnkStruct_0200A090 *a0, struct UnkStruct_0200A090_sub4 *a1);
struct UnkStruct_0200A090_sub4 *sub_0200A3C8(struct UnkStruct_0200A090 *mgr, NARC *narc, int fileId, BOOL compressed, int id, int vram, HeapID heapId);
struct UnkStruct_0200A090_sub4 *sub_0200A480(struct UnkStruct_0200A090 *mgr, NARC *narc, int fileId, BOOL compressed, int id, int vram, int pltt_num, HeapID heapId);
struct UnkStruct_0200A090_sub4 *sub_0200A540(struct UnkStruct_0200A090 *a0, NARC *narc, int fileId, BOOL compressed, int id, GfGfxResType type, HeapID heapId);

#endif //POKEHEARTGOLD_UNK_0200A090_H
