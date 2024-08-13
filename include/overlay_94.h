#ifndef POKEHEARTGOLD_OVY_94_H
#define POKEHEARTGOLD_OVY_94_H

#include "party_menu.h"

#define PARTICLE_HEAP_SIZE        (0x4800)

typedef struct UnkStruct_Overlay_94_B {
    Party* party;
    u8 unk4[0x17];
    FieldSystem* fieldSystem;
    u8 unk2[0x7];
    u8 unk27;
} UnkStruct_Overlay_94_B;

void PartyMenu_InitIconFormChangeData(PartyMenuStruct* unkPtr);
BOOL PartyMenu_AnimateIconFormChange(PartyMenuStruct* unkPtr);

#endif //POKEHEARTGOLD_OVY_94_H

