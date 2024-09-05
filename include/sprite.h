#ifndef POKEHEARTGOLD_SPRITE_H
#define POKEHEARTGOLD_SPRITE_H

#include "unk_02009D48.h"

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

typedef struct SpriteAnimationData2 {
    const NNSG2dCellDataBank *cellBank;
    const NNSG2dCellAnimBankData *animBankData;
    NNSG2dCellAnimation animation;
    u32 cellTransferStateHandle;
} SpriteAnimationData2;

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
    u8 animationFrame;                                   // 035
    fx32 frame;                                          // 038
    SpriteList *spriteList;                              // 03c
    u32 animationData[SPRITE_ANIMATION_DATA_WORD_COUNT]; // 040
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

struct SpriteList {
    Sprite *sprites;
    int numSprites;
    Sprite **stack;
    int stackPointer;
    Sprite dummy;
    NNSG2dRendererInstance *renderer;
    void *animBuff;
    NNSG2dCellAnimBankData *animBank;
    u32 flag;
};

SpriteList *SpriteList_Create(SpriteListParam *param);
BOOL SpriteList_Delete(SpriteList *spriteList);
void sub_0202457C(SpriteList *spriteList);
Sprite *CreateSprite(const SpriteTemplate *template);
Sprite *sub_02024714(const SimpleSpriteTemplate *simpleTemplate);
void Sprite_Delete(Sprite *sprite);
void Sprite_SetMatrix(Sprite *sprite, VecFx32 *vec);
void sub_020247E4(Sprite *sprite, VecFx32 *vec);
void sub_020247F4(Sprite *sprite, VecFx32 *vec);
void sub_02024804(Sprite *sprite, VecFx32 *vec, u8 a2);
void sub_02024818(Sprite *sprite, u32 a1);
void sub_0202481C(Sprite *sprite, u32 a1, u8 a2);
void Set2dSpriteVisibleFlag(Sprite *sprite, BOOL flag);
void Set2dSpriteAnimActiveFlag(Sprite *sprite, BOOL flag);
void sub_02024868(Sprite *sprite, int a1);
void sub_0202487C(Sprite *sprite, u8 a1);
void sub_02024890(Sprite *sprite, u8 a1);
VecFx32 *Sprite_GetMatrixPtr(Sprite *sprite);
VecFx32 *sub_020248B0(Sprite *sprite);
u16 sub_020248B4(Sprite *sprite);
BOOL Get2dSpriteVisibleFlag(Sprite *sprite);
BOOL sub_020248C0(Sprite *sprite);
u32 Get2dSpriteAnimSeqNo(Sprite *sprite);
void Set2dSpriteAnimSeqNo(Sprite *sprite, int a1);
void TryChange2dSpriteAnimSeqNo(Sprite *sprite, int a1);
void Sprite_ResetAnimCtrlState(Sprite *sprite);
u16 Get2dSpriteCurrentAnimSeqNo(Sprite *sprite);
void Sprite_TickCellOrMulticellAnimation(Sprite *sprite, fx32 a1);
void Sprite_SetAnimCtrlCurrentFrame(Sprite *sprite, u16 a1);
u16 Sprite_GetAnimCtrlCurrentFrame(Sprite *sprite);
void Sprite_SetPriority(Sprite *sprite, u8 a1);
u8 Sprite_GetPriority(Sprite *sprite);
void Sprite_SetPalIndex(Sprite *sprite, int a1);
void sub_02024A48(Sprite *sprite, int a1);
int Sprite_GetPalIndex(Sprite *sprite);
void Sprite_SetPalOffset(Sprite *sprite, u8 a1);
void sub_02024AA8(Sprite *sprite, s32 a1);
u8 Sprite_GetPalOffset(Sprite *sprite);
void Sprite_SetDrawPriority(Sprite *sprite, u16 a1);
u16 Sprite_GetDrawPriority(Sprite *sprite);
void sub_02024B00(Sprite *sprite, NNSG2dImageProxy *proxy);
NNSG2dImagePaletteProxy *Sprite_GetPaletteProxy(Sprite *sprite);
void sub_02024B20(Sprite *sprite, NNSG2dImagePaletteProxy *proxy);
NNSG2dImageProxy *Sprite_GetImageProxy(Sprite *sprite);
void sub_02024B38(Sprite *sprite, BOOL a1);
NNS_G2D_VRAM_TYPE Sprite_GetVramType(Sprite *sprite);
int Sprite_IsCellAnimationRunning(Sprite *sprite);
void sub_02024B78(Sprite *sprite, GXOamMode mode);
GXOamMode sub_02024BAC(Sprite *sprite);
void sub_02024BBC(HeapID heapId);
void sub_02024BF4(HeapID heapId);
u32 sub_02024C24(Sprite *sprite, u32 a1);
u32 sub_02024C9C(Sprite *sprite);
NNSG2dCellAnimation *Sprite_GetCellAnim(Sprite *sprite);

#endif // POKEHEARTGOLD_SPRITE_H
