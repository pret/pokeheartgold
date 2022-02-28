#ifndef POKEHEARTGOLD_SYS_VARS_H
#define POKEHEARTGOLD_SYS_VARS_H

#include "event_data.h"
#include "save.h"

BOOL SetScriptVar(SCRIPT_STATE* state, u16 var_id, u16 value);
u16 GetScriptVar(SCRIPT_STATE* state, u16 var_id);
void ScriptState_SetFollowerTrainerNum(SCRIPT_STATE* state, u16 trainer_num);
u16 ScriptState_GetFollowerTrainerNum(SCRIPT_STATE* state);
void SetStarterToScriptState(SCRIPT_STATE* state, u16 starter);
u16 GetStarterFromScriptState(SCRIPT_STATE* state);
u16 DPPtLeftover_GetRivalSpecies(SCRIPT_STATE* state);
u16 DPPtLeftover_GetFriendStarterSpecies(SCRIPT_STATE* state);
u16 ScriptState_GetFishingCompetitionLengthRecord(SCRIPT_STATE* state);
void ScriptState_SetFishingCompetitionLengthRecord(SCRIPT_STATE* state, u16 record);
u16 sub_02066B70(SCRIPT_STATE* state);
u16 sub_02066B80(s32 a0);
void sub_02066B9C(SCRIPT_STATE* state, u32 a1);
BOOL sub_02066BC0(SCRIPT_STATE* state, u32 a1);
void sub_02066BE8(SCRIPT_STATE* state, u32 a1, u16 value);
u32 sub_02066C00(s32 a0);
void sub_02066C1C(SCRIPT_STATE* state, s32 a1);
void sub_02066C4C(SCRIPT_STATE* state, s32 a1);
BOOL sub_02066C74(SCRIPT_STATE* state, s32 a1);
void sub_02066CAC(SCRIPT_STATE* state, u32 id);
u32 ScriptState_GetLotoId(SCRIPT_STATE* state);
void ScriptState_RollLotoId(SCRIPT_STATE* state);
void Save_LCRNGAdvanceLotoID(SAVEDATA* savedata);
u16 sub_02066D40(SCRIPT_STATE* state);
void sub_02066D50(SCRIPT_STATE* state, u16 value);
void sub_02066D60(SAVEDATA* savedata);
void sub_02066D80(SCRIPT_STATE* state);
u16 sub_02066DA8(SCRIPT_STATE* state);
u16 sub_02066DB8(SCRIPT_STATE* state);
void sub_02066DC8(SCRIPT_STATE* state, u16 value);
u16 sub_02066DD8(SCRIPT_STATE* state);
u16 sub_02066DE8(SCRIPT_STATE* state);
u16 sub_02066DF8(SCRIPT_STATE* state);
u16 sub_02066E08(SCRIPT_STATE* state);
u16 sub_02066E18(SCRIPT_STATE* state);
u16 sub_02066E28(SCRIPT_STATE* state);
void sub_02066E38(SCRIPT_STATE* state, u16 value);
u16 sub_02066E48(SCRIPT_STATE* state);
BOOL sub_02066E58(SCRIPT_STATE* state);
u16 sub_02066E74(SCRIPT_STATE* state);
void sub_02066E84(SCRIPT_STATE* state, u16 value);
void ScriptState_UpdateBuenasPasswordSet(SCRIPT_STATE* state);
u16 ScriptState_GetBuenasPasswordSet(SCRIPT_STATE* state);

#endif
