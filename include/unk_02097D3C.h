#ifndef POKEHEARTGOLD_UNK_02097D3C_H
#define POKEHEARTGOLD_UNK_02097D3C_H

#include "field_types_def.h"
#include "save.h"

typedef struct ViewRankingsArgs {
    u16 page_scroll;
    u16 cursorPos;
    SaveData *saveData;
} ViewRankingsArgs;

typedef struct UnkStruct_02097D48 {
    u32 state;
    ViewRankingsArgs *args;
} UnkStruct_02097D48;

// pageScrollParam = 3 * scroll + page
void FieldSystem_LaunchTask_ViewRankingsApp(FieldSystem *fieldSystem, u8 pageScrollParam, u8 cursorPos);

#endif // POKEHEARTGOLD_UNK_02097D3C_H
