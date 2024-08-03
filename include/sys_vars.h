#ifndef POKEHEARTGOLD_SYS_VARS_H
#define POKEHEARTGOLD_SYS_VARS_H

#include "save.h"
#include "save_vars_flags.h"

BOOL SetScriptVar(SaveVarsFlags *state, u16 var_id, u16 value);
u16 GetScriptVar(SaveVarsFlags *state, u16 var_id);
void Save_VarsFlags_SetFollowerTrainerNum(SaveVarsFlags *state, u16 trainer_num);
u16 Save_VarsFlags_GetFollowerTrainerNum(SaveVarsFlags *state);
void Save_VarsFlags_SetStarter(SaveVarsFlags *state, u16 starter);
u16 Save_VarsFlags_GetStarter(SaveVarsFlags *state);
u16 DPPtLeftover_GetRivalSpecies(SaveVarsFlags *state);
u16 DPPtLeftover_GetFriendStarterSpecies(SaveVarsFlags *state);
u16 Save_VarsFlags_GetFishingCompetitionLengthRecord(SaveVarsFlags *state);
void Save_VarsFlags_SetFishingCompetitionLengthRecord(SaveVarsFlags *state, u16 record);
u16 Save_VarsFlags_GetUnownReportLevel(SaveVarsFlags *state);
u16 sub_02066B80(s32 a0);
void sub_02066B9C(SaveVarsFlags *state, u32 a1);
BOOL sub_02066BC0(SaveVarsFlags *state, u32 a1);
void sub_02066BE8(SaveVarsFlags *state, u32 a1, u16 value);
u32 sub_02066C00(s32 a0);
void sub_02066C1C(SaveVarsFlags *state, s32 a1);
void sub_02066C4C(SaveVarsFlags *state, s32 a1);
BOOL sub_02066C74(SaveVarsFlags *state, s32 a1);
void Save_VarsFlags_SetLotoId(SaveVarsFlags *state, u32 id);
u32 Save_VarsFlags_GetLotoId(SaveVarsFlags *state);
void Save_VarsFlags_RollLotoId(SaveVarsFlags *state);
void Save_LCRNGAdvanceLotoID(SaveData *saveData, u16 var);
u16 Save_VarsFlags_GetVar4041(SaveVarsFlags *state);
void Save_VarsFlags_SetVar4041(SaveVarsFlags *state, u16 value);
void sub_02066D60(SaveData *saveData);
void sub_02066D80(SaveVarsFlags *state);
u16 Save_VarsFlags_GetVar4042(SaveVarsFlags *state);
u16 Save_VarsFlags_GetVar404B(SaveVarsFlags *state);
void Save_VarsFlags_SetVar404B(SaveVarsFlags *state, u16 value);
u16 Save_VarsFlags_GetBattleFactoryPrintProgress(SaveVarsFlags *state);
u16 Save_VarsFlags_GetBattleHallPrintProgress(SaveVarsFlags *state);
u16 Save_VarsFlags_GetBattleCastlePrintProgress(SaveVarsFlags *state);
u16 Save_VarsFlags_GetBattleArcadePrintProgress(SaveVarsFlags *state);
u16 Save_VarsFlags_GetBattleTowerPrintProgress(SaveVarsFlags *state);
u16 Save_VarsFlags_GetVar404C(SaveVarsFlags *state);
void Save_VarsFlags_SetVar404C(SaveVarsFlags *state, u16 value);
u16 Save_VarsFlags_GetVar4052(SaveVarsFlags *state);
BOOL Save_VarsFlags_IsInRocketTakeover(SaveVarsFlags *state);
u16 Save_VarsFlags_GetVar4057(SaveVarsFlags *state);
void Save_VarsFlags_SetVar4057(SaveVarsFlags *state, u16 value);
void Save_VarsFlags_UpdateBuenasPasswordSet(SaveVarsFlags *state);
u16 Save_VarsFlags_GetBuenasPasswordSet(SaveVarsFlags *state);

#endif
