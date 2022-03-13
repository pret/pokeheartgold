#ifndef POKEHEARTGOLD_OVY_94_H
#define POKEHEARTGOLD_OVY_94_H

#include "msgdata.h"
#include "pokemon_types_def.h"
#include "script.h"

typedef struct UnkStruct_B
{
    PARTY* party;
    u8 unk4[0x16];
    FieldSystem* fsys;
    u8 unk2[0x7];
    u8 unk27;
};


typedef struct UnkStruct_PartyMenu {
    BOOL unk0;
    u8 unk4[0x650];
    struct UnkStruct_B* unk654; //0x654
    u8 unk658[0x167];
    MSGDATA* msgData; //0x7c0
    MSGFMT* unk7c4; 
    STRING* unk7c8;
    u8 unk655[0x498];
    u8 unkc64;
    u8 unkc65; //selected index..?
    u8 unkc66[0x1a];
    s32* unkc80;
};

void ov94_021E5900(struct UnkStruct_PartyMenu* unkPtr);
BOOL ov94_021E593C(struct UnkStruct_PartyMenu* unkPtr);
void ov94_021E5AEC(struct UnkStruct_PartyMenu* unkPtr);
void ov94_021E5B04(struct UnkStruct_PartyMenu* unkPtr);
void ov94_021E5B30(struct UnkStruct_PartyMenu* unkPtr);

#endif //POKEHEARTGOLD_OVY_94_H