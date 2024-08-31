#ifndef POKEHEARTGOLD_UNK_02082908_H
#define POKEHEARTGOLD_UNK_02082908_H

#include "options.h"
#include "overlay_manager.h"
#include "pm_string.h"

extern const OVY_MGR_TEMPLATE sOverlayTemplate_NamingScreen;

typedef struct NamingScreenArgs {
    int unk0;
    int unk4;
    int form;
    u8 unkC[0x4];
    int gender;
    int unk14;
    String *unk18;
    u16 unk1C[PLAYER_NAME_LENGTH + 1];
} NamingScreenArgs;

void sub_0208311C(NamingScreenArgs *a0);
NamingScreenArgs *NamingScreen_CreateArgs(HeapID heapId, int kind, int param, int maxLen, Options *options, int *a5);

#endif // POKEHEARTGOLD_UNK_02082908_H
