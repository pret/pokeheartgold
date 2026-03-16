#ifndef GUARD_POKEHEARTGOLD_APPLICATION_POKEDEX_POKEDEX_INTERNAL_H
#define GUARD_POKEHEARTGOLD_APPLICATION_POKEDEX_POKEDEX_INTERNAL_H

#include "global.h"

#include "application/pokedex/pokedex_internal_constants.h"

#include "bg_window.h"
#include "msgdata.h"
#include "overlay_18.h"
#include "palette.h"
#include "sprite_system.h"
#include "unk_0201956C.h" // 0x0201956C
#include "unk_02019BA4.h" // 0x02019BA4

enum {
    POKEDEXAPP_MAINSEQ_00 = 0,
    POKEDEXAPP_MAINSEQ_01 = 1,
    POKEDEXAPP_MAINSEQ_02 = 2,
    POKEDEXAPP_MAINSEQ_03 = 3,
    POKEDEXAPP_MAINSEQ_04 = 4,
    POKEDEXAPP_MAINSEQ_05 = 5,
    POKEDEXAPP_MAINSEQ_06 = 6,
    POKEDEXAPP_MAINSEQ_07 = 7,
    POKEDEXAPP_MAINSEQ_08 = 8,
    POKEDEXAPP_MAINSEQ_09 = 9,
    POKEDEXAPP_MAINSEQ_10 = 10,
    POKEDEXAPP_MAINSEQ_11 = 11,
    POKEDEXAPP_MAINSEQ_12 = 12,
    POKEDEXAPP_MAINSEQ_13 = 13,
    POKEDEXAPP_MAINSEQ_14 = 14,
    POKEDEXAPP_MAINSEQ_15 = 15,
    POKEDEXAPP_MAINSEQ_16 = 16,
    POKEDEXAPP_MAINSEQ_17 = 17,
    POKEDEXAPP_MAINSEQ_18 = 18,
    POKEDEXAPP_MAINSEQ_19 = 19,
    POKEDEXAPP_MAINSEQ_20 = 20,
    POKEDEXAPP_MAINSEQ_21 = 21,
    POKEDEXAPP_MAINSEQ_22 = 22,
    POKEDEXAPP_MAINSEQ_23 = 23,
    POKEDEXAPP_MAINSEQ_24 = 24,
    POKEDEXAPP_MAINSEQ_25 = 25,
    POKEDEXAPP_MAINSEQ_26 = 26,
    POKEDEXAPP_MAINSEQ_27 = 27,
    POKEDEXAPP_MAINSEQ_28 = 28,
    POKEDEXAPP_MAINSEQ_29 = 29,
    POKEDEXAPP_MAINSEQ_30 = 30,
    POKEDEXAPP_MAINSEQ_31 = 31,
    POKEDEXAPP_MAINSEQ_32 = 32,
    POKEDEXAPP_MAINSEQ_33 = 33,
    POKEDEXAPP_MAINSEQ_34 = 34,
    POKEDEXAPP_MAINSEQ_35 = 35,
    POKEDEXAPP_MAINSEQ_36 = 36,
    POKEDEXAPP_MAINSEQ_37 = 37,
    POKEDEXAPP_MAINSEQ_38 = 38,
    POKEDEXAPP_MAINSEQ_39 = 39,
    POKEDEXAPP_MAINSEQ_40 = 40,
    POKEDEXAPP_MAINSEQ_41 = 41,
    POKEDEXAPP_MAINSEQ_42 = 42,
    POKEDEXAPP_MAINSEQ_43 = 43,
    POKEDEXAPP_MAINSEQ_44 = 44,
    POKEDEXAPP_MAINSEQ_45 = 45,
    POKEDEXAPP_MAINSEQ_46 = 46,
    POKEDEXAPP_MAINSEQ_47 = 47,
    POKEDEXAPP_MAINSEQ_48 = 48,
    POKEDEXAPP_MAINSEQ_49 = 49,
    POKEDEXAPP_MAINSEQ_50 = 50,
    POKEDEXAPP_MAINSEQ_51 = 51,
    POKEDEXAPP_MAINSEQ_52 = 52,
    POKEDEXAPP_MAINSEQ_53 = 53,
    POKEDEXAPP_MAINSEQ_54 = 54,
    POKEDEXAPP_MAINSEQ_55 = 55,
    POKEDEXAPP_MAINSEQ_56 = 56,
    POKEDEXAPP_MAINSEQ_57 = 57,
    POKEDEXAPP_MAINSEQ_58 = 58,
    POKEDEXAPP_MAINSEQ_59 = 59,
    POKEDEXAPP_MAINSEQ_60 = 60,
    POKEDEXAPP_MAINSEQ_61 = 61,
    POKEDEXAPP_MAINSEQ_62 = 62,
    POKEDEXAPP_MAINSEQ_63 = 63,
    POKEDEXAPP_MAINSEQ_64 = 64,
    POKEDEXAPP_MAINSEQ_65 = 65,
    POKEDEXAPP_MAINSEQ_66 = 66,
    POKEDEXAPP_MAINSEQ_67 = 67,
    POKEDEXAPP_MAINSEQ_68 = 68,
    POKEDEXAPP_MAINSEQ_69 = 69,
    POKEDEXAPP_MAINSEQ_70 = 70,
    POKEDEXAPP_MAINSEQ_71 = 71,
    POKEDEXAPP_MAINSEQ_72 = 72,
    POKEDEXAPP_MAINSEQ_73 = 73,
    POKEDEXAPP_MAINSEQ_74 = 74,
    POKEDEXAPP_MAINSEQ_75 = 75,
    POKEDEXAPP_MAINSEQ_76 = 76,
    POKEDEXAPP_MAINSEQ_77 = 77,
    POKEDEXAPP_MAINSEQ_78 = 78,
    POKEDEXAPP_MAINSEQ_79 = 79,
    POKEDEXAPP_MAINSEQ_80 = 80,
    POKEDEXAPP_MAINSEQ_81 = 81,
    POKEDEXAPP_MAINSEQ_82 = 82,
    POKEDEXAPP_MAINSEQ_83 = 83,
    POKEDEXAPP_MAINSEQ_84 = 84,
    POKEDEXAPP_MAINSEQ_85 = 85,
    POKEDEXAPP_MAINSEQ_86 = 86,
    POKEDEXAPP_MAINSEQ_87 = 87,
    POKEDEXAPP_MAINSEQ_88 = 88,
    POKEDEXAPP_MAINSEQ_89 = 89,
    POKEDEXAPP_MAINSEQ_90 = 90,
    POKEDEXAPP_MAINSEQ_91 = 91,
    POKEDEXAPP_MAINSEQ_92 = 92,
    POKEDEXAPP_MAINSEQ_MAX = 93,
};

