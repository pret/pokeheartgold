#ifndef POKEHEARTGOLD_ALPH_PUZZLE_H
#define POKEHEARTGOLD_ALPH_PUZZLE_H

#include "bg_window.h"
#include "overlay_manager.h"
#include "unk_0200CF18.h"
#include "palette.h"
#include "message_format.h"
#include "msgdata.h"
#include "task.h"

typedef enum AlphPuzzles {
    ALPH_PUZZLE_KABUTO,
    ALPH_PUZZLE_AEROACTYL,
    ALPH_PUZZLE_OMANYTE,
    ALPH_PUZZLE_HO_OH,
    ALPH_PUZZLE_MAX
} AlphPuzzles;

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
    String *quitText;
    String *hintText[ALPH_PUZZLE_MAX];
    String *confirmQuitText[1];
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
BOOL ov110_AlphPuzzle_OvyExit(OVY_MANAGER *man, int *state);

#endif //POKEHEARTGOLD_ALPH_PUZZLE_H
