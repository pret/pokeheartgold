#ifndef GUARD_POKEHEARTGOLD_APPLICATION_POKEDEX_POKEDEX_INTERNAL_H
#define GUARD_POKEHEARTGOLD_APPLICATION_POKEDEX_POKEDEX_INTERNAL_H

#include "global.h"

#include "bg_window.h"
#include "msgdata.h"
#include "overlay_18.h"
#include "palette.h"
#include "unk_0201956C.h"

typedef struct PokedexAppData PokedexAppData;

struct PokedexAppData {
    PokedexArgs *unk_0000;
    BgConfig *unk_0004;
    UnkStruct_0201956C *unk_0008;
    u8 filler_000C[0x650];
    MsgData *unk_065C;
    MessageFormat *unk_0660;
    String *unk_0664;
    u8 filler_0668[0x1E8];
    PaletteData *unk_0850;
    NARC *unk_0854;
    u8 filler_0858[4];
    int unk_085C;
    u8 filler_0860[0xFF0];
    void *unk_1850;
    void *unk_1854;
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
void ov18_021E6244(PokedexAppData *pokedexApp);
void ov18_021E6280(PokedexAppData *pokedexApp);
void ov18_021E62A8(PokedexAppData *pokedexApp);
void ov18_021E62E8(PokedexAppData *pokedexApp);
void ov18_021E6308(PokedexAppData *pokedexApp);
void ov18_021E6540(PokedexAppData *pokedexApp);
void ov18_021E654C(PokedexAppData *pokedexApp);
BOOL ov18_021E8BF4(PokedexAppData *appData, int *pState);
void ov18_021F0168(PokedexAppData *pokedexApp);
u16 ov18_021F8838(PokedexAppData *appData);

#endif // GUARD_POKEHEARTGOLD_APPLICATION_POKEDEX_POKEDEX_INTERNAL_H
