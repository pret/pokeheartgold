#ifndef POKEHEARTGOLD_OVY_94_H
#define POKEHEARTGOLD_OVY_94_H

#include "msgdata.h"
#include "pokemon_types_def.h"
#include "script.h"

typedef struct UnkStruct_Overlay_94_B
{
    PARTY* party;
    u8 unk4[0x16];
    FieldSystem* fsys;
    u8 unk2[0x7];
    u8 unk27;
};

typedef struct UnkStruct_Overlay_94_C  {
	u32 unk0;
	s32 unk4;
	s32 unk8;
	u32 species;
	u32 unk10; 
    u32 partyMonIndex; //same information as B's unkc65
	u32* unk18; 
	u8 unk1c;
	u32** unk20;
	u32 unk24;
	u32 unk28;
	u32 unk2c;
};

typedef struct UnkStruct_Overlay_94_A {
    BOOL unk0;
    u8 unk4[0x650];
    struct UnkStruct_Overlay_94_B* unk654; //0x654
    u8 unk658[0x167];
    MSGDATA* msgData; //0x7c0
    MSGFMT* unk7c4; 
    STRING* unk7c8;
    u8 unk655[0x498];
    u8 unkc64;
    u8 partyMonIndex; //selected index..?
    u8 unkc66[0x1a];
    struct UnkStruct_Overlay_94_C* unkc80;
};

void ov94_021E5900(struct UnkStruct_Overlay_94_A* unkPtr);
BOOL ov94_021E593C(struct UnkStruct_Overlay_94_A* unkPtr);
void ov94_021E5AEC(struct UnkStruct_Overlay_94_A* unkPtr);
void ov94_021E5B04(struct UnkStruct_Overlay_94_A* unkPtr);
void ov94_021E5B30(struct UnkStruct_Overlay_94_A* unkPtr);
void ov94_021E5B54(struct UnkStruct_Overlay_94_C* unkPtr);
void ov94_021E5BA0(struct UnkStruct_Overlay_94_C* unkPtr);
void ov94_021E5C28(struct UnkStruct_Overlay_94_C* unkPtr);
s32 ov94_021E5C60(void);
void ov94_021E5C84(struct UnkStruct_Overlay_94_C* unkPtr);
u32 ov94_021E5CA0(u32 unkA, u32 unkB);
u32 ov94_021E5CC4(u32 unkA, u32 unkB);
#endif //POKEHEARTGOLD_OVY_94_H