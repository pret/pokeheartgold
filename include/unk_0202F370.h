#ifndef POKEHEARTGOLD_UNK_0202F370_H
#define POKEHEARTGOLD_UNK_0202F370_H

#include "global.h"

typedef enum MapMarkingIcon {
    MAP_MARKING_ICON_POKEBALL,
    MAP_MARKING_ICON_PIKACHU,
    MAP_MARKING_ICON_EXCLMARK,
    MAP_MARKING_ICON_QMARK,
    MAP_MARKING_ICON_APRICORN,
    MAP_MARKING_ICON_EGG,
    MAP_MARKING_ICON_HOUSE,
    MAP_MARKING_ICON_TMHM,
    MAP_MARKING_ICON_SHOCK,
    MAP_MARKING_ICON_NULL = 15,
} MapMarkingIcon;

typedef struct UnkStruct_0202F3DC {
    u32 mapID;
    u8 icons[4];
    u16 words[4];
} MapMarkingsRAM;

typedef struct MapMarkingsSave {
    u16 mapID;
    u16 icon0 : 4;
    u16 icon1 : 4;
    u16 icon2 : 4;
    u16 icon3 : 4;
    u16 words[4];
} MapMarkingsSave;

typedef struct UnkPokegearSub8List {
    MapMarkingsSave list[100];
} MapMarkingsSaveArray;

void MapMarkingsRAM_Reset(MapMarkingsRAM *unk);
BOOL MapMarkingsRAM_IsInUse_EraseIfNot(MapMarkingsRAM *unk);
void MapMarkings_CopyRAMtoSave(MapMarkingsRAM *src, MapMarkingsSave *dest);
void MapMarkings_CopySaveToRAM(MapMarkingsSave *src, MapMarkingsRAM *dest);
BOOL MapMarkingsSaveArray_EntryIsValid(MapMarkingsSaveArray *list, u8 index);
void MapMarkingsSaveArray_ResetEntry(MapMarkingsSaveArray *list, u8 index);
BOOL MapMarkingsSaveArray_CopyEntryToRAM(MapMarkingsSaveArray *list, MapMarkingsRAM *dest, u8 index);
BOOL MapMarkingsSaveArray_CopyEntryFromRAM(MapMarkingsSaveArray *list, MapMarkingsRAM *src, u8 index, BOOL check);

#endif // POKEHEARTGOLD_UNK_0202F370_H
