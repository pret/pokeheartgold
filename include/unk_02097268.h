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

void sub_0209730C(SaveData *, int);
EncounterSlot *sub_020974C4(SAFARIZONE_AREASET *areaSet, int area, int encounterType, TimeOfDayWildParam timeOfDay, enum HeapID heapID);

#endif // POKEHEARTGOLD_UNK_02097268_H
