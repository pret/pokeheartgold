#include "move.h"
#include "filesystem.h"
#include "constants/moves.h"

void LoadWazaEntry(u16 moveId, WAZA *dest);
u32 GetAttrFromWazaTbl(WAZA *movedata, MoveAttr attrno);

void LoadAllWazaTbl(WAZA *dest) {
    ReadFromNarcMemberByIdPair(dest, NARC_poketool_waza_waza_tbl, 0, 0, (NUM_MOVES + 1) * sizeof(WAZA));
}

u32 GetWazaAttr(u16 moveId, MoveAttr attrno) {
    WAZA movedata;
    LoadWazaEntry(moveId, &movedata);
    return GetAttrFromWazaTbl(&movedata, attrno);
}

u8 WazaGetMaxPp(u16 moveId, u8 ppUps) {
    u8 pp;
    if (ppUps > 3) {
        ppUps = 3;
    }
    pp = GetWazaAttr(moveId, MOVEATTR_PP);
    return pp + ((pp * 20 * ppUps) / 100);
}

u32 GetAttrFromWazaTbl(WAZA * wazaTbl, MoveAttr attr) {
    switch (attr) {
    case MOVEATTR_EFFECT:
        return wazaTbl->effect;
    case MOVEATTR_CLASS:
        return wazaTbl->class;
    case MOVEATTR_POWER:
        return wazaTbl->power;
    case MOVEATTR_TYPE:
        return wazaTbl->type;
    case MOVEATTR_ACCURACY:
        return wazaTbl->accuracy;
    case MOVEATTR_PP:
        return wazaTbl->pp;
    case MOVEATTR_EFFECT_CHANCE:
        return wazaTbl->effectChance;
    case MOVEATTR_UNK7:
        return wazaTbl->unk8;
    case MOVEATTR_PRIORTY:
        return wazaTbl->priority;
    case MOVEATTR_UNK9:
        return wazaTbl->unkB;
    case MOVEATTR_UNK10:
        return wazaTbl->unkC;
    case MOVEATTR_CONTEST_TYPE:
        return wazaTbl->contestType;
    default:
        return (u32)wazaTbl;
    }
}

void LoadWazaEntry(u16 moveId, WAZA * wazaTbl) {
    ReadWholeNarcMemberByIdPair(wazaTbl, NARC_poketool_waza_waza_tbl, moveId);
}
