#ifndef POKEHEARTGOLD_BAG_TYPES_DEF_H
#define POKEHEARTGOLD_BAG_TYPES_DEF_H

#include "constants/items.h"

#include "bag_cursor.h"
#include "field_types_def.h"
#include "item.h"
#include "menu_input_state.h"
#include "save.h"

/*
 * Return value of Bag_TryRegisterItem
 */
typedef enum RegisterItemResult {
    REG_ITEM_FAIL,
    REG_ITEM_SLOT1,
    REG_ITEM_SLOT2,
} RegisterItemResult;

// Enum for argument "code" to GetItemUseErrorMessage
typedef enum ItemUseError {
    ITEMUSEERROR_OKAY = 0,       // no error
    ITEMUSEERROR_NODISMOUNT = 1, // can't get off bike
    ITEMUSEERROR_NOFOLLOWER = 2, // have a companion
    ITEMUSEERROR_NOTNOW = 3,     // you're a member of team rocket

    ITEMUSEERROR_OAKSWORDS = -1u,
} ItemUseError;

/*
 * The player's inventory. All items in all pockets,
 * and the two items registered to the touchscreen
 * buttons. This is saved to flash.
 */
typedef struct Bag {
    ItemSlot items[NUM_BAG_ITEMS];              // General items
    ItemSlot keyItems[NUM_BAG_KEY_ITEMS];       // Key items
    ItemSlot TMsHMs[NUM_BAG_TMS_HMS];           // Move machines
    ItemSlot mail[NUM_BAG_MAIL];                // Mail items
    ItemSlot medicine[NUM_BAG_MEDICINE];        // Healing items
    ItemSlot berries[NUM_BAG_BERRIES];          // Berries
    ItemSlot balls[NUM_BAG_BALLS];              // Balls
    ItemSlot battleItems[NUM_BAG_BATTLE_ITEMS]; // Battle-only items
    u16 registeredItems[2];                     // IDs of registered key items
} Bag;

/*
 * Item slot access for bag view
 */
typedef struct BagViewPocket {
    ItemSlot *slots; // Points into Bag
    u8 padding[4];
    u8 pocketId; // POCKET_XXX constant
    u8 padding2[3];
} BagViewPocket;

typedef struct ItemCheckUseData {
    u32 mapId;
    int playerState;
    u16 haveFollower : 1;
    u16 haveRocketCostume : 1;
    u16 facingTile;
    u16 standingTile;
    PlayerAvatar *playerAvatar;
    FieldSystem *fieldSystem;
} ItemCheckUseData;

/*
 * Data relevant to drawing the bag on screen
 */
typedef struct BagView {
    SaveData *saveData;       // Persistent game state
    BagViewPocket pockets[8]; // Pocket information
    u8 unk64;
    u8 unk65;
    u16 itemId;
    u16 unk68;
    u8 padding[2];
    BagCursor *cursor; // State of last selection
    ItemCheckUseData *checkUseData;
    u8 unk74;
    u8 unk75;
    u16 unk76_0 : 1;
    u16 unk76_1 : 15;
    MenuInputStateMgr *menuInputStateMgr;
} BagView; // size: 0x7C

#endif // POKEHEARTGOLD_BAG_TYPES_DEF_H
