#ifndef POKEHEARTGOLD_BATTLE_ARCADE_GAME_BOARD_H
#define POKEHEARTGOLD_BATTLE_ARCADE_GAME_BOARD_H

#include "msgdata.h"
#include "msgfmt.h"
#include "overlay_manager.h"
#include "party.h"
#include "player_data.h"
#include "save.h"
#include "save_frontier.h"
#include "window.h"
#include "unk_02009D48.h"

#define ARCADE_ENEMY_POKEMON_MAX    4
#define HEAP_ID_GAME_BOARD        110


typedef struct GAME_BOARD_ARGS {
    SAVEDATA *savedata;
    u8 type;
    u8 level;
    u8 unk6;
    u8 unk7;
    int *weather;
    u8 *cursorSpeed;
    u8 *unk10;
    u16 *unk14;
    u16 multiWinstreak;
    u16 unk1A;
    u16 winstreak;
    u16 unk1E;
    u8 opponentHeldItemFlag[ARCADE_ENEMY_POKEMON_MAX];
    u8 opponentLevelFlag[ARCADE_ENEMY_POKEMON_MAX];
    u8 opponentUnkFlag[ARCADE_ENEMY_POKEMON_MAX];
    u8 opponentMoveFlag[ARCADE_ENEMY_POKEMON_MAX];
    PARTY *playerParty;
    PARTY *opponentParty;
    u16 returnWork;
    void *work; 
    u16 unk;
    u8 randomFlag;
    u8 dummy1;
    u16 dummy2;
} GAME_BOARD_ARGS;

typedef struct GAME_BOARD_SUB_94 {
    void *unk0;
    u8 unk4;
    u8 unk5;
    u8 unk6;
    u8 unk7;
    u8 unk8;
    u8 unk9;
    u16 unkA_0:15;
    u16 unkA_15:1;
    void *unkC;
} GAME_BOARD_SUB_94; //size: 0x10

typedef struct GAME_BOARD_SUB_3B4 {
    void *unk0;
    void *unk4;
    u8 unk8;
    u8 unk9;
    u8 unkA;
    u8 unkB_0:4;
    u8 unkB_4:2;
    u8 unkB_6:2;
} GAME_BOARD_SUB_3B4; //size: 0xC

typedef struct GAME_BOARD_SUB_3C4 {
    void *unk0;
    u32 unk4;
} GAME_BOARD_SUB_3C4;

typedef struct GAME_BOARD_SUB_3E8 {
    void *spriteList;
    GF_G2dRenderer render;
    void *resourceMan[4];
    void *resourceObj[11][4];
} GAME_BOARD_SUB_3E8;

typedef struct GAME_BOARD_WORK {
    OVY_MANAGER *man;
    FRONTIER_SAVE *frontierSavedata;
    u8 substate;
    u8 type;
    u8 unkA;
    u8 wait;  
    u8 randomFlag;
    u8 cursorPos;
    u8 unkE;
    u8 unkF;
    u8 unk10;
    u8 unk11;
    u8 unk12;
    u8 unk13_0:1;
    u8 unk13_1:7;
    u8 unk14;
    u8 unk15;
    u16 cursorPosStart;
    int unk18;
    u8 *cursorSpeed;
    u8 *unk20;
    u16 *unk24;
    u16 winstreak;
    u16 unk2A;
    u8 boardHeight;
    u8 boardWidth;
    u8 boardArea;
    u8 unk2F_0:1;
    u8 unk2F_1:7;
    u8 unk30[4];
    u8 unk34[16];
    u8 unk44[32];
    u8 unk64;
    MSGDATA *msgData;
    MSGFMT *msgFmt;
    STRING *unk70;
    STRING *unk74;
    STRING *unk78[2];
    u16 unk80[8];
    BGCONFIG *bgConfig;
    GAME_BOARD_SUB_94 unk94[2];
    GAME_BOARD_SUB_3B4 unk3B4;
    void *unk3C0;
    GAME_BOARD_SUB_3C4 unk3C4[2];
    void *unk3D4;
    OPTIONS *options;
    SAVEDATA *savedata;
    void *arcadeSavedata;
    void *arcadeScoreSavedata;
    GAME_BOARD_SUB_3E8 unk3E8;
    void *cursor;
    void *panel[16];
    void *iconA[4];
    void *iconB[4];
    void *itemA[4];
    void *itemB[4];
    void *button;
    int *weather;
    u16 *returnWork;
    PARTY *playerParty;
    PARTY *opponentParty;
    NARC *narc;
    u16 sendBuffer[40];
    u8 multiCursorPos;
    u8 multiSelectPos;
    u16 multiWinstreak;
    u16 dummy1;
    u32 dummy;
} GAME_BOARD_WORK;

#endif
