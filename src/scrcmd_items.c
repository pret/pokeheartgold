#include "scrcmd.h"
#include "bag.h"
#include "constants/items.h"

extern BOOL ItemIsTMOrHM(u16 item_id);

BOOL ScrCmd_GiveItem(SCRIPTCONTEXT* ctx) {
    FieldSystem* sav_ptr = ctx->fsys;
    u16 item_id = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    u16 quantity = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    u16* ret_ptr = GetVarPointer(ctx->fsys, ScriptReadHalfword(ctx));

    Bag* bag = Sav2_Bag_get(sav_ptr->savedata);
    *ret_ptr = Bag_AddItem(bag, item_id, quantity, 4);

    return FALSE;
}

BOOL ScrCmd_TakeItem(SCRIPTCONTEXT* ctx) {
    FieldSystem* sav_ptr = ctx->fsys;
    u16 item_id = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    u16 quantity = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    u16* ret_ptr = GetVarPointer(ctx->fsys, ScriptReadHalfword(ctx));

    Bag* bag = Sav2_Bag_get(sav_ptr->savedata);
    *ret_ptr = Bag_TakeItem(bag, item_id, quantity, 4);

    return FALSE;
}

BOOL ScrCmd_HasSpaceForItem(SCRIPTCONTEXT* ctx) {
    FieldSystem* sav_ptr = ctx->fsys;
    u16 item_id = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    u16 quantity = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    u16* ret_ptr = GetVarPointer(ctx->fsys, ScriptReadHalfword(ctx));

    Bag* bag = Sav2_Bag_get(sav_ptr->savedata);
    *ret_ptr = Bag_HasSpaceForItem(bag, item_id, quantity, 4);

    return FALSE;
}

BOOL ScrCmd_HasItem(SCRIPTCONTEXT* ctx) {
    FieldSystem* sav_ptr = ctx->fsys;
    u16 item_id = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    u16 quantity = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    u16* ret_ptr = GetVarPointer(ctx->fsys, ScriptReadHalfword(ctx));

    Bag* bag = Sav2_Bag_get(sav_ptr->savedata);
    *ret_ptr = Bag_HasItem(bag, item_id, quantity, 11);

    return FALSE;
}

BOOL ScrCmd_GetItemQuantity(SCRIPTCONTEXT* ctx) {
    FieldSystem* sav_ptr = ctx->fsys;
    u16 item_id = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    u16* ret_ptr = GetVarPointer(ctx->fsys, ScriptReadHalfword(ctx));

    Bag* bag = Sav2_Bag_get(sav_ptr->savedata);
    *ret_ptr = Bag_GetQuantity(bag, item_id, 11);

    return FALSE;
}

BOOL ScrCmd_ItemIsTMOrHM(SCRIPTCONTEXT* ctx) {
    u16 item_id = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    u16* ret_ptr = GetVarPointer(ctx->fsys, ScriptReadHalfword(ctx));

    *ret_ptr = ItemIsTMOrHM(item_id);

    return FALSE;
}

BOOL ScrCmd_GetItemPocket(SCRIPTCONTEXT* ctx) {
    u16 item_id = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    u16* ret_ptr = GetVarPointer(ctx->fsys, ScriptReadHalfword(ctx));

    *ret_ptr = GetItemAttr(item_id, ITEMATTR_FIELD_POCKET, 11);

    return FALSE;
}