typedef struct PokedexAppData PokedexAppData;

typedef struct PokedexAppData_UnkSub0868_State04 {
    u8 unk_0;
    u8 unk_1;
    u8 unk_2;
    u8 unk_3;
    u8 unk_4;
    u8 unk_5;
    u8 unk_6;
    u8 unk_7_0 : 4;
    u8 unk_7_4 : 4;
} PokedexAppData_UnkSub0868_State04;

typedef struct PokedexAppData_UnkSub0868_State06 {
    u32 unk_0;
    u32 unk_4;
    s16 unk_8;
    u16 unk_A;
} PokedexAppData_UnkSub0868_State06;

typedef struct PokedexAppData_UnkSub0868_State09 {
    u16 unk_0;
    u8 unk_2;
    u8 unk_3;
} PokedexAppData_UnkSub0868_State09;

typedef struct PokedexAppData_UnkSub0868_State10 {
    u8 unk_0;
} PokedexAppData_UnkSub0868_State10;

typedef struct PokedexAppData_UnkSub0868_State13 {
    u16 *unk_0;
    u8 unk_4;
    u8 unk_5;
    u8 unk_6;
    u8 unk_7;
} PokedexAppData_UnkSub0868_State13;

typedef struct PokedexAppData_UnkSub0868_State16 {
    u16 unk_0;
    u16 unk_2;
} PokedexAppData_UnkSub0868_State16;

