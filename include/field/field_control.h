#ifndef POKEHEARTGOLD_FIELD_CONTROL_H
#define POKEHEARTGOLD_FIELD_CONTROL_H

#include "field_system.h"
#include "unk_02031B0C.h"

typedef struct Soundplate {
    u8 soundplateSoundID;
    u8 volumeIndex;
    u8 unk2;
    u8 unk3;
    u8 x;
    u8 z;
    u8 xBounds;
    u8 zBounds;
} Soundplate;

typedef struct SoundplateStruct {
    u8 unk0[2];
    u16 unk2;
    Soundplate soundplates[];
} SoundplateStruct;

void FieldInput_Update(FieldInput *fieldInput, FieldSystem *fieldSystem, u16 newKeys, u16 heldKeys);
int FieldInput_Process(FieldInput *fieldInput, FieldSystem *fieldSystem);
BOOL FieldInput_Process_Colosseum(FieldInput *fieldInput, FieldSystem *fieldSystem);
BOOL FieldInput_Process_UnionRoom(FieldInput *fieldInput, FieldSystem *fieldSystem);
BOOL FieldInput_Process_BattleTower(FieldInput *fieldInput, FieldSystem *fieldSystem);
void ov01_021E7F00(FieldSystem *fieldSystem, BOOL arg1);
u32 ov01_021E7F54(FieldSystem *fieldSystem);

#endif // POKEHEARTGOLD_FIELD_CONTROL_H
