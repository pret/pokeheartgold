#ifndef POKEHEARTGOLD_CONSTANTS_GLOBAL_FIELDMAP_H
#define POKEHEARTGOLD_CONSTANTS_GLOBAL_FIELDMAP_H

// Facing direction
#define DIR_NORTH        0
#define DIR_SOUTH        1
#define DIR_WEST         2
#define DIR_EAST         3

// BG event type
#define BG_TYPE_NORMAL       0
#define BG_TYPE_SIGNPOST     1
#define BG_TYPE_HIDDEN_ITEM  2

// BG event direction
#define BG_DIR_SOUTH         0
#define BG_DIR_EAST          1
#define BG_DIR_WEST          2
#define BG_DIR_NORTH         3
#define BG_DIR_ALL           4
#define BG_DIR_EASTWEST      5
#define BG_DIR_NORTHSOUTH    6

// Player avatar state
#define PLAYER_STATE_WALKING 0
#define PLAYER_STATE_CYCLING 1
#define PLAYER_STATE_SURFING 2
#define PLAYER_STATE_ROCKET  3

// Player transition bits
#define PLAYER_TRANSITION_WALKING               1
#define PLAYER_TRANSITION_CYCLING               2
#define PLAYER_TRANSITION_SURFING               4
#define PLAYER_TRANSITION_x0008                 8
#define PLAYER_TRANSITION_x0010                16
#define PLAYER_TRANSITION_x0020                32
#define PLAYER_TRANSITION_x0040                64
#define PLAYER_TRANSITION_x0080               128
#define PLAYER_TRANSITION_HEAL                256
#define PLAYER_TRANSITION_x0200               512
#define PLAYER_TRANSITION_ROCKET             1024
#define PLAYER_TRANSITION_ROCKET_HEAL        2048
#define PLAYER_TRANSITION_POKEATHLON         4096
#define PLAYER_TRANSITION_x2000              8192
#define PLAYER_TRANSITION_x4000             16384

#endif //POKEHEARTGOLD_CONSTANTS_GLOBAL_FIELDMAP_H
