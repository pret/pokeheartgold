#ifndef POKEHEARTGOLD_OVY_99_H
#define POKEHEARTGOLD_OVY_99_H

#include "overlay_manager.h"
#include "player_data.h"
#include "pokedex.h"
#include "save_pokeathlon.h"

typedef struct PokeathlonMedalsArgs {
    Pokedex *pokedex;
    void *unk4;
    BOOL natDexEnabled;
    BOOL unkC;
} PokeathlonMedalsArgs;

typedef struct PokeathlonEventRecordArgs {
    void *unk0;
    void *unk4;
    void *unk8;
    PlayerProfile *profile;
    BOOL unk10;
} PokeathlonEventRecordArgs;

typedef struct PokeathlonCourseRecordArgs {
    POKEATHLON_SAV *pokeathlon;
    BOOL unk4;
} PokeathlonCourseRecordArgs;

typedef struct UnkStruct_0203EFA0 {
    POKEATHLON_SAV *pokeathlon;
    PlayerProfile *profile;
} UnkStruct_0203EFA0;

BOOL PokeathlonMedals_Init(OverlayManager *man, int *state);
BOOL PokeathlonMedals_Main(OverlayManager *man, int *state);
BOOL PokeathlonMedals_Exit(OverlayManager *man, int *state);

BOOL PokeathlonEventRecord_Init(OverlayManager *man, int *state);
BOOL PokeathlonEventRecord_Main(OverlayManager *man, int *state);
BOOL PokeathlonEventRecord_Exit(OverlayManager *man, int *state);

BOOL PokeathlonCourseRecord_Init(OverlayManager *man, int *state);
BOOL PokeathlonCourseRecord_Main(OverlayManager *man, int *state);
BOOL PokeathlonCourseRecord_Exit(OverlayManager *man, int *state);

BOOL ov99_021E677C(OverlayManager *man, int *state);
BOOL ov99_021E6888(OverlayManager *man, int *state);
BOOL ov99_021E6840(OverlayManager *man, int *state);

#endif // POKEHEARTGOLD_OVY_99_H
