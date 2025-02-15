#ifndef POKEHEARTGOLD_FIELD_MOVE_H
#define POKEHEARTGOLD_FIELD_MOVE_H

#include "global.h"

#include "field_system.h"
#include "task.h"

typedef struct FieldMoveUseData {
    TaskManager *taskManager;
    u16 partySlot;
    u16 fieldMoveIdx;
} FieldMoveUseData;

typedef struct FieldMoveCheckData {
    u32 mapId;
    FieldSystem *fieldSystem;
    LocalMapObject *facingObject;
    u16 flag;
} FieldMoveCheckData;

typedef void (*FieldMoveUseFunc)(struct FieldMoveUseData *useData, const struct FieldMoveCheckData *checkData);
typedef u32 (*FieldMoveCheckFunc)(const struct FieldMoveCheckData *checkData);

typedef enum FieldMoveFuncType {
    FIELD_MOVE_FUNC_USE,
    FIELD_MOVE_FUNC_CHECK
} FieldMoveFuncType;

#define FIELD_MOVE_CHECK_TREE_F      0
#define FIELD_MOVE_CHECK_UNK1_F      1
#define FIELD_MOVE_CHECK_WATER_F     2
#define FIELD_MOVE_CHECK_ROCK_F      3
#define FIELD_MOVE_CHECK_BREAKROCK_F 4
#define FIELD_MOVE_CHECK_WATERFALL_F 5
#define FIELD_MOVE_CHECK_ROCKCLIMB_F 6
#define FIELD_MOVE_CHECK_FLASH_F     7
#define FIELD_MOVE_CHECK_UNK8_F      8
#define FIELD_MOVE_CHECK_UNK9_F      9
#define FIELD_MOVE_CHECK_UNK10_F     10
#define FIELD_MOVE_CHECK_UNK11_F     11
#define FIELD_MOVE_CHECK_WHIRLPOOL_F 12
#define FIELD_MOVE_CHECK_HEADBUTT_F  13

typedef enum FieldMoveCheckFlags {
    FIELD_MOVE_CHECK_TREE = (1 << FIELD_MOVE_CHECK_TREE_F),
    FIELD_MOVE_CHECK_UNK1 = (1 << FIELD_MOVE_CHECK_UNK1_F),
    FIELD_MOVE_CHECK_WATER = (1 << FIELD_MOVE_CHECK_WATER_F),
    FIELD_MOVE_CHECK_ROCK = (1 << FIELD_MOVE_CHECK_ROCK_F),
    FIELD_MOVE_CHECK_BREAKROCK = (1 << FIELD_MOVE_CHECK_BREAKROCK_F),
    FIELD_MOVE_CHECK_WATERFALL = (1 << FIELD_MOVE_CHECK_WATERFALL_F),
    FIELD_MOVE_CHECK_ROCKCLIMB = (1 << FIELD_MOVE_CHECK_ROCKCLIMB_F),
    FIELD_MOVE_CHECK_FLASH = (1 << FIELD_MOVE_CHECK_FLASH_F),
    FIELD_MOVE_CHECK_UNK8 = (1 << FIELD_MOVE_CHECK_UNK8_F),
    FIELD_MOVE_CHECK_UNK9 = (1 << FIELD_MOVE_CHECK_UNK9_F),
    FIELD_MOVE_CHECK_UNK10 = (1 << FIELD_MOVE_CHECK_UNK10_F),
    FIELD_MOVE_CHECK_UNK11 = (1 << FIELD_MOVE_CHECK_UNK11_F),
    FIELD_MOVE_CHECK_WHIRLPOOL = (1 << FIELD_MOVE_CHECK_WHIRLPOOL_F),
    FIELD_MOVE_CHECK_HEADBUTT = (1 << FIELD_MOVE_CHECK_HEADBUTT_F)
} FieldMoveCheckFlags;

typedef struct FieldMoveFuncData {
    FieldMoveUseFunc use;
    FieldMoveCheckFunc check;
} FieldMoveFuncData;

typedef struct FieldUseMoveEnvironment {
    u32 magic;
    LocalMapObject *facingObject;
    FieldMoveUseData useData;
} FieldUseMoveEnvironment;

void *FieldMove_GetMoveFunc(FieldMoveFuncType funcType, u16 fieldMoveIndex);
void FieldMove_InitCheckData(FieldSystem *fieldSystem, FieldMoveCheckData *checkData);

#endif // POKEHEARTGOLD_FIELD_MOVE_H
