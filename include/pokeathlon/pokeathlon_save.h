#ifndef POKEHEARTGOLD_POKEATHLON_SAVE_H
#define POKEHEARTGOLD_POKEATHLON_SAVE_H

#include "save.h"

typedef struct Pokeathlon_UnkSubStruct_B00 {
    u32 unk0;
    u32 unk4;
    u32 unk8;
    u32 unkC;
    u32 unk10;
    u32 unk14;
    u32 unk18;
    u32 unk1C;
    u32 unk20;
    u32 unk24;
    u32 unk28;
    u32 unk2C;
    u32 unk30;
    u8 unk34[0x10];
    u32 unk44[10];
    u32 unk6C;
    u32 unk70;
} Pokeathlon_UnkSubStruct_B00; // size: 0x74

typedef struct Pokeathlon_CourseEntry {
    u16 unk_0;
    u8 unk_2[6];
} Pokeathlon_CourseEntry; // size: 0x8

typedef struct Pokeathlon_RecordsSolo {
    Pokeathlon_CourseEntry entries[5];
    u8 unk_28[0x4];
} Pokeathlon_RecordsSolo; // size: 0x2C

typedef struct Pokeathlon_RecordsLink {
    Pokeathlon_CourseEntry entries[5];
    u8 unk_28[0x7C];
} Pokeathlon_RecordsLink; // size: 0xA4

typedef struct PokeathlonSave {
    u8 unk_0[0xDC];
    u8 unk_DC[0x1F0]; // sub-struct pointed to by PokeathlonSave_GetUnkDC; byte[slot-1] holds per-pokemon course bits
    Pokeathlon_RecordsSolo recordsSolo[10]; // 0x2CC
    Pokeathlon_RecordsLink recordsLink[10]; // 0x484
    u8 unk_AEC[0x14]; // pointed to by PokeathlonSave_GetUnkAEC
    Pokeathlon_UnkSubStruct_B00 unk_B00; // pointed to by PokeathlonSave_GetUnkB00 / PokeathlonSave_GetAgainUnkB00
    int athletePoints; // 0xB74 - capped at 99999
    u32 unk_B78;       // bitfield, bits 0-26 (PokeathlonSave_GetUnkB78_AtIndex / PokeathlonSave_SetUnkB78_AtIndex)
    u16 unk_B7C;       // bitfield (PokeathlonSave_GetUnkB7C_AtIndex / PokeathlonSave_SetUnkB7C_AtIndex / PokeathlonSave_ResetUnkB7C)
    u16 unk_B7E;
} PokeathlonSave; // size: 0xB80

typedef struct PokeathlonFriendshipRoomStatueData {
    u16 species;
    u8 gender;
    u8 form;
} PokeathlonFriendshipRoomStatueData;

typedef struct PokeathlonSave_FriendshipRecords {
    PokeathlonFriendshipRoomStatueData friendshipRoomStatues[3];
    u8 unk[0x1C];
} PokeathlonSave_FriendshipRecords;

u32 PokeathlonSave_sizeof();
void PokeathlonSave_Init(PokeathlonSave *dest);
PokeathlonSave *Save_Pokeathlon_Get(SaveData *saveData);
PokeathlonSave *PokeathlonSave_dummy1(PokeathlonSave *pokeathlon);
void *PokeathlonSave_GetUnkDC(PokeathlonSave *pokeathlonSave);
Pokeathlon_RecordsSolo *PokeathlonSave_GetRecordsSolo(PokeathlonSave *pokeathlonSave);
Pokeathlon_RecordsLink *PokeathlonSave_GetRecordsLink(PokeathlonSave *pokeathlonSave);
void *PokeathlonSave_GetUnkAEC(PokeathlonSave *pokeathlonSave);
Pokeathlon_UnkSubStruct_B00 *PokeathlonSave_GetUnkB00(PokeathlonSave *pokeathlonSave);
PokeathlonSave *PokeathlonSave_dummy2(PokeathlonSave *pokeathlon);
BOOL PokeathlonSave_GetUnkDC_AtIndex(PokeathlonSave *pokeathlonSave, int shift, int index);
Pokeathlon_RecordsSolo *PokeathlonSave_GetRecordsSolo2(PokeathlonSave *pokeathlonSave);
Pokeathlon_RecordsLink *PokeathlonSave_GetRecordsLink2(PokeathlonSave *pokeathlonSave);
Pokeathlon_UnkSubStruct_B00 *PokeathlonSave_GetAgainUnkB00(PokeathlonSave *pokeathlonSave);
void PokeathlonSave_SetUnkDC_AtIndex(PokeathlonSave *pokeathlonSave, int shift, int index);
void PokeathlonSave_AddAthletePoints(PokeathlonSave *pokeathlonSave, u16 amount);
void PokeathlonSave_SubAthletePoints(PokeathlonSave *pokeathlonSave, u16 amount);
u32 PokeathlonSave_GetAthletePoints(PokeathlonSave *pokeathlonSave);
BOOL PokeathlonSave_GetUnkB78_AtIndex(PokeathlonSave *pokeathlon, int idx);
void PokeathlonSave_SetUnkB78_AtIndex(PokeathlonSave *pokeathlon, int idx);
BOOL PokeathlonSave_GetUnkB7C_AtIndex(PokeathlonSave *pokeathlon, int idx);
void PokeathlonSave_SetUnkB7C_AtIndex(PokeathlonSave *pokeathlon, int idx);
void PokeathlonSave_ResetUnkB7C(PokeathlonSave *pokeathlon);

u32 PokeathlonSave_FriendshipRecords_sizeof();
void PokeathlonSave_FriendshipRecords_Init(PokeathlonSave_FriendshipRecords *dest);
PokeathlonSave_FriendshipRecords *Save_Pokeathlon_FriendshipRecords_Get(SaveData *saveData);

#endif // POKEHEARTGOLD_POKEATHLON_SAVE_H
