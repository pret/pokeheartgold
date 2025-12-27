#ifndef GUARD_POKEHEARTGOLD_APPLICATION_POKEDEX_POKEDEX_INTERNAL_H
#define GUARD_POKEHEARTGOLD_APPLICATION_POKEDEX_POKEDEX_INTERNAL_H

#include "global.h"

#include "bg_window.h"
#include "msgdata.h"
#include "overlay_18.h"
#include "palette.h"
#include "unk_0201956C.h"
#include "unk_02019BA4.h"

typedef struct PokedexAppData PokedexAppData;

typedef struct PokedexAppData_UnkSub1030 {
    u16 unk_0;
    u16 unk_2;
} PokedexAppData_UnkSub1030;

typedef struct PokedexAppData_UnkSub18CC {
    void *unk_0;
    void *unk_4;
    void *unk_8;
    void *unk_C;
} PokedexAppData_UnkSub18CC;

typedef struct PokedexAppData_UnkSub18DC_0 {
    s32 *unk_0;
    s32 unk_4;
} PokedexAppData_UnkSub18DC_0;

typedef struct PokedexAppData_UnkSub18DC {
    PokedexAppData_UnkSub18DC_0 unk_00;
    PokedexAppData_UnkSub18DC_0 unk_08;
    PokedexAppData_UnkSub18DC_0 unk_10;
    PokedexAppData_UnkSub18DC_0 unk_18;
    PokedexAppData_UnkSub18DC_0 unk_20;
    u32 *unk_28;
} PokedexAppData_UnkSub18DC;

typedef struct PokedexAppData_UnkSub1908 {
    u8 unk_00;
    u8 unk_01;
    u8 unk_02;
    u8 unk_03;
} PokedexAppData_UnkSub1908;

typedef struct PokedexAppData_UnkSub190C {
    u8 unk_00;
    u8 unk_01;
    u8 unk_02;
    u8 unk_03;
    u8 unk_04[32];
} PokedexAppData_UnkSub190C;

typedef struct UnkStruct_ov18_021F9780 {
    u8 x;
    u8 y;
    u8 width;
    u8 height;
} UnkStruct_ov18_021F9780;

struct PokedexAppData {
    PokedexArgs *unk_0000;
    BgConfig *unk_0004;
    UnkStruct_0201956C *unk_0008;
    u8 filler_000C[0x30];
    Window unk_003C;
    u8 filler_004C[0x30];
    Window unk_007C;
    u8 filler_008C[0x1D0];
    Window unk_025C;
    u8 filler_026C[0x1C0];
    Window unk_042C;
    u8 filler_043C[0x80];
    Window unk_04BC;
    u8 filler_04CC[0x50];
    Window unk_051C;
    u8 filler_052C[0x130];
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
    void *unk_1848;
    void *unk_184C;
    void *unk_1850;
    void *unk_1854;
    u8 unk_1858;
    u8 unk_1859;
    u8 filler_185A[2];
    u8 unk_185C;
    int unk_1860;
    GridInputHandler *unk_1864;
    int unk_1868;
    u32 unk_186C;
    int unk_1870;
    int unk_1874;
    int unk_1878;
    int unk_187C;
    int unk_1880;
    int unk_1884;
    int unk_1888;
    u32 unk_188C;
    u8 filler_1890[0x8];
    int unk_1898;
    u8 filler_189C[6];
    u16 unk_18A2;
    u8 unk_18A4[0x20];
    s8 unk_18C4;
    u8 filler_18C5[7];
    PokedexAppData_UnkSub18CC unk_18CC;
    PokedexAppData_UnkSub18DC unk_18DC;
    PokedexAppData_UnkSub1908 *unk_1908;
    PokedexAppData_UnkSub190C *unk_190C;
}; // size: 0x1910

