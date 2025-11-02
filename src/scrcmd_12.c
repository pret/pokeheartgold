#include "field_system.h"
#include "catching_show.h"
#include "pokedex.h"
#include "save_arrays.h"
#include "save_pokegear.h"
#include "save_vars_flags.h"
#include "scrcmd.h"
#include "sys_flags.h"
#include "trainer_memo.h"
#include "unk_02092BE8.h"
#include "update_dex_received.h"

BOOL ScrCmd_MomGiftCheck(ScriptContext *ctx) {
    u16 sp;
    u16 *retPtr = ScriptGetVarPointer(ctx);
    PhoneCallPersistentState *callPersistentState = SaveData_GetPhoneCallPersistentState(ctx->fieldSystem->saveData);
    if (PhoneCallPersistentState_MomGiftQueue_Peek(callPersistentState, 0, &sp) == 0) {
        *retPtr = FALSE;
    } else {
        *retPtr = TRUE;
    }
    return FALSE;
}

BOOL ScrCmd_PalParkAction(ScriptContext *ctx) {
    SaveVarsFlags *script = Save_VarsFlags_Get(ctx->fieldSystem->saveData);
    u16 var0 = ScriptGetVar(ctx);
    if (var0 == 2) {
        Save_VarsFlags_SetPalParkSysFlag(script);
        CatchingShow_ClearState(ctx->fieldSystem);
    } else if (var0 == 0) {
        CatchingShow_Start(ctx->fieldSystem);
    } else if (var0 == 1) {
        Save_VarsFlags_ClearPalParkSysFlag(script);
        CatchingShow_End(ctx->fieldSystem);
    } else {
        GF_ASSERT(FALSE);
    }

    return FALSE;
}

BOOL ScrCmd_509(ScriptContext *ctx) {
    struct MigratedPokemon *unkStruct = Save_MigratedPokemon_Get(ctx->fieldSystem->saveData);
    Pokemon *mon = AllocMonZeroed(HEAP_ID_FIELD3);
    u16 *retPtr = ScriptGetVarPointer(ctx);
    if (sub_0202EC98(unkStruct) == PARTY_SIZE) {
        *retPtr = TRUE;
    } else {
        *retPtr = FALSE;
    }
    Heap_Free(mon);
    return FALSE;
}

BOOL ScrCmd_510(ScriptContext *ctx) {
    MigratedPokemon *unkStruct = Save_MigratedPokemon_Get(ctx->fieldSystem->saveData);
    PCStorage *storage = SaveArray_PCStorage_Get(ctx->fieldSystem->saveData);
    Pokemon *mon = AllocMonZeroed(HEAP_ID_FIELD3);
    PlayerProfile *profile = Save_PlayerData_GetProfile(ctx->fieldSystem->saveData);
    Pokedex *pokedex = Save_Pokedex_Get(ctx->fieldSystem->saveData);
    int i;

    for (i = 0; i < PARTY_SIZE; i++) {
        MigratedPokemon_ConvertToPokemon(unkStruct, i, mon);
        MonSetTrainerMemo(mon, profile, 2, 0, HEAP_ID_FIELD3);
        GF_ASSERT(PCStorage_PlaceMonInFirstEmptySlotInAnyBox(storage, Mon_GetBoxMon(mon)));
        UpdatePokedexWithReceivedSpecies(ctx->fieldSystem->saveData, mon);
    }

    Heap_Free(mon);
    sub_0202EB74(unkStruct);
    sub_02093070(ctx->fieldSystem);
    return FALSE;
}

BOOL ScrCmd_PalParkScoreGet(ScriptContext *ctx) {
    u16 var0 = ScriptGetVar(ctx);
    u16 *retPtr = ScriptGetVarPointer(ctx);

    switch (var0) {
    case 0:
        *retPtr = CatchingShow_CalcCatchingPoints(ctx->fieldSystem);
        break;
    case 1:
        *retPtr = CatchingShow_GetTimePoints(ctx->fieldSystem);
        break;
    case 2:
        *retPtr = CatchingShow_GetTypePoints(ctx->fieldSystem);
        break;
    case 3: {
        int val0 = CatchingShow_GetTimePoints(ctx->fieldSystem);
        int val1 = CatchingShow_CalcCatchingPoints(ctx->fieldSystem);
        int val2 = CatchingShow_GetTypePoints(ctx->fieldSystem);
        *retPtr = val1 + val2 + val0;
        break;
    }
    }

    return FALSE;
}
