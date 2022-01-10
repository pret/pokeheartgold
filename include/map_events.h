#ifndef POKEHEARTGOLD_MAP_EVENTS_H
#define POKEHEARTGOLD_MAP_EVENTS_H

#include "fieldmap.h"
#include "map_events_internal.h"
#include "heap.h"
#include "map_header.h"

u32 Field_GetNumBgEvents(const UnkSavStruct80 *fsys);
BG_EVENT *Field_GetBgEvents(UnkSavStruct80 *fsys);
u8 *MapEvents_GetScriptHeader(UnkSavStruct80 *fsys);
void Field_AllocateMapEvents(UnkSavStruct80 *work, HeapID heapId);
void Field_FreeMapEvents(UnkSavStruct80 *work);
void Field_InitMapEvents(UnkSavStruct80 *work, u32 mapno);
void MapEvents_ReadFromNarc(MAP_EVENTS *events, u32 mapno);
void Field_InitMapObjectsFromZoneEventData(UnkSavStruct80 *fsys);
int Field_GetWarpEventAtXYPos(const UnkSavStruct80 *fsys, int x, int y);
u32 Field_GetNumCoordEvents(const UnkSavStruct80 *fsys);
u32 Field_GetNumObjectEvents(const UnkSavStruct80 *fsys);
BOOL Field_SetObjectEventXYPos(UnkSavStruct80 *fsys, int id, u16 x, u16 y);
BOOL Field_SetObjectEventFacing(UnkSavStruct80 *fsys, int id, u16 dirn);
BOOL Field_SetObjectEventMovement(UnkSavStruct80 *fsys, int id, u16 mvt);
BOOL Field_SetWarpXYPos(UnkSavStruct80 *fsys, int warpno, u16 x, u16 y);
BOOL Field_SetBgEventXYPos(UnkSavStruct80 *fsys, int bgno, u32 x, u32 y);
void MapEvents_ComputeRamHeader(MAP_EVENTS *events);
void WildEncounters_ReadFromNarc(ENC_DATA *encData, u32 mapno);
void MapScriptHeader_ReadFromNarc(MAP_EVENTS *events, u32 mapno);

#endif //POKEHEARTGOLD_MAP_EVENTS_H
