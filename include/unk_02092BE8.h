#ifndef POKEHEARTGOLD_UNK_02092BE8_H
#define POKEHEARTGOLD_UNK_02092BE8_H
#include "save.h"
#include "save_flypoints.h"
#include "event_data.h"
#include "script.h"
#include "gear_phone.h"

typedef struct UnkPokegearstruct_2c{
    u8 unkBool00; 
    u8 unkFsysVar01; //One of the variables inside FieldSystem with offset 0x110 (currently unk_10C[1];)
    u16 mapMusicID; //0x02 (surf-overriden)
    u8 unkVar04; //related to unk_var2 from UnkFsysSub_114
    u8 unkVar05; 
    u8 unkVar06; 
    u8 playerGender; //0x07
    int x; //0x08
    int y; //0x0c
    u16 mapID; //0x10
    u16 mapHeader; //0x12
    u8 filler_14[0xe];
    u8 matrixXCoord; //0x22
    u8 matrixYCoord; //0x23
    SAVEDATA* data; //0x24
    int unkPtr28; //Pointer to a Field System variable at offset 0x10C (currently unk_10C[0];)
} Unk_PokegearSTRUCT_2C;

typedef struct UnkPokegearstruct_14{
    s16 y;
    s16 x;
    u8 unkVar0c;
    u8 unkVar0d;
    u8 unkVar0e;
    u8 unkVar0f;
    u8 unkVar10;
    u8 unkArr11[3];
} Unk_PokegearSTRUCT_14;

void sub_02092BE8(FieldSystem* sys, Unk_PokegearSTRUCT_2C* ptr, BOOL Unkbool);
void sub_02092D80(FieldSystem* sys, Unk_PokegearSTRUCT_2C* ptr);
void sub_02092D8C(FieldSystem* sys, Unk_PokegearSTRUCT_2C* ptr);
UnkFsysSub_114* sub_02092D98(HeapID id, FieldSystem* sys);
void sub_02092DD8(UnkFsysSub_114 * ptr);
UnkFsysSub_114* sub_02092DEC(FieldSystem* sys);
void sub_02092DF4(UnkFsysSub_114* ptr);
u8 sub_02092E08(UnkFsysSub_114* ptr);
PhoneBookEntry* sub_02092E10(UnkFsysSub_114* ptr);
void sub_02092E14(UnkFsysSub_114* ptr, u8 Unkflag, BOOL Unkbool);
void sub_02092E34(UnkFsysSub_114* ptr, s32 Unkarg1,  BOOL uselessArg);
void sub_02092E54(UnkFsysSub_114* ptr);
void sub_02092F30(UnkFsysSub_114* ptr, s64 seconds);
void sub_02092F64(UnkFsysSub_114* ptr);
void sub_02092FA0(UnkFsysSub_114* ptr);
void sub_02092FA8(UnkFsysSub_114* ptr);
void sub_02092FB8(u32 uselessArg, UnkFsysSub_114* ptr);
void sub_02093010(UnkFsysSub_114* ptr, BOOL Unkarg0);
BOOL sub_02093070(FieldSystem* sys);
BOOL sub_020930C4(FieldSystem* sys);
BOOL sub_02093134(FieldSystem* sys, POKEMON *);
BOOL sub_0209316C(FieldSystem* sys);

#endif //POKEHEARTGOLD_UNK_02092BE8_H
