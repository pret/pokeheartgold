#ifndef POKEHEARTGOLD_SYS_VARS_H
#define POKEHEARTGOLD_SYS_VARS_H

#include "event_data.h"
#include "save.h"

BOOL SetScriptVar(ScriptState* state, u16 var_id, u16 value);
u16 GetScriptVar(ScriptState* state, u16 var_id);
void ScriptState_SetFollowerTrainerNum(ScriptState* state, u16 trainer_num);
u16 ScriptState_GetFollowerTrainerNum(ScriptState* state);
void ScriptState_SetStarter(ScriptState* state, u16 starter);
u16 ScriptState_GetStarter(ScriptState* state);
u16 DPPtLeftover_GetRivalSpecies(ScriptState* state);
u16 DPPtLeftover_GetFriendStarterSpecies(ScriptState* state);
u16 ScriptState_GetFishingCompetitionLengthRecord(ScriptState* state);
void ScriptState_SetFishingCompetitionLengthRecord(ScriptState* state, u16 record);
u16 ScriptState_GetUnownReportLevel(ScriptState* state);
u16 sub_02066B80(s32 a0);
void sub_02066B9C(ScriptState* state, u32 a1);
BOOL sub_02066BC0(ScriptState* state, u32 a1);
void sub_02066BE8(ScriptState* state, u32 a1, u16 value);
u32 sub_02066C00(s32 a0);
void sub_02066C1C(ScriptState* state, s32 a1);
void sub_02066C4C(ScriptState* state, s32 a1);
BOOL sub_02066C74(ScriptState* state, s32 a1);
void ScriptState_SetLotoId(ScriptState* state, u32 id);
u32 ScriptState_GetLotoId(ScriptState* state);
void ScriptState_RollLotoId(ScriptState* state);
void Save_LCRNGAdvanceLotoID(SaveData* savedata, u16 var);
u16 ScriptState_GetVar4041(ScriptState* state);
void ScriptState_SetVar4041(ScriptState* state, u16 value);
void sub_02066D60(SaveData* savedata);
void sub_02066D80(ScriptState* state);
u16 ScriptState_GetVar4042(ScriptState* state);
u16 ScriptState_GetVar404B(ScriptState* state);
void ScriptState_SetVar404B(ScriptState* state, u16 value);
u16 ScriptState_GetBattleFactoryPrintProgress(ScriptState* state);
u16 ScriptState_GetBattleHallPrintProgress(ScriptState* state);
u16 ScriptState_GetBattleCastlePrintProgress(ScriptState* state);
u16 ScriptState_GetBattleArcadePrintProgress(ScriptState* state);
u16 ScriptState_GetBattleTowerPrintProgress(ScriptState* state);
u16 ScriptState_GetVar404C(ScriptState* state);
void ScriptState_SetVar404C(ScriptState* state, u16 value);
u16 ScriptState_GetVar4052(ScriptState* state);
BOOL ScriptState_IsInRocketTakeover(ScriptState* state);
u16 ScriptState_GetVar4057(ScriptState* state);
void ScriptState_SetVar4057(ScriptState* state, u16 value);
void ScriptState_UpdateBuenasPasswordSet(ScriptState* state);
u16 ScriptState_GetBuenasPasswordSet(ScriptState* state);

#endif
