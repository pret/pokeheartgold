#ifndef POKEHEARTGOLD_MAP_EVENTS_H
#define POKEHEARTGOLD_MAP_EVENTS_H

#include "fieldmap.h"
#include "map_events_internal.h"
#include "heap.h"
#include "map_header.h"

u32 Field_GetNumBgEvents(const UnkSavStruct80 *fsys);
BG_EVENT *Field_GetBgEvents(UnkSavStruct80 *fsys);

#endif //POKEHEARTGOLD_MAP_EVENTS_H
