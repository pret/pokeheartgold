#ifndef POKEHEARTGOLD_POKEMON_STORAGE_SYSTEM_H
#define POKEHEARTGOLD_POKEMON_STORAGE_SYSTEM_H

#include "pm_string.h"
#include "pokemon_types_def.h"
#include "constants/pokemon.h"
#include "constants/box_wallpaper.h"

typedef struct PokemonStorageSystem PC_STORAGE;

typedef struct PC_Box {
    BOXMON mons[MONS_PER_BOX];
    u8 unk_FF0[16];
} PC_BOX;

struct PokemonStorageSystem {
    /* 00000 */ PC_BOX boxes[NUM_BOXES];
    /* 12000 */ int curBox;
    /* 12004 */ u32 boxModifiedFlag;
    /* 12008 */ u16 box_names[NUM_BOXES][BOX_NAME_LENGTH];
    /* 122D8 */ u8 wallpapers[NUM_BOXES];
    /* 122EA */ u8 unlockedWallpapers;
    /* 122EB */ u8 filler_122EB[0x11];
};

#define BOX_ALL_MODIFIED_FLAG      ((u32)((1<<NUM_BOXES)-1))

void PCStorage_GetBoxName(PC_STORAGE *pcStorage, u32 boxno, STRING *dest);
BOOL PCStorage_PlaceMonInFirstEmptySlotInAnyBox(PC_STORAGE *storage, BOXMON *boxmon);
void PCStorage_init(PC_STORAGE *storage);
u32 PCStorage_sizeof(void);
void PCStorage_InitializeBoxes(PC_STORAGE *storage);
BOOL PCStorage_PlaceMonInBoxFirstEmptySlot(PC_STORAGE* storage, u32 boxno, BOXMON* boxmon);
BOOL PCStorage_PlaceMonInBoxByIndexPair(PC_STORAGE* storage, u32 boxno, u32 slotno, BOXMON* boxmon);
void PCStorage_SwapMonsInBoxByIndexPair(PC_STORAGE* storage, u32 boxno, u32 from, u32 to);
void PCStorage_DeleteBoxMonByIndexPair(PC_STORAGE* storage, u32 boxno, u32 slotno);
int PCStorage_GetActiveBox(PC_STORAGE *storage);
int PCStorage_FindFirstBoxWithEmptySlot(PC_STORAGE *storage);
BOOL PCStorage_FindFirstEmptySlot(PC_STORAGE* storage, int* boxno_p, int* slotno_p);
int PCStorage_CountEmptySpotsInAllBoxes(PC_STORAGE* storage);
int PCStorage_CountEmptySpotsInBox(PC_STORAGE* storage, u32 boxno);
void PCStorage_SetActiveBox(PC_STORAGE* storage, u32 boxno);
u8 PCStorage_GetBoxWallpaper(PC_STORAGE* storage, u32 boxno);
BOOL PCStorage_IsValidWallpaperId(u8 wallpaperno);
void PCStorage_SetBoxWallpaper(PC_STORAGE* storage, u32 boxno, u8 wallpaperno);
void PCStorage_SetBoxName(PC_STORAGE* storage, u32 boxno, const STRING* src);
int PCStorage_CountMonsAndEggsInBox(PC_STORAGE* storage, u32 boxno);
int PCStorage_CountMonsInBox(PC_STORAGE* storage, u32 boxno);
int PCStorage_CountMonsInAllBoxes(PC_STORAGE* storage);
u32 PCStorage_GetMonDataByIndexPair(PC_STORAGE* storage, u32 boxno, u32 slotno, int attr, void *ptr);
BOXMON* PCStorage_GetMonByIndexPair(PC_STORAGE* storage, u32 boxno, u32 slotno);
void PCStorage_UnlockBonusWallpaper(PC_STORAGE* storage, u32 wallpaper);
BOOL PCStorage_IsBonusWallpaperUnlocked(PC_STORAGE* storage, u32 wallpaper);
void PCStorage_SetBoxModified(PC_STORAGE* storage, u8 boxno);
void PCStorage_SetAllBoxesModified(PC_STORAGE* storage);
void PCStorage_ResetBoxModifiedFlags(PC_STORAGE* storage);
u32 PCStorage_GetBoxModifiedFlags(PC_STORAGE* storage);
u32 sub_02074120(void);
void sub_02074128(PC_STORAGE* storage);

#endif //POKEHEARTGOLD_POKEMON_STORAGE_SYSTEM_H
