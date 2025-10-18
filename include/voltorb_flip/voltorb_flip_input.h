#ifndef POKEHEARTGOLD_VOLTORB_FLIP_INPUT_H
#define POKEHEARTGOLD_VOLTORB_FLIP_INPUT_H

#include "sprite_system.h"
#include "unk_020192D0.h"

typedef enum VoltorbFlipInput {
    VOLTORB_FLIP_INPUT_GRID_BEGIN = 0,
    VOLTORB_FLIP_INPUT_GRID_END = 24,
    VOLTORB_FLIP_INPUT_MEMO,
    VOLTORB_FLIP_INPUT_QUIT,
} VoltorbFlipInput;

typedef struct Ov122_021E8CFC {
    struct ManagedSprite *unk0;
    struct ManagedSprite *unk4;
    UnkStruct_02019BA4 *unk8;
    u8 selectedRow;
    u8 focus;
    u8 unkEx : 4;
    u8 unkEy : 4;
    u8 memoOpen : 1;
    u8 memoFocused : 1;
    u8 unkFz : 1;
    u8 unkFp : 5;
} Ov122_021E8CFC;

Ov122_021E8CFC *ov122_021E8CFC(enum HeapID, struct ManagedSprite *, struct ManagedSprite *);
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

#endif // POKEHEARTGOLD_VOLTORB_FLIP_INPUT_H
