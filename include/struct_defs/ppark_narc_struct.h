#ifndef POKEHEARTGOLD_STRUCT_DEFS_PPARK_NARC_STRUCTS
#define POKEHEARTGOLD_STRUCT_DEFS_PPARK_NARC_STRUCTS

#include <nitro/types.h>

enum PalParkEncounterType {
    PP_ENCTYPE_NONE,

    PP_ENCTYPE_LAND_MIN,
    PP_ENCTYPE_FOREST = PP_ENCTYPE_LAND_MIN,
    PP_ENCTYPE_MOUNTAIN,
    PP_ENCTYPE_FIELD,
    PP_ENCTYPE_4, // unused

    PP_ENCTYPE_WATER_MIN,
    PP_ENCTYPE_5 = PP_ENCTYPE_WATER_MIN, // unused
    PP_ENCTYPE_POND,
    PP_ENCTYPE_7, // unused
    PP_ENCTYPE_SEA,
};

// Data structure in files/arc/ppark.narc
// Fields 4 and 5 appear to be unused
// gainax3/retsam_00jupc: type1 and type2,
// however they do not correspond to
// include/constants/pokemon.h defines.
struct PalParkMonsData {
    u8 landSector;
    u8 waterSector;
    u8 score;
    u8 encounterRate;
    u8 unk4;
    u8 unk5;
};

#endif
