#ifndef GUARD_POKEHEARTGOLD_FIELD_ENCOUNTER_CHECK_H
#define GUARD_POKEHEARTGOLD_FIELD_ENCOUNTER_CHECK_H

#include "field/headbutt.h"

#include "field_system.h"

#define ENCOUNTER_TYPE_LAND       0
#define ENCOUNTER_TYPE_SURFING    1
#define ENCOUNTER_TYPE_FISHING    2
#define ENCOUNTER_TYPE_ROCK_SMASH 3
#define ENCOUNTER_TYPE_HEADBUTT   4

#define ROD_TYPE_OLD   0
#define ROD_TYPE_GOOD  1
#define ROD_TYPE_SUPER 2
#define ROD_TYPE_NONE  0xFF

BOOL FieldSystem_PerformLandOrSurfEncounterCheck(FieldSystem *fieldSystem);
BOOL FieldSystem_PerformFishEncounterCheck(FieldSystem *fieldSystem, u8 rodType, BattleSetup **pBattleSetup);
BOOL FieldSystem_PerformRockSmashEncounterCheck(FieldSystem *fieldSystem, BattleSetup **pBattleSetup);
BOOL FieldSystem_PerformSweetScentEncounterCheck(FieldSystem *fieldSystem, TaskManager *taskManager);
BOOL FieldSystem_PerformHeadbuttEncounterCheck(FieldSystem *fieldSystem, BattleSetup **pBattleSetup, const HeadbuttSlot *headbuttSlots);
void ov02_02247F30(FieldSystem *fieldSystem, u16 species, u8 level, BOOL shiny, BattleSetup *battleSetup);
BOOL ov02_02247F9C(FieldSystem *fieldSystem, u8 metatileBehavior);

#endif // GUARD_POKEHEARTGOLD_FIELD_ENCOUNTER_CHECK_H
