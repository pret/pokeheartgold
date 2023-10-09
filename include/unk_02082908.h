#ifndef POKEHEARTGOLD_UNK_02082908_H
#define POKEHEARTGOLD_UNK_02082908_H

#include "overlay_manager.h"
#include "pm_string.h"

extern const OVY_MGR_TEMPLATE _02102610;

typedef struct Unk0203F5C0 {
    int unk0;
    u8 unk4[0x4];
    int unk8;
    u8 unkC[0x4];
    int unk10;
    int unk14;
    String *unk18;
    u16 unk1C[PLAYER_NAME_LENGTH + 1];
} Unk0203F5C0;

void sub_0208311C(Unk0203F5C0 *a0);
Unk0203F5C0 *sub_020830D8(HeapID heapId, int kind, int param, int maxLen, Options *options, int *a5);

#endif //POKEHEARTGOLD_UNK_02082908_H
