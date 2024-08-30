#ifndef POKEHEARTGOLD_MOVE_H
#define POKEHEARTGOLD_MOVE_H

#include "global.h"

typedef struct MoveTbl {
    u16 effect;
    u8 category;
    u8 power;
    u8 type;
    u8 accuracy;
    u8 pp;
    u8 effectChance;
    u16 range;
    s8 priority;
    u8 unkB;
    struct {
        u8 unkC;
        u8 contestType;
        u16 unk_E;
    };
} MoveTbl;

typedef enum MoveAttr {
    MOVEATTR_EFFECT = 0,
    MOVEATTR_CLASS,
    MOVEATTR_POWER,
    MOVEATTR_TYPE,
    MOVEATTR_ACCURACY,
    MOVEATTR_PP,
    MOVEATTR_EFFECT_CHANCE,
    MOVEATTR_RANGE,
    MOVEATTR_PRIORTY,
    MOVEATTR_UNK9,
    MOVEATTR_UNK10,
    MOVEATTR_CONTEST_TYPE,
} MoveAttr;

u32 GetMoveAttr(u16 moveId, MoveAttr attrno);
u8 GetMoveMaxPP(u16 moveId, u8 ppUps);
void LoadMoveTbl(MoveTbl *dest);
u32 GetMoveTblAttr(MoveTbl *moveTbl, MoveAttr attr);
void LoadMoveEntry(u16 moveId, MoveTbl *moveTbl);

#endif // POKEHEARTGOLD_MOVE_H
