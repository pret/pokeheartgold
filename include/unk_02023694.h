#ifndef POKEHEARTGOLD_UNK_02023694_H
#define POKEHEARTGOLD_UNK_02023694_H

#include "unk_02009D48.h"

typedef struct SpriteTemplate {
    void *spriteList;
    const struct SpriteResourcesHeader *header;
    VecFx32 position;
    VecFx32 scale;
    u16 rotation;
    u32 priority;
    int whichScreen;
    HeapID heapId;
} SpriteTemplate;

typedef struct Unk122_021E7F64 {
    u8 unk0[0x10];
    int unk10;
} Unk122_021E7F64;

typedef struct Sprite {
    VecFx32 matrix;
    VecFx32 affineMatrix;
    VecFx32 scale;
    u16 rotation;
    u8 affine;
    u8 flip;
    u8 overwrite;
    u8 palIndex;
    u8 palOffset;
    BOOL mosaic;
    GXOamMode mode;
    u8 drawFlag;
    u8 animationFrame;
    fx32 frame;
    void *unkPtr;
    u32 animationData[29];
    NNSG2dImageProxy imageProxy;
    NNSG2dImagePaletteProxy paletteProxy;
    u32 flag;
    u16 animationNo;
    u8 priority;
    u16 drawPriority;
    NNS_G2D_VRAM_TYPE type;
    struct Sprite *prev;
    struct Sprite *next;
} Sprite;

typedef struct UnkImageStruct {
    Sprite *unk0;
    SpriteResourcesHeader *unk4;
    ListOfUnkStruct_02009D48 *unk8;
    int vramTransfer;
} UnkImageStruct;

void sub_02024AA8(void *, s32);
void sub_02024504(SpriteList *);
void sub_0202457C(SpriteList *);
void Sprite_Delete(Sprite *);
int sub_02024B68(Sprite *);
struct Sprite *CreateSprite(const struct SpriteTemplate *template);
void Set2dSpriteAnimActiveFlag(Sprite *, int);
void Set2dSpriteAnimSeqNo(Sprite *, int);
void Set2dSpriteVisibleFlag(Sprite *, int);
SpriteList *SpriteList_Create(struct SpriteListParam *param);
Unk122_021E7F64 *sub_02024CB8(void *a0);
void sub_020247D4(Sprite *, VecFx32 *);
VecFx32 *sub_020248AC(Sprite *);
void sub_02024868(Sprite *, int);
void sub_02024950(Sprite *, int);
void sub_02023EA4(Sprite *, int);
void sub_02024A14(Sprite*, int);
void sub_02024A48(Sprite*, int);
int sub_02024A6C(Sprite*);
NNSG2dImageProxy *sub_02024B1C(Sprite *);

#endif //POKEHEARTGOLD_UNK_02023694_H
