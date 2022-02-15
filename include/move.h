#ifndef POKEHEARTGOLD_MOVE_H
#define POKEHEARTGOLD_MOVE_H

typedef struct WazaTbl {
    u16 effect;
    u8 class;
    u8 power;
    u8 type;
    u8 accuracy;
    u8 pp;
    u8 effectChance;
    u16 unk8;
    s8 priority;
    u8 unkB;
    u8 unkC;
    u8 contestType;
    u8 padding[2];
} WAZA;

typedef enum MoveAttr {
    MOVEATTR_EFFECT = 0,
    MOVEATTR_CLASS,
    MOVEATTR_POWER,
    MOVEATTR_TYPE,
    MOVEATTR_ACCURACY,
    MOVEATTR_PP,
    MOVEATTR_EFFECT_CHANCE,
    MOVEATTR_UNK7,
    MOVEATTR_PRIORTY,
    MOVEATTR_UNK9,
    MOVEATTR_UNK10,
    MOVEATTR_CONTEST_TYPE,
} MoveAttr;

u32 GetWazaAttr(u16 moveId, MoveAttr attrno);
u8 WazaGetMaxPp(u16 moveId, u8 ppUps);
void LoadAllWazaTbl(WAZA *dest);
u32 GetAttrFromWazaTbl(WAZA * wazaTbl, MoveAttr attr);
void LoadWazaEntry(u16 moveId, WAZA * wazaTbl);

#endif //POKEHEARTGOLD_MOVE_H
