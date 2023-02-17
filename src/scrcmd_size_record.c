#include "pokemon.h"
#include "scrcmd.h"
#include "dex_mon_measures.h"
#include "event_data.h"
#include "script_state_misc.h"

static const u16 sBigMonSizeTable[][3] = {
    {290,  1,       0},
    {300,  1,      10},
    {400,  2,     110},
    {500,  4,     310},
    {600,  20,    710},
    {700,  50,   2710},
    {800,  100,  7710},
    {900,  150, 17710},
    {1000, 150, 32710},
    {1100, 100, 47710},
    {1200, 50,  57710},
    {1300, 20,  62710},
    {1400, 5,   64710},
    {1500, 2,   65210},
    {1600, 1,   65410},
    {1700, 1,   65510},
};

static u32 GetMonSizeHash(Pokemon *pokemon) {
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

static u8 TranslateBigMonSizeTableIndex(u32 a0) {
    u8 i;
    for (i = 1; i < NELEMS(sBigMonSizeTable) - 1; i++) {
        if (a0 < sBigMonSizeTable[i][2]) {
            return i - 1;
        }
    }
    return i;
}

static u32 GetMonSize(int species, int rand) {
    u32 r6;
    int r4;

    r6 = SpeciesGetDexHeight(species, 4);
    r4 = TranslateBigMonSizeTableIndex(rand);
    return r6 * ((u64)sBigMonSizeTable[r4][0] + ((u64)rand - (u64)sBigMonSizeTable[r4][2]) / (u64)sBigMonSizeTable[r4][1]) / 10;
}

static void FormatSizeRecord(FieldSystem *fsys, u8 idx0, u8 idx1, u16 species, u16 rand) {
    MSGFMT ** msgFmt;
    u32 score;
    u32 r4;

    msgFmt = FieldSysGetAttrAddr(fsys, SCRIPTENV_MSGFMT);
    score = GetMonSize(species, rand);
    r4 = LengthConvertToImperial(score);
    BufferIntegerAsString(*msgFmt, idx0, r4 / 10, 3, STRCONVMODE_LEFT_ALIGN, TRUE);
    BufferIntegerAsString(*msgFmt, idx1, r4 % 10, 1, STRCONVMODE_LEFT_ALIGN, TRUE);
};

BOOL ScrCmd_SizeRecordCompare(SCRIPTCONTEXT *ctx) {
    Pokemon *pokemon;
    vu16 rand, record;
    u16 slot;
    u16 species;
    u16 *ret_p;
    u32 cm1;
    u32 cm2;
    FieldSystem *fsys;

    fsys = ctx->fsys;
    ret_p = GetVarPointer(ctx->fsys, ScriptReadHalfword(ctx));
    slot = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    pokemon = GetPartyMonByIndex(SavArray_PlayerParty_get(fsys->savedata), slot);
    species = GetMonData(pokemon, MON_DATA_SPECIES, NULL);
    rand = GetMonSizeHash(pokemon);
    cm1 = GetMonSize(species, rand);
    record = ScriptState_GetFishingCompetitionLengthRecord(SavArray_Flags_get(fsys->savedata));
    cm2 = GetMonSize(species, record);
    {
        u32 in1 = LengthConvertToImperial(cm1);
        u32 in2 = LengthConvertToImperial(cm2);
        if (in1 == in2) {
            // *ret_p = 1;
            return 1; // Whoops! This instead yields to the next frame.
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

BOOL ScrCmd_SizeRecordUpdate(SCRIPTCONTEXT *ctx) {
    Pokemon *pokemon;
    u16 slot;
    FieldSystem *fsys;

    fsys = ctx->fsys;
    slot = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    pokemon = GetPartyMonByIndex(SavArray_PlayerParty_get(fsys->savedata), slot);
    ScriptState_SetFishingCompetitionLengthRecord(SavArray_Flags_get(fsys->savedata), GetMonSizeHash(pokemon));
    return FALSE;
}

BOOL ScrCmd_BufferRecordSize(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys;
    u16 idx0;
    u16 idx1;
    u16 species;
    vu16 rand;

    fsys = ctx->fsys;
    idx0 = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    idx1 = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    species = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    rand = ScriptState_GetFishingCompetitionLengthRecord(SavArray_Flags_get(fsys->savedata));
    FormatSizeRecord(fsys, idx0, idx1, species, rand);
    return FALSE;
}

BOOL ScrCmd_BufferMonSize(SCRIPTCONTEXT *ctx) {
    Pokemon *pokemon;
    FieldSystem *fsys;
    u16 idx0;
    u16 idx1;
    u16 slot;

    fsys = ctx->fsys;
    idx0 = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    idx1 = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    slot = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    pokemon = GetPartyMonByIndex(SavArray_PlayerParty_get(fsys->savedata), slot);
    FormatSizeRecord(fsys, idx0, idx1, GetMonData(pokemon, MON_DATA_SPECIES, NULL), GetMonSizeHash(pokemon));
    return FALSE;
}