typedef struct PokedexAppData_UnkSub0868_State17 {
    u32 unk_0;
    u32 unk_4;
    u8 filler_8[2];
    u16 unk_A;
} PokedexAppData_UnkSub0868_State17;

typedef struct PokedexAppData_UnkSub0868_State26 {
    u8 unk_0;
    u8 unk_1;
    u8 unk_2;
    u8 unk_3;
} PokedexAppData_UnkSub0868_State26;

typedef struct PokedexAppData_UnkSub0868_State38 {
    u32 unk_0;
    u32 unk_4;
    u16 unk_8;
    s16 unk_A;
} PokedexAppData_UnkSub0868_State38;

typedef struct PokedexAppData_UnkSub0868_State69 {
    u16 unk_0;
    u8 unk_2;
} PokedexAppData_UnkSub0868_State69;

typedef struct PokedexAppData_UnkSub0868_State77_Sub4 {
    PokedexAppData *pokedexApp;
    u8 filler_04[0x1C];
} PokedexAppData_UnkSub0868_State77_Sub4;

typedef struct PokedexAppData_UnkSub0868_State77 {
    int unk_0;
    PokedexAppData_UnkSub0868_State77_Sub4 *unk_4;
} PokedexAppData_UnkSub0868_State77;

typedef union PokedexAppData_UnkSub0868 {
    PokedexAppData_UnkSub0868_State04 state_04;
    PokedexAppData_UnkSub0868_State06 state_06;
    PokedexAppData_UnkSub0868_State09 state_09;
    PokedexAppData_UnkSub0868_State10 state_10;
    PokedexAppData_UnkSub0868_State13 state_13;
    PokedexAppData_UnkSub0868_State16 state_16;
    PokedexAppData_UnkSub0868_State17 state_17;
    PokedexAppData_UnkSub0868_State26 state_26;
    PokedexAppData_UnkSub0868_State38 state_38;
    PokedexAppData_UnkSub0868_State69 state_69;
    PokedexAppData_UnkSub0868_State77 state_77;
    u8 padding[16];
} PokedexAppData_UnkSub0868;

typedef struct PokedexAppData_UnkSub0878 {
    u16 unk_000[NATIONAL_DEX_COUNT][2];
    u16 unk_7B4;
    u16 unk_7B6;
} PokedexAppData_UnkSub0878;

typedef struct PokedexAppData_UnkSub1030 {
    u16 unk_0; // 0x0
    u16 unk_2; // 0x2
} PokedexAppData_UnkSub1030;

typedef struct PokedexAppData_UnkSub18CC {
    s16 *player_ypos;  // 0x0
    s16 *player_scale; // 0x4
    s16 *mon_ypos;     // 0x8
    s16 *mon_scale;    // 0xC
} PokedexAppData_UnkSub18CC;

typedef struct PokedexAppData_UnkSub18DC_0 {
    s32 *maps;
    s32 nMaps;
} PokedexAppData_UnkSub18DC_0;

typedef struct PokedexAppData_UnkSub18DC {
    PokedexAppData_UnkSub18DC_0 unk_00; // 0x00
    PokedexAppData_UnkSub18DC_0 unk_08; // 0x08
    PokedexAppData_UnkSub18DC_0 unk_10; // 0x10
    PokedexAppData_UnkSub18DC_0 unk_18; // 0x18
    PokedexAppData_UnkSub18DC_0 unk_20; // 0x20
    u32 *unk_28;                        // 0x28
} PokedexAppData_UnkSub18DC;