void ov18_021E5C74(void);
void ov18_021E5C84(PokedexAppData *pokedexApp);
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
u16 *ov18_021E6AEC(PokedexAppData *pokedexApp, u32 a1);
u16 *ov18_021E6BB8(PokedexAppData *pokedexApp, u32 a1);
void ov18_021E6C90(u16 *a0);
void ov18_021E6C98(PokedexAppData *pokedexApp);
void ov18_021E6CC0(PokedexAppData *pokedexApp);
void ov18_021E6CE8(PokedexAppData *pokedexApp, u16 *a1);
BOOL ov18_021E6D10(PokedexAppData *pokedexApp, u16 species, u16 language);
BOOL ov18_021E6D38(PokedexAppData *pokedexApp, u16 species);
void ov18_021E6D68(PokedexAppData *pokedexApp, u16 species, s16 a2);
void ov18_021E6E44(PokedexAppData *pokedexApp);
void ov18_021E6F6C(BgConfig *bgConfig, u8 bgId, u8 language, NARC *narc, enum HeapID heapId);
void ov18_021E6FB8(BgConfig *bgConfig, u8 bgId, NARC *narc, enum HeapID heapId);
void ov18_021E6FFC(PokedexAppData *pokedexApp);
void ov18_021E71D0(PokedexAppData *pokedexApp, int a1, int a2);
void ov18_021E74B8(PokedexAppData *pokedexApp, int a1);
void ov18_021E74E4(PokedexAppData *pokedexApp);
void ov18_021E7534(PokedexAppData *pokedexApp, int a1);
void ov18_021E766C(PokedexAppData *pokedexApp, u32 a1);
u8 ov18_021E7698(int a0);
void ov18_021E76EC(PokedexAppData *pokedexApp, u32 a1);
void ov18_021E7724(PokedexAppData *pokedexApp);
void ov18_021E78AC(PokedexAppData *pokedexApp);
void ov18_021E7A80(PokedexAppData *pokedexApp, u16 species, u16 a2);
void ov18_021E7B6C(BOOL a0);
void ov18_021E81A8(PokedexAppData *pokedexApp);
void ov18_021E8254(PokedexAppData *pokedexApp);
void ov18_021E8410(PokedexAppData *pokedexApp);
void ov18_021E84EC(PokedexAppData *pokedexApp);
void ov18_021E8528(PokedexAppData *pokedexApp, int a1, int a2);
void ov18_021E8648(PokedexAppData *pokedexApp);
BOOL ov18_021E8BF4(PokedexAppData *pokedexApp, int *pState);
void ov18_021EE3FC(PokedexAppData *pokedexApp);
void ov18_021EE638(PokedexAppData *pokedexApp, u32 species, int a2);
void ov18_021EE6BC(PokedexAppData *pokedexApp, int species, int a2);
void ov18_021EE6EC(PokedexAppData *pokedexApp, int species, int a2);
void ov18_021EE8B8(PokedexAppData *pokedexApp, u32 species, int a2);
void ov18_021EED70(PokedexAppData *pokedexApp, int species, int a2);
void ov18_021EEE58(PokedexAppData *pokedexApp);
void ov18_021EEED0(PokedexAppData *pokedexApp, int a1);
void ov18_021EF45C(PokedexAppData *pokedexApp);
void ov18_021EF528(PokedexAppData *pokedexApp);
void ov18_021EF5D8(PokedexAppData *pokedexApp);
void ov18_021EF764(PokedexAppData *pokedexApp);
void ov18_021EF848(PokedexAppData *pokedexApp);
void ov18_021EF91C(PokedexAppData *pokedexApp);
void ov18_021EF9B4(PokedexAppData *pokedexApp);
void ov18_021EFA50(PokedexAppData *pokedexApp);
void ov18_021EFB88(PokedexAppData *pokedexApp);
void ov18_021EFBE8(PokedexAppData *pokedexApp, int a1);
void ov18_021EFC3C(PokedexAppData *pokedexApp, int a1);
void ov18_021EFE70(PokedexAppData *pokedexApp, int a1);
void ov18_021EFFEC(PokedexAppData *pokedexApp);
void ov18_021F0118(PokedexAppData *pokedexApp, int a1);
void ov18_021F014C(PokedexAppData *pokedexApp);
void ov18_021F0168(PokedexAppData *pokedexApp);
void ov18_021F021C(PokedexAppData *pokedexApp);
void ov18_021F05E8(PokedexAppData *pokedexApp);
void ov18_021F0858(PokedexAppData *pokedexApp);
void ov18_021F0900(PokedexAppData *pokedexApp);
void ov18_021F11C0(PokedexAppData *pokedexApp, int a1, int a2);
void ov18_021F1CAC(PokedexAppData *pokedexApp, int species, int a2, int a3);
void ov18_021F1DE4(PokedexAppData *pokedexApp, u32 species, int a2, int a3);
void ov18_021F209C(PokedexAppData *pokedexApp, u32 species, int a2, int a3);
void ov18_021F24E0(PokedexAppData *pokedexApp, u32 species, int a2);
void ov18_021F2530(PokedexAppData *pokedexApp, u32 species, int a2);
void ov18_021F2880(PokedexAppData *pokedexApp);
void ov18_021F2A2C(PokedexAppData *pokedexApp, int a1, int a2);
void ov18_021F2A84(PokedexAppData *pokedexApp, int a1, int a2);
void ov18_021F2EC8(PokedexAppData *pokedexApp, int a1, int a2);
void ov18_021F2F3C(PokedexAppData *pokedexApp);
void ov18_021F3494(PokedexAppData *pokedexApp);
void ov18_021F3618(PokedexAppData *pokedexApp, int a1);
void ov18_021F3B60(PokedexAppData *pokedexApp, int a1);
void ov18_021F3D98(PokedexAppData *pokedexApp);
void ov18_021F49F8(PokedexAppData *pokedexApp);
void ov18_021F5DC0(PokedexAppData *pokedexApp);
void ov18_021F6DE0(PokedexAppData *pokedexApp, int a1);
void ov18_021F6EC0(PokedexAppData *pokedexApp);
void ov18_021F6FA0(PokedexAppData *pokedexApp);
void ov18_021F7124(PokedexAppData *pokedexApp);
void ov18_021F7354(PokedexAppData *pokedexApp);
void ov18_021F74D8(PokedexAppData *pokedexApp);
void ov18_021F7668(PokedexAppData *pokedexApp);
void ov18_021F7748(PokedexAppData *pokedexApp);
int ov18_021F8824(PokedexAppData *pokedexApp);
u16 ov18_021F8838(PokedexAppData *pokedexApp);
u16 ov18_021F891C(PokedexAppData *pokedexApp, BOOL a1);

#endif // GUARD_POKEHEARTGOLD_APPLICATION_POKEDEX_POKEDEX_INTERNAL_H
