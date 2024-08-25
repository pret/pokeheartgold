#ifndef POKEHEARTGOLD_POKE_OVERLAY_H
#define POKEHEARTGOLD_POKE_OVERLAY_H

#include "global.h"

typedef enum PMOverlayLoadType {
    OVY_LOAD_NORMAL,
    OVY_LOAD_NOINIT,
    OVY_LOAD_ASYNC,
} PMOverlayLoadType;

void UnloadOverlayByID(FSOverlayID ovyId);
BOOL HandleLoadOverlay(FSOverlayID ovyId, PMOverlayLoadType loadType);

#endif // POKEHEARTGOLD_POKE_OVERLAY_H
