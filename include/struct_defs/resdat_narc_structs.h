#ifndef POKEHEARTGOLD_STRUCT_DEFS_RESDAT_NARC_ENTRY
#define POKEHEARTGOLD_STRUCT_DEFS_RESDAT_NARC_ENTRY

#include <nitro/types.h>

// These structs need to be defined seperately to compile the resdat narc
// without needing to include the entirity of the sdk headers.
// Do not attempt to move them.

struct ResdatNarcEntry {
    u32 charId;
    u32 plttId;
    u32 cellId;
    u32 animId;
    u32 mcelId;
    u32 manmId;
    u32 xferFlag;
    u32 priority;
};

typedef enum GF_GraphicsResourceType {
    GF_GFX_RES_TYPE_CHAR = 0,
    GF_GFX_RES_TYPE_PLTT = 1,
    GF_GFX_RES_TYPE_CELL = 2,
    GF_GFX_RES_TYPE_ANIM = 3,
    GF_GFX_RES_TYPE_MCEL = 4,
    GF_GFX_RES_TYPE_MANM = 5,
    GF_GFX_RES_TYPE_MAX = 6,
} GfGfxResType;

typedef struct GF_2DGfxResHeaderNarc {
    int narcId;
    int fileId;
    BOOL compressed;
    int id;
    int extra[2];
} GF_2DGfxResHeaderNarc;

typedef struct GF_2DGfxResHeaderNarcList {
    GfGfxResType type;
    GF_2DGfxResHeaderNarc internal[]; // arbitrary length
} GF_2DGfxResHeaderNarcList;

#endif
