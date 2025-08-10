#ifndef POKEHEARTGOLD_UNK_02092BE8_H
#define POKEHEARTGOLD_UNK_02092BE8_H

#include "field_system.h"
#include "field_types_def.h"
#include "gear_phone.h"
#include "save.h"
#include "save_local_field_data.h"
#include "save_vars_flags.h"
#include "script.h"
#include "sys_task_api.h"

typedef struct PokegearArgs {
    u8 incomingPhoneCall;    // 0x00
    u8 unk01;                // One of the variables inside FieldSystem with offset 0x110 (currently unk_10C[1];)
    u16 mapMusicID;          // 0x02 (surf-overriden)
    u8 callerId;             // 0x04
    u8 unk05;                // 0x05
    u8 callScriptID;         // 0x06
    u8 playerGender;         // 0x07
    int x;                   // 0x08
    int y;                   // 0x0c
    u16 mapID;               // 0x10
    u16 mapHeader;           // 0x12
    BOOL unk_14;             // 0x14
    int mapCursorX;          // 0x18
    int mapCursorY;          // 0x1C
    u16 unk_20;              // 0x20
    u8 matrixXCoord;         // 0x22
    u8 matrixYCoord;         // 0x23
    SaveData *saveData;      // 0x24
    void *menuInputStatePtr; // 0x28
} PokegearArgs;

typedef struct UnkPokegearstruct_14 {
    s16 y;
    s16 x;
    u8 unk04[5];
    u8 padding_09[3];
} Unk_PokegearSTRUCT_14;

void sub_02092D80(FieldSystem *sys, PokegearArgs *ptr);
void sub_02092D8C(FieldSystem *sys, PokegearArgs *ptr);
GearPhoneRingManager *GearPhoneRingManager_New(HeapID heapId, FieldSystem *sys);
void GearPhoneRingManager_Delete(GearPhoneRingManager *ptr);
GearPhoneRingManager *FieldSystem_GetGearPhoneRingManager(FieldSystem *sys);
void GearPhoneRingManager_StartRinging(GearPhoneRingManager *ptr);
BOOL GearPhoneRingManager_IsRinging(GearPhoneRingManager *ptr);
PhoneBookEntry *GearPhoneRingManager_GetCallerPhoneBookEntry(GearPhoneRingManager *ptr);
void sub_02092E14(GearPhoneRingManager *ptr, u8 a1, BOOL a2);
void sub_02092E34(GearPhoneRingManager *ptr, s32 a1, BOOL a2);
void GearPhoneRingManager_HandleTimeAdvance(GearPhoneRingManager *ptr, s64 seconds);
void GearPhoneRingManager_ResetIfActive(GearPhoneRingManager *ptr);
void GearPhone_ToggleRinging(GearPhoneRingManager *ptr, BOOL a1);
BOOL sub_02093070(FieldSystem *sys);
BOOL sub_020930C4(FieldSystem *sys);
BOOL sub_02093134(FieldSystem *sys, Pokemon *mon);
BOOL sub_0209316C(FieldSystem *sys);

#endif // POKEHEARTGOLD_UNK_02092BE8_H
