#ifndef POKEHEARTGOLD_UNK_0204A3F4_H
#define POKEHEARTGOLD_UNK_0204A3F4_H

#include "field_system.h"
#include "scrcmd_9.h"

BOOL PartyIsValidForTower(u16 numRequired, SaveData *saveData, BOOL checkDuplicateItems);
void sub_0204A68C(void);
void sub_0204A698(u32 a0);
u32 sub_0204A6A0(u32 a0);
void sub_0204A6A8(FieldSystem *fieldSystem);
void sub_0204A6E8(FieldSystem *fieldSystem);
u32 sub_0204A6F8(SaveData *saveData, u32 a1);
void sub_0204A730(SaveData *saveData, u8 a1);
u16 sub_0204A750(SaveData *saveData);
u32 sub_0204A764(SaveData *saveData);
u16 sub_0204A800(SaveData *saveData);
void sub_0204A810(FrontierFieldSystem **frontierFsys);
FrontierFieldSystem *InitFrontierFieldSystem(SaveData *saveData, BOOL resumeFromPrevious, u32 a2);
void sub_0204AA2C(FrontierFieldSystem *frontierFsys);
void sub_0204AA58(FrontierFieldSystem *frontierFsys, TaskManager *taskManager, void *a2);
BOOL sub_0204AA78(FrontierFieldSystem *frontierFsys, void **a1, SaveData *saveData);
u32 SelectedPartyHasDuplicateSpeciesOrItem(FrontierFieldSystem *frontierFsys, SaveData *saveData);
void SetRandomFrontierTrainers(FrontierFieldSystem *frontierFsys, SaveData *saveData);
u8 GetFrontierBattleNumber(FrontierFieldSystem *frontierFsys);
BOOL sub_0204AC7C(FrontierFieldSystem *frontierFsys);
void sub_0204AD04(FrontierFieldSystem *frontierFsys, SaveData *saveData);
void sub_0204AE20(FrontierFieldSystem *frontierFsys, SaveData *saveData);
void sub_0204AF2C(FrontierFieldSystem *frontierFsys);
void sub_0204AFE0(FrontierFieldSystem *frontierFsys);
u32 sub_0204B044(FrontierFieldSystem *frontierFsys, u32 a1);
u32 sub_0204B05C(FrontierFieldSystem *frontierFsys);
u32 GetPalmerDefeated(FrontierFieldSystem *frontierFsys);
u32 AwardTowerBattlePoints(FrontierFieldSystem *frontierFsys);
BOOL sub_0204B0E0(FrontierFieldSystem *frontierFsys, SaveData *saveData);
u32 sub_0204B120(FrontierFieldSystem *frontierFsys, SaveData *saveData, u32 a2);
BOOL TryGivePalmerRibbons(FrontierFieldSystem *frontierFsys, SaveData *saveData);
BOOL TryGiveOtherTowerRibbons(FrontierFieldSystem *frontierFsys, SaveData *saveData);
u16 sub_0204B258(FrontierFieldSystem *frontierFsys, SaveData *saveData);
u8 GetFrontierTrainerIVs(u32 frontierTrainerIndex);
u16 sub_0204B510(FrontierFieldSystem *frontierFsys);

#endif // POKEHEARTGOLD_UNK_0204A3F4_H
