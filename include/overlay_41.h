#ifndef POKEHEARTGOLD_OVY_41_H
#define POKEHEARTGOLD_OVY_41_H

#include "fashion_case.h"
#include "overlay_manager.h"

typedef struct FashionAppData {
    SaveFashionData *saveFashionData;
    int unk_4;
    int unk_8;
} FashionAppData;

BOOL AccessoryPortrait_Init(OverlayManager *man, int *state);
BOOL AccessoryPortrait_Main(OverlayManager *man, int *state);
BOOL AccessoryPortrait_Exit(OverlayManager *man, int *state);

BOOL ov41_02246DE0(OverlayManager *man, int *state);
BOOL ov41_02246F08(OverlayManager *man, int *state);
BOOL ov41_02247150(OverlayManager *man, int *state);

#endif // POKEHEARTGOLD_OVY_41_H
