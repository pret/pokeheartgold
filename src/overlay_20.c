#include "pokemon.h"
#include "script.h"
#include "fieldmap.h"
#include "unk_02090C94.h"
#include "event_data.h"
#include "script_state_misc.h"

extern const u16 ov20_02259C74[16][3];

int ov20_022598C0(POKEMON *pokemon) {
    u16 pid_lo;
    u16 hpIv_lo;
    u16 atkIv_lo;
    u16 defIv_lo;
    u16 spdIv_lo;
    u16 spAtkIv_lo;
    u16 spDefIv_lo;
    u16 ret, ret2;

    pid_lo = GetMonData(pokemon, MON_DATA_PERSONALITY, NULL);
    hpIv_lo = GetMonData(pokemon, MON_DATA_HP_IV, NULL) & 0xF;
    atkIv_lo = GetMonData(pokemon, MON_DATA_ATK_IV, NULL) & 0xF;
    defIv_lo = GetMonData(pokemon, MON_DATA_DEF_IV, NULL) & 0xF;
    spdIv_lo = GetMonData(pokemon, MON_DATA_SPEED_IV, NULL) & 0xF;
    spAtkIv_lo = GetMonData(pokemon, MON_DATA_SPATK_IV, NULL) & 0xF;
    spDefIv_lo = GetMonData(pokemon, MON_DATA_SPDEF_IV, NULL) & 0xF;

    ret = ((spDefIv_lo ^ spAtkIv_lo) * spdIv_lo) ^ (pid_lo >> 8);
    ret2 = ((atkIv_lo ^ defIv_lo) * hpIv_lo) ^ ((u8)pid_lo);
    return ret + (ret2 << 8);
}

u8 ov20_0225996C(u32 a0) {
    u8 i;
    for (i = 1; i < NELEMS(ov20_02259C74) - 1; i++) {
        if (a0 < ov20_02259C74[i][2]) {
            return i - 1;
        }
    }
    return i;
}

u32 ov20_022599A0(int species, int rand) {
    u32 r6;
    int r4;

    r6 = SpeciesGetDexHeight(species);
    r4 = ov20_0225996C(rand);
    return r6 * ((u64)ov20_02259C74[r4][0] + ((u64)rand - (u64)ov20_02259C74[r4][2]) / (u64)ov20_02259C74[r4][1]) / 10;
}

void ov20_02259A1C(UnkSavStruct80 *fsys, u32 idx0, u32 idx1, u16 species, u16 rand) {
    MSGFMT ** msgFmt;
    u32 score;
    u32 r4;

    msgFmt = FieldSysGetAttrAddr(fsys, UNK80_10_C_MSGFMT);
    score = ov20_022599A0(species, rand);
    r4 = LengthConvertToImperial(score);
    BufferIntegerAsString(*msgFmt, idx0, r4 / 10, 3, STRCONVMODE_LEFT_ALIGN, TRUE);
    BufferIntegerAsString(*msgFmt, idx1, r4 % 10, 1, STRCONVMODE_LEFT_ALIGN, TRUE);
};

BOOL ScrCmd_390(SCRIPTCONTEXT *ctx) {
    POKEMON *pokemon;
    vu16 rand, record;
    u16 slot;
    u16 species;
    u16 *ret_p;
    u32 cm1;
    u32 cm2;
    UnkSavStruct80 *fsys;

    fsys = ctx->unk80;
    ret_p = GetVarPointer(ctx->unk80, ScriptReadHalfword(ctx));
    slot = VarGet(ctx->unk80, ScriptReadHalfword(ctx));
    pokemon = GetPartyMonByIndex(SavArray_PlayerParty_get(fsys->savedata), slot);
    species = GetMonData(pokemon, MON_DATA_SPECIES, NULL);
    rand = ov20_022598C0(pokemon);
    cm1 = ov20_022599A0(species, rand);
    record = ScriptState_GetFishingCompetitionLengthRecord(SavArray_Flags_get(fsys->savedata));
    cm2 = ov20_022599A0(species, record);
    {
        u32 in1 = LengthConvertToImperial(cm1);
        u32 in2 = LengthConvertToImperial(cm2);
        if (in1 == in2) {
            // *ret_p = 1;
            return 1; // Whoops! This yields to the next frame.
        } else {
            if (in1 > in2) {
                *ret_p = 2;
            } else {
                *ret_p = 0;
            }
        }
    }
    return FALSE;
}
