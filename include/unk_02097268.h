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

typedef struct UnkStruct_02097268 {
    u8 unk_0;
    u8 unk_1_0 : 7;
    u8 unk_1_7 : 1;
    u8 unk_2;
} UnkStruct_02097268;

void sub_02097268(UnkStruct_02097268 *a0, int a1, BOOL a2);
void sub_0209730C(SaveData *saveData, int a1);
ENC_SLOT *sub_020974C4(SAFARIZONE_AREASET *areaSet, int area, int encounterType, TimeOfDayWildParam timeOfDay, enum HeapID heapID);

#endif // POKEHEARTGOLD_UNK_02097268_H
