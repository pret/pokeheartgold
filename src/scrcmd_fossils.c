#include "scrcmd.h"
#include "bag.h"
#include "constants/items.h"
#include "constants/species.h"

static const u16 sFossilPokemonMap[7][2] = {
    { ITEM_OLD_AMBER, SPECIES_AERODACTYL },
    { ITEM_HELIX_FOSSIL, SPECIES_OMANYTE },
    { ITEM_DOME_FOSSIL, SPECIES_KABUTO },
    { ITEM_ROOT_FOSSIL, SPECIES_LILEEP },
    { ITEM_CLAW_FOSSIL, SPECIES_ANORITH },
    { ITEM_ARMOR_FOSSIL, SPECIES_SHIELDON },
    { ITEM_SKULL_FOSSIL, SPECIES_CRANIDOS },
};

BOOL ScrCmd_CountFossils(ScriptContext* ctx) {
    FieldSystem* sav_ptr = ctx->fieldSystem;
    u16* ret_ptr = ScriptGetVarPointer(ctx);

    u8 i;
    u16 total;
    for (i = 0, total = 0; i < NELEMS(sFossilPokemonMap); i++) {
        total += Bag_GetQuantity(Save_Bag_Get(sav_ptr->saveData), sFossilPokemonMap[i][0], HEAP_ID_4);
    }

    *ret_ptr = total;
    return FALSE;
}

BOOL ScrCmd_GetFossilPokemon(ScriptContext* ctx) {
    u16 *ret_ptr = ScriptGetVarPointer(ctx);
    u16 fossil_id = ScriptGetVar(ctx);

    *ret_ptr = 0;
    for (u16 i = 0; i < NELEMS(sFossilPokemonMap); i++) {
        if (fossil_id == sFossilPokemonMap[i][0]) {
            *ret_ptr = sFossilPokemonMap[i][1];
            break;
        }
    }

    return FALSE;
}

BOOL ScrCmd_GetFossilMinimumAmount(ScriptContext* ctx) {
    FieldSystem* sav_ptr = ctx->fieldSystem;
    u16* ret_ptr1 = ScriptGetVarPointer(ctx);
    u16* ret_ptr2 = ScriptGetVarPointer(ctx);
    u16 needed_amount = ScriptGetVar(ctx);

    *ret_ptr1 = 0;
    *ret_ptr2 = 0;

    u8 i;
    u16 total;
    for (i = 0, total = 0; i < NELEMS(sFossilPokemonMap); i++) {
        total += Bag_GetQuantity(Save_Bag_Get(sav_ptr->saveData), sFossilPokemonMap[i][0], HEAP_ID_4);
        if (total >= needed_amount) {
            *ret_ptr1 = sFossilPokemonMap[i][0];
            *ret_ptr2 = i;
            break;
        }
    }

    return FALSE;
}