typedef struct PokedexAppData_UnkSub1908 {
    u8 unk_00; // 0x00
    u8 unk_01; // 0x01
    u8 unk_02; // 0x02
    u8 unk_03; // 0x03
} PokedexAppData_UnkSub1908;

typedef struct PokedexAppData_UnkSub190C {
    u8 unk_00;     // 0x00
    u8 unk_01;     // 0x01
    u8 unk_02;     // 0x02
    u8 unk_03;     // 0x03
    u8 unk_04[32]; // 0x04
} PokedexAppData_UnkSub190C;

typedef struct UnkStruct_ov18_021F9780 {
    u8 x;
    u8 y;
    u8 width;
    u8 height;
} UnkStruct_ov18_021F9780;

typedef struct PokedexAppData_UnkSub1850 {
    u16 unk_0;
    u16 unk_2;
} PokedexAppData_UnkSub1850;

struct PokedexAppData {
    PokedexArgs *args;                              // 0x0000
    BgConfig *bgConfig;                             // 0x0004
    UnkStruct_0201956C *unk_0008;                   // 0x0008
    Window windows[101];                            // 0x000C
    MsgData *msgData;                               // 0x065C
    MessageFormat *msgFormat;                       // 0x0660
    String *strBufFormatted;                        // 0x0664
    u8 filler_0668[4];                              // 0x0668
    SpriteManager *unk_066C;                        // 0x066C
    u8 filler_0770[0x1E0];                          // 0x0770
    PaletteData *paletteData;                       // 0x0850
    NARC *gfxNarc;                                  // 0x0854
    u8 filler_0858[4];                              // 0x0858
    int unk_085C;                                   // 0x085C
    int unk_0860;                                   // 0x0860
    u32 unk_0864;                                   // 0x0864
    PokedexAppData_UnkSub0868 unk_0868;             // 0x0868
    PokedexAppData_UnkSub0878 unk_0878;             // 0x0878
    PokedexAppData_UnkSub1030 unk_1030[518];        // 0x1030
    void *heights;                                  // 0x1848
    void *weights;                                  // 0x184C
    PokedexAppData_UnkSub1850 *unk_1850;            // 0x1850
    u8 *unk_1854;                                   // 0x1854
    u8 unk_1858;                                    // 0x1858
    u8 unk_1859;                                    // 0x1859
    u8 unk_185A;                                    // 0x185A
    u8 unk_185B;                                    // 0x185B
    u8 unk_185C;                                    // 0x185C
    u8 unk_185D;                                    // 0x185D
    u8 unk_185E;                                    // 0x185E
    int unk_1860;                                   // 0x1860
    GridInputHandler *unk_1864;                     // 0x1864
    u32 dexSearchCriteria[DEX_SEARCH_CRITERIA_NUM]; // 0x1868
    u32 dexSearchCriteriaBak[2];                    // 0x1890
    int unk_1898;                                   // 0x1898
    u8 filler_189C[4];                              // 0x189C
    u8 unk_18A0;                                    // 0x18A0
    u8 unk_18A1;                                    // 0x18A1
    u16 curSpecies;                                 // 0x18A2
    u8 seenForms[0x20];                             // 0x18A4
    s8 numSeenForms;                                // 0x18C4
    s8 unk_18C5;                                    // 0x18C5
    s8 unk_18C6;                                    // 0x18C6
    u8 unk_18C7_0 : 5;                              // 0x18C7
    u8 unk_18C7_5 : 2;                              // 0x18C7
    u8 unk_18C7_7 : 1;                              // 0x18C7
    s8 unk_18C8;                                    // 0x18C8
    s8 unk_18C9;                                    // 0x18C9
    s8 unk_18CA;                                    // 0x18CA
    u8 unk_18CB_0 : 6;                              // 0x18CB
    u8 unk_18CB_6 : 1;                              // 0x18CB
    u8 unk_18CB_7 : 1;                              // 0x18CB
    PokedexAppData_UnkSub18CC unk_18CC;             // 0x18CC
    PokedexAppData_UnkSub18DC unk_18DC;             // 0x18DC
    PokedexAppData_UnkSub1908 *unk_1908;            // 0x1908
    PokedexAppData_UnkSub190C *unk_190C;            // 0x190C
}; // size: 0x1910

