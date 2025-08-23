#ifndef POKEHEARTGOLD_ITEM_H
#define POKEHEARTGOLD_ITEM_H

#include "heap.h"
#include "pm_string.h"

/*
 * Item slot in memory/save file.
 * If id or quantity is 0 but not both, the slot is invalid.
 * Item ID must be unsigned less than ITEMS_COUNT.
 * Quantity must be no more than 99 for a TM/HM, or 999 in general.
 */
typedef struct ItemSlot {
    u16 id;       // from constants/items.h
    u16 quantity; // quantity of that item
} ItemSlot;

/*
 * Bit array describing the effects of using the item on a
 * party member.
 */
typedef struct ItemPartyParam {
    u8 slp_heal : 1;
    u8 psn_heal : 1;
    u8 brn_heal : 1;
    u8 frz_heal : 1;
    u8 prz_heal : 1;
    u8 cfs_heal : 1;
    u8 inf_heal : 1;
    u8 guard_spec : 1;
    u8 revive : 1;
    u8 revive_all : 1;
    u8 level_up : 1;
    u8 evolve : 1;
    u8 atk_stages : 4;
    u8 def_stages : 4;
    u8 spatk_stages : 4;
    u8 spdef_stages : 4;
    u8 speed_stages : 4;
    u8 accuracy_stages : 4;
    u8 critrate_stages : 2;
    u8 pp_up : 1;
    u8 pp_max : 1;
    u8 pp_restore : 1;
    u8 pp_restore_all : 1;
    u8 hp_restore : 1;
    u8 hp_ev_up : 1;
    u8 atk_ev_up : 1;
    u8 def_ev_up : 1;
    u8 speed_ev_up : 1;
    u8 spatk_ev_up : 1;
    u8 spdef_ev_up : 1;
    u8 friendship_mod_lo : 1;
    u8 friendship_mod_med : 1;
    u8 friendship_mod_hi : 1;
    s8 hp_ev_up_param;
    s8 atk_ev_up_param;
    s8 def_ev_up_param;
    s8 speed_ev_up_param;
    s8 spatk_ev_up_param;
    s8 spdef_ev_up_param;
    u8 hp_restore_param;
    u8 pp_restore_param;
    s8 friendship_mod_lo_param;
    s8 friendship_mod_med_param;
    s8 friendship_mod_hi_param;
    u8 paddding[2];
} ItemPartyParam;

/*
 * Item parameter data, loaded from itemtool/itemdata/item_data.narc
 */
typedef struct ItemData {
    u16 price;
    u8 holdEffect;
    u8 holdEffectParam;
    u8 pluckEffect;
    u8 flingEffect;
    u8 flingPower;
    u8 naturalGiftPower;
    u16 naturalGiftType : 5;
    u16 prevent_toss : 1;
    u16 selectable : 1;
    u16 fieldPocket : 4;
    u16 battlePocket : 5;
    u8 fieldUseFunc;
    u8 battleUseFunc;
    u8 partyUse;
    u8 padding_0D;
    union {
        u8 dummy;
        ItemPartyParam partyUseParam;
    };
    u8 padding_22[2];
} ItemData;

/*
 * void MoveItemSlotInList(ItemSlot *slots, int from, int to, int pocket, HeapID heapId)
 *
 * Move item slot within an array, shifting the intermediate slots.
 * Performs the operation out-of-place using a temporary array from the heap.
 *
 * @param slots:       The array to work in
 * @param from:        Source slot index
 * @param to:          Destination slot index
 * @param pocket:      Pocket ID
 * @param heapId:     Heap ID to allocate the temporary array from
 */
void MoveItemSlotInList(ItemSlot *slots, int from, int to, int pocket, HeapID heapId);

/*
 * int GetItemIndexMapping(u16 itemId, int attrNo)
 *
 * Grabs the NARC member or AGB mapping for the given item.
 *
 * @param itemId:      Item ID to look up
 * @param attrNo:      Which attribute to fetch, uses the ITEMNARC_* constants
 *
 * @returns: If attrNo is ... then ...
 *     ITEMNARC_PARAM:   Index into itemtool/itemdata/item_data.narc
 *     ITEMNARC_NCGR:    Index into itemtool/itemdata/item_icon.narc specifying the graphics character data
 *     ITEMNARC_NCLR:    Index into itemtool/itemdata/item_icon.narc specifying the graphics palette data
 *     ITEMNARC_AGBCODE: The corresponding item ID from Ruby, Sapphire, Emerald, FireRed, and LeafGreen, used for migration.
 *
 * If itemId or attrNo is invalid, returns 0
 */
