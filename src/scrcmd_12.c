#include "scrcmd.h"
#include "save_pokegear.h"
#include "event_data.h"
#include "sys_flags.h"
#include "pal_park.h"
#include "save_arrays.h"
#include "pokedex.h"
#include "unk_0208E600.h"
#include "update_dex_received.h"
#include "unk_02092BE8.h"

BOOL ScrCmd_MomGiftCheck(ScriptContext *ctx) {
    u16 sp;
    u16 *retPtr = ScriptGetVarPointer(ctx);
    MomsSavings *momsSavings = SaveData_GetMomsSavingsAddr(ctx->fieldSystem->saveData);
    if (sub_0202F224(momsSavings, 0, &sp) == 0) {
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
        PalPark_ClearState(ctx->fieldSystem);
    } else if (var0 == 0) {
        PalPark_InitFromSave(ctx->fieldSystem);
    } else if (var0 == 1) {
        Save_VarsFlags_ClearPalParkSysFlag(script);
        PalPark_StopClock(ctx->fieldSystem);
    } else {
        GF_ASSERT(0);
    }

    return FALSE;
}

BOOL ScrCmd_509(ScriptContext *ctx) {
    struct MigratedPokemonSav *unkStruct = Save_MigratedPokemon_Get(ctx->fieldSystem->saveData);
    Pokemon *mon = AllocMonZeroed(HEAP_ID_32);
    u16 *retPtr = ScriptGetVarPointer(ctx);
    if (sub_0202EC98(unkStruct) == PARTY_SIZE) {
        *retPtr = TRUE;
    } else {
        *retPtr = FALSE;
    }
    FreeToHeap(mon);
    return FALSE;
}

BOOL ScrCmd_510(ScriptContext *ctx) {
    struct MigratedPokemonSav *unkStruct = Save_MigratedPokemon_Get(ctx->fieldSystem->saveData);
    PC_STORAGE *storage = SaveArray_PCStorage_Get(ctx->fieldSystem->saveData);
    Pokemon *mon = AllocMonZeroed(HEAP_ID_32);
    PlayerProfile *profile = Save_PlayerData_GetProfileAddr(ctx->fieldSystem->saveData);
    Pokedex *pokedex = Save_Pokedex_Get(ctx->fieldSystem->saveData);
    int i;

    for (i = 0; i < PARTY_SIZE; i++) {
        GetMigratedPokemonByIndex(unkStruct, i, mon);
        MonSetTrainerMemo(mon, profile, 2, 0, HEAP_ID_32);
        GF_ASSERT(PCStorage_PlaceMonInFirstEmptySlotInAnyBox(storage, Mon_GetBoxMon(mon)));
        UpdatePokedexWithReceivedSpecies(ctx->fieldSystem->saveData, mon);
    }

    FreeToHeap(mon);
    sub_0202EB74(unkStruct);
    sub_02093070(ctx->fieldSystem);
    return FALSE;
}

BOOL ScrCmd_PalParkScoreGet(ScriptContext *ctx) {
    u16 var0 = ScriptGetVar(ctx);
    u16 *retPtr = ScriptGetVarPointer(ctx);

    switch (var0) {
    case 0:
        *retPtr = PalPark_CalcSpeciesScore(ctx->fieldSystem);
        break;
    case 1:
        *retPtr = PalPark_CalcTimeScore(ctx->fieldSystem);
        break;
    case 2:
        *retPtr = PalPark_CalcTypesScore(ctx->fieldSystem);
        break;
    case 3: {
        int val0 = PalPark_CalcTimeScore(ctx->fieldSystem);
        int val1 = PalPark_CalcSpeciesScore(ctx->fieldSystem);
        int val2 = PalPark_CalcTypesScore(ctx->fieldSystem);
        *retPtr = val1 + val2 + val0;
        break;
    }
    }

    return FALSE;
}
