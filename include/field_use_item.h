#ifndef POKEHEARTGOLD_FIELD_USE_ITEM_H
#define POKEHEARTGOLD_FIELD_USE_ITEM_H

#include "task.h"

#define USE_ITEM_TASK_MENU              0
#define USE_ITEM_TASK_FIELD               1
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
};

struct UnkStruct_BagViewApplicationMaybe {
    int unk_0000;
    u8 filler_0004[0x22];
    u16 unk_0026;
    u8 filler_0028[0x32C];
    TaskFunc unk_0354;
    u8 filler_0358[0x28];
    struct AlphItemUseData *unk_0380;
};

typedef BOOL (*ItemMenuUseFunc)(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);
typedef BOOL (*ItemFieldUseFunc)(struct ItemUseTaskData *data);
typedef int (*ItemCheckUseFunc)(const struct ItemUseData *data);

#endif //POKEHEARTGOLD_FIELD_USE_ITEM_H
