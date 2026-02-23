#ifndef POKEHEARTGOLD_FIELD_MAP_CHANGE_H
#define POKEHEARTGOLD_FIELD_MAP_CHANGE_H

#include "field_types_def.h"
#include "heap.h"
#include "pokemon_types_def.h"

typedef struct MapChangeState MapChangeState;
typedef struct FlyTaskEnv FlyTaskEnv;

MapChangeState *MapChange_AllocState(enum HeapID heapID);
void MapChange_FreeState(MapChangeState *state);
void FieldSystem_SetTeleportWarpFlag(FieldSystem *fieldSystem, u32 flag);
void FieldSystem_HandleEnterMapNonWarp(FieldSystem *fieldSystem);
void FieldSystem_HandleEnterMapWarp(FieldSystem *fieldSystem);
void FieldSystem_ExitSafariZoneWarp(FieldSystem *fieldSystem);
void FieldSystem_ExitSafariZoneNonWarp(FieldSystem *fieldSystem);
void FieldSystem_ClearSafariFlag(FieldSystem *fieldSystem);
void FieldSystem_ClearFollowingTrainer(FieldSystem *fieldSystem);
void FieldSystem_RandomizeRoamers(FieldSystem *fieldSystem);
FlyTaskEnv *FlyTask_CreateEnv(enum HeapID heapID, FieldSystem *fieldSystem, Pokemon *pokemon, u16 partySlot, u16 mapsec, s16 cursorX, s16 cursorY);
BOOL Task_Fly(TaskManager *taskManager);

#endif // POKEHEARTGOLD_FIELD_MAP_CHANGE_H
