#ifndef POKEHEARTGOLD_UNK_02023694_H
#define POKEHEARTGOLD_UNK_02023694_H

#include "unk_02009D48.h"

typedef struct SpriteTemplate {
    void *spriteList;                            // 000
    const struct SpriteResourcesHeader *header;  // 004
    VecFx32 position;                            // 008
    VecFx32 scale;                               // 014
    u16 rotation;                                // 020
    u32 priority;                                // 024
    NNS_G2D_VRAM_TYPE whichScreen;               // 028
    HeapID heapId;                               // 02C
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
    SpriteResourceHeaderList *spriteResourceHeaderList;
    int vramTransfer;
} UnkImageStruct;

void sub_02023EA4(Sprite *, int);
struct Sprite *CreateSprite(const struct SpriteTemplate *template);
void Set2dSpriteAnimActiveFlag(Sprite *, int);
SpriteList *SpriteList_Create(struct SpriteListParam *param);
void SpriteList_Delete(SpriteList *);
void sub_0202457C(SpriteList *);
void Sprite_Delete(Sprite *);
void Sprite_SetMatrix(Sprite *, VecFx32 *);
NNSG2dImagePaletteProxy *sub_02024B34(Sprite *);
NNS_G2D_VRAM_TYPE Sprite_GetVramType(Sprite*);
void sub_0202487C(Sprite*, u8);
void Set2dSpriteVisibleFlag(Sprite *, int);
void sub_02024868(Sprite *, int);
VecFx32 *Sprite_GetMatrixPtr(Sprite *);
VecFx32* sub_020248B0(Sprite*);
void sub_020247F4(Sprite*, VecFx32*);
void sub_02024818(Sprite*, u32);
u16 sub_020248B4(Sprite*);
void sub_02024890(Sprite*, u8);
void sub_020247E4(Sprite*, VecFx32*);
void sub_02024B38(Sprite*, BOOL);
void sub_02024B78(Sprite* sprite, GXOamMode mode);
GXOamMode sub_02024BAC(Sprite* sprite);
u32 sub_02024C9C(Sprite*);
u32 Get2dSpriteAnimSeqNo(Sprite*);
void Set2dSpriteAnimSeqNo(Sprite *, int);
void TryChange2dSpriteAnimSeqNo(Sprite *, int);
u16 Get2dSpriteCurrentAnimSeqNo(Sprite *);
void Sprite_ResetAnimCtrlState(Sprite*);
void Sprite_SetAnimCtrlCurrentFrame(Sprite*, u16);
u16 Sprite_GetAnimCtrlCurrentFrame(Sprite*);
BOOL Get2dSpriteVisibleFlag(Sprite*);
void Sprite_SetPalOffset(Sprite*, u8);
void Sprite_TickCellOrMulticellAnimation(Sprite*, fx32);
void Sprite_SetPalIndex(Sprite*, int);
void sub_02024A48(Sprite*, int);
int Sprite_GetPalIndex(Sprite*);
void sub_02024AA8(void *, s32);
u8 Sprite_GetPalOffset(Sprite*);
void Sprite_SetPriority(Sprite*, u8);
u8 Sprite_GetPriority(Sprite*);
void Sprite_SetDrawPriority(Sprite*, u16);
u16 Sprite_GetDrawPriority(Sprite*);
NNSG2dImageProxy *sub_02024B1C(Sprite *);
int Sprite_IsCellAnimationFinished(Sprite *);
NNSG2dCellAnimation *sub_02024CB8(Sprite *a0);

#endif //POKEHEARTGOLD_UNK_02023694_H
