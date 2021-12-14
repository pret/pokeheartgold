#ifndef POKEHEARTGOLD_GF_GFX_LOADER_H
#define POKEHEARTGOLD_GF_GFX_LOADER_H

#include "filesystem.h"

void *GfGfxLoader_LoadFromNarc_GetSizeOut(
    NarcId narcId,
    s32 fileId,
    BOOL isCompressed,
    HeapID heapId,
    BOOL allocAtEnd,
    u32 *size_p
);

#endif //POKEHEARTGOLD_GF_GFX_LOADER_H
