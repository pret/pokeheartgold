#ifndef GUARD_POKEHEARTGOLD_APPLICATION_POKEDEX_POKEDEX_INTERNAL_H
#define GUARD_POKEHEARTGOLD_APPLICATION_POKEDEX_POKEDEX_INTERNAL_H

#include "global.h"

#include "bg_window.h"
#include "overlay_18.h"
#include "palette.h"

typedef struct PokedexAppData PokedexAppData;

struct PokedexAppData {
    PokedexArgs *unk_0000;
    BgConfig *unk_0004;
    u8 filler_0008[0x848];
    PaletteData *unk_0850;
    u8 filler_0854[8];
    int unk_085C;
    u8 filler_0860[0xFF8];
    u8 unk_1858;
    u8 filler_1859[3];
    u8 unk_185C;
    int unk_1860;
    u8 filler_1864[0xAC];
}; // size: 0x1910

void ov18_021E5C74(void);
void ov18_021E5C84(PokedexAppData *pokedexApp);
void ov18_021E7A3C(PokedexAppData *pokedexApp);
void ov18_021E5E70(PokedexAppData *pokedexApp, BOOL a1);
void ov18_021E5F58(PokedexAppData *pokedexApp);
void ov18_021E5FA4(void);
void ov18_021E5FE8(void);
void ov18_021E602C(void);
void ov18_021E6070(void);
void ov18_021E60B4(void);
void ov18_021E60F8(void);
void ov18_021E613C(PokedexAppData *pokedexApp, u8 bgId);
void ov18_021E6174(void);
void ov18_021E618C(int ev1, int ev2);
void ov18_021E61A4(PokedexAppData *appData);
void ov18_021E6204(PokedexAppData *pokedexApp);
BOOL ov18_021E8BF4(PokedexAppData *appData, int *pState);
u16 ov18_021F8838(PokedexAppData *appData);

#endif // GUARD_POKEHEARTGOLD_APPLICATION_POKEDEX_POKEDEX_INTERNAL_H
