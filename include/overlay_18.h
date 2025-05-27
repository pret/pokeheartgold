#ifndef POKEHEARTGOLD_OVY_18_H
#define POKEHEARTGOLD_OVY_18_H

#include "menu_input_state.h"
#include "overlay_manager.h"
#include "player_data.h"
#include "pokedex.h"

typedef struct PokedexArgs {
    Pokedex *pokedex;
    PlayerProfile *playerProfile;
    u32 *unk_08;
    MenuInputStateMgr *menuInputStatePtr;
    int x;
    int y;
    u16 mapId;
    u16 mapMatrixId;
} PokedexArgs;

BOOL Pokedex_Init(OverlayManager *man, int *state);
BOOL Pokedex_Main(OverlayManager *man, int *state);
BOOL Pokedex_Exit(OverlayManager *man, int *state);

#endif // POKEHEARTGOLD_OVY_18_H
