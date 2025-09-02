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
    u8 isScriptedLaunch;     // 0x00
    u8 menuInputState;       // 0x01
    u16 mapMusicID;          // 0x02 (surf-overriden)
    u8 callerId;             // 0x04
    u8 isScriptedCall;       // 0x05
    u8 callScriptID;         // 0x06
    u8 playerGender;         // 0x07
    int x;                   // 0x08
    int z;                   // 0x0c
    u16 mapID;               // 0x10
    u16 mapHeader;           // 0x12
    BOOL setFlyDestination;  // 0x14
    int mapCursorX;          // 0x18
    int mapCursorY;          // 0x1C
    u16 selectedFlyDest;     // 0x20
    u8 matrixXCoord;         // 0x22
    u8 matrixYCoord;         // 0x23
    SaveData *saveData;      // 0x24
    void *menuInputStatePtr; // 0x28
} PokegearArgs;

typedef struct UnkPokegearstruct_14 {
    u8 unk_0;
    u8 unk_1;
    u8 unk_2;
    u8 isScriptedCall;
    u8 callScriptID;
} Unk_PokegearSTRUCT_14;

void FieldSystem_InitPokegearArgs_Phone(FieldSystem *sys, PokegearArgs *ptr);
void FieldSystem_InitPokegearArgs_Map(FieldSystem *sys, PokegearArgs *ptr);
GearPhoneRingManager *GearPhoneRingManager_New(enum HeapID heapID, FieldSystem *sys);
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
