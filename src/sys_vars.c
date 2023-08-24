#include "global.h"
#include "constants/species.h"
#include "friend_group.h"
#include "math_util.h"
#include "sys_vars.h"

static const u16 _020FE4A4[] = {
    0x06F2,
    0xAD7C,
};

static const u16 _020FE4A8[] = {
    0x6208,
    0xF229,
    0x0382,
    0x1228,
};

BOOL SetScriptVar(SaveVarsFlags* state, u16 var_id, u16 value) {
    u16* var_ptr = GetVarAddr(state, var_id);
    if (var_id < VAR_BASE || var_id > SPECIAL_VAR_BASE) {
        GF_ASSERT(FALSE);
        return FALSE;
    }

    if (var_ptr == NULL) {
        return FALSE;
    }

    *var_ptr = value;
    return TRUE;
}

u16 GetScriptVar(SaveVarsFlags* state, u16 var_id) {
    u16* var_ptr = GetVarAddr(state, var_id);
    if (var_ptr == NULL) {
        return 0;
    }

    return *var_ptr;
}

void Save_VarsFlags_SetFollowerTrainerNum(SaveVarsFlags* state, u16 trainer_num) {
    SetScriptVar(state, VAR_FOLLOWER_TRAINER_NUM, trainer_num);
}

u16 Save_VarsFlags_GetFollowerTrainerNum(SaveVarsFlags* state) {
    return GetScriptVar(state, VAR_FOLLOWER_TRAINER_NUM);
}

void Save_VarsFlags_SetStarter(SaveVarsFlags* state, u16 starter) {
    SetScriptVar(state, VAR_PLAYER_STARTER, starter);
}

u16 Save_VarsFlags_GetStarter(SaveVarsFlags* state) {
    return GetScriptVar(state, VAR_PLAYER_STARTER);
}

// This will always return Turtwig.
u16 DPPtLeftover_GetRivalSpecies(SaveVarsFlags* state) {
    u16 rival_starter_species;

    u16 player_starter_species = GetScriptVar(state, VAR_PLAYER_STARTER);
    if (player_starter_species == SPECIES_TURTWIG) {
        rival_starter_species = SPECIES_CHIMCHAR;
    } else {
        rival_starter_species = SPECIES_TURTWIG;
        if (player_starter_species == SPECIES_CHIMCHAR) {
            rival_starter_species = SPECIES_PIPLUP;
        }
    }

    return rival_starter_species;
}

// This will always return Chimchar.
u16 DPPtLeftover_GetFriendStarterSpecies(SaveVarsFlags* state) {
    u16 friend_starter_species;

    u16 player_starter_species = GetScriptVar(state, VAR_PLAYER_STARTER);
    if (player_starter_species == SPECIES_TURTWIG) {
        friend_starter_species = SPECIES_PIPLUP;
    } else {
        friend_starter_species = SPECIES_TURTWIG;
        if (player_starter_species != SPECIES_CHIMCHAR) {
            friend_starter_species = SPECIES_CHIMCHAR;
        }
    }

    return friend_starter_species;
}

u16 Save_VarsFlags_GetFishingCompetitionLengthRecord(SaveVarsFlags* state) {
    return GetScriptVar(state, VAR_MAGIKARP_SIZE_RECORD);
}

void Save_VarsFlags_SetFishingCompetitionLengthRecord(SaveVarsFlags* state, u16 record) {
    SetScriptVar(state, VAR_MAGIKARP_SIZE_RECORD, record);
}

u16 Save_VarsFlags_GetUnownReportLevel(SaveVarsFlags* state) {
    return GetScriptVar(state, VAR_UNOWN_REPORT_LEVEL);
}

u16 sub_02066B80(s32 a0) {
    GF_ASSERT(a0 >= 0 && (u32)a0 < NELEMS(_020FE4A4));
    return _020FE4A4[a0];
}

void sub_02066B9C(SaveVarsFlags* state, u32 a1) {
    SetScriptVar(state, VAR_UNK_4043 + a1, sub_02066B80(a1));
}

BOOL sub_02066BC0(SaveVarsFlags* state, u32 a1) {
    u16 var1 = GetScriptVar(state, VAR_UNK_4043 + a1);
    u16 var2 = sub_02066B80(a1);
    return var1 == var2;
}

void sub_02066BE8(SaveVarsFlags* state, u32 a1, u16 value) {
    if (a1 < NELEMS(_020FE4A8)) {
        SetScriptVar(state, VAR_ROAMER_RAIKOU_STATUS + a1, value);
    }
}

u32 sub_02066C00(s32 a0) {
    GF_ASSERT(a0 >= 0 && a0 < (s32)NELEMS(_020FE4A8));
    return _020FE4A8[a0];
}

void sub_02066C1C(SaveVarsFlags* state, s32 a1) {
    GF_ASSERT(a1 >= 0 && a1 < (s32)NELEMS(_020FE4A8));
    SetScriptVar(state, VAR_UNK_4036 + a1, sub_02066C00(a1));
}

void sub_02066C4C(SaveVarsFlags* state, s32 a1) {
    GF_ASSERT(a1 >= 0 && a1 < (s32)NELEMS(_020FE4A8));
    SetScriptVar(state, VAR_UNK_4036 + a1, 0);
}

BOOL sub_02066C74(SaveVarsFlags* state, s32 a1) {
    GF_ASSERT(a1 >= 0 && a1 < (s32)NELEMS(_020FE4A8));
    u16 var1 = GetScriptVar(state, VAR_UNK_4036 + a1);
    u32 var2 = sub_02066C00(a1);
    return var1 == var2;
}

