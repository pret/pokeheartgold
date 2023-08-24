#include "scrcmd.h"
#include "bag.h"
#include "constants/items.h"

extern BOOL ItemIsTMOrHM(u16 item_id);

BOOL ScrCmd_GiveItem(ScriptContext* ctx) {
    FieldSystem* sav_ptr = ctx->fieldSystem;
    u16 item_id = ScriptGetVar(ctx);
    u16 quantity = ScriptGetVar(ctx);
    u16* ret_ptr = ScriptGetVarPointer(ctx);

    Bag* bag = Save_Bag_Get(sav_ptr->saveData);
    *ret_ptr = Bag_AddItem(bag, item_id, quantity, HEAP_ID_4);

    return FALSE;
}

BOOL ScrCmd_TakeItem(ScriptContext* ctx) {
    FieldSystem* sav_ptr = ctx->fieldSystem;
    u16 item_id = ScriptGetVar(ctx);
    u16 quantity = ScriptGetVar(ctx);
    u16* ret_ptr = ScriptGetVarPointer(ctx);

    Bag* bag = Save_Bag_Get(sav_ptr->saveData);
    *ret_ptr = Bag_TakeItem(bag, item_id, quantity, HEAP_ID_4);

    return FALSE;
}

BOOL ScrCmd_HasSpaceForItem(ScriptContext* ctx) {
    FieldSystem* sav_ptr = ctx->fieldSystem;
    u16 item_id = ScriptGetVar(ctx);
    u16 quantity = ScriptGetVar(ctx);
    u16* ret_ptr = ScriptGetVarPointer(ctx);

    Bag* bag = Save_Bag_Get(sav_ptr->saveData);
    *ret_ptr = Bag_HasSpaceForItem(bag, item_id, quantity, HEAP_ID_4);

    return FALSE;
}

BOOL ScrCmd_HasItem(ScriptContext* ctx) {
    FieldSystem* sav_ptr = ctx->fieldSystem;
    u16 item_id = ScriptGetVar(ctx);
    u16 quantity = ScriptGetVar(ctx);
    u16* ret_ptr = ScriptGetVarPointer(ctx);

    Bag* bag = Save_Bag_Get(sav_ptr->saveData);
    *ret_ptr = Bag_HasItem(bag, item_id, quantity, HEAP_ID_FIELD);

    return FALSE;
}

BOOL ScrCmd_GetItemQuantity(ScriptContext* ctx) {
    FieldSystem* sav_ptr = ctx->fieldSystem;
    u16 item_id = ScriptGetVar(ctx);
    u16* ret_ptr = ScriptGetVarPointer(ctx);

    Bag* bag = Save_Bag_Get(sav_ptr->saveData);
    *ret_ptr = Bag_GetQuantity(bag, item_id, HEAP_ID_FIELD);

    return FALSE;
}

BOOL ScrCmd_ItemIsTMOrHM(ScriptContext* ctx) {
    u16 item_id = ScriptGetVar(ctx);
    u16* ret_ptr = ScriptGetVarPointer(ctx);

    *ret_ptr = ItemIsTMOrHM(item_id);

    return FALSE;
}

BOOL ScrCmd_GetItemPocket(ScriptContext* ctx) {
    u16 item_id = ScriptGetVar(ctx);
    u16* ret_ptr = ScriptGetVarPointer(ctx);

    *ret_ptr = GetItemAttr(item_id, ITEMATTR_FIELD_POCKET, HEAP_ID_FIELD);

    return FALSE;
}
