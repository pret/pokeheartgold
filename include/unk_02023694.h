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

struct SpriteAnimationData {
    const NNSG2dCellDataBank* cellBank;
    const NNSG2dCellAnimBankData* animBankData;
    NNSG2dCellAnimation animation;
};

#define SPRITE_ANIMATION_DATA_WORD_COUNT  (sizeof(struct SpriteAnimationData)/4)

typedef struct Sprite {
    VecFx32 matrix;                                      // 000
    VecFx32 affineMatrix;                                // 00C
    VecFx32 scale;                                       // 018
    u16 rotation;                                        // 024
    u8 affine;                                           // 026
    u8 flip;                                             // 027
    u8 overwrite;                                        // 028
    u8 palIndex;                                         // 029
    u8 palOffset;                                        // 02a
    BOOL mosaic;                                         // 02c
    GXOamMode mode;                                      // 030
    u8 drawFlag;                                         // 034
    u8 animationFrame;                                   // 035
    fx32 frame;                                          // 038
    void *unkPtr;                                        // 03c
    u32 animationData[SPRITE_ANIMATION_DATA_WORD_COUNT]; // 040, cast to SpriteAnimationData internally
    NNSG2dImageProxy imageProxy;                         // 0b4
    NNSG2dImagePaletteProxy paletteProxy;                // 0d8
    u32 flag;                                            // 0ec
    u16 animationNo;                                     // 0f0
    u8 priority;                                         // 0f2
    u16 drawPriority;                                    // 0f4
    NNS_G2D_VRAM_TYPE type;                              // 0f8
    struct Sprite *prev;                                 // 0fc
    struct Sprite *next;                                 // 100
} Sprite;

typedef struct UnkImageStruct {
    Sprite *sprite;
    SpriteResourcesHeader *spriteResourcesHeader;
    ListOfUnkStruct_02009D48 *listOfUnkStruct_9D48;
    int vramTransfer;
} UnkImageStruct;

void sub_02023EA4(Sprite *, int);
struct Sprite *CreateSprite(const struct SpriteTemplate *template);
void Set2dSpriteAnimActiveFlag(Sprite *, int);
SpriteList *SpriteList_Create(struct SpriteListParam *param);
void sub_02024504(SpriteList *);
void sub_0202457C(SpriteList *);
void Sprite_Delete(Sprite *);
void sub_020247D4(Sprite *, VecFx32 *);
NNS_G2D_VRAM_TYPE sub_02024B60(Sprite*);
void sub_0202487C(Sprite*, u8);
void Set2dSpriteVisibleFlag(Sprite *, int);
void sub_02024868(Sprite *, int);
VecFx32 *sub_020248AC(Sprite *);
VecFx32* sub_020248B0(Sprite*);
void sub_020247F4(Sprite*, VecFx32*);
void sub_02024818(Sprite*, u16);
u16 sub_020248B4(Sprite*);
void sub_02024890(Sprite*, u8);
void sub_020247E4(Sprite*, VecFx32*);
void sub_02024B38(Sprite*, BOOL);
void sub_02024B78(Sprite* sprite, GXOamMode mode);
GXOamMode sub_02024BAC(Sprite* sprite);
u32 sub_02024C9C(Sprite*);
u32 sub_020248C8(Sprite*);
void Set2dSpriteAnimSeqNo(Sprite *, int);
void sub_02024950(Sprite *, int);
u16 sub_020249A8(Sprite *);
void sub_02024964(Sprite*);
void sub_020249D4(Sprite*);
u16 sub_020249F8(Sprite*);
BOOL sub_020248B8(Sprite*);
void sub_02024A74(Sprite*, u8);
void sub_020249B0(Sprite*, fx32);
void sub_02024A14(Sprite*, int);
void sub_02024A48(Sprite*, int);
int sub_02024A6C(Sprite*);
void sub_02024AA8(void *, s32);
u8 sub_02024ACC(Sprite*);
void sub_02024A04(Sprite*, u8);
u8 sub_02024A0C(Sprite*);
void sub_02024ADC(Sprite*, u16);
u16 sub_02024AF8(Sprite*);
NNSG2dImageProxy *sub_02024B1C(Sprite *);
int sub_02024B68(Sprite *);
NNSG2dCellAnimation *sub_02024CB8(Sprite *a0);

#endif //POKEHEARTGOLD_UNK_02023694_H
