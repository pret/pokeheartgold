#ifndef POKEHEARTGOLD_VOLTORB_FLIP_INPUT_H
#define POKEHEARTGOLD_VOLTORB_FLIP_INPUT_H

#include "sprite_system.h"

typedef struct Ov122_021E8CFC {
    struct ManagedSprite *unk0;
    struct ManagedSprite *unk4;
    void *unk8;
    u8 unkC;
    u8 unkD;
    u8 unkEx : 4;
    u8 unkEy : 4;
    u8 memoOpen : 1;
    u8 memoFocused : 1;
    u8 unkFz : 1;
    u8 unkFp : 5;
} Ov122_021E8CFC;

typedef void (*Ov122UnkCB)(struct Ov122_021E8CFC *a0, int a1, int a2);

Ov122_021E8CFC *ov122_021E8CFC(HeapID, struct ManagedSprite *, struct ManagedSprite *);
void ov122_021E8D58(Ov122_021E8CFC *);
int ov122_021E8D74(Ov122_021E8CFC *);
void ov122_021E8D8C(Ov122_021E8CFC *, int);
void SetMemoOpen(Ov122_021E8CFC *, BOOL);
void SetMemoFocused(Ov122_021E8CFC *, BOOL);
int ov122_021E8DF0(Ov122_021E8CFC *);
int ov122_021E8E0C(Ov122_021E8CFC *);
BOOL ov122_021E8E28(Ov122_021E8CFC *);
void ov122_021E8E40(Ov122_021E8CFC *);
void ov122_021E8E58(Ov122_021E8CFC *);
int ov122_021E8E70(Ov122_021E8CFC *);

struct Ov122_021E8CFC;

void ov122_021E91D0(struct Ov122_021E8CFC *a0, int a1, int a2);
void ov122_021E91F4(struct Ov122_021E8CFC *a0, int a1, int a2);
void ov122_021E91F8(struct Ov122_021E8CFC *a0, int a1, int a2);
void ov122_021E925C(struct Ov122_021E8CFC *a0, int a1, int a2);

#endif // POKEHEARTGOLD_VOLTORB_FLIP_INPUT_H
