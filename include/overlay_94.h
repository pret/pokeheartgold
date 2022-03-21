#ifndef POKEHEARTGOLD_OVY_94_H
#define POKEHEARTGOLD_OVY_94_H

#include "msgdata.h"
#include "pokemon_types_def.h"
#include "script.h"
#include "unk_02014DA0.h"

#define HEAPID_PARTY_MENU         ((HeapID)12)
#define PARTICLE_HEAP_SIZE        (0x4800)

typedef struct UnkStruct_Overlay_94_B {
    PARTY* party;
    u8 unk4[0x17];
    FieldSystem* fsys;
    u8 unk2[0x7];
    u8 unk27;
} UnkStruct_Overlay_94_B;

typedef struct IconFormeChangeWork  {
    int state;
    int effectTimer;
    int duration;
    int species;
    int fileId;
    int partyMonIndex; //same information as B's unkc65
    ParticleSystem* particleSystem;
} IconFormeChangeWork;

typedef struct PartyMenuStruct {
    BOOL unk0;
    u8 unk4[0x650];
    UnkStruct_Overlay_94_B* unk654; //0x654
    u8 unk658[0x167];
    MSGDATA* msgData; //0x7c0
    MSGFMT* unk7c4; 
    STRING* unk7c8;
    u8 unk7cc[0x498];
    u8 unkc64;
    u8 partyMonIndex; //selected index..?
    u8 unkc66[0x1a];
    IconFormeChangeWork* iconFormeChange;
} PartyMenuStruct;

void PartyMenu_InitIconFormeChangeWork(PartyMenuStruct* unkPtr);
BOOL PartyMenu_AnimateIconFormeChange(PartyMenuStruct* unkPtr);

#endif //POKEHEARTGOLD_OVY_94_H

