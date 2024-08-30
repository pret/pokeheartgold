#ifndef POKEHEARTGOLD_SYS_FLAGS_H
#define POKEHEARTGOLD_SYS_FLAGS_H

#include "save_vars_flags.h"

void SetScriptFlag(SaveVarsFlags *state, u16 flag_id);
void ClearScriptFlag(SaveVarsFlags *state, u16 flag_id);
BOOL CheckScriptFlag(SaveVarsFlags *state, u16 flag_id);
BOOL FlagAction(SaveVarsFlags *state, u32 action, u32 flag_id);
void SetFlag960(SaveVarsFlags *state);
BOOL CheckFlag960(SaveVarsFlags *state);
void SetGameClearFlag(SaveVarsFlags *state);
BOOL CheckGameClearFlag(SaveVarsFlags *state);
void Save_VarsFlags_SetHaveFollowerFlag(SaveVarsFlags *state);
void Save_VarsFlags_ClearHaveFollowerFlag(SaveVarsFlags *state);
BOOL Save_VarsFlags_CheckHaveFollower(SaveVarsFlags *state);
void SetFlag99C(SaveVarsFlags *state);
void SetFlag965(SaveVarsFlags *state);
void ClearFlag965(SaveVarsFlags *state);
BOOL CheckFlag965(SaveVarsFlags *state);
void Save_VarsFlags_SetRocketCostumeFlag(SaveVarsFlags *state);
void Save_VarsFlags_ClearRocketCostumeFlag(SaveVarsFlags *state);
BOOL Save_VarsFlags_CheckRocketCostumeFlag(SaveVarsFlags *state);
BOOL EventFlagCheck_RematchGroup(SaveVarsFlags *state, u16 flag_id);
void Save_VarsFlags_SetAlphPuzzleFlag(SaveVarsFlags *state, u8 flag);
BOOL Save_VarsFlags_CheckAlphPuzzleFlag(SaveVarsFlags *state, u8 flag);
void Save_VarsFlags_MomsSavingsFlagAction(SaveVarsFlags *state, BOOL set);
BOOL Save_VarsFlags_MomsSavingsFlagCheck(SaveVarsFlags *state);
u16 GetOverriddenMapMusic(SaveVarsFlags *state, u32 map_no);
void SetFlag966(SaveVarsFlags *state);
void ClearFlag966(SaveVarsFlags *state);
BOOL CheckFlag966(SaveVarsFlags *state);
BOOL CheckMetBill(SaveVarsFlags *state);
void SetFlag975(SaveVarsFlags *state);
void ClearFlag975(SaveVarsFlags *state);
void Save_VarsFlags_SetSafariSysFlag(SaveVarsFlags *state);
void Save_VarsFlags_ClearSafariSysFlag(SaveVarsFlags *state);
BOOL Save_VarsFlags_CheckSafariSysFlag(SaveVarsFlags *state);
BOOL Save_VarsFlags_CheckBugContestFlag(SaveVarsFlags *state);
void Save_VarsFlags_SetPalParkSysFlag(SaveVarsFlags *state);
void Save_VarsFlags_ClearPalParkSysFlag(SaveVarsFlags *state);
BOOL Save_VarsFlags_CheckPalParkSysFlag(SaveVarsFlags *state);
void ClearFlag972(SaveVarsFlags *state);
BOOL StrengthFlagAction(SaveVarsFlags *state, u32 action);
void SysFlagFlashSet(SaveVarsFlags *state);
void SysFlagFlashClear(SaveVarsFlags *state);
BOOL SysFlagFlashCheck(SaveVarsFlags *state);
void SysFlagDefogSet(SaveVarsFlags *state);
void SysFlagDefogClear(SaveVarsFlags *state);
BOOL SysFlagDefogCheck(SaveVarsFlags *state);
BOOL Save_VarsFlags_FlypointFlagAction(SaveVarsFlags *state, u32 action, u32 flypoint_flag_no);
void SetFlag970(SaveVarsFlags *state);
BOOL CheckGotStarter(SaveVarsFlags *state);
BOOL CheckGotPokegear(SaveVarsFlags *state);
BOOL CheckGotPokedex(SaveVarsFlags *state);
BOOL CheckGotMenuIconI(SaveVarsFlags *state, s32 icon_idx);
BOOL CheckFlag96A(SaveVarsFlags *state);
BOOL sub_020669B4(SaveVarsFlags *state, u32 a1);
BOOL CheckDisabledCianwoodWaterfall(SaveVarsFlags *state);
BOOL CheckSolvedLtSurgeGym(SaveVarsFlags *state);
BOOL CheckFlag982(SaveVarsFlags *state);
BOOL CheckFlag09A(SaveVarsFlags *state);
BOOL CheckFlag997(SaveVarsFlags *state);
void SetFlag99A(SaveVarsFlags *state);
void ClearFlag99A(SaveVarsFlags *state);
BOOL CheckFlag99A(SaveVarsFlags *state);
BOOL CheckBattledSnorlax(SaveVarsFlags *state);
BOOL CheckBattledRedGyarados(SaveVarsFlags *state);
void ChangeFlag99D(SaveVarsFlags *state, BOOL set);

#endif
