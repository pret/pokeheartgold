#ifndef POKEHEARTGOLD_UNK_02023694_H
#define POKEHEARTGOLD_UNK_02023694_H

#include "unk_02009D48.h"

typedef struct Sprite Sprite;

typedef struct SpriteList SpriteList;

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

void sub_02024AA8(void *, s32);
void sub_02024504(SpriteList *);
void sub_0202457C(SpriteList *);
void sub_02024758(Sprite *);
int sub_02024B68(Sprite *);
struct Sprite *CreateSprite(const struct SpriteTemplate *template);
void Set2dSpriteAnimActiveFlag(Sprite *, int);
void Set2dSpriteAnimSeqNo(Sprite *, int);
void Set2dSpriteVisibleFlag(Sprite *, int);
SpriteList *SpriteList_Create(struct SpriteListParam *param);
Unk122_021E7F64 *sub_02024CB8(void *a0);

#endif //POKEHEARTGOLD_UNK_02023694_H