int GetItemIndexMapping(u16 itemId, int attrNo);

/*
 * u16 UpConvertItemId_Gen3to4(u16 agbcode)
 *
 * Maps the generation 3 item ID to the generation 4 equivalent.
 *
 * @param agbcode:     Gen 3 item ID
 *
 * @returns: Corresponding gen 4 item ID, or ITEM_NONE if conversion failed
 */
u16 UpConvertItemId_Gen3to4(u16 agbcode);

/*
 * int GetItemIconCell(void)
 *
 * Get the index for the cell data in itemtool/itemdata/item_icon.narc.
 *
 * @returns: The cell data index
 */
int GetItemIconCell(void);

/*
 * int GetItemIconAnim(void)
 *
 * Get the index for the animation data in itemtool/itemdata/item_icon.narc.
 *
 * @returns: The animation data index
 */
int GetItemIconAnim(void);

/*
 * void *LoadItemDataOrGfx(u16 itemId, int attrno, HeapID heapId)
 *
 * Loads the raw data corresponding to the given item. Allocates a new buffer.
 *
 * @param itemId:      Item ID to look up
 * @param attrno:      Type of object to load
 * @param heapId:     ID of heap to allocate the result from
 *
 * @returns: Pointer to loaded data. If attrNo is ... then ...
 *     ITEMNARC_PARAM:   ItemData* from itemtool/itemdata/item_data.narc
 *     ITEMNARC_NCGR:    NCGR from itemtool/itemdata/item_icon.narc
 *     ITEMNARC_NCLR:    NCLR from itemtool/itemdata/item_icon.narc
 *
 * If itemId or attrno is invalid, or if allocation failed, returns NULL
 */
void *LoadItemDataOrGfx(u16 itemId, int attrno, HeapID heapId);

/*
 * void GetItemNameIntoString(String *dest, u16 itemId, HeapID heapId)
 *
 * Reads the name of the indicated item into the preallocated string.
 *
 * @param dest:        Pointer to String containing the result
 * @param itemId:      The item whose name you want to get
 * @param heapId:     Heap in which to allocate the temporary MsgData
 */
void GetItemNameIntoString(String *dest, u16 itemId, HeapID heapId);

/*
 * void GetItemDescIntoString(String *dest, u16 itemId, HeapID heapId)
 *
 * Reads the description of the indicated item into the preallocated string.
 *
 * @param dest:        Pointer to String containing the result
 * @param itemId:      The item whose description you want to get
 * @param heapId:     Heap in which to allocate the temporary MsgData
 */
void GetItemDescIntoString(String *dest, u16 itemId, HeapID heapId);

/*
 * s32 GetItemAttr(u16 itemId, u16 attrno, HeapID heapId)
 *
 * Gets the specified item effect parameter from itemtool/itemdata/item_data.narc
 *
 * @param itemId:      The item you want to query
 * @param attrno:      The attribute you want to read
 * @param heapId:     Heap in which to allocate the temporary ItemData
 *
 * @returns: Integer attribute value
 */
s32 GetItemAttr(u16 itemId, u16 attrno, HeapID heapId);

/*
 * s32 GetItemAttr_PreloadedItemData(u16 itemId, u16 attrno, HeapID heapId)
 *
 * Gets the specified item effect parameter from itemtool/itemdata/item_data.narc
 *
 * @param itemData:    Pointer to the preloaded row from itemtool/itemdata/item_data.narc
 * @param attrno:      The attribute you want to read
 *
 * @returns: Integer attribute value
 */
s32 GetItemAttr_PreloadedItemData(ItemData *itemData, u16 attrno);

/*
 * u16 TMHMGetMove(u16 itemId)
 *
 * Convert the TM/HM item ID to the move it teaches
 *
 * @param itemId:      Item ID for the selected TM/HM
 *
 * @returns: Corresponding move ID
 */
u16 TMHMGetMove(u16 itemId);

