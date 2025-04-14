#ifndef GUARD_POKEHEARTGOLD_APPLICATION_POKEGEAR_PHONE_H
#define GUARD_POKEHEARTGOLD_APPLICATION_POKEGEAR_PHONE_H

#include "global.h"

#include "mail_misc.h"
#include "unk_02092BE8.h"

typedef enum PokegearAppId {
    GEAR_APP_CONFIGURE,
    GEAR_APP_RADIO,
    GEAR_APP_MAP,
    GEAR_APP_PHONE,
    GEAR_APP_FLY,
} PokegearAppId;

typedef struct PokegearApp_UnkSub07C_Sub4_Sub4 {
    u16 unk_00;
    u8 unk_02;
    u8 unk_03;
    u8 unk_04;
    u8 unk_05;
    u8 unk_06;
    u8 unk_07;
    s8 unk_08;
    s8 unk_09;
    s8 unk_0A;
    s8 unk_0B;
} PokegearApp_UnkSub07C_Sub4_Sub4;

typedef union SpriteOrUnkImageStruct {
    UnkImageStruct *unk_image_struct;
    Sprite *sprite;
} SpriteOrUnkImageStruct;

typedef struct PokegearApp_UnkSub07C_Sub4 {
    u8 unk_00_0 : 1;
    u8 unk_00_1 : 1;
    u8 unk_00_2 : 1;
    u8 unk_01;
    u8 unk_02;
    u8 unk_03;
    PokegearApp_UnkSub07C_Sub4_Sub4 *unk_04;
    u8 filler_08[0x8];
    SpriteOrUnkImageStruct unk_10[4];
} PokegearApp_UnkSub07C_Sub4;

typedef struct PokegearApp_UnkSub07C {
    u16 unk_00;
    u16 unk_02;
    PokegearApp_UnkSub07C_Sub4 *unk_04;
    PokegearApp_UnkSub07C_Sub4 *unk_08;
} PokegearApp_UnkSub07C;

typedef struct UnkStruct_ov100_021E6E20_Sub8 {
    u8 unk_00;
    u8 unk_01;
    u16 unk_02;
    s16 unk_04;
    s16 unk_06;
    u8 filler_08[0x18];
    Sprite *unk_20;
    u8 filler_24[0x4];
} UnkStruct_ov100_021E6E20_Sub8;

typedef struct UnkStruct_ov100_021E6E20 {
    u16 unk_00;
    u16 unk_02;
    u8 *unk_04; // char buffer?
    UnkStruct_ov100_021E6E20_Sub8 *unk_08;
} UnkStruct_ov100_021E6E20;

typedef struct PokegearApp_UnkSub094 {
    HeapID heapId;
    int unk_004;
    u16 unk_008;
    u16 unk_00A;
    u16 unk_00C;
    u16 unk_00E;
    SpriteList *unk_010;
    GF_G2dRenderer unk_014;
    u8 filler_13C[4];
    GF_2DGfxResMan *unk_140[4];
    GF_2DGfxResObjList *unk_150[4];
} PokegearApp_UnkSub094; // size: 0x160

typedef struct PokegearAppData PokegearAppData;
struct PokegearAppData {
    HeapID heapId;                              // 0x000
    u8 app;                                     // 0x004
    u8 registeredCards : 7;                     // 0x005
    u8 unk_006;                                 // 0x006
    u8 unk_007;                                 // 0x007
    u8 unk_008;                                 // 0x008
    u8 unk_009;                                 // 0x009
    MenuInputState unk_00C;                     // 0x00C
    MenuInputState unk_010;                     // 0x010
    u8 filler_014[0x4];                         // 0x014
    int unk_018;                                // 0x018
    int unk_01C;                                // 0x01C
    PokegearArgs *args;                         // 0x020
    SaveData *saveData;                         // 0x024
    SavePokegear *savePokegear;                 // 0x028
    SaveVarsFlags *saveVarsFlags;               // 0x02C
    Options *options;                           // 0x030
    PlayerProfile *profile;                     // 0x034
    u8 unk_038;                                 // 0x038
    u8 filler_039[0x1D];                        // 0x039
    u16 unk_056;                                // 0x056
    void (*unk_058)(PokegearAppData *, void *); // 0x058
    void (*unk_05C)(void *);                    // 0x05C
    u8 filler_05C[0x4];                         // 0x060
    void *unk_064;                              // 0x064
    u8 filler_068[0x4];                         // 0x068
    EasyChatArgs *easyChatArgs;                 // 0x06C;
    OVY_MANAGER *childApplication;              // 0x070
    BgConfig *bgConfig;                         // 0x074
    PaletteData *plttData;                      // 0x078
    PokegearApp_UnkSub07C *unk_07C;             // 0x07C
    RTCTime unk_080;                            // 0x080
    SpriteRenderer *gfxRenderer;                // 0x08C
    SpriteGfxHandler *gfxHandler;               // 0x090
    PokegearApp_UnkSub094 *unk_094;             // 0x094
    SpriteOrUnkImageStruct unk_098[11];         // 0x098
    u16 *unk_0C4;                               // 0x0C4
    NNSG2dScreenData *unk_0C8;                  // 0x0C8
}; // size: 0xCC

