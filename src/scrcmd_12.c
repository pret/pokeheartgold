#include "scrcmd.h"
#include "save_pokegear.h"
#include "event_data.h"
#include "sys_flags.h"
#include "unk_020557E0.h"
#include "save_arrays.h"
#include "pokedex.h"
#include "unk_0208E600.h"
#include "update_dex_received.h"
#include "unk_02092BE8.h"

BOOL ScrCmd_MomGiftCheck(ScriptContext *ctx) {
    u16 sp;
    u16 *retPtr = ScriptGetVarPointer(ctx);
    MomsSavings *momsSavings = SaveData_GetMomsSavingsAddr(ctx->fsys->savedata);
    if (sub_0202F224(momsSavings, 0, &sp) == 0) {
        *retPtr = FALSE;
    } else {
        *retPtr = TRUE;
    }
    return FALSE;
}

BOOL ScrCmd_508(ScriptContext *ctx) {
    SaveVarsFlags *script = Save_VarsFlags_Get(ctx->fsys->savedata);
    u16 var0 = ScriptGetVar(ctx);
    if (var0 == 2) {
        Save_VarsFlags_SetPalParkSysFlag(script);
        sub_020557E0(ctx->fsys);
    } else if (var0 == 0) {
        sub_020557F8(ctx->fsys);
    } else if (var0 == 1) {
        Save_VarsFlags_ClearPalParkSysFlag(script);
        sub_02055828(ctx->fsys);
    } else {
        GF_ASSERT(0);
    }

    return FALSE;
}

BOOL ScrCmd_509(ScriptContext *ctx) {
    struct UnkStruct_0202EB30 *unkStruct = sub_020270F8(ctx->fsys->savedata);
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
    struct UnkStruct_0202EB30 *unkStruct = sub_020270F8(ctx->fsys->savedata);
    PC_STORAGE *storage = GetStoragePCPointer(ctx->fsys->savedata);
    Pokemon *mon = AllocMonZeroed(HEAP_ID_32);
    PlayerProfile *profile = Save_PlayerData_GetProfileAddr(ctx->fsys->savedata);
    Pokedex *pokedex = Save_Pokedex_Get(ctx->fsys->savedata);
    int i;

    for (i = 0; i < PARTY_SIZE; i++) {
        sub_0202EC70(unkStruct, i, mon);
        MonSetTrainerMemo(mon, profile, 2, 0, HEAP_ID_32);
        GF_ASSERT(PCStorage_PlaceMonInFirstEmptySlotInAnyBox(storage, Mon_GetBoxMon(mon)));
        UpdatePokedexWithReceivedSpecies(ctx->fsys->savedata, mon);
    }

    FreeToHeap(mon);
    sub_0202EB74(unkStruct);
    sub_02093070(ctx->fsys);
    return FALSE;
}

BOOL ScrCmd_511(ScriptContext *ctx) {
    u16 var0 = ScriptGetVar(ctx);
    u16 *retPtr = ScriptGetVarPointer(ctx);

    switch (var0) {
    case 0:
        *retPtr = sub_020558D0(ctx->fsys);
        break;
    case 1:
        *retPtr = sub_020558E0(ctx->fsys);
        break;
    case 2:
        *retPtr = sub_020558F0(ctx->fsys);
        break;
    case 3: {
        int val0 = sub_020558E0(ctx->fsys);
        int val1 = sub_020558D0(ctx->fsys);
        int val2 = sub_020558F0(ctx->fsys);
        *retPtr = val1 + val2 + val0;
        break;
    }
    }

    return FALSE;
}
