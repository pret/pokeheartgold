#include "global.h"
#include "constants/sndseq.h"
#include "constants/maps.h"
#include "constants/flags.h"
#include "sys_flags.h"

struct MusicOverride {
    u16 map;
    u16 flag;
    u16 seq;
};

static const struct MusicOverride sMusicOverrideMap[] = {
    { MAP_D22R0101, FLAG_BUG_CONTEST_ACTIVE, SEQ_GS_TAIKAIMAE_D5 },
    { MAP_R35R0201, FLAG_BUG_CONTEST_ACTIVE, SEQ_GS_TAIKAIMAE },
    { MAP_R36R0201, FLAG_BUG_CONTEST_ACTIVE, SEQ_GS_TAIKAIMAE },
    { MAP_T04GYM0101, FLAG_UNK_994, SEQ_GS_EYE_ROCKET },
    { MAP_R24, FLAG_UNK_995, SEQ_GS_EYE_ROCKET },
    { MAP_D10R0101, FLAG_UNK_999, SEQ_GS_SAFARI_FIELD },
    { MAP_D23R0101, FLAG_ROCKET_TAKEOVER_ACTIVE, SEQ_GS_SENKYO },
    { MAP_D23R0102, FLAG_ROCKET_TAKEOVER_ACTIVE, SEQ_GS_SENKYO },
    { MAP_D23R0103, FLAG_ROCKET_TAKEOVER_ACTIVE, SEQ_GS_SENKYO },
    { MAP_D23R0104, FLAG_ROCKET_TAKEOVER_ACTIVE, SEQ_GS_SENKYO },
    { MAP_D23R0105, FLAG_ROCKET_TAKEOVER_ACTIVE, SEQ_GS_SENKYO },
    { MAP_D23R0106, FLAG_ROCKET_TAKEOVER_ACTIVE, SEQ_GS_SENKYO },
    { MAP_D23R0107, FLAG_ROCKET_TAKEOVER_ACTIVE, SEQ_GS_SENKYO },
};

void SetScriptFlag(SaveVarsFlags* state, u16 flag_id) {
    SetFlagInArray(state, flag_id);
}

void ClearScriptFlag(SaveVarsFlags* state, u16 flag_id) {
    ClearFlagInArray(state, flag_id);
}

BOOL CheckScriptFlag(SaveVarsFlags* state, u16 flag_id) {
    return CheckFlagInArray(state, flag_id);
}

BOOL FlagAction(SaveVarsFlags* state, u32 action, u32 flag_id) {
    switch (action) {
    case FLAG_ACTION_SET:
        SetScriptFlag(state, flag_id);
        break;
    case FLAG_ACTION_CLEAR:
        ClearScriptFlag(state, flag_id);
        break;
    case FLAG_ACTION_CHECK:
        return CheckScriptFlag(state, flag_id);
    default:
        GF_ASSERT(FALSE);
    }

    return FALSE;
}

void SetFlag960(SaveVarsFlags* state) {
    SetScriptFlag(state, FLAG_UNK_960);
}

BOOL CheckFlag960(SaveVarsFlags* state) {
    return CheckScriptFlag(state, FLAG_UNK_960);
}

void SetGameClearFlag(SaveVarsFlags* state) {
    SetScriptFlag(state, FLAG_GAME_CLEAR);
}

BOOL CheckGameClearFlag(SaveVarsFlags* state) {
    return CheckScriptFlag(state, FLAG_GAME_CLEAR);
}

void Save_VarsFlags_SetHaveFollowerFlag(SaveVarsFlags* state) {
    SetScriptFlag(state, FLAG_HAVE_FOLLOWER);
}

void Save_VarsFlags_ClearHaveFollowerFlag(SaveVarsFlags* state) {
    ClearScriptFlag(state, FLAG_HAVE_FOLLOWER);
}

BOOL Save_VarsFlags_CheckHaveFollower(SaveVarsFlags* state) {
    return CheckScriptFlag(state, FLAG_HAVE_FOLLOWER);
}

void SetFlag99C(SaveVarsFlags* state) {
    SetScriptFlag(state, FLAG_UNK_99C);
}

void SetFlag965(SaveVarsFlags* state) {
    SetScriptFlag(state, FLAG_UNK_965);
}

void ClearFlag965(SaveVarsFlags* state) {
    ClearScriptFlag(state, FLAG_UNK_965);
}

BOOL CheckFlag965(SaveVarsFlags* state) {
    return CheckScriptFlag(state, FLAG_UNK_965);
}

void Save_VarsFlags_SetRocketCostumeFlag(SaveVarsFlags* state) {
    SetScriptFlag(state, FLAG_SYS_ROCKET_COSTUME);
}

