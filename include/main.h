#ifndef POKEHEARTGOLD_MAIN_H
#define POKEHEARTGOLD_MAIN_H

#include "overlay_manager.h"

void Main_ResetOverlayManager(void);
void RegisterMainOverlay(FSOverlayID overlayId, const OVY_MGR_TEMPLATE *template);
void InitializeMainRNG(void);

#endif //POKEHEARTGOLD_MAIN_H
