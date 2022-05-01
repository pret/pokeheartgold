#ifndef POKEHEARTGOLD_UNK_02023694_H
#define POKEHEARTGOLD_UNK_02023694_H

#include "unk_02009D48.h"

struct Sprite;

typedef struct SpriteList SpriteList;

struct SpriteTemplate {
    void *spriteList;
    const struct SpriteResourcesHeader *header;
    VecFx32 position;
    VecFx32 scale;
    u16 rotation;
    u32 priority;
    int whichScreen;
    HeapID heapId;
};

void sub_02024AA8(void *, s32);
void sub_02024504(SpriteList *);
void sub_0202457C(SpriteList *);
struct Sprite *CreateSprite(const struct SpriteTemplate *template);
void Set2dSpriteAnimActiveFlag(struct Sprite *, int);
void Set2dSpriteAnimSeqNo(struct Sprite *, int);
void Set2dSpriteVisibleFlag(struct Sprite *, int);
SpriteList *SpriteList_Create(struct SpriteListParam *param);

#endif //POKEHEARTGOLD_UNK_02023694_H
