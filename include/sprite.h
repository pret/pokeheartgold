#ifndef POKEHEARTGOLD_SPRITE_H
#define POKEHEARTGOLD_SPRITE_H

#include "unk_02009D48.h"

typedef enum SpriteAnimType {
    SPRITE_ANIM_TYPE_NULL,
    SPRITE_ANIM_TYPE_CELL,
    SPRITE_ANIM_TYPE_MULTICELL,
    SPRITE_ANIM_TYPE_CELL_TRANSFER,
} SpriteAnimType;

typedef struct SimpleSpriteTemplate {
    SpriteList *spriteList;              // 000
    const SpriteResourcesHeader *header; // 004
    VecFx32 position;                    // 008
    u32 priority;                        // 014
    NNS_G2D_VRAM_TYPE whichScreen;       // 018
    HeapID heapId;                       // 01C
} SimpleSpriteTemplate;

typedef struct SpriteTemplate {
    SpriteList *spriteList;              // 000
    const SpriteResourcesHeader *header; // 004
    VecFx32 position;                    // 008
    VecFx32 scale;                       // 014
    u16 rotation;                        // 020
    u32 priority;                        // 024
    NNS_G2D_VRAM_TYPE whichScreen;       // 028
    HeapID heapId;                       // 02C
} SpriteTemplate;

typedef struct SpriteAnimationData {
    const NNSG2dCellDataBank *cellBank;
    const NNSG2dCellAnimBankData *animBankData;
    NNSG2dCellAnimation animation;
} SpriteAnimationData;

typedef struct SpriteAnimationDataWithTransfer {
    const NNSG2dCellDataBank *cellBank;
    const NNSG2dCellAnimBankData *animBankData;
    NNSG2dCellAnimation animation;
    u32 cellTransferStateHandle;
} SpriteAnimationDataWithTransfer;

typedef struct SpriteMultiAnimationData {
    const NNSG2dCellDataBank *cellBank;
    const NNSG2dCellAnimBankData *animBankData;
    NNSG2dMultiCellAnimation animation;
    const NNSG2dMultiCellDataBank *multiCellBank;
    const NNSG2dMultiCellAnimBankData *multiAnimBankData;
    NNSG2dNode *node;
    NNSG2dCellAnimation *cellAnim;
} SpriteMultiAnimationData;

// UB: this is too small
#ifdef BUGFIX_SPRITE_ANIM_SIZE
#define max(a, b)                        ((a) > (b) ? (a) : (b))
#define SPRITE_ANIMATION_DATA_WORD_COUNT (max(sizeof(SpriteAnimationData), sizeof(SpriteMultiAnimationData)) / 4)
#else
#define SPRITE_ANIMATION_DATA_WORD_COUNT 29
#endif // BUGFIX_SPRITE_ANIM_SIZE

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
    u8 animActive;                                       // 035
    fx32 speed;                                          // 038
    SpriteList *spriteList;                              // 03c
    u32 animationData[SPRITE_ANIMATION_DATA_WORD_COUNT]; // 040
    NNSG2dImageProxy imageProxy;                         // 0b4
    NNSG2dImagePaletteProxy paletteProxy;                // 0d8
    SpriteAnimType flag;                                 // 0ec
    u16 animationNo;                                     // 0f0
    u8 priority;                                         // 0f2
    u16 drawPriority;                                    // 0f4
    NNS_G2D_VRAM_TYPE type;                              // 0f8
    struct Sprite *prev;                                 // 0fc
    struct Sprite *next;                                 // 100
} Sprite;

typedef struct ManagedSprite {
    Sprite *sprite;
    SpriteResourcesHeader *spriteResourcesHeader;
    SpriteResourceHeaderList *spriteResourceHeaderList;
    int vramTransfer;
} ManagedSprite;

struct SpriteList {
    Sprite *sprites;                  // 0x000
    int numSprites;                   // 0x004
    Sprite **stack;                   // 0x008
    int stackPointer;                 // 0x00C
    Sprite dummy;                     // 0x010
    NNSG2dRendererInstance *renderer; // 0x114
    void *animBuff;                   // 0x118
    NNSG2dCellAnimBankData *animBank; // 0x11C
    u32 flag;                         // 0x120
};

