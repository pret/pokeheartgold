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

void PartyMenu_InitIconFormChangeData(PartyMenu* partyMenu);
BOOL PartyMenu_AnimateIconFormChange(PartyMenu* partyMenu);

#endif //POKEHEARTGOLD_OVY_94_H

