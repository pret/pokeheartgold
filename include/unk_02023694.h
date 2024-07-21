#ifndef POKEHEARTGOLD_UNK_02023694_H
#define POKEHEARTGOLD_UNK_02023694_H

#include "unk_02009D48.h"

typedef struct SpriteTemplate {
    SpriteList *spriteList;                      // 000
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

void sub_02023EA4(Sprite *sprite, int a1);
struct Sprite *CreateSprite(const struct SpriteTemplate *template);
void Set2dSpriteAnimActiveFlag(Sprite *sprite, int a1);
SpriteList *SpriteList_Create(struct SpriteListParam *param);
void SpriteList_Delete(SpriteList *spriteList);
void sub_0202457C(SpriteList *spriteList);
void Sprite_Delete(Sprite *sprite);
void Sprite_SetMatrix(Sprite *sprite, VecFx32 *vec);
NNSG2dImagePaletteProxy *Sprite_GetPaletteProxy(Sprite *sprite);
NNS_G2D_VRAM_TYPE Sprite_GetVramType(Sprite *sprite);
void sub_0202487C(Sprite *sprite, u8 a1);
void Set2dSpriteVisibleFlag(Sprite *sprite, int a1);
void sub_02024868(Sprite *sprite, int a1);
VecFx32 *Sprite_GetMatrixPtr(Sprite *sprite);
VecFx32 *sub_020248B0(Sprite *sprite);
void sub_020247F4(Sprite *sprite, VecFx32 *vec);
void sub_02024818(Sprite *sprite, u32 a1);
u16 sub_020248B4(Sprite *sprite);
void sub_02024890(Sprite *sprite, u8 a1);
void sub_020247E4(Sprite *sprite, VecFx32 *vec);
void sub_02024B38(Sprite *sprite, BOOL a1);
void sub_02024B78(Sprite *sprite, GXOamMode mode);
GXOamMode sub_02024BAC(Sprite *sprite);
u32 sub_02024C9C(Sprite *sprite);
u32 Get2dSpriteAnimSeqNo(Sprite *sprite);
void Set2dSpriteAnimSeqNo(Sprite *sprite, int a1);
void TryChange2dSpriteAnimSeqNo(Sprite *sprite, int a1);
u16 Get2dSpriteCurrentAnimSeqNo(Sprite *sprite);
void Sprite_ResetAnimCtrlState(Sprite *sprite);
void Sprite_SetAnimCtrlCurrentFrame(Sprite *sprite, u16 a1);
u16 Sprite_GetAnimCtrlCurrentFrame(Sprite *sprite);
BOOL Get2dSpriteVisibleFlag(Sprite *sprite);
void Sprite_SetPalOffset(Sprite *sprite, u8 a1);
void Sprite_TickCellOrMulticellAnimation(Sprite *sprite, fx32 a1);
void Sprite_SetPalIndex(Sprite *sprite, int a1);
void sub_02024A48(Sprite *sprite, int a1);
int Sprite_GetPalIndex(Sprite *sprite);
void sub_02024AA8(Sprite *sprite, s32 a1);
u8 Sprite_GetPalOffset(Sprite *sprite);
void Sprite_SetPriority(Sprite *sprite, u8 a1);
u8 Sprite_GetPriority(Sprite *sprite);
void Sprite_SetDrawPriority(Sprite *sprite, u16 a1);
u16 Sprite_GetDrawPriority(Sprite *sprite);
NNSG2dImageProxy *Sprite_GetImageProxy(Sprite *sprite);
int Sprite_IsCellAnimationRunning(Sprite *sprite);
NNSG2dCellAnimation *Sprite_GetCellAnim(Sprite *sprite);

#endif //POKEHEARTGOLD_UNK_02023694_H
