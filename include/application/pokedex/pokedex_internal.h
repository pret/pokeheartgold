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
    u8 filler_000C[0x30];
    Window unk_003C;
    u8 filler_004C[0x610];
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
    u8 filler_1864[0x3E];
    u16 unk_18A2;
    u8 filler_18A4[0x6C];
}; // size: 0x1910

void ov18_021E5C74(void);
void ov18_021E5C84(PokedexAppData *pokedexApp);
void ov18_021E7A3C(PokedexAppData *pokedexApp);
void ov18_021E5E70(PokedexAppData *pokedexApp, BOOL a1);
void ov18_021E5F58(PokedexAppData *pokedexApp);
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
void ov18_021E6574(PokedexAppData *pokedexApp);
void ov18_021E659C(PokedexAppData *pokedexApp);
void ov18_021E65AC(PokedexAppData *pokedexApp);
void ov18_021E65D4(PokedexAppData *pokedexApp);
void ov18_021E65FC(PokedexAppData *pokedexApp);
void ov18_021E6624(PokedexAppData *pokedexApp);
void ov18_021E664C(PokedexAppData *pokedexApp);
void ov18_021E6674(PokedexAppData *pokedexApp);
void ov18_021E669C(PokedexAppData *pokedexApp);
void ov18_021E66C4(PokedexAppData *pokedexApp);
void ov18_021E66EC(PokedexAppData *pokedexApp);
void ov18_021E6714(PokedexAppData *pokedexApp);
void ov18_021E673C(PokedexAppData *pokedexApp);
void ov18_021E6794(PokedexAppData *pokedexApp);
void ov18_021E67B0(PokedexAppData *pokedexApp);
void ov18_021E6868(PokedexAppData *pokedexApp);
void ov18_021E7048(PokedexAppData *pokedexApp);
void ov18_021E7BD0(PokedexAppData *pokedexApp);
void ov18_021E7D90(PokedexAppData *pokedexApp);
void ov18_021E7ED8(PokedexAppData *pokedexApp);
void ov18_021E800C(PokedexAppData *pokedexApp);
void ov18_021EE3FC(PokedexAppData *pokedexApp);
void ov18_021EEE58(PokedexAppData *pokedexApp);
void ov18_021F021C(PokedexAppData *pokedexApp);
void ov18_021F05E8(PokedexAppData *pokedexApp);
void ov18_021F0858(PokedexAppData *pokedexApp);
void ov18_021F0900(PokedexAppData *pokedexApp);
void ov18_021F2880(PokedexAppData *pokedexApp);
void ov18_021F2F3C(PokedexAppData *pokedexApp);
void ov18_021F3D98(PokedexAppData *pokedexApp);
void ov18_021F49F8(PokedexAppData *pokedexApp);
void ov18_021F5DC0(PokedexAppData *pokedexApp);
void ov18_021E67C8(PokedexAppData *pokedexApp, int a1);
BOOL ov18_021E8BF4(PokedexAppData *appData, int *pState);
void ov18_021F0168(PokedexAppData *pokedexApp);
u16 ov18_021F8838(PokedexAppData *appData);

#endif // GUARD_POKEHEARTGOLD_APPLICATION_POKEDEX_POKEDEX_INTERNAL_H
