#ifndef POKEHEARTGOLD_UNK_02092BE8_H
#define POKEHEARTGOLD_UNK_02092BE8_H
#include "save.h"
#include "save_flypoints.h"
#include "event_data.h"
#include "script.h"
#include "gear_phone.h"

/*
    all Unkstruct_2c offsets:
    //0x00 (u8???) some bool var
    //0x01 One of the variables inside FieldSystem with offset 0x110 (currently u8 filler_10C[1];)
    //0x02 (u16?) Map music ID (surf-overriden)
    //0x04 (u8?????) UnkFsysSub_114*
    //0x05 (u8???) related to int x????
    //0x06 (u8???) also related to int y?????
    //0x07 u8 player gender
    //0x08 int x
    //0x0c int y
    //0x10 (u32???) map_number???
    //0x12 u16 map_header
    //0x22 bitfield for map matrix x (r1 = (((r1 >> 4) >> 27) + r1) >> 5;) (needs more research)
    //0x23 bitfield for map matrix y (r1 = (((r1 >> 4) >> 27) + r1) >> 5;) (needs more research)
    //0x24 SAVEDATA*
    //0x28 pointer to a Field System variable at offset 0x10C (currently u8 filler_10C[0];)
*/
typedef struct Unkstruct_2c{
    u8 Unk_Bool00; //0x00
    u8 Unk_FsysVar01; //0x01
    u16 Map_MusicID; //0x02
    u8 UnkFsysSub_114ptr; //0x04
    u8 Unk_Var05; //0x05
    u8 Unk_Var06; //0x06
    u8 Player_Gender; //0x07
    int x; //0x08
    int y; //0x0c
    u16 mapID; //0x10
    u16 mapHeader; //0x12
    u8 filler_01[0x08];//0x14
    u8 Unk_Bitfield22; //0x22
    u8 Unk_Bitfield23; //0x23
    SAVEDATA* data; //0x24
    int Unk_ptr28; //0x28
}UnkSTRUCT_2C;

/*
    (local struct)
    all Unkstruct_14 offsets as they appear in the function below:
    //SP + 0x00 BOOL var
    //SP + 0x04 Location * PosPtr
    //SP + 0x08 u16 *x
    //SP + 0x0a u16 *y
    //SP + 0x0c Unk_Var0c
    //SP + 0x0d Unk_Var0d
    //SP + 0x0e Unk_Var0e
    //SP + 0x0f Unk_Var0f
    //SP + 0x10 Unk_Var10
    //SP + 0x11 Unk_Arr11
*/
typedef struct Unkstruct_14{
    BOOL Unkvar0;
    Location *PosPtr;
    u16 *x;
    u16 *y;
    u8 Unk_Var0c;
    u8 Unk_Var0d;
    u8 Unk_Var0e;
    u8 Unk_Var0f;
    u8 Unk_Var10;
    u8 Unk_Arr11[3];
}UnkSTRUCT_14;

void sub_02092BE8(FieldSystem* sys, UnkSTRUCT_2C* ptr, BOOL arg3);
void sub_02092D80(FieldSystem* sys, UnkSTRUCT_2C* ptr);
void sub_02092D8C(FieldSystem* sys, UnkSTRUCT_2C* ptr);
struct UnkFsysSub_114* sub_02092DEC(FieldSystem* sys);
u8 sub_02092E08(struct UnkFsysSub_114* ptr);
void sub_02092E14(struct UnkFsysSub_114* ptr, u32 Unkarg1, u32 Unkarg2);
void sub_02092E34(struct UnkFsysSub_114* ptr, u32 Unkarg1, u32 Unkarg2);
void sub_02092E54(struct UnkFsysSub_114* ptr);
void sub_02092F30(struct UnkFsysSub_114* ptr, s64 seconds);
void sub_02092F64(struct UnkFsysSub_114* ptr);
void sub_02092FA0(struct UnkFsysSub_114* ptr);
void sub_02092FA8(struct UnkFsysSub_114* ptr);
void sub_02092FB8(u32 uselessArg, struct UnkFsysSub_114* ptr);
void sub_02093010(struct UnkFsysSub_114* ptr, BOOL Unkarg0);
BOOL sub_02093070(FieldSystem* sys);
BOOL sub_020930C4(FieldSystem* sys);
BOOL sub_02093134(FieldSystem* sys, POKEMON *);
BOOL sub_0209316C(FieldSystem* sys);

#endif //POKEHEARTGOLD_UNK_02092BE8_H
