#ifndef POKEHEARTGOLD_VOLTORB_FLIP_INPUT_H
#define POKEHEARTGOLD_VOLTORB_FLIP_INPUT_H

#include "sprite_system.h"
#include "unk_020192D0.h"

typedef enum VoltorbFlipInput {
    VOLTORB_FLIP_INPUT_GRID_BEGIN = 0,
    VOLTORB_FLIP_INPUT_GRID_END = 24,
    VOLTORB_FLIP_INPUT_MEMO,
    VOLTORB_FLIP_INPUT_QUIT,
    // Pseudo-input codes for wrapping around horizontally.
    // These put the cursor in the last-observed row on either
    // the first or last column.
    VOLTORB_FLIP_COL4_ROWLAST,
    VOLTORB_FLIP_COL0_ROWLAST,

    // relative consts
    VOLTORB_FLIP_INPUT_GRID_NUM = VOLTORB_FLIP_INPUT_GRID_END + 1,
} VoltorbFlipInput;

typedef struct Ov122_021E8CFC {
    struct ManagedSprite *unk0; // 0x0
    struct ManagedSprite *unk4; // 0x4
    UnkStruct_02019BA4 *unk8;   // 0x8
    u8 selectedRow;             // 0xC
    u8 focus;                   // 0xD
    u8 unk_E_0 : 4;             // 0xE:0
    u8 unk_E_4 : 4;             // 0xE:4
    u8 memoOpen : 1;            // 0xF:0
    u8 memoFocused : 1;         // 0xF:1
    u8 unk_F_2 : 1;             // 0xF:2
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
