#ifndef POKEHEARTGOLD_SYS_FLAGS_H
#define POKEHEARTGOLD_SYS_FLAGS_H

#include "event_data.h"

void SetScriptFlag(ScriptState* state, u16 flag_id);
void ClearScriptFlag(ScriptState* state, u16 flag_id);
BOOL CheckScriptFlag(ScriptState* state, u16 flag_id);
BOOL FlagAction(ScriptState* state, u32 action, u32 flag_id);
void SetFlag960(ScriptState* state);
BOOL CheckFlag960(ScriptState* state);
void SetGameClearFlag(ScriptState* state);
BOOL CheckGameClearFlag(ScriptState* state);
void ScriptState_SetHaveFollowerFlag(ScriptState* state);
void ScriptState_ClearHaveFollowerFlag(ScriptState* state);
BOOL ScriptState_CheckHaveFollower(ScriptState* state);
void SetFlag99C(ScriptState* state);
void SetFlag965(ScriptState* state);
void ClearFlag965(ScriptState* state);
BOOL CheckFlag965(ScriptState* state);
void ScriptState_SetRocketCostumeFlag(ScriptState* state);
void ScriptState_ClearRocketCostumeFlag(ScriptState* state);
BOOL ScriptState_CheckRocketCostumeFlag(ScriptState* state);
BOOL EventFlagCheck_RematchGroup(ScriptState* state, u16 flag_id);
void ScriptState_SetAlphPuzzleFlag(ScriptState* state, u8 flag);
BOOL ScriptState_CheckAlphPuzzleFlag(ScriptState* state, u8 flag);
void ScriptState_MomsSavingsFlagAction(ScriptState* state, BOOL set);
BOOL ScriptState_MomsSavingsFlagCheck(ScriptState* state);
u16 GetOverriddenMapMusic(ScriptState* state, u32 map_no);
void SetFlag966(ScriptState* state);
void ClearFlag966(ScriptState* state);
BOOL CheckFlag966(ScriptState* state);
BOOL CheckMetBill(ScriptState* state);
void SetFlag975(ScriptState* state);
void ClearFlag975(ScriptState* state);
void ScriptState_SetSafariSysFlag(ScriptState* state);
void ScriptState_ClearSafariSysFlag(ScriptState* state);
BOOL ScriptState_CheckSafariSysFlag(ScriptState* state);
BOOL CheckFlag996(ScriptState* state);
void ScriptState_SetPalParkSysFlag(ScriptState* state);
void ScriptState_ClearPalParkSysFlag(ScriptState* state);
BOOL ScriptState_CheckPalParkSysFlag(ScriptState* state);
void ClearFlag972(ScriptState* state);
BOOL StrengthFlagAction(ScriptState* state, u32 action);
void SysFlagFlashSet(ScriptState* state);
void SysFlagFlashClear(ScriptState* state);
BOOL SysFlagFlashCheck(ScriptState* state);
void SysFlagDefogSet(ScriptState* state);
void SysFlagDefogClear(ScriptState* state);
BOOL SysFlagDefogCheck(ScriptState* state);
BOOL ScriptState_FlypointFlagAction(ScriptState* state, u32 action, u32 flypoint_flag_no);
void SetFlag970(ScriptState* state);
BOOL CheckGotStarter(ScriptState* state);
BOOL CheckGotPokegear(ScriptState* state);
BOOL CheckGotPokedex(ScriptState* state);
BOOL CheckGotMenuIconI(ScriptState* state, s32 icon_idx);
BOOL CheckFlag96A(ScriptState* state);
BOOL sub_020669B4(ScriptState* state, u32 a1);
BOOL CheckDisabledCianwoodWaterfall(ScriptState* state);
BOOL CheckSolvedLtSurgeGym(ScriptState* state);
BOOL CheckFlag982(ScriptState* state);
BOOL CheckFlag09A(ScriptState* state);
BOOL CheckFlag997(ScriptState* state);
void SetFlag99A(ScriptState* state);
void ClearFlag99A(ScriptState* state);
BOOL CheckFlag99A(ScriptState* state);
BOOL CheckBattledSnorlax(ScriptState* state);
BOOL CheckBattledRedGyarados(ScriptState* state);
void ChangeFlag99D(ScriptState* state, BOOL set);

#endif
