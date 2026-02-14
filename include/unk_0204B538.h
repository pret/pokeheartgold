#ifndef POKEHEARTGOLD_UNK_0204B538_H
#define POKEHEARTGOLD_UNK_0204B538_H

#include "field_types_def.h"
#include "message_format.h"
#include "scrcmd_9.h"

MessageFormat *sub_0204B538(SaveData *saveData, u16 numEligiblePokemon, u16 a2, u8 a3, u8 *numLegendaryPokemonSeen);
u32 sub_0204B5E8(u8 a0);
u16 sub_0204B610(FieldSystem *fieldSystem, u16 *linkAllyData); // SetLinkAllyData?
BOOL sub_0204B66C(FieldSystem *fieldSystem, u16 *a1);
BOOL sub_0204B690(FieldSystem *fieldSystem, u16 *a1);
void sub_0204B6AC(FrontierFieldSystem *frontierFsys, SaveData *saveData);
void sub_0204B708(FrontierFieldSystem *frontierFsys);
void sub_0204B720(FrontierFieldSystem *frontierFsys, u32 a1);
u16 GetRandomBattleTowerTrainer(FrontierFieldSystem *frontierFsys, u8 difficultyBracket, u8 winsThisRound, u32 towerMode); // sub_0204B73C
u32 sub_0204BA04(FrontierFieldSystem *frontierFsys, FrontierTrainer *frontierTrainer, u16 frontierTrainerIndex, u32 numPokemon, u16 *partySpecies, u16 *partyItems, FrontierMultiBattleAllyData *multiBattleAllyData, enum HeapID heapID);
void GenerateAllyFrontierMons(FrontierFieldSystem *frontierFsys, FrontierTrainer *frontierTrainer, u16 frontierTrainerIndex, u32 replaceItem, FrontierMultiBattleAllyData *multiBattleAllyData, enum HeapID heapID); // sub_0204BA50

#endif // POKEHEARTGOLD_UNK_0204B538_H
