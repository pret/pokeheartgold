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

#endif //POKEHEARTGOLD_POKEMON_STORAGE_SYSTEM_H