void Save_VarsFlags_SetLotoId(SaveVarsFlags* state, u32 id) {
    SetScriptVar(state, VAR_LOTO_NUMBER_LO, id & 0xFFFF);
#ifdef BUGFIX_LOTO_NUMBER_HI
    SetScriptVar(state, VAR_LOTO_NUMBER_HI, id >> 16);
#else
    SetScriptVar(state, VAR_LOTO_NUMBER_LO, id >> 16);
#endif
}

u32 Save_VarsFlags_GetLotoId(SaveVarsFlags* state) {
    u16 lo = GetScriptVar(state, VAR_LOTO_NUMBER_LO);
    u16 hi = GetScriptVar(state, VAR_LOTO_NUMBER_HI);

    return hi << 16 | lo;
}

void Save_VarsFlags_RollLotoId(SaveVarsFlags* state) {
    u16 lo = LCRandom();
    u16 hi = LCRandom();

    Save_VarsFlags_SetLotoId(state, hi << 16 | lo);
}

void Save_LCRNGAdvanceLotoID(SaveData* saveData, u16 var) {
#pragma unused(var)
    SaveVarsFlags* state = Save_VarsFlags_Get(saveData);
    SAV_FRIEND_GRP* friend_groups = Save_FriendGroup_Get(saveData);
    u32 rand_id = sub_0202C7DC(friend_groups) * 1103515245 + 12345;

    Save_VarsFlags_SetLotoId(state, rand_id);
}

u16 Save_VarsFlags_GetVar4041(SaveVarsFlags* state) {
    return GetScriptVar(state, VAR_UNK_4041);
}

void Save_VarsFlags_SetVar4041(SaveVarsFlags* state, u16 value) {
    SetScriptVar(state, VAR_UNK_4041, value);
}

void sub_02066D60(SaveData* saveData) {
    SaveVarsFlags* state = Save_VarsFlags_Get(saveData);
    u32 rand = LCRandom() % 98;

    Save_VarsFlags_SetVar4041(state, rand + 2);
}

void sub_02066D80(SaveVarsFlags* state) {
    u16 var = GetScriptVar(state, VAR_UNK_4042);
    u16 unk_value = 10000;
    if (var < 10000) {
        unk_value = var + 1;
    }

    SetScriptVar(state, VAR_UNK_4042, unk_value);
}

u16 Save_VarsFlags_GetVar4042(SaveVarsFlags* state) {
    return GetScriptVar(state, VAR_UNK_4042);
}

u16 Save_VarsFlags_GetVar404B(SaveVarsFlags* state) {
    return GetScriptVar(state, VAR_UNK_404B);
}

void Save_VarsFlags_SetVar404B(SaveVarsFlags* state, u16 value) {
    SetScriptVar(state, VAR_UNK_404B, value);
}

u16 Save_VarsFlags_GetBattleFactoryPrintProgress(SaveVarsFlags* state) {
    return GetScriptVar(state, VAR_BATTLE_FACTORY_PRINT_PROGRESS);
}

u16 Save_VarsFlags_GetBattleHallPrintProgress(SaveVarsFlags* state) {
    return GetScriptVar(state, VAR_BATTLE_HALL_PRINT_PROGRESS);
}

u16 Save_VarsFlags_GetBattleCastlePrintProgress(SaveVarsFlags* state) {
    return GetScriptVar(state, VAR_BATTLE_CASTLE_PRINT_PROGRESS);
}

u16 Save_VarsFlags_GetBattleArcadePrintProgress(SaveVarsFlags* state) {
    return GetScriptVar(state, VAR_BATTLE_ARCADE_PRINT_PROGRESS);
}

u16 Save_VarsFlags_GetBattleTowerPrintProgress(SaveVarsFlags* state) {
    return GetScriptVar(state, VAR_BATTLE_TOWER_PRINT_PROGRESS);
}

u16 Save_VarsFlags_GetVar404C(SaveVarsFlags* state) {
    return GetScriptVar(state, VAR_UNK_404C);
}

void Save_VarsFlags_SetVar404C(SaveVarsFlags* state, u16 value) {
    SetScriptVar(state, VAR_UNK_404C, value);
}

u16 Save_VarsFlags_GetVar4052(SaveVarsFlags* state) {
    return GetScriptVar(state, VAR_UNK_4052);
}

BOOL Save_VarsFlags_IsInRocketTakeover(SaveVarsFlags* state) {
    u16 var = GetScriptVar(state, VAR_SCENE_ROCKET_TAKEOVER);
    if (var < 2 || var > 4) {
        return FALSE;
    }

    return TRUE;
}

u16 Save_VarsFlags_GetVar4057(SaveVarsFlags* state) {
    return GetScriptVar(state, VAR_UNK_4057);
}

void Save_VarsFlags_SetVar4057(SaveVarsFlags* state, u16 value) {
    SetScriptVar(state, VAR_UNK_4057, value);
}

void Save_VarsFlags_UpdateBuenasPasswordSet(SaveVarsFlags* state) {
    u16 set = GetScriptVar(state, VAR_BUENAS_PASSWORD_SET);
    u16 new_set = LCRandom() % 30;

    if (set == new_set) {
        new_set = (new_set + 1) % 30;
    }

    SetScriptVar(state, VAR_BUENAS_PASSWORD_SET, new_set);
}

u16 Save_VarsFlags_GetBuenasPasswordSet(SaveVarsFlags* state) {
    return GetScriptVar(state, VAR_BUENAS_PASSWORD_SET);
}
