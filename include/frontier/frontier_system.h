#ifndef POKEHEARTGOLD_FRONTIER_SYSTEM_H
#define POKEHEARTGOLD_FRONTIER_SYSTEM_H

#include "frontier/frontier_map.h"

#include "message_format.h"

typedef struct FrontierSystem {
    void *unk0;
    u8 unk4[0x40];
    MessageFormat *unk44;
} FrontierSystem;

FrontierMap *FrontierSystem_GetFrontierMap(FrontierSystem *frontierSystem);

#endif
