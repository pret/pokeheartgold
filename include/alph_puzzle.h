#ifndef POKEHEARTGOLD_ALPH_PUZZLE_H
#define POKEHEARTGOLD_ALPH_PUZZLE_H

#include "bg_window.h"
#include "overlay_manager.h"
#include "unk_0200CF18.h"
#include "palette.h"
#include "message_format.h"
#include "msgdata.h"

typedef struct UnkAlphSub_10 {
    void *unk_00;
    u8 unk4;
    u8 unk5;
    u8 unk6;
    u8 unk7;
    u32 *unk8;
    SaveData *savedata;
} UnkAlphSub_10;

typedef struct AlphPuzzleTile {
    u8 x;
    u8 y;
    u8 rotation;
    u8 isImmovable;
    Sprite *sprite;
} AlphPuzzleTile;

typedef struct AlphPuzzleData {
    HeapID heapId;
    int unk4;
    int unkState;
    u16 unkC;
    u16 unkE;
    UnkAlphSub_10 *unk10;
    BgConfig *bgConfig;
    u8 unk18;
    u8 puzzleIndex;
    u8 unk1A;
    u8 unk1B;
    s16 unk1C;
    s16 unk1E;
    u8 unk20;
    u8 unk21;
    u8 unk22;
    u8 unk23;
    u8 textPrinterId;
    u8 textFrameDelay;
    u8 frame;
    u8 unk27;
    MsgData *msgData;
    MessageFormat *messageFormat;
    String *unk30;
    String *unk34;
    String *unk38[4];
    String *unk48[1];
    Window window[3];
    void *unk7C;
    PaletteData *palette;
    SpriteRenderer *unk84;
    void *unk88;
    Sprite *unk8C[2];
    u8 unk94[0x40];
    NNSG2dScreenData *screenData;
    void *unkD8;
    AlphPuzzleTile tileGrid[16];
    AlphPuzzleTile *selectedTile;
} AlphPuzzleData;

BOOL ov110_AlphPuzzle_OvyInit(OVY_MANAGER *man, int *state);
BOOL ov110_AlphPuzzle_OvyExec(OVY_MANAGER *man, int *state);
BOOL ov110_AlphPuzzle_OvyExit(OVY_MANAGER *man);
void ov110_021E5A24(void);
void ov110_021E5A74(AlphPuzzleData *data);
void ov110_021E5AAC(AlphPuzzleData *data);
BOOL ov110_021E5AD4(AlphPuzzleData *data);
BOOL ov110_021E5B0C(AlphPuzzleData *data);

int ov110_021E5D90(AlphPuzzleData *data, u8 *xOut, u8 *yOut);

//the following functions haven't been decompiled yet
int ov110_021E5C60(AlphPuzzleData *data);
int ov110_021E6014(AlphPuzzleData *data);
int ov110_021E6150(AlphPuzzleData *data);
void ov110_021E6904(AlphPuzzleData *data, int a1);
void ov110_021E6A04(AlphPuzzleData *data);
void ov110_021E6C58(AlphPuzzleData *, u8, int);
void ov110_021E6D20(AlphPuzzleData *data);
void ov110_021E6A44(AlphPuzzleData *data, u8 a1, u8 a2, int a3);
void ov110_021E6C18(AlphPuzzleData *data, s16 a1, u8 a2, u8 a3, u8 a4);
void sub_02024818(Sprite *sprite, u16 a1);
void ov110_021E6764(AlphPuzzleData *data);
void ov110_021E6A44(AlphPuzzleData *data, u8 x, u8 y, int a3);
void ov110_021E6BEC(AlphPuzzleTile *tile, s16 x, s16 y);

#endif //POKEHEARTGOLD_ALPH_PUZZLE_H
