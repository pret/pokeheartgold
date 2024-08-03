#ifndef POKEHEARTGOLD_MAP_EVENTS_H
#define POKEHEARTGOLD_MAP_EVENTS_H

#include "fieldmap.h"
#include "heap.h"
#include "map_events_internal.h"
#include "map_header.h"

void Field_AllocateMapEvents(FieldSystem *work, HeapID heapId);
void Field_FreeMapEvents(FieldSystem *work);
void Field_InitMapEvents(FieldSystem *work, u32 mapno);
void Field_InitMapObjectsFromZoneEventData(FieldSystem *fieldSystem);
BG_EVENT *Field_GetBgEvents(FieldSystem *fieldSystem);
u32 Field_GetNumBgEvents(const FieldSystem *fieldSystem);
const WARP_EVENT *Field_GetWarpEventI(const FieldSystem *fieldSystem, u32 warpno);
int Field_GetWarpEventAtXYPos(const FieldSystem *fieldSystem, int x, int y);
u32 Field_GetNumCoordEvents(const FieldSystem *fieldSystem);
const COORD_EVENT *Field_GetCoordEvents(const FieldSystem *fieldSystem);
u32 Field_GetNumObjectEvents(const FieldSystem *fieldSystem);
const ObjectEvent *Field_GetObjectEvents(const FieldSystem *fieldSystem);
BOOL Field_SetEventDefaultXYPos(FieldSystem *fieldSystem, int id, u16 x, u16 y);
BOOL Field_SetEventDefaultDirection(FieldSystem *fieldSystem, int id, u16 dirn);
BOOL Field_SetEventDefaultMovement(FieldSystem *fieldSystem, int id, u16 movement);
BOOL Field_SetWarpXYPos(FieldSystem *fieldSystem, int warpno, u16 x, u16 y);
BOOL Field_SetBgEventXYPos(FieldSystem *fieldSystem, int bgno, u32 x, u32 y);
void WildEncounters_ReadFromNarc(ENC_DATA *encData, u32 mapno);
ENC_DATA *MapEvents_GetLoadedEncTable(FieldSystem *fieldSystem);
u8 *MapEvents_GetScriptHeader(FieldSystem *fieldSystem);

#endif // POKEHEARTGOLD_MAP_EVENTS_H
