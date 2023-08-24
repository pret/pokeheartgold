#include "scrcmd.h"
#include "event_data.h"
#include "sys_vars.h"
#include "save_arrays.h"

u8 LotoId_CountDigitsMatched(u16 lotoId, u16 otid);

BOOL ScrCmd_BufferDeptStoreFloorNo(ScriptContext *ctx) {
    MessageFormat **msg = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u8 fieldno = ScriptReadByte(ctx);
    u8 floor = ScriptReadByte(ctx);
    BufferDeptStoreFloorNo(*msg, fieldno, floor);
    return FALSE;
}

BOOL ScrCmd_LotoIdGet(ScriptContext *ctx) {
    SaveVarsFlags *state = Save_VarsFlags_Get(ctx->fieldSystem->saveData);
    u16 *retPtr = ScriptGetVarPointer(ctx);
    u32 lotoId = Save_VarsFlags_GetLotoId(state);
    *retPtr = lotoId;
    return FALSE;
}

BOOL ScrCmd_LotoIdSearch(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    PC_STORAGE *storage = SaveArray_PCStorage_Get(fieldSystem->saveData);
    u16 *retPtr0 = ScriptGetVarPointer(ctx);
    u16 *retPtr1 = ScriptGetVarPointer(ctx);
    u16 *retPtr2 = ScriptGetVarPointer(ctx);
    u16 lotoId = ScriptGetVar(ctx);
    u16 partyCount;

    u16 monDigit;
    u16 monPosition;
    u16 i;
    u32 otid;
    u8 digitCount;

    u16 boxDigit;
    u16 boxPosition;
    u32 ii;
    u32 j;

    partyCount = Party_GetCount(SaveArray_Party_Get(fieldSystem->saveData));
    for (monDigit = 0, monPosition = 0, i = 0; i < partyCount; i++) {
        Pokemon *mon = Party_GetMonByIndex(SaveArray_Party_Get(fieldSystem->saveData), i);
        if (!GetMonData(mon, MON_DATA_IS_EGG, NULL)) {
            otid = GetMonData(mon, MON_DATA_OTID, NULL) & 0xffff;
            digitCount = LotoId_CountDigitsMatched(lotoId, otid);
            if (digitCount != 0 && monDigit < digitCount) {
                monDigit = digitCount;
                monPosition = i;
            }
        }
    }

    for (boxDigit = 0, boxPosition = 0, ii = 0; ii < NUM_BOXES; ii++) {
        for (j = 0; j < MONS_PER_BOX; j++) {
            BoxPokemon *boxMon = PCStorage_GetMonByIndexPair(storage, ii, j);
            if (GetBoxMonData(boxMon, MON_DATA_SPECIES, NULL) != 0 && !GetBoxMonData(boxMon, MON_DATA_IS_EGG, NULL)) {
                otid = GetBoxMonData(boxMon, MON_DATA_OTID, NULL) & 0xffff;
                digitCount = LotoId_CountDigitsMatched(lotoId, otid);
                if (digitCount != 0 && boxDigit < digitCount) {
                    boxDigit = digitCount;
                    boxPosition = ii * MONS_PER_BOX + j;
                }
            }
        }
    }

    if (monDigit == 0 && boxDigit == 0) {
        *retPtr0 = 0;
        *retPtr1 = 0;
        *retPtr2 = 0;
    } else if (monDigit >= boxDigit) {
        *retPtr0 = monPosition;
        *retPtr1 = monDigit;
        *retPtr2 = 0;
    } else {
        *retPtr0 = boxPosition;
        *retPtr1 = boxDigit;
        *retPtr2 = 1;
    }

    return FALSE;
}

BOOL ScrCmd_LotoIdSet(ScriptContext *ctx) {
    SaveVarsFlags *state = Save_VarsFlags_Get(ctx->fieldSystem->saveData);
    Save_VarsFlags_RollLotoId(state);
    return FALSE;
}

static u16 sLotoId = 0;
static u16 sOtId = 0;
u8 LotoId_CountDigitsMatched(u16 lotoId, u16 otid) {
    u8 i;
    u8 count = 0;

    for (i = 0; i < 5; i++) {
        sLotoId = lotoId % 10;
        sOtId = otid % 10;

        if ((lotoId % 10) != (otid % 10)) {
            break;
        }

        lotoId /= 10;
        otid /= 10;
        count++;
    }

    return count;
}
