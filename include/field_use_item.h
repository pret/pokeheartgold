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

struct ItemUseData {
    u32 mapId;
    int unk04;
    u16 haveFollower:1;
    u16 flag969set:1;
    u16 facingTile;
    u16 standingTile;
    FIELD_PLAYER_AVATAR *playerAvatar;
    FieldSystem *fsys;
};

struct AlphItemUseData {
    int scriptNo;
    u16 unk4;
    u16 unk6;
    u16 unk8;
    u16 unkA;
};

struct ItemUseTaskData {
    FieldSystem *fsys;        // 00
    struct ItemUseData dat;   // 04
    u8 padding_1C[0x8];       // 1C
    u16 itemId;               // 24
};

struct ItemUseTaskData2 {
    TaskManager *taskManager;
    u16 itemId;
    u8 unk6;
};

typedef void (*ItemMenuUseFunc)(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);
typedef BOOL (*ItemFieldUseFunc)(struct ItemUseTaskData *data);
typedef u32 (*ItemCheckUseFunc)(const struct ItemUseData *data);

struct UseItemInPartyTaskEnv {
    PARTY *party;
    BAG_DATA *bag;
    MAILBOX *mailbox;
    OPTIONS *options;
    struct UnkStruct_0202E474 *unk10;
    u32 unk14;
    void *unk18;
    FieldSystem *unk1C;
    void *unk20;
    u8 unk24;
    u8 unk25;
    u8 unk26;
    u16 unk28;
    u16 unk2A;
    u8 padding_2C[0x18];
};

#endif //POKEHEARTGOLD_FIELD_USE_ITEM_H