void Save_VarsFlags_ClearRocketCostumeFlag(SaveVarsFlags* state) {
    ClearScriptFlag(state, FLAG_SYS_ROCKET_COSTUME);
}

BOOL Save_VarsFlags_CheckRocketCostumeFlag(SaveVarsFlags* state) {
    return CheckScriptFlag(state, FLAG_SYS_ROCKET_COSTUME);
}

BOOL EventFlagCheck_RematchGroup(SaveVarsFlags* state, u16 flag_id) {
    return CheckScriptFlag(state, FLAG_UNK_97B + flag_id);
}

void Save_VarsFlags_SetAlphPuzzleFlag(SaveVarsFlags* state, u8 flag) {
    switch (flag) {
    case 0:
        SetScriptFlag(state, FLAG_SYS_ALPH_PUZZLE_KABUTO);
        return;
    case 1:
        SetScriptFlag(state, FLAG_SYS_ALPH_PUZZLE_AERODACTYL);
        return;
    case 2:
        SetScriptFlag(state, FLAG_SYS_ALPH_PUZZLE_OMANYTE);
        return;
    case 3:
        SetScriptFlag(state, FLAG_SYS_ALPH_PUZZLE_HO_OH);
        return;
    }
}

BOOL Save_VarsFlags_CheckAlphPuzzleFlag(SaveVarsFlags* state, u8 flag) {
    BOOL ret = FALSE;

    switch (flag) {
    case 0:
        ret = CheckScriptFlag(state, FLAG_SYS_ALPH_PUZZLE_KABUTO);
        break;
    case 1:
        ret = CheckScriptFlag(state, FLAG_SYS_ALPH_PUZZLE_AERODACTYL);
        break;
    case 2:
        ret = CheckScriptFlag(state, FLAG_SYS_ALPH_PUZZLE_OMANYTE);
        break;
    case 3:
        ret = CheckScriptFlag(state, FLAG_SYS_ALPH_PUZZLE_HO_OH);
        break;
    }

    return ret;
}

void Save_VarsFlags_MomsSavingsFlagAction(SaveVarsFlags* state, BOOL set) {
    if (set) {
        SetScriptFlag(state, FLAG_SYS_MOMS_SAVINGS);
    } else {
        ClearScriptFlag(state, FLAG_SYS_MOMS_SAVINGS);
    }
}

BOOL Save_VarsFlags_MomsSavingsFlagCheck(SaveVarsFlags* state) {
    return CheckScriptFlag(state, FLAG_SYS_MOMS_SAVINGS);
}

u16 GetOverriddenMapMusic(SaveVarsFlags* state, u32 map_no) {
    for (u32 i = 0; i < NELEMS(sMusicOverrideMap); i++) {
        if (map_no == sMusicOverrideMap[i].map && CheckScriptFlag(state, sMusicOverrideMap[i].flag)) {
            return sMusicOverrideMap[i].seq;
        }
    }

    return 0;
}

void SetFlag966(SaveVarsFlags* state) {
    SetScriptFlag(state, FLAG_UNK_966);
}

void ClearFlag966(SaveVarsFlags* state) {
    ClearScriptFlag(state, FLAG_UNK_966);
}

BOOL CheckFlag966(SaveVarsFlags* state) {
    return CheckScriptFlag(state, FLAG_UNK_966);
}

BOOL CheckMetBill(SaveVarsFlags* state) {
    return CheckScriptFlag(state, FLAG_SYS_MET_BILL);
}

void SetFlag975(SaveVarsFlags* state) {
    SetScriptFlag(state, FLAG_UNK_975);
}

void ClearFlag975(SaveVarsFlags* state) {
    ClearScriptFlag(state, FLAG_UNK_975);
}

void Save_VarsFlags_SetSafariSysFlag(SaveVarsFlags* state) {
    SetScriptFlag(state, FLAG_SYS_SAFARI);
}

void Save_VarsFlags_ClearSafariSysFlag(SaveVarsFlags* state) {
    ClearScriptFlag(state, FLAG_SYS_SAFARI);
}

BOOL Save_VarsFlags_CheckSafariSysFlag(SaveVarsFlags* state) {
    return CheckScriptFlag(state, FLAG_SYS_SAFARI);
}

BOOL CheckFlag996(SaveVarsFlags* state) {
    return CheckScriptFlag(state, FLAG_UNK_996);
}

void Save_VarsFlags_SetPalParkSysFlag(SaveVarsFlags* state) {
    SetScriptFlag(state, FLAG_SYS_PAL_PARK);
}

void Save_VarsFlags_ClearPalParkSysFlag(SaveVarsFlags* state) {
    ClearScriptFlag(state, FLAG_SYS_PAL_PARK);
}

