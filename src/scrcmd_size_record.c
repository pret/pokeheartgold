#include "global.h"
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

static u32 GetMonSizeHash(Pokemon *mon) {
    u16 pid_lo;
    u16 hpIv_lo;
    u16 atkIv_lo;
    u16 defIv_lo;
    u16 spdIv_lo;
    u16 spAtkIv_lo;
    u16 spDefIv_lo;
    u16 ret, ret2;

    pid_lo = GetMonData(mon, MON_DATA_PERSONALITY, NULL);
    hpIv_lo = GetMonData(mon, MON_DATA_HP_IV, NULL) & 0xF;
    atkIv_lo = GetMonData(mon, MON_DATA_ATK_IV, NULL) & 0xF;
    defIv_lo = GetMonData(mon, MON_DATA_DEF_IV, NULL) & 0xF;
    spdIv_lo = GetMonData(mon, MON_DATA_SPEED_IV, NULL) & 0xF;
    spAtkIv_lo = GetMonData(mon, MON_DATA_SPATK_IV, NULL) & 0xF;
    spDefIv_lo = GetMonData(mon, MON_DATA_SPDEF_IV, NULL) & 0xF;

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

    r6 = SpeciesGetDexHeight(species, HEAP_ID_4);
    r4 = TranslateBigMonSizeTableIndex(rand);
    return r6 * ((u64)sBigMonSizeTable[r4][0] + ((u64)rand - (u64)sBigMonSizeTable[r4][2]) / (u64)sBigMonSizeTable[r4][1]) / 10;
}

static void FormatSizeRecord(FieldSystem *fieldSystem, u8 idx0, u8 idx1, u16 species, u16 rand) {
    MessageFormat ** msgFmt;
    u32 score;
    u32 r4;

    msgFmt = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    score = GetMonSize(species, rand);
    r4 = LengthConvertToImperial(score);
    BufferIntegerAsString(*msgFmt, idx0, r4 / 10, 3, PRINTING_MODE_LEFT_ALIGN, TRUE);
    BufferIntegerAsString(*msgFmt, idx1, r4 % 10, 1, PRINTING_MODE_LEFT_ALIGN, TRUE);
}

BOOL ScrCmd_SizeRecordCompare(ScriptContext *ctx) {
    Pokemon *mon;
    vu16 rand, record;
    u16 slot;
    u16 species;
    u16 *ret_p;
    u32 cm1;
    u32 cm2;
    FieldSystem *fieldSystem;

    fieldSystem = ctx->fieldSystem;
    ret_p = ScriptGetVarPointer(ctx);
    slot = ScriptGetVar(ctx);
    mon = Party_GetMonByIndex(SaveArray_Party_Get(fieldSystem->saveData), slot);
    species = GetMonData(mon, MON_DATA_SPECIES, NULL);
    rand = GetMonSizeHash(mon);
    cm1 = GetMonSize(species, rand);
    record = Save_VarsFlags_GetFishingCompetitionLengthRecord(Save_VarsFlags_Get(fieldSystem->saveData));
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

BOOL ScrCmd_SizeRecordUpdate(ScriptContext *ctx) {
    Pokemon *mon;
    u16 slot;
    FieldSystem *fieldSystem;

    fieldSystem = ctx->fieldSystem;
    slot = ScriptGetVar(ctx);
    mon = Party_GetMonByIndex(SaveArray_Party_Get(fieldSystem->saveData), slot);
    Save_VarsFlags_SetFishingCompetitionLengthRecord(Save_VarsFlags_Get(fieldSystem->saveData), GetMonSizeHash(mon));
    return FALSE;
}

BOOL ScrCmd_BufferRecordSize(ScriptContext *ctx) {
    FieldSystem *fieldSystem;
    u16 idx0;
    u16 idx1;
    u16 species;
    vu16 rand;

    fieldSystem = ctx->fieldSystem;
    idx0 = ScriptGetVar(ctx);
    idx1 = ScriptGetVar(ctx);
    species = ScriptGetVar(ctx);
    rand = Save_VarsFlags_GetFishingCompetitionLengthRecord(Save_VarsFlags_Get(fieldSystem->saveData));
    FormatSizeRecord(fieldSystem, idx0, idx1, species, rand);
    return FALSE;
}

BOOL ScrCmd_BufferMonSize(ScriptContext *ctx) {
    Pokemon *mon;
    FieldSystem *fieldSystem;
    u16 idx0;
    u16 idx1;
    u16 slot;

    fieldSystem = ctx->fieldSystem;
    idx0 = ScriptGetVar(ctx);
    idx1 = ScriptGetVar(ctx);
    slot = ScriptGetVar(ctx);
    mon = Party_GetMonByIndex(SaveArray_Party_Get(fieldSystem->saveData), slot);
    FormatSizeRecord(fieldSystem, idx0, idx1, GetMonData(mon, MON_DATA_SPECIES, NULL), GetMonSizeHash(mon));
    return FALSE;
}
