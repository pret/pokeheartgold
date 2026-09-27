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

// Enum for the context in which the bag menu is displayed
typedef enum BagViewContext {
    BAG_VIEW_CONTEXT_NORMAL,
    BAG_VIEW_CONTEXT_GIVE_ITEM,
    BAG_VIEW_CONTEXT_MART_SELL,
    BAG_VIEW_CONTEXT_GARDENING,
    BAG_VIEW_CONTEXT_POFFIN_SINGLEPLAYER,
    BAG_VIEW_CONTEXT_POFFIN_MULTIPLAYER,
    BAG_VIEW_CONTEXT_BERRY_POTS,
} BagViewContext;

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
    u16 position;
    s16 scroll;
    u8 pocketId; // POCKET_XXX constant
    u8 count;
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
    u8 curPocket;
    u8 context;
    u16 itemId;
    u16 returnCode;
    u8 padding[2];
    BagCursor *cursor; // State of last selection
    ItemCheckUseData *checkUseData;
    u8 partySlot;
    u8 soldAmount;
    u16 onBike : 1;
    u16 mapLoadType : 15;
    MenuInputStateMgr *menuInputStateMgr;
} BagView; // size: 0x7C

#endif // POKEHEARTGOLD_BAG_TYPES_DEF_H
