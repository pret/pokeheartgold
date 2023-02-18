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

enum Terrain {
    TERRAIN_PLAIN,
    TERRAIN_SAND,
    TERRAIN_GRASS,
    TERRAIN_PUDDLE,
    TERRAIN_ROCKS,
    TERRAIN_CAVE,
    TERRAIN_SNOW,
    TERRAIN_WATER,
    TERRAIN_ICE,
    TERRAIN_BUILDING,
    TERRAIN_MARSH,
    TERRAIN_BRIDGE,
    TERRAIN_LINK,
    TERRAIN_MAX
};

//Battle Type
#define BATTLE_TYPE_TRAINER                 (1 << 0)
#define BATTLE_TYPE_DOUBLES                 (1 << 1)
#define BATTLE_TYPE_2                       (1 << 2)
#define BATTLE_TYPE_MULTI                   (1 << 3)
#define BATTLE_TYPE_INGAME_PARTNER          (1 << 4)
#define BATTLE_TYPE_5                       (1 << 5)
#define BATTLE_TYPE_6                       (1 << 6)
#define BATTLE_TYPE_7                       (1 << 7)
#define BATTLE_TYPE_9                       (1 << 9)
#define BATTLE_TYPE_DEMO                    (1 << 10)

//Move Effects
#define MOVE_EFFECT_0                       (1 << 0)
#define MOVE_EFFECT_1                       (1 << 1)
#define MOVE_EFFECT_LEECH_SEED              (1 << 2)
#define MOVE_EFFECT_3                       (1 << 3)
#define MOVE_EFFECT_4                       (1 << 4)
#define MOVE_EFFECT_PERISH_SONG             (1 << 5)
#define MOVE_EFFECT_YAWN                    (1 << 12)
#define MOVE_EFFECT_IMPRISON_USER           (1 << 13)
#define MOVE_EFFECT_14                      (1 << 14)
#define MOVE_EFFECT_IMPRISON                (1 << 30)

//Field Side Conditions
#define SIDE_CONDITION_REFLECT              (1 << 0)
#define SIDE_CONDITION_LIGHT_SCREEN         (1 << 1)
#define SIDE_CONDITION_SPIKES               (1 << 2)
#define SIDE_CONDITION_SAFEGUARD            (1 << 3)
#define SIDE_CONDITION_FUTURE_SIGHT         (1 << 4)
#define SIDE_CONDITION_5                    (1 << 5)
#define SIDE_CONDITION_MIST                 (1 << 6)
#define SIDE_CONDITION_STEALTH_ROCKS        (1 << 7)
#define SIDE_CONDITION_8                    (1 << 8)
#define SIDE_CONDITION_9                    (1 << 9)
#define SIDE_CONDITION_TOXIC_SPIKES         (1 << 10)

//Status 2
#define STATUS2_12                          (1 << 12)
#define STATUS2_13                          (1 << 13)
#define STATUS2_14                          (1 << 14)
#define STATUS2_15                          (1 << 15)
#define STATUS2_ATTRACT_BATTLER1            (1 << 16)
#define STATUS2_ATTRACT_BATTLER2            (1 << 17)
#define STATUS2_ATTRACT_BATTLER3            (1 << 18)
#define STATUS2_ATTRACT_BATTLER4            (1 << 19)
#define STATUS2_FOCUS_ENERGY                (1 << 20)
#define STATUS2_TRANSFORMED                 (1 << 21)
#define STATUS2_24                          (1 << 24)
#define STATUS2_27                          (1 << 27)
#define STATUS2_DEFENCE_CURL                (1 << 30)

#define STATUS2_BINDING_ALL                 (STATUS2_13 | STATUS2_14 | STATUS2_15)
#define STATUS2_ATTRACT_ALL                 (STATUS2_ATTRACT_BATTLER1 | STATUS2_ATTRACT_BATTLER2 | STATUS2_ATTRACT_BATTLER3 | STATUS2_ATTRACT_BATTLER4)

#endif