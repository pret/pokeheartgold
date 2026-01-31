#ifndef GUARD_POKEHEARTGOLD_FIELD_ENCOUNTER_CHECK_H
#define GUARD_POKEHEARTGOLD_FIELD_ENCOUNTER_CHECK_H

#include "field_system.h"

BOOL FieldSystem_PerformLandEncounterCheck(FieldSystem *fieldSystem);
BOOL FieldSystem_PerformFishEncounterCheck(FieldSystem *fieldSystem, u8 rodType, BattleSetup **pBattleSetup);
BOOL FieldSystem_PerformRockSmashEncounterCheck(FieldSystem *fieldSystem, BattleSetup **pBattleSetup);

#endif // GUARD_POKEHEARTGOLD_FIELD_ENCOUNTER_CHECK_H
