#include "scrcmd.h"
#include "bag.h"
#include "constants/items.h"

extern BOOL ItemIsTMOrHM(u16 item_id);

BOOL ScrCmd_GiveItem(SCRIPTCONTEXT* ctx) {
    FieldSystem* sav_ptr = ctx->fsys;
    u16 item_id = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    u16 quantity = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    u16* ret_ptr = GetVarPointer(ctx->fsys, ScriptReadHalfword(ctx));

    Bag* bag = SaveGetBag(sav_ptr->savedata);
    *ret_ptr = BagAddItem(bag, item_id, quantity, HEAP_ID_4);

    return FALSE;
}

BOOL ScrCmd_TakeItem(SCRIPTCONTEXT* ctx) {
    FieldSystem* sav_ptr = ctx->fsys;
    u16 item_id = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    u16 quantity = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    u16* ret_ptr = GetVarPointer(ctx->fsys, ScriptReadHalfword(ctx));

    Bag* bag = SaveGetBag(sav_ptr->savedata);
    *ret_ptr = BagTakeItem(bag, item_id, quantity, HEAP_ID_4);

    return FALSE;
}

BOOL ScrCmd_HasSpaceForItem(SCRIPTCONTEXT* ctx) {
    FieldSystem* sav_ptr = ctx->fsys;
    u16 item_id = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    u16 quantity = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    u16* ret_ptr = GetVarPointer(ctx->fsys, ScriptReadHalfword(ctx));

    Bag* bag = SaveGetBag(sav_ptr->savedata);
    *ret_ptr = BagHasSpaceForItem(bag, item_id, quantity, HEAP_ID_4);

    return FALSE;
}

BOOL ScrCmd_HasItem(SCRIPTCONTEXT* ctx) {
    FieldSystem* sav_ptr = ctx->fsys;
    u16 item_id = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    u16 quantity = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    u16* ret_ptr = GetVarPointer(ctx->fsys, ScriptReadHalfword(ctx));

    Bag* bag = SaveGetBag(sav_ptr->savedata);
    *ret_ptr = BagHasItem(bag, item_id, quantity, HEAP_ID_FIELD);

    return FALSE;
}

BOOL ScrCmd_GetItemQuantity(SCRIPTCONTEXT* ctx) {
    FieldSystem* sav_ptr = ctx->fsys;
    u16 item_id = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    u16* ret_ptr = GetVarPointer(ctx->fsys, ScriptReadHalfword(ctx));

    Bag* bag = SaveGetBag(sav_ptr->savedata);
    *ret_ptr = BagGetQuantity(bag, item_id, HEAP_ID_FIELD);

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

    *ret_ptr = GetItemAttr(item_id, ITEMATTR_FIELD_POCKET, HEAP_ID_FIELD);

    return FALSE;
}
