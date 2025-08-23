#ifndef POKEHEARTGOLD_SAVE_PALPAD_H
#define POKEHEARTGOLD_SAVE_PALPAD_H

#include "save.h"

#define NUM_PALPAD_ENTRIES    16
#define NUM_FRIENDS_PER_ENTRY 16

typedef struct SavePalPad {
    u16 name[PLAYER_NAME_LENGTH + 1];
    u32 otid;
    u8 filler_14[0x4];
    u32 unk_18[NUM_FRIENDS_PER_ENTRY];
    u8 unk_58[NUM_FRIENDS_PER_ENTRY];
    u8 unk_68[NUM_FRIENDS_PER_ENTRY];
    u8 filler_78[NUM_FRIENDS_PER_ENTRY];
} SavePalPad;

u32 Save_PalPad_sizeof(void);
SavePalPad *Save_PalPad_Get(SaveData *saveData);
void Save_PalPad_Init(SavePalPad *palPad);
SavePalPad *PalPad_GetNthEntry(SavePalPad *arr, int n);
u8 PalPadEntry_GetFromUnk68Array(SavePalPad *palPad, int n);
void SavePalPad_Merge(SavePalPad *a, SavePalPad *b, int n, HeapID heapId);
int PalPad_PlayerIdIsFriendOrMutual(SavePalPad *palPad, u32 otId);

#endif // POKEHEARTGOLD_SAVE_PALPAD_H
