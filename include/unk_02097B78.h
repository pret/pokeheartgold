#ifndef POKEHEARTGOLD_UNK_02097B78_H
#define POKEHEARTGOLD_UNK_02097B78_H

#include "overlay_manager.h"
#include "save.h"

typedef struct UnkStruct_0203FCC4 {
    int unk0[0x12];
} UnkStruct_0203FCC4;

typedef struct LegendaryCinematicArgs {
    SaveData *saveData;
    UnkStruct_0203FCC4 unk4;
    u16 unk4C;
    u16 unk4E;
} LegendaryCinematicArgs;

BOOL LegendaryCinematic_Init(OverlayManager *man, int *state);
BOOL LegendaryCinematic_Main(OverlayManager *man, int *state);
BOOL LegendaryCinematic_Exit(OverlayManager *man, int *state);

#endif // POKEHEARTGOLD_UNK_02097B78_H
