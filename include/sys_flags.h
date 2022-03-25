#ifndef POKEHEARTGOLD_SYS_FLAGS_H
#define POKEHEARTGOLD_SYS_FLAGS_H

#include "event_data.h"

void SetScriptFlag(SCRIPT_STATE* state, u16 flag_id);
void ClearScriptFlag(SCRIPT_STATE* state, u16 flag_id);
BOOL CheckScriptFlag(SCRIPT_STATE* state, u16 flag_id);
BOOL FlagAction(SCRIPT_STATE* state, u32 action, u32 flag_id);
void SetFlag960(SCRIPT_STATE* state);
BOOL CheckFlag960(SCRIPT_STATE* state);
void SetGameClearFlag(SCRIPT_STATE* state);
BOOL CheckGameClearFlag(SCRIPT_STATE* state);
void ScriptState_SetHaveFollowerFlag(SCRIPT_STATE* state);
void ScriptState_ClearHaveFollowerFlag(SCRIPT_STATE* state);
BOOL ScriptState_CheckHaveFollower(SCRIPT_STATE* state);
void SetFlag99C(SCRIPT_STATE* state);
void SetFlag965(SCRIPT_STATE* state);
void ClearFlag965(SCRIPT_STATE* state);
BOOL CheckFlag965(SCRIPT_STATE* state);
void ScriptState_SetRocketCostumeFlag(SCRIPT_STATE* state);
void ScriptState_ClearRocketCostumeFlag(SCRIPT_STATE* state);
BOOL ScriptState_CheckRocketCostumeFlag(SCRIPT_STATE* state);
BOOL EventFlagCheck_RematchGroup(SCRIPT_STATE* state, u16 flag_id);
void ScriptState_SetAlphPuzzleFlag(SCRIPT_STATE* state, u8 flag);
BOOL ScriptState_CheckAlphPuzzleFlag(SCRIPT_STATE* state, u8 flag);
void ScriptState_MomsSavingsFlagAction(SCRIPT_STATE* state, BOOL set);
BOOL ScriptState_MomsSavingsFlagCheck(SCRIPT_STATE* state);
u16 GetOverriddenMapMusic(SCRIPT_STATE* state, u32 map_no);
void SetFlag966(SCRIPT_STATE* state);
void ClearFlag966(SCRIPT_STATE* state);
BOOL CheckFlag966(SCRIPT_STATE* state);
BOOL CheckMetBill(SCRIPT_STATE* state);
void SetFlag975(SCRIPT_STATE* state);
void ClearFlag975(SCRIPT_STATE* state);
void ScriptState_SetSafariSysFlag(SCRIPT_STATE* state);
void ScriptState_ClearSafariSysFlag(SCRIPT_STATE* state);
BOOL ScriptState_CheckSafariSysFlag(SCRIPT_STATE* state);
BOOL CheckFlag996(SCRIPT_STATE* state);
void ScriptState_SetPalParkSysFlag(SCRIPT_STATE* state);
void ScriptState_ClearPalParkSysFlag(SCRIPT_STATE* state);
BOOL ScriptState_CheckPalParkSysFlag(SCRIPT_STATE* state);
void ClearFlag972(SCRIPT_STATE* state);
BOOL StrengthFlagAction(SCRIPT_STATE* state, u32 action);
void SysFlagFlashSet(SCRIPT_STATE* state);
void SysFlagFlashClear(SCRIPT_STATE* state);
BOOL SysFlagFlashCheck(SCRIPT_STATE* state);
void SysFlagDefogSet(SCRIPT_STATE* state);
void SysFlagDefogClear(SCRIPT_STATE* state);
BOOL SysFlagDefogCheck(SCRIPT_STATE* state);
BOOL ScriptState_FlypointFlagAction(SCRIPT_STATE* state, u32 action, u32 flypoint_flag_no);
void SetFlag970(SCRIPT_STATE* state);
BOOL CheckGotStarter(SCRIPT_STATE* state);
BOOL CheckGotPokegear(SCRIPT_STATE* state);
BOOL CheckGotPokedex(SCRIPT_STATE* state);
BOOL CheckGotMenuIconI(SCRIPT_STATE* state, s32 icon_idx);
BOOL CheckFlag96A(SCRIPT_STATE* state);
BOOL sub_020669B4(SCRIPT_STATE* state, u32 a1);
BOOL CheckDisabledCianwoodWaterfall(SCRIPT_STATE* state);
BOOL CheckSolvedLtSurgeGym(SCRIPT_STATE* state);
BOOL CheckFlag982(SCRIPT_STATE* state);
BOOL CheckFlag09A(SCRIPT_STATE* state);
BOOL CheckFlag997(SCRIPT_STATE* state);
void SetFlag99A(SCRIPT_STATE* state);
void ClearFlag99A(SCRIPT_STATE* state);
BOOL CheckFlag99A(SCRIPT_STATE* state);
BOOL CheckBattledSnorlax(SCRIPT_STATE* state);
BOOL CheckBattledRedGyarados(SCRIPT_STATE* state);
void ChangeFlag99D(SCRIPT_STATE* state, BOOL set);

#endif