int ov100_021E5C50(u16 a0, u16 a1);
BOOL ov100_021E5D3C(PokegearAppData *phoneApp, int a1);
u8 ov100_021E5DC8(PokegearAppData *phoneApp);
int ov100_021E5C80(PokegearAppData *phoneApp);
BOOL ov100_021E5900(PokegearAppData *phoneApp);
int ov100_021E5924(PokegearAppData *phoneApp);
BOOL ov100_021E5BB0(PokegearAppData *phoneApp, BOOL a1);
BOOL ov100_021E5DDC(PokegearAppData *phoneApp);
BOOL ov100_021E5E88(PokegearAppData *phoneApp);
void ov100_021E5EB4(PokegearAppData *phoneApp, int a1);
void ov100_021E5FDC(void);

BOOL Pokegear_Init(OVY_MANAGER *man, int *state);
BOOL Pokegear_Main(OVY_MANAGER *man, int *state);
BOOL Pokegear_Exit(OVY_MANAGER *man, int *state);
void ov100_021E65F4(void *cb_args);

void ov100_021E6914(PokegearAppData *phoneApp);
void ov100_021E6950(PokegearAppData *phoneApp);
void ov100_021E69E8(PokegearAppData *phoneApp);

PokegearApp_UnkSub094 *ov100_021E69F8(HeapID heapId, u16 a1, u16 a2, u16 a3, u16 a4, int a5);
void ov100_021E6A3C(PokegearApp_UnkSub094 *a0);
void ov100_021E6AB0(PokegearApp_UnkSub094 *a0);
UnkImageStruct *ov100_021E6AC0(PokegearApp_UnkSub094 *a0, u8 a1, u8 a2, u8 a3, u8 a4, u8 a5, u8 a6, u8 a7, int a8);
void ov100_021E6C44(UnkImageStruct *a0);

UnkStruct_ov100_021E6E20 *ov100_021E6E20(int a1, HeapID heapId);
void ov100_021E6E58(UnkStruct_ov100_021E6E20 *a0);
void ov100_021E6E84(UnkStruct_ov100_021E6E20 *a0);
u16 ov100_021E6EC4(UnkStruct_ov100_021E6E20 *a0, Sprite *a1);
void ov100_021E6EF4(UnkStruct_ov100_021E6E20 *a0);
void ov100_021E6F34(UnkStruct_ov100_021E6E20 *a0, u8 a1);

PokegearApp_UnkSub07C *ov100_021E6F88(int a0, HeapID heapId);
void ov100_021E6FBC(PokegearApp_UnkSub07C *a0);
u16 ov100_021E7014(PokegearApp_UnkSub07C *a0, const PokegearApp_UnkSub07C_Sub4_Sub4 *a1, u8 a2, u8 a3, BOOL a4, HeapID heapId, SpriteOrUnkImageStruct a6, SpriteOrUnkImageStruct a7, SpriteOrUnkImageStruct a8, SpriteOrUnkImageStruct a9);
BOOL ov100_021E70A4(PokegearApp_UnkSub07C *a0, u16 a1);
u16 ov100_021E7128(PokegearApp_UnkSub07C *a0, u16 a1, BOOL a2);
u16 ov100_021E72F8(PokegearApp_UnkSub07C *a0, u16 a1, u8 a2);
u8 ov100_021E7334(PokegearApp_UnkSub07C *a0);
u8 ov100_021E733C(PokegearApp_UnkSub07C *a0, u16 a1);
u8 ov100_021E73AC(PokegearApp_UnkSub07C *a0, u8 a1);
u8 ov100_021E73C8(PokegearApp_UnkSub07C *a0, u8 a1);
void ov100_021E7414(PokegearApp_UnkSub07C *a0, u16 a1, BOOL a2);

#endif // GUARD_POKEHEARTGOLD_APPLICATION_POKEGEAR_PHONE_H
