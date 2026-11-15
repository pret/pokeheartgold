#ifndef POKEHEARTGOLD_UNK_02074E5C_H
#define POKEHEARTGOLD_UNK_02074E5C_H

#include "battle/battle.h"

typedef struct LinkBattleCommState {
    BattleSetup *battleSetup;
    BgConfig *bgConfig;
    Window *window;
    PaletteData *paletteData;
    void *palPad[4];
    u8 sendBuffer[0x1000];
    u8 recvCount;
    u8 handshakeStep;
    u16 syncTimer;
    void *waitDial;
} LinkBattleCommState;

void sub_02074F9C(BattleSystem *battleSystem, int recipient, int battler, void *message, u32 size);
void sub_02074E5C(BattleSystem *battleSystem);
void sub_02074EC4(LinkBattleCommState *linkBattleCommState);
u32 sub_02075074(LinkBattleCommState *linkBattleCommState, u32 a1);
BOOL sub_020750E0(LinkBattleCommState *linkBattleCommState);
BOOL sub_02075108(LinkBattleCommState *linkBattleCommState);
BOOL sub_0207514C(LinkBattleCommState *linkBattleCommState);
BOOL sub_02075178(LinkBattleCommState *linkBattleCommState);
BOOL sub_020751B8(LinkBattleCommState *linkBattleCommState);
BOOL sub_020751DC(LinkBattleCommState *linkBattleCommState);
BOOL sub_02075220(LinkBattleCommState *linkBattleCommState);
BOOL sub_02075248(LinkBattleCommState *linkBattleCommState);
BOOL sub_0207527C(LinkBattleCommState *linkBattleCommState);
BOOL sub_020752D8(LinkBattleCommState *linkBattleCommState);
BOOL sub_0207531C(LinkBattleCommState *linkBattleCommState, u32 a1);
BOOL sub_02075350(LinkBattleCommState *linkBattleCommState, u32 a1, u32 a2);
BOOL sub_020753A8(LinkBattleCommState *linkBattleCommState, u32 a1);
BOOL sub_020753D4(LinkBattleCommState *linkBattleCommState, u32 a1, u32 a2);

#endif
