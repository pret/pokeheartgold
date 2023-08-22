#ifndef POKEHEARTGOLD_FIELD_USE_ITEM_H
#define POKEHEARTGOLD_FIELD_USE_ITEM_H

#include "task.h"
#include "party.h"
#include "bag.h"
#include "mail.h"
#include "bag_view.h"
#include "unk_0203BC10.h"

#define USE_ITEM_TASK_MENU               0
#define USE_ITEM_TASK_FIELD              1
#define USE_ITEM_TASK_CHECK              2

struct ItemCheckUseData {
    u32 mapId;
    int playerState;
    u16 haveFollower:1;
    u16 haveRocketCostume:1;
    u16 facingTile;
    u16 standingTile;
    PlayerAvatar *playerAvatar;
    FieldSystem *fieldSystem;
};

struct AlphItemUseData {
    int scriptNo;
    u16 var_8000;
    u16 var_8001;
    u16 var_8002;
    u16 var_8003;
};

typedef void *(*FieldApplicationWorkCtor)(FieldSystem *fieldSystem);

struct ItemFieldUseData {
    FieldSystem *fieldSystem;      // 00
    struct ItemCheckUseData dat;   // 04
    FieldApplicationWorkCtor ctor; // 1C
    void *work;                    // 20
    u16 itemId;                    // 24
    u8 state;                      // 26
    u8 no_app;                     // 27
};

struct ItemMenuUseData {
    TaskManager *taskManager;
    u16 itemId;
    u8 unk6;
};

typedef void (*ItemMenuUseFunc)(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2);
typedef BOOL (*ItemFieldUseFunc)(struct ItemFieldUseData *data);
typedef enum ItemUseError (*ItemCheckUseFunc)(const struct ItemCheckUseData *data);

struct UseItemInPartyTaskEnv {
    Party *party;
    Bag *bag;
    MAILBOX *mailbox;
    OPTIONS *options;
    struct UnkStruct_0202E474 *unk10;
    u32 unk14;
    void *unk18;
    FieldSystem *fieldSystem;
    void *unk20;
    u8 unk24;
    u8 unk25;
    u8 unk26;
    u16 itemId;
    u16 unk2A;
    u8 padding_2C[0x18];
};

struct RegisteredKeyItemUseMessagePrintTaskData {
    Window window;
    String *strbuf;
    u16 printerId;
    u16 state;
};

void *GetItemFieldUseFunc(int funcType, int itemType);
void ItemCheckUseData_Init(FieldSystem *fieldSystem, struct ItemCheckUseData *dat);
BOOL Leftover_CanPlantBerry(const struct ItemCheckUseData *data);
int UseRegisteredItemButtonInField(FieldSystem *fieldSystem, u8 slot);

#endif //POKEHEARTGOLD_FIELD_USE_ITEM_H
