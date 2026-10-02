#ifndef POKEHEARTGOLD_STRUCT_DEFS_PHOTO_NARC_STRUCT
#define POKEHEARTGOLD_STRUCT_DEFS_PHOTO_NARC_STRUCT

#include <nitro/types.h>

// file: a/2/5/4
typedef struct PhotoData {
    u16 mapId;
    u16 iconId;
    u16 x;
    u16 y;
    u8 unk8;
    u8 unk9;
    u16 subjectObjId;
    u16 param[2];
} PhotoData;

#endif
