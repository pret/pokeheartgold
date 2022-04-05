#ifndef POKEHEARTGOLD_UNK_02092BE8_H
#define POKEHEARTGOLD_UNK_02092BE8_H

#include "save.h"
#include "save_flypoints.h"
#include "event_data.h"
#include "script.h"
#include "gear_phone.h"
#include "unk_0200E320.h"

typedef struct UnkPokegearstruct_2c{
    u8 unk00;
    u8 unk01; //One of the variables inside FieldSystem with offset 0x110 (currently unk_10C[1];)
    u16 mapMusicID; //0x02 (surf-overriden)
    u8 unk04; //related to unk_var2 from UnkFsysSub_114
    u8 unk05;
    u8 unk06;
    u8 playerGender; //0x07
    int x; //0x08
    int y; //0x0c
    u16 mapID; //0x10
    u16 mapHeader; //0x12
    u8 filler_14[0xe];
    u8 matrixXCoord; //0x22
    u8 matrixYCoord; //0x23
    SAVEDATA* saveData; //0x24
    void *unk28; //Pointer to a Field System variable at offset 0x10C (currently unk_10C[0];)
} Unk_PokegearSTRUCT_2C;

typedef struct UnkPokegearstruct_14{
    s16 y;
    s16 x;
    u8 unk04;
    u8 unk05;
    u8 unk06;
    u8 unk07;
    u8 unk08;
    u8 padding_09[3];
} Unk_PokegearSTRUCT_14;

void sub_02092D80(FieldSystem* sys, Unk_PokegearSTRUCT_2C* ptr);
void sub_02092D8C(FieldSystem* sys, Unk_PokegearSTRUCT_2C* ptr);
GearPhoneRingManager* GearPhoneRingManager_new(HeapID heapId, FieldSystem* sys);
void sub_02092DD8(GearPhoneRingManager * ptr);
GearPhoneRingManager* Fsys_GetGearPhoneRingManager(FieldSystem* sys);
void sub_02092DF4(GearPhoneRingManager* ptr);
BOOL sub_02092E08(GearPhoneRingManager* ptr);
PhoneBookEntry* sub_02092E10(GearPhoneRingManager* ptr);
void sub_02092E14(GearPhoneRingManager* ptr, u8 a1, BOOL a2);
void sub_02092E34(GearPhoneRingManager* ptr, s32 a1, BOOL a2);
void sub_02092F30(GearPhoneRingManager* ptr, s64 seconds);
void sub_02092FA8(GearPhoneRingManager* ptr);
void GearPhone_ToggleRinging(GearPhoneRingManager* ptr, BOOL a1);
BOOL sub_02093070(FieldSystem* sys);
BOOL sub_020930C4(FieldSystem* sys);
BOOL sub_02093134(FieldSystem* sys, POKEMON * pkmn);
BOOL sub_0209316C(FieldSystem* sys);

#endif //POKEHEARTGOLD_UNK_02092BE8_H