String *ov18_021E590C(u16 species, int language, enum HeapID heapId);
String *ov18_021E595C(u16 species, int language, enum HeapID heapId);
String *ov18_021E59A8(u16 species, int language, int a2, enum HeapID heapId);

void ov18_021E5C40(void *cb_arg);
void ov18_021E5C74(void);
void ov18_021E5C84(PokedexAppData *pokedexApp);
void ov18_021E5E70(PokedexAppData *pokedexApp, BOOL a1);
void ov18_021E5F58(PokedexAppData *pokedexApp);
void ov18_021E613C(PokedexAppData *pokedexApp, u8 bgId);
void ov18_021E6174(void);
void ov18_021E618C(u8 ev1, u8 ev2);
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
void ov18_021E7A80(PokedexAppData *pokedexApp, u16 species, s16 a2);
void ov18_021E7B6C(BOOL a0);
void ov18_021E800C(PokedexAppData *pokedexApp);
void ov18_021E81A8(PokedexAppData *pokedexApp);
void ov18_021E8254(PokedexAppData *pokedexApp);
void ov18_021E8410(PokedexAppData *pokedexApp);
void ov18_021E84EC(PokedexAppData *pokedexApp);
void ov18_021E8528(PokedexAppData *pokedexApp, int a1, int a2);
void ov18_021E8648(PokedexAppData *pokedexApp);
BOOL ov18_021E8AB0(PokedexAppData *pokedexApp, u32 a1);
u32 ov18_021E8ACC(PokedexAppData *pokedexApp, u32 a1, u32 a2);
u32 ov18_021E8AE0(PokedexAppData *pokedexApp, u32 a1);
u32 ov18_021E8B0C(u32 a0);
u32 ov18_021E8B18(u32 a0);
BOOL ov18_021E8B24(u32 a0);
BOOL ov18_021E8B5C(u32 a0);
void ov18_021E8B94(PokedexAppData *pokedexApp);
void ov18_021E8BD4(PokedexAppData *pokedexApp);

BOOL PokedexApp_RunMainSeq(PokedexAppData *pokedexApp, int *pState);

