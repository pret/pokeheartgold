#include "move.h"

#include "global.h"

#include "constants/moves.h"

#include "filesystem.h"

void LoadMoveTbl(MoveTbl *dest) {
    ReadFromNarcMemberByIdPair(dest, NARC_poketool_waza_waza_tbl, 0, 0, (NUM_MOVES + 1) * sizeof(MoveTbl));
}

u32 GetMoveAttr(u16 moveId, MoveAttr attrno) {
    MoveTbl movedata;
    LoadMoveEntry(moveId, &movedata);
    return GetMoveTblAttr(&movedata, attrno);
}

u8 MoveTable_CalcMaxPP(u16 moveId, u8 ppUps) {
    u8 pp;
    if (ppUps > 3) {
        ppUps = 3;
    }
    pp = GetMoveAttr(moveId, MOVEATTR_PP);
    return pp + ((pp * 20 * ppUps) / 100);
}

u32 GetMoveTblAttr(MoveTbl *moveTbl, MoveAttr attr) {
    switch (attr) {
    case MOVEATTR_EFFECT:
        return moveTbl->effect;
    case MOVEATTR_CLASS:
        return moveTbl->category;
    case MOVEATTR_POWER:
        return moveTbl->power;
    case MOVEATTR_TYPE:
        return moveTbl->type;
    case MOVEATTR_ACCURACY:
        return moveTbl->accuracy;
    case MOVEATTR_PP:
        return moveTbl->pp;
    case MOVEATTR_EFFECT_CHANCE:
        return moveTbl->effectChance;
    case MOVEATTR_RANGE:
        return moveTbl->range;
    case MOVEATTR_PRIORTY:
        return moveTbl->priority;
    case MOVEATTR_UNK9:
        return moveTbl->unkB;
    case MOVEATTR_UNK10:
        return moveTbl->unkC;
    case MOVEATTR_CONTEST_TYPE:
        return moveTbl->contestType;
    default:
        return (u32)moveTbl;
    }
}

void LoadMoveEntry(u16 moveId, MoveTbl *moveTbl) {
    ReadWholeNarcMemberByIdPair(moveTbl, NARC_poketool_waza_waza_tbl, moveId);
}