BOOL Save_VarsFlags_CheckPalParkSysFlag(SaveVarsFlags* state) {
    return CheckScriptFlag(state, FLAG_SYS_PAL_PARK);
}

void ClearFlag972(SaveVarsFlags* state) {
    ClearScriptFlag(state, FLAG_UNK_972);
}

BOOL StrengthFlagAction(SaveVarsFlags* state, u32 action) {
    return FlagAction(state, action, FLAG_STRENGTH_ACTIVE);
}

void SysFlagFlashSet(SaveVarsFlags* state) {
    SetScriptFlag(state, FLAG_SYS_FLASH);
}

void SysFlagFlashClear(SaveVarsFlags* state) {
    ClearScriptFlag(state, FLAG_SYS_FLASH);
}

BOOL SysFlagFlashCheck(SaveVarsFlags* state) {
    return CheckScriptFlag(state, FLAG_SYS_FLASH);
}

void SysFlagDefogSet(SaveVarsFlags* state) {
    SetScriptFlag(state, FLAG_SYS_DEFOG);
}

void SysFlagDefogClear(SaveVarsFlags* state) {
    ClearScriptFlag(state, FLAG_SYS_DEFOG);
}

BOOL SysFlagDefogCheck(SaveVarsFlags* state) {
    return CheckScriptFlag(state, FLAG_SYS_DEFOG);
}

BOOL Save_VarsFlags_FlypointFlagAction(SaveVarsFlags* state, u32 action, u32 flypoint_flag_no) {
    GF_ASSERT(flypoint_flag_no < 38);
    return FlagAction(state, action, FLAG_SYS_FLYPOINT_PALLET + flypoint_flag_no);
}

void SetFlag970(SaveVarsFlags* state) {
    SetScriptFlag(state, FLAG_UNK_970);
}

BOOL CheckGotStarter(SaveVarsFlags* state) {
    return CheckScriptFlag(state, FLAG_GOT_STARTER);
}

BOOL CheckGotPokegear(SaveVarsFlags* state) {
    return CheckScriptFlag(state, FLAG_GOT_POKEGEAR);
}

BOOL CheckGotPokedex(SaveVarsFlags* state) {
    return CheckScriptFlag(state, FLAG_GOT_POKEDEX);
}

BOOL CheckGotMenuIconI(SaveVarsFlags* state, s32 icon_idx) {
    GF_ASSERT(icon_idx < 4);
    return CheckScriptFlag(state, FLAG_GOT_BAG + icon_idx);
}

BOOL CheckFlag96A(SaveVarsFlags* state) {
    return CheckScriptFlag(state, FLAG_UNK_96A);
}

BOOL sub_020669B4(SaveVarsFlags* state, u32 a1) {
    if (a1 > 2) {
        return FALSE;
    }

    return CheckScriptFlag(state, FLAG_UNK_96B + a1);
}

BOOL CheckDisabledCianwoodWaterfall(SaveVarsFlags* state) {
    return CheckScriptFlag(state, FLAG_SYS_CIANWOOD_WATERFALL_DISABLE);
}

BOOL CheckSolvedLtSurgeGym(SaveVarsFlags* state) {
    return CheckScriptFlag(state, FLAG_SYS_SOLVED_LT_SURGE_GYM);
}

BOOL CheckFlag982(SaveVarsFlags* state) {
    return CheckScriptFlag(state, FLAG_UNK_982);
}

BOOL CheckFlag09A(SaveVarsFlags* state) {
    return CheckScriptFlag(state, FLAG_UNK_09A);
}

BOOL CheckFlag997(SaveVarsFlags* state) {
    return CheckScriptFlag(state, FLAG_UNK_997);
}

void SetFlag99A(SaveVarsFlags* state) {
    SetScriptFlag(state, FLAG_UNK_99A);
}

void ClearFlag99A(SaveVarsFlags* state) {
    ClearScriptFlag(state, FLAG_UNK_99A);
}

BOOL CheckFlag99A(SaveVarsFlags* state) {
    return CheckScriptFlag(state, FLAG_UNK_99A);
}

BOOL CheckBattledSnorlax(SaveVarsFlags* state) {
    return CheckScriptFlag(state, FLAG_SNORLAX_MEET);
}

BOOL CheckBattledRedGyarados(SaveVarsFlags* state) {
    return CheckScriptFlag(state, FLAG_RED_GYARADOS_MEET);
}

void ChangeFlag99D(SaveVarsFlags* state, BOOL set) {
    if (set) {
        SetScriptFlag(state, FLAG_UNK_99D);
    } else {
        ClearScriptFlag(state, FLAG_UNK_99D);
    }
}
