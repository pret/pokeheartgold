#ifndef POKEHEARTGOLD_CONSTANTS_GLOBAL_FIELDMAP_H
#define POKEHEARTGOLD_CONSTANTS_GLOBAL_FIELDMAP_H

// Facing direction
#define DIR_NORTH 0
#define DIR_SOUTH 1
#define DIR_WEST  2
#define DIR_EAST  3
#define DIR_MAX   4

// BG event type
#define BG_TYPE_NORMAL      0
#define BG_TYPE_SIGNPOST    1
#define BG_TYPE_HIDDEN_ITEM 2

// BG event direction
#define BG_DIR_SOUTH      0
#define BG_DIR_EAST       1
#define BG_DIR_WEST       2
#define BG_DIR_NORTH      3
#define BG_DIR_ALL        4
#define BG_DIR_EASTWEST   5
#define BG_DIR_NORTHSOUTH 6

// Player avatar state
#define PLAYER_STATE_WALKING        0
#define PLAYER_STATE_CYCLING        1
#define PLAYER_STATE_SURFING        2
#define PLAYER_STATE_ROCKET         3
#define PLAYER_STATE_UNK_SP         4
#define PLAYER_STATE_UNK_WATER      5
#define PLAYER_STATE_POKEATHLON     6
#define PLAYER_STATE_FISHING        7
#define PLAYER_STATE_UNK_POKE       8
#define PLAYER_STATE_SAVING         9
#define PLAYER_STATE_HEAL           10
#define PLAYER_STATE_LADDER         11
#define PLAYER_STATE_ROCKET_HEAL    12
#define PLAYER_STATE_APRICORN_SHAKE 13
#define PLAYER_STATE_ROCKET_SAVING  14

// Player transition bits
#define PLAYER_TRANSITION_WALKING     1 << 0
#define PLAYER_TRANSITION_CYCLING     1 << 1
#define PLAYER_TRANSITION_SURFING     1 << 2
#define PLAYER_TRANSITION_x0008       1 << 3
#define PLAYER_TRANSITION_x0010       1 << 4
#define PLAYER_TRANSITION_x0020       1 << 5
#define PLAYER_TRANSITION_x0040       1 << 6
#define PLAYER_TRANSITION_x0080       1 << 7
#define PLAYER_TRANSITION_HEAL        1 << 8
#define PLAYER_TRANSITION_x0200       1 << 9
#define PLAYER_TRANSITION_ROCKET      1 << 10
#define PLAYER_TRANSITION_ROCKET_HEAL 1 << 11
#define PLAYER_TRANSITION_POKEATHLON  1 << 12
#define PLAYER_TRANSITION_x2000       1 << 13
#define PLAYER_TRANSITION_x4000       1 << 14

#endif // POKEHEARTGOLD_CONSTANTS_GLOBAL_FIELDMAP_H