/*
 * BOOL MoveIsHM(u16 moveId)
 *
 * Check whether the specified move is taught by an HM
 *
 * @param moveId:      ID of the move to check
 *
 * @returns: TRUE if it's an HM move, FALSE otherwise
 */
BOOL MoveIsHM(u16 moveId);

/*
 * u8 ItemToTMHMId
 *
 * Converts item to the number of the TM or HM. If it is an HM, the number will be between 92 and 99 inclusive.
 *
 * @param itemId:      ID of the item to convert
 *
 * @returns: Number of the TM or HM. If an HM, subtract 92 to get the true number.
 */
u8 ItemToTMHMId(u16 itemId);

/*
 * BOOL ItemIdIsMail(u16 itemId)
 *
 * Checks whether the indicated item is a mail item.
 *
 * @param itemId:      the item ID to check
 *
 * @returns: TRUE if it is a mail, FALSE otherwise
 */
BOOL ItemIdIsMail(u16 itemId);

/*
 * u8 ItemToMailId(u16 itemId)
 *
 * Converts item ID to mail ID
 *
 * @param itemId:      Item ID to convert
 *
 * @returns: Corresponding mail ID
 */
u8 ItemToMailId(u16 itemId);

/*
 * u16 MailToItemId(u8 mailId)
 *
 * Converts mail ID to item ID
 *
 * @param mailId:      Mail ID to convert
 *
 * @returns: Corresponding item ID
 */
u16 MailToItemId(u8 mailId);

/*
 * s32 ItemToBallId(u16 itemId)
 *
 * Converts item ID to ball ID
 *
 * @param itemId:      Item ID to convert
 *
 * @returns: Corresponding ball ID
 */
s32 ItemToBallId(u16 itemId);

/*
 * u16 BallToItemId(s32 ballId)
 *
 * Converts ball ID to item ID
 *
 * @param ballId:      Ball ID to convert
 *
 * @returns: Corresponding item ID
 */
u16 BallToItemId(s32 ballId);

/*
 * BOOL ItemIdIsBerry(u16 itemId)
 *
 * Checks whether the item ID is a berry item
 *
 * @param itemId:      Item ID to check
 *
 * @returns: TRUE if it is a berry item, else FALSE
 */
BOOL ItemIdIsBerry(u16 itemId);

/*
 * u16 BerryToItemId(u16 berryId)
 *
 * Converts berry ID to item ID
 *
 * @param berryId:      Berry ID to convert
 *
 * @returns: Corresponding item ID
 */
u16 BerryToItemId(u8 berryId);

/*
 * String *GetNutName(u16 berryId, HeapID heapId)
 *
 * Creates a new String containing the name of the berry
 *
 * @param berryId:     Berry to get the name of
 * @param heapId:     Heap to allocate the String from
 *
 * @returns: New string containing the name of the berry
 */
String *GetNutName(u16 berryId, HeapID heapId);

/*
 * ItemData *LoadAllItemData(HeapID heapId)
 *
 * Reads the entire FIMG of itemtool/itemdata/item_data.narc into a new buffer
 *
 * @param heapId:     Heap to allocate the array from
 *
 * @returns: Pointer to new array.
 */
ItemData *LoadAllItemData(HeapID heapId);

/*
 * ItemData *GetItemDataPtrFromArray(ItemData *itemData, u32 itemDataIdx)
 *
 * Gets the pointer to the selected member of the array returned by LoadAllItemData above. This function exists because scrub dev is scrub.
 *
 * @param itemData:    The full contents of itemtool/itemdata/item_data.narc, returned by LoadAllItemData
 * @param itemDataIdx: Index into itemData
 *
 * @returns: Pointer to &itemData[itemDataIdx]
 */
ItemData *GetItemDataPtrFromArray(ItemData *itemData, u32 itemDataIdx);

/*
 * BOOL ItemIdIsNotJohtoBall(u16 itemId)
 *
 * Check whether the item is a type of ball reintroduced in this game. Presumably for backwards compatibility with Diamond, Pearl, and Platinum.
 *
 * @param itemId:      Item ID to check
 *
 * @returns: TRUE if the item is not a Johto ball, FALSE otherwise
 */
BOOL ItemIdIsNotJohtoBall(u16 itemId);

#endif // POKEHEARTGOLD_ITEM_H
