#ifndef POKEHEARTGOLD_PARTY_MENU_H
#define POKEHEARTGOLD_PARTY_MENU_H

#include "constants/party_menu.h"

#define FIELD_MOVE_CHECK_TREE_F                   0
#define FIELD_MOVE_CHECK_UNKx02_F                 1
#define FIELD_MOVE_CHECK_WATER_F                  2
#define FIELD_MOVE_CHECK_ROCK_F                   3
#define FIELD_MOVE_CHECK_BREAKROCK_F              4
#define FIELD_MOVE_CHECK_WATERFALL_F              5
#define FIELD_MOVE_CHECK_ROCKCLIMB_F              6
#define FIELD_MOVE_CHECK_FLASH_F                  7
#define FIELD_MOVE_CHECK_UNKx100_F                8
#define FIELD_MOVE_CHECK_UNKx200_F                9
#define FIELD_MOVE_CHECK_UNKx400_F               10
#define FIELD_MOVE_CHECK_UNKx800_F               11
#define FIELD_MOVE_CHECK_UNKx1000_F              12
#define FIELD_MOVE_CHECK_UNKx2000_F              13
#define FIELD_MOVE_CHECK_UNKx4000_F              14
#define FIELD_MOVE_CHECK_UNKx8000_F              15

struct FieldMoveUseData {
    TaskManager *taskManager;
    u16 unk4;
    u16 fieldMoveIdx;
};

struct FieldMoveCheckData {
    u32 mapId;
    FieldSystem *fsys;
    LocalMapObject *facingObject;
    u16 flag;
};

#define FIELD_MOVE_FUNC_USE      0
#define FIELD_MOVE_FUNC_CHECK    1

typedef void (*FieldMoveUseFunc)(struct FieldMoveUseData *useData, const struct FieldMoveCheckData *sub);
typedef u32 (*FieldMoveCheckFunc)(const struct FieldMoveCheckData *checkData);

struct FieldUseMoveEnv {
    u32 magic;
    LocalMapObject *facingObject;
    struct FieldMoveUseData useData;
};

#endif //POKEHEARTGOLD_PARTY_MENU_H
