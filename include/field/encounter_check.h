#ifndef GUARD_POKEHEARTGOLD_FIELD_ENCOUNTER_CHECK_H
#define GUARD_POKEHEARTGOLD_FIELD_ENCOUNTER_CHECK_H

#include "field/headbutt.h"

#include "field_system.h"

BOOL FieldSystem_PerformLandOrSurfEncounterCheck(FieldSystem *fieldSystem);
BOOL FieldSystem_PerformFishEncounterCheck(FieldSystem *fieldSystem, u8 rodType, BattleSetup **pBattleSetup);
BOOL FieldSystem_PerformRockSmashEncounterCheck(FieldSystem *fieldSystem, BattleSetup **pBattleSetup);
BOOL FieldSystem_PerformSweetScentEncounterCheck(FieldSystem *fieldSystem, TaskManager *taskManager);
BOOL FieldSystem_PerformHeadbuttEncounterCheck(FieldSystem *fieldSystem, BattleSetup **pBattleSetup, const HeadbuttSlot *headbuttSlots);
void ov02_02247F30(FieldSystem *fieldSystem, u16 species, u8 level, BOOL shiny, BattleSetup *battleSetup);

#endif // GUARD_POKEHEARTGOLD_FIELD_ENCOUNTER_CHECK_H
