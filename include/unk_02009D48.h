#ifndef POKEHEARTGOLD_UNK_02009D48_H
#define POKEHEARTGOLD_UNK_02009D48_H

#include "unk_0200A090.h"

typedef struct UnkStruct_02009D48 {
    const NNSG2dImageProxy* imageProxy;
    const NNSG2dCharacterData* charData;
    const NNSG2dImagePaletteProxy* plttProxy;
    NNSG2dCellDataBank* cellData;
    const NNSG2dCellAnimBankData* cellAnim;
    const NNSG2dMultiCellDataBank* multiCellData;
    const NNSG2dMultiCellAnimBankData* multiCellAnim;
    int flag;
    u8 priority;
} UnkStruct_02009D48;

typedef struct ListOfUnkStruct_02009D48 {
    UnkStruct_02009D48 *headers;
    int num;
} ListOfUnkStruct_02009D48;

struct UnkStruct_02009E84 {
    u32 charId;
    u32 plttId;
    u32 cellId;
    u32 animId;
    u32 mcelId;
    u32 manmId;
    u32 xferFlag;
    u32 priority;
};

typedef struct UnkStruct_0202445C UnkStruct_0202445C;

typedef struct UnkStruct_02009F40 {
    NNSG2dRendererInstance rendererInstance;
    NNSG2dRenderSurface renderSurface[2];
} UnkStruct_02009F40;

struct UnkLocal_02009F40 {
    int unk_0;
    NNSG2dRendererInstance *rendererInstance;
    HeapID heapId;
};

void sub_02009D48(struct UnkStruct_02009D48 *hdr, int charId, int plttId, int cellId, int cellAnmId, int multiCellId, int multiCellAnmId, int transfer, int priority, struct _2DGfxResMan *charMan, struct _2DGfxResMan *plttMan, struct _2DGfxResMan *cellMan, struct _2DGfxResMan *cellAnmMan, struct _2DGfxResMan *multiCellMan, struct _2DGfxResMan *multiCellAnmMan);
ListOfUnkStruct_02009D48 *sub_02009E84(const struct UnkStruct_02009E84 *a0, HeapID heapId, struct _2DGfxResMan *charMan, struct _2DGfxResMan *plttMan, struct _2DGfxResMan *cellMan, struct _2DGfxResMan *animMan, struct _2DGfxResMan *mcelMan, struct _2DGfxResMan *manmMan);
void sub_02009F24(ListOfUnkStruct_02009D48 *list);
UnkStruct_0202445C *sub_02009F40(int a0, UnkStruct_02009F40 *a1, HeapID heapId);
void sub_02009FA8(struct UnkStruct_02009F40 *a0, fx32 x, fx32 y);
void sub_02009FC8(struct UnkStruct_02009F40 *a0, fx32 x, fx32 y);
void sub_02009FE8(u32 a0, GXOBJVRamModeChar mode);
void sub_0200A080(u32 a0);

#endif //POKEHEARTGOLD_UNK_02009D48_H
