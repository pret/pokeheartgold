#ifndef GUARD_POKEHEARTGOLD_APPLICATION_POKEDEX_POKEDEX_INTERNAL_H
#define GUARD_POKEHEARTGOLD_APPLICATION_POKEDEX_POKEDEX_INTERNAL_H

#include "global.h"

#include "bg_window.h"
#include "msgdata.h"
#include "overlay_18.h"
#include "palette.h"
#include "unk_0201956C.h"

typedef struct PokedexAppData PokedexAppData;

typedef struct PokedexAppData_UnkSub1030 {
    u16 unk_0;
    u16 unk_2;
} PokedexAppData_UnkSub1030;

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
    u8 filler_0860[0x7D0];
    PokedexAppData_UnkSub1030 unk_1030[518];
    u8 filler_1848[8];
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
void ov18_021E67C8(PokedexAppData *pokedexApp, int a1);
void ov18_021E6A70(PokedexAppData *pokedexApp);
void ov18_021E6C98(PokedexAppData *pokedexApp);
void ov18_021E6A98(u16 *a0, u16 a1, u16 a2);
u16 ov18_021F891C(PokedexAppData *pokedexApp, BOOL a1);
u16 *ov18_021E6AEC(PokedexAppData *pokedexApp, u32 a1);
BOOL ov18_021E8BF4(PokedexAppData *appData, int *pState);
void ov18_021F0168(PokedexAppData *pokedexApp);
u16 ov18_021F8838(PokedexAppData *appData);

#endif // GUARD_POKEHEARTGOLD_APPLICATION_POKEDEX_POKEDEX_INTERNAL_H
