#ifndef POKEHEARTGOLD_OVY_94_H
#define POKEHEARTGOLD_OVY_94_H

#include "msgdata.h"
#include "pokemon_types_def.h"
#include "script.h"
#include "unk_02014DA0.h"

#define PARTICLE_HEAP_SIZE        (0x4800)

typedef struct UnkStruct_Overlay_94_B {
    Party* party;
    u8 unk4[0x17];
    FieldSystem* fieldSystem;
    u8 unk2[0x7];
    u8 unk27;
} UnkStruct_Overlay_94_B;

typedef struct IconFormChangeData  {
    int state;
    int effectTimer;
    int duration;
    int species;
    int fileId;
    int partyMonIndex; //same information as B's unkc65
    ParticleSystem* particleSystem;
} IconFormChangeData;

typedef struct PartyMenuStruct {
    BOOL unk0;
    u8 unk4[0x650];
    UnkStruct_Overlay_94_B* unk654; //0x654
    u8 unk658[0x167];
    MsgData* msgData; //0x7c0
    MessageFormat* unk7c4;
    String* unk7c8;
    u8 unk7cc[0x498];
    u8 unkc64;
    u8 partyMonIndex; //selected index..?
    u8 unkc66[0x1a];
    IconFormChangeData* iconFormChange;
} PartyMenuStruct;

void PartyMenu_InitIconFormChangeData(PartyMenuStruct* unkPtr);
BOOL PartyMenu_AnimateIconFormChange(PartyMenuStruct* unkPtr);

#endif //POKEHEARTGOLD_OVY_94_H

