#ifndef POKEHEARTGOLD_UNK_02097268_H
#define POKEHEARTGOLD_UNK_02097268_H

#include "gf_rtc.h"
#include "overlay_01.h"
#include "safari_zone.h"
#include "save.h"
#include "wild_encounter.h"

#define SAFARI_ENCOUNTER_SLOTS_LAND          0
#define SAFARI_ENCOUNTER_SLOTS_SURFING       1
#define SAFARI_ENCOUNTER_SLOTS_ROD(rod_type) (2 + (rod_type))
#define NUM_SAFARI_ENCOUNTER_TYPES           5

typedef struct SafariObjectConfig {
    u8 buildModel;
    u8 isAnimated : 1;
    u8 width : 3;
    u8 height : 3;
    u8 hasGenderedLayout : 1;
    u8 objectType;
} SafariObjectConfig;

void GetSafariObjectConfig(SafariObjectConfig *a0, int a1, BOOL a2);
void SaveData_SafariZone_CheckAreasWithUpdatedEncounters(SaveData *saveData, int a1);
ENC_SLOT *SafariZoneAreaSet_LoadAreaEncounters(SAFARIZONE_AREASET *areaSet, int area, int encounterType, TimeOfDayWildParam timeOfDay, enum HeapID heapID);

#endif // POKEHEARTGOLD_UNK_02097268_H
