#ifndef POKEHEARTGOLD_CONSTANTS_BATTLE_H
#define POKEHEARTGOLD_CONSTANTS_BATTLE_H

enum BattleSide {
    B_SIDE_ALL,
    B_SIDE_1,
    B_SIDE_2,
    B_SIDE_PLAYER,
    B_SIDE_OPPONENT,
    B_SIDE_5,
    B_SIDE_6,
    B_SIDE_7,
    B_SIDE_8,
    B_SIDE_9,
    B_SIDE_10,
    B_SIDE_11,
    B_SIDE_12,
    B_SIDE_13,
    B_SIDE_14,
    B_SIDE_15,
    B_SIDE_16,
    B_SIDE_17,
    B_SIDE_18
};

//Battle Type
#define BATTLE_TYPE_TRAINER                 (1 << 0)
#define BATTLE_TYPE_1                       (1 << 1)
#define BATTLE_TYPE_2                       (1 << 2)
#define BATTLE_TYPE_3                       (1 << 3)
#define BATTLE_TYPE_4                       (1 << 4)

//Field Side Conditions
#define SIDE_CONDITION_REFLECT              (1 << 0)
#define SIDE_CONDITION_LIGHT_SCREEN         (1 << 1)
#define SIDE_CONDITION_2                    (1 << 2)
#define SIDE_CONDITION_3                    (1 << 3)
#define SIDE_CONDITION_4                    (1 << 4)
#define SIDE_CONDITION_5                    (1 << 5)
#define SIDE_CONDITION_MIST                 (1 << 6)

#endif