void ov18_021EE388(PokedexAppData *pokedexApp);
void ov18_021EE3FC(PokedexAppData *pokedexApp);
void ov18_021EE5FC(PokedexAppData *pokedexApp);
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
void ov18_021EFC3C(PokedexAppData *pokedexApp, int windowId);
void ov18_021EFC9C(PokedexAppData *pokedexApp, u32 type, int windowId, int a3);
void ov18_021EFD00(PokedexAppData *pokedexApp, u16 a1, int a2);
void ov18_021EFDB4(PokedexAppData *pokedexApp, u16 a1, int a2);
void ov18_021EFE70(PokedexAppData *pokedexApp, int a1);
void ov18_021EFEC4(PokedexAppData *pokedexApp);
void ov18_021EFFEC(PokedexAppData *pokedexApp);
void ov18_021F0118(PokedexAppData *pokedexApp, int a1);
void ov18_021F014C(PokedexAppData *pokedexApp);
void ov18_021F0168(PokedexAppData *pokedexApp);
void ov18_021F018C(PokedexAppData *pokedexApp);
void ov18_021F01D4(PokedexAppData *pokedexApp);
void ov18_021F021C(PokedexAppData *pokedexApp);
void ov18_021F0D2C(PokedexAppData *pokedexApp);
void ov18_021F03C0(PokedexAppData *pokedexApp);
void ov18_021F03E0(PokedexAppData *pokedexApp);
void ov18_021F0428(PokedexAppData *pokedexApp);
void ov18_021F0504(PokedexAppData *pokedexApp, int a1);
void ov18_021F05E8(PokedexAppData *pokedexApp);
void ov18_021F0838(PokedexAppData *pokedexApp);
void ov18_021F0858(PokedexAppData *pokedexApp);
void ov18_021F08E0(PokedexAppData *pokedexApp);
void ov18_021F0900(PokedexAppData *pokedexApp);
void ov18_021F0918(PokedexAppData *pokedexApp);
void ov18_021F0928(PokedexAppData *pokedexApp);
void ov18_021F0940(PokedexAppData *pokedexApp);
void ov18_021F0B70(PokedexAppData *pokedexApp, int a1);
void ov18_021F0DD0(PokedexAppData *pokedexApp);
void ov18_021F0F2C(PokedexAppData *pokedexApp);
void ov18_021F0F68(PokedexAppData *pokedexApp, int a1, int a2);
void ov18_021F0FC8(PokedexAppData *pokedexApp);
void ov18_021F0FEC(PokedexAppData *pokedexApp);
void ov18_021F1004(PokedexAppData *pokedexApp);
void ov18_021F118C(PokedexAppData *pokedexApp, int a1, int a2);
int ov18_021F11AC(PokedexAppData *pokedexApp, int a1);
void ov18_021F11C0(PokedexAppData *pokedexApp, int a1, int a2);
void ov18_021F1620(PokedexAppData *pokedexApp, int a1);
void ov18_021F16C4(PokedexAppData *pokedexApp, int a1, int a2, u8 a3);
void ov18_021F1760(PokedexAppData *pokedexApp, int a1, int a2, u8 a3);
void ov18_021F1CAC(PokedexAppData *pokedexApp, int species, int a2, int a3);
void ov18_021F1DE4(PokedexAppData *pokedexApp, u32 species, int a2, int a3);
void ov18_021F209C(PokedexAppData *pokedexApp, u32 species, int a2, int a3);
void ov18_021F24E0(PokedexAppData *pokedexApp, u32 species, int a2);
void ov18_021F2530(PokedexAppData *pokedexApp, u32 species, int a2);
void ov18_021F2880(PokedexAppData *pokedexApp);
void ov18_021F2A2C(PokedexAppData *pokedexApp, int a1, int a2);
void ov18_021F2A84(PokedexAppData *pokedexApp, int a1, int a2);
void ov18_021F2AC0(PokedexAppData *pokedexApp, int a1);
BOOL ov18_021F2AF8(PokedexAppData *pokedexApp, u32 x, u32 y);
void ov18_021F2B3C(PokedexAppData *pokedexApp, int a1, s16 a2);
void ov18_021F2B70(PokedexAppData *pokedexApp, int a1, s16 a2);
s16 ov18_021F2B9C(PokedexAppData *pokedexApp);
void ov18_021F2BB0(PokedexAppData *pokedexApp, int a1);
void ov18_021F2BFC(PokedexAppData *pokedexApp);
void ov18_021F2C10(PokedexAppData *pokedexApp, int a1, int a2);
void ov18_021F2C5C(PokedexAppData *pokedexApp, int a1, int a2);
int ov18_021F2CD0(PokedexAppData *pokedexApp, int a1, u32 x, u32 y);
int ov18_021F2D24(PokedexAppData *pokedexApp, int a1, u32 x, u32 y, int a4);
int ov18_021F2DD4(PokedexAppData *pokedexApp, int a1, int a2, int a3);
u8 ov18_021F2E14(PokedexAppData *pokedexApp, int a1, int a2, int a3);
void ov18_021F2E4C(PokedexAppData *pokedexApp, int a1, int a2);
void ov18_021F2E80(PokedexAppData *pokedexApp, int a1, int a2);
void ov18_021F2EC8(PokedexAppData *pokedexApp, int a1, int a2);
void ov18_021F2F00(PokedexAppData *pokedexApp);
void ov18_021F2F3C(PokedexAppData *pokedexApp);
void ov18_021F3190(PokedexAppData *pokedexApp);
void ov18_021F3294(PokedexAppData *pokedexApp);
void ov18_021F3438(PokedexAppData *pokedexApp);
void ov18_021F3448(PokedexAppData *pokedexApp);
void ov18_021F3494(PokedexAppData *pokedexApp);
void ov18_021F3618(PokedexAppData *pokedexApp, int a1);
void ov18_021F36D4(PokedexAppData *pokedexApp, int a1, int a2, int a3);
void ov18_021F37D4(PokedexAppData *pokedexApp, int a1, int a2, int a3);
void ov18_021F38F0(PokedexAppData *pokedexApp, int a1, u16 a2);
void ov18_021F39C4(PokedexAppData *pokedexApp, int a1, u16 a2);
void ov18_021F3A64(PokedexAppData *pokedexApp, u32 a1, int a2);
u32 ov18_021F3AB0(PokedexAppData *pokedexApp, int a1);
int ov18_021F3AD0(PokedexAppData *pokedexApp, int a1);
void ov18_021F3AD8(PokedexAppData *pokedexApp);
void ov18_021F3B2C(PokedexAppData *pokedexApp, int a1);
void ov18_021F3B60(PokedexAppData *pokedexApp, int a1);
void ov18_021F3BA4(PokedexAppData *pokedexApp);
void ov18_021F3BD4(PokedexAppData *pokedexApp, int a1);
void ov18_021F3C30(PokedexAppData *pokedexApp);
void ov18_021F3C54(PokedexAppData *pokedexApp, int a1);
void ov18_021F3C88(PokedexAppData *pokedexApp);
void ov18_021F3D34(PokedexAppData *pokedexApp);
void ov18_021F3D6C(PokedexAppData *pokedexApp);
void ov18_021F3D80(PokedexAppData *pokedexApp, int a1);
void ov18_021F3D98(PokedexAppData *pokedexApp);
void ov18_021F3E08(PokedexAppData *pokedexApp);
void ov18_021F40A0(PokedexAppData *pokedexApp);
void ov18_021F4080(PokedexAppData *pokedexApp);
void ov18_021F4134(PokedexAppData *pokedexApp);
void ov18_021F4384(PokedexAppData *pokedexApp);
void ov18_021F4620(PokedexAppData *pokedexApp);
void ov18_021F463C(PokedexAppData *pokedexApp);
void ov18_021F49F8(PokedexAppData *pokedexApp);
void ov18_021F4A50(PokedexAppData *pokedexApp);
void ov18_021F504C(PokedexAppData *pokedexApp, PokedexAppData_UnkSub0868_State77_Sub4 *a1);
BOOL ov18_021F50C0(PokedexAppData_UnkSub0868_State77_Sub4 *a0);
BOOL ov18_021F516C(PokedexAppData_UnkSub0868_State77_Sub4 *a0);
void ov18_021F5DC0(PokedexAppData *pokedexApp);
void ov18_021F5DE0(PokedexAppData *pokedexApp);
void ov18_021F5EF0(PokedexAppData *pokedexApp, int a1);
void ov18_021F6038(PokedexAppData *pokedexApp);
void ov18_021F609C(PokedexAppData *pokedexApp, int a1);
void ov18_021F6178(PokedexAppData *pokedexApp, int a1);
void ov18_021F619C(PokedexAppData *pokedexApp, s8 a1, s8 a2, int a3);
int ov18_021F6258(PokedexAppData *pokedexApp, int a1, int a2);
int ov18_021F62B4(PokedexAppData *pokedexApp, u32 x, u32 y);
BOOL ov18_021F6310(PokedexAppData *pokedexApp, u32 x, u32 y);
BOOL ov18_021F63DC(PokedexAppData *pokedexApp, u32 x, u32 y);
int ov18_021F64A4(PokedexAppData *pokedexApp, int a1);
int ov18_021F64F4(PokedexAppData *pokedexApp, int a1);
int ov18_021F6540(PokedexAppData *pokedexApp, int a1, int a2, int a3);
void ov18_021F6578(PokedexAppData *pokedexApp, int a1, int a2);
void ov18_021F65AC(PokedexAppData *pokedexApp);
void ov18_021F65EC(PokedexAppData *pokedexApp);
void ov18_021F662C(PokedexAppData *pokedexApp);
void ov18_021F6684(PokedexAppData *pokedexApp);
void ov18_021F6714(PokedexAppData *pokedexApp);
void ov18_021F67D0(PokedexAppData *pokedexApp);
void ov18_021F6844(PokedexAppData *pokedexApp, int a1, int a2);
void ov18_021F6984(PokedexAppData *pokedexApp, int a1, int a2);
void ov18_021F6990(PokedexAppData *pokedexApp);
int ov18_021F6B00(PokedexAppData *pokedexApp);
int ov18_021F6BBC(PokedexAppData *pokedexApp, int a1);
void ov18_021F6DE0(PokedexAppData *pokedexApp, int a1);
u32 ov18_021F6E2C(PokedexAppData *pokedexApp);
void ov18_021F6EC0(PokedexAppData *pokedexApp);
u32 ov18_021F6F08(PokedexAppData *pokedexApp);
void ov18_021F6FA0(PokedexAppData *pokedexApp);
u32 ov18_021F6FE8(PokedexAppData *pokedexApp);
void ov18_021F7124(PokedexAppData *pokedexApp);
u32 ov18_021F716C(PokedexAppData *pokedexApp);
void ov18_021F7354(PokedexAppData *pokedexApp);
u32 ov18_021F739C(PokedexAppData *pokedexApp);
void ov18_021F74D8(PokedexAppData *pokedexApp);
u32 ov18_021F7520(PokedexAppData *pokedexApp);
u32 ov18_021F765C(u32 *a1);
void ov18_021F7668(PokedexAppData *pokedexApp);
u32 ov18_021F76B0(PokedexAppData *pokedexApp);
void ov18_021F7748(PokedexAppData *pokedexApp);
u32 ov18_021F7790(PokedexAppData *pokedexApp);
u32 ov18_021F7974(PokedexAppData *pokedexApp, int a1);
void ov18_021F7B74(PokedexAppData *pokedexApp);
u32 ov18_021F7C14(PokedexAppData *pokedexApp, u32 *a1);
u32 ov18_021F7D00(PokedexAppData *pokedexApp, u32 *a1);
u32 ov18_021F7D30(PokedexAppData *pokedexApp, u32 *a1);
u32 ov18_021F7DCC(PokedexAppData *pokedexApp, u32 *a1);
u32 ov18_021F7E70(PokedexAppData *pokedexApp, u32 *a1);
void ov18_021F7ED4(PokedexAppData *pokedexApp, u8 a1, u32 a2, u32 a3, u32 a4, u32 a5, u32 a6, u32 a7, u32 a8, u32 a9, u32 a10, u32 a11);
u32 ov18_021F8824(PokedexAppData *pokedexApp);
u16 ov18_021F8838(PokedexAppData *pokedexApp);
u32 ov18_021F8850(PokedexAppData_UnkSub0878 *a0, u16 a1);
void ov18_021F8884(PokedexAppData *pokedexApp, int a1);
u16 ov18_021F891C(PokedexAppData *pokedexApp, BOOL a1);
u32 ov18_021F8950(PokedexAppData *pokedexApp, int a1);

#endif // GUARD_POKEHEARTGOLD_APPLICATION_POKEDEX_POKEDEX_INTERNAL_H