SpriteList *SpriteList_Create(SpriteListParam *param);
BOOL SpriteList_Delete(SpriteList *spriteList);
BOOL SpriteList_DeleteAllSprites(SpriteList *spriteList);
void SpriteList_RenderAndAnimateSprites(SpriteList *spriteList);
Sprite *Sprite_CreateAffine(const SpriteTemplate *template);
Sprite *Sprite_Create(const SimpleSpriteTemplate *simpleTemplate);
void Sprite_Delete(Sprite *sprite);
void Sprite_SetMatrix(Sprite *sprite, VecFx32 *vec);
void Sprite_SetAffineMatrix(Sprite *sprite, VecFx32 *vec);
void Sprite_SetAffineScale(Sprite *sprite, VecFx32 *vec);
void Sprite_SetScaleAndAffineType(Sprite *sprite, VecFx32 *vec, u8 affine);
void Sprite_SetAffineZRotation(Sprite *sprite, u32 a1);
void Sprite_SetRotationAndAffineType(Sprite *sprite, u32 rotation, u8 affine);
void Sprite_SetDrawFlag(Sprite *sprite, BOOL flag);
void Sprite_SetAnimActiveFlag(Sprite *sprite, BOOL flag);
void Sprite_SetAnimSpeed(Sprite *sprite, fx32 frame);
void Sprite_SetAffineOverwriteMode(Sprite *sprite, u8 affine);
void Sprite_SetFlipMode(Sprite *sprite, u8 flip);
VecFx32 *Sprite_GetMatrixPtr(Sprite *sprite);
VecFx32 *Sprite_GetScalePtr(Sprite *sprite);
u16 Sprite_GetRotation(Sprite *sprite);
BOOL Sprite_GetDrawFlag(Sprite *sprite);
BOOL Sprite_GetAnimActiveFlag(Sprite *sprite);
u32 Sprite_GetNumAnimSeqs(Sprite *sprite);
void Sprite_SetAnimCtrlSeq(Sprite *sprite, int seq);
void Sprite_TryChangeAnimSeq(Sprite *sprite, int seq);
void Sprite_ResetAnimCtrlState(Sprite *sprite);
u16 Sprite_GetAnimationNumber(Sprite *sprite);
void Sprite_UpdateAnim(Sprite *sprite, fx32 frames);
void Sprite_SetAnimationFrame(Sprite *sprite, u16 frame);
u16 Sprite_GetAnimationFrame(Sprite *sprite);
void Sprite_SetPriority(Sprite *sprite, u8 priority);
u8 Sprite_GetPriority(Sprite *sprite);
void Sprite_SetPaletteOverride(Sprite *sprite, int index);
void Sprite_SetPalIndexRespectVramOffset(Sprite *sprite, int index);
int Sprite_GetPalIndex(Sprite *sprite);
void Sprite_SetPalOffset(Sprite *sprite, u8 offset);
void Sprite_SetPalOffsetRespectVramOffset(Sprite *sprite, u8 offset);
u8 Sprite_GetPalOffset(Sprite *sprite);
void Sprite_SetDrawPriority(Sprite *sprite, u32 priority);
u16 Sprite_GetDrawPriority(Sprite *sprite);
void Sprite_SetImageProxy(Sprite *sprite, NNSG2dImageProxy *proxy);
NNSG2dImageProxy *Sprite_GetImageProxy(Sprite *sprite);
void Sprite_SetPaletteProxy(Sprite *sprite, NNSG2dImagePaletteProxy *proxy);
NNSG2dImagePaletteProxy *Sprite_GetPaletteProxy(Sprite *sprite);
void Sprite_SetMosaic(Sprite *sprite, BOOL mosaic);
NNS_G2D_VRAM_TYPE Sprite_GetVramType(Sprite *sprite);
int Sprite_IsAnimated(Sprite *sprite);
void Sprite_SetOamMode(Sprite *sprite, GXOamMode mode);
GXOamMode Sprite_GetOamMode(Sprite *sprite);
void ClearMainOAM(HeapID heapId);
void ClearSubOAM(HeapID heapId);
u32 Sprite_GetCurrentAnimFrameExAttr(Sprite *sprite);
NNSG2dCellAnimation *Sprite_GetCellAnim(Sprite *sprite);

#endif // POKEHEARTGOLD_SPRITE_H
