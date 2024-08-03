#ifndef POKEHEARTGOLD_POKEMON_STORAGE_SYSTEM_H
#define POKEHEARTGOLD_POKEMON_STORAGE_SYSTEM_H

#include "constants/box_wallpaper.h"
#include "constants/pokemon.h"

#include "pm_string.h"
#include "pokemon_types_def.h"

typedef struct PokemonStorageSystem PCStorage;

typedef struct PC_Box {
    BoxPokemon mons[MONS_PER_BOX];
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

#define BOX_ALL_MODIFIED_FLAG ((u32)((1 << NUM_BOXES) - 1))

void PCStorage_GetBoxName(PCStorage *pcStorage, u32 boxno, String *dest);
BOOL PCStorage_PlaceMonInFirstEmptySlotInAnyBox(PCStorage *storage, BoxPokemon *boxMon);
void PCStorage_Init(PCStorage *storage);
u32 PCStorage_sizeof(void);
void PCStorage_InitializeBoxes(PCStorage *storage);
BOOL PCStorage_PlaceMonInBoxFirstEmptySlot(PCStorage *storage, u32 boxno, BoxPokemon *boxMon);
BOOL PCStorage_PlaceMonInBoxByIndexPair(PCStorage *storage, u32 boxno, u32 slotno, BoxPokemon *boxMon);
void PCStorage_SwapMonsInBoxByIndexPair(PCStorage *storage, u32 boxno, u32 from, u32 to);
void PCStorage_DeleteBoxMonByIndexPair(PCStorage *storage, u32 boxno, u32 slotno);
int PCStorage_GetActiveBox(PCStorage *storage);
int PCStorage_FindFirstBoxWithEmptySlot(PCStorage *storage);
BOOL PCStorage_FindFirstEmptySlot(PCStorage *storage, int *boxno_p, int *slotno_p);
int PCStorage_CountEmptySpotsInAllBoxes(PCStorage *storage);
int PCStorage_CountEmptySpotsInBox(PCStorage *storage, u32 boxno);
void PCStorage_SetActiveBox(PCStorage *storage, u32 boxno);
u8 PCStorage_GetBoxWallpaper(PCStorage *storage, u32 boxno);
BOOL PCStorage_IsValidWallpaperId(u8 wallpaperno);
void PCStorage_SetBoxWallpaper(PCStorage *storage, u32 boxno, u8 wallpaperno);
void PCStorage_SetBoxName(PCStorage *storage, u32 boxno, const String *src);
int PCStorage_CountMonsAndEggsInBox(PCStorage *storage, u32 boxno);
int PCStorage_CountMonsInBox(PCStorage *storage, u32 boxno);
int PCStorage_CountMonsInAllBoxes(PCStorage *storage);
u32 PCStorage_GetMonDataByIndexPair(PCStorage *storage, u32 boxno, u32 slotno, int attr, void *ptr);
BoxPokemon *PCStorage_GetMonByIndexPair(PCStorage *storage, u32 boxno, u32 slotno);
void PCStorage_UnlockBonusWallpaper(PCStorage *storage, u32 wallpaper);
BOOL PCStorage_IsBonusWallpaperUnlocked(PCStorage *storage, u32 wallpaper);
void PCStorage_SetBoxModified(PCStorage *storage, u8 boxno);
void PCStorage_SetAllBoxesModified(PCStorage *storage);
void PCStorage_ResetBoxModifiedFlags(PCStorage *storage);
u32 PCStorage_GetBoxModifiedFlags(PCStorage *storage);
u32 sub_02074120(void);
void sub_02074128(PCStorage *storage);

#endif // POKEHEARTGOLD_POKEMON_STORAGE_SYSTEM_H
