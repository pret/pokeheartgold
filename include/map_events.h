#ifndef POKEHEARTGOLD_MAP_EVENTS_H
#define POKEHEARTGOLD_MAP_EVENTS_H

#include "fieldmap.h"
#include "map_events_internal.h"
#include "heap.h"
#include "map_header.h"

void Field_AllocateMapEvents(FieldSystem *work, HeapID heapId);
void Field_FreeMapEvents(FieldSystem *work);
void Field_InitMapEvents(FieldSystem *work, u32 mapno);
void Field_InitMapObjectsFromZoneEventData(FieldSystem *fsys);
BG_EVENT *Field_GetBgEvents(FieldSystem *fsys);
u32 Field_GetNumBgEvents(const FieldSystem *fsys);
const WARP_EVENT *Field_GetWarpEventI(const FieldSystem *fsys, u32 warpno);
int Field_GetWarpEventAtXYPos(const FieldSystem *fsys, int x, int y);
u32 Field_GetNumCoordEvents(const FieldSystem *fsys);
const COORD_EVENT *Field_GetCoordEvents(const FieldSystem *fsys);
u32 Field_GetNumObjectEvents(const FieldSystem *fsys);
const OBJECT_EVENT *Field_GetObjectEvents(const FieldSystem *fsys);
BOOL Field_SetObjectEventXYPos(FieldSystem *fsys, int id, u16 x, u16 y);
BOOL Field_SetObjectEventFacing(FieldSystem *fsys, int id, u16 dirn);
BOOL Field_SetObjectEventMovement(FieldSystem *fsys, int id, u16 mvt);
BOOL Field_SetWarpXYPos(FieldSystem *fsys, int warpno, u16 x, u16 y);
BOOL Field_SetBgEventXYPos(FieldSystem *fsys, int bgno, u32 x, u32 y);
void WildEncounters_ReadFromNarc(ENC_DATA *encData, u32 mapno);
ENC_DATA *MapEvents_GetLoadedEncTable(FieldSystem *fsys);
u8 *MapEvents_GetScriptHeader(FieldSystem *fsys);

#endif //POKEHEARTGOLD_MAP_EVENTS_H
