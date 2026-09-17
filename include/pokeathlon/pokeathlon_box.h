#ifndef POKEHEARTGOLD_POKEATHLON_BOX_H
#define POKEHEARTGOLD_POKEATHLON_BOX_H

#include "global.h"

#include "pokeathlon/pokeathlon.h"

#include "bg_window.h"
#include "message_format.h"
#include "msgdata.h"
#include "overlay_manager.h"
#include "pokemon_storage_system.h"
#include "pokemon_types_def.h"
#include "sprite.h"
#include "unk_0200A090.h"

typedef struct PokeathlonBox_MonStats {
    s8 power;
    s8 stamina;
    s8 jump;
    s8 skill;
    s8 speed;
    s8 padding;
    u16 stars;
} PokeathlonBox_MonStats;

typedef struct PokeathlonBoxArgs_SelectedMon {
    u32 unk0; // 0x00
    u32 unk4; // 0x04
    u16 species; // 0x08
    u16 form; // 0x0A
    u32 personality; // 0x0C
    PokeathlonBox_MonStats stats; // 0x10
    u8 isShiny; // 0x18
    u8 gender; // 0x19
    u16 nickname[7]; // 0x1A
} PokeathlonBoxArgs_SelectedMon; // size: 0x28

typedef struct PokeathlonBoxArgs {
    PokeathlonCourseArgs* courseArgs; // 0x00
    PokeathlonBoxArgs_SelectedMon selectedMons[3]; // 0x04
    u8 filler7C[8]; // 0x7C
    u32 courseId; // 0x84
} PokeathlonBoxArgs;

typedef struct PokeathlonBox_BoxMon {
    u32 species;
    u32 personality;
    u16 isEgg;
    u16 form;
    u16 unkC;
    u16 unkE;
    u16 isShiny;
    u16 gender;
    u8 filler14[4];
    u16 nickname[11];
} PokeathlonBox_BoxMon;

typedef struct PokeathlonBox_SelectedMon {
    u32 boxno;
    u32 slot;
} PokeathlonBox_SelectedMon;

typedef struct PokeathlonBox_UnkStruct0221EC14 {
    u32 personality; // 0x00
    u16 species; // 0x04
    u8 isShiny; // 0x06
    u8 form; // 0x07
    u8 gender;  // 0x08
    u8 unk9;  // 0x09
    u16 nickname[11]; // 0x0A
    u8 unk20[5];
    u8 unk25;
    u16 unk26;
    u8 unk28;
    u8 unk29;
    u8 filler2A[6];
    u8 unk30;
    u8 unk31;
    u8 filler32[6];
    u8 unk38;
    u8 unk39;
    u8 filler3A[6];
    u8 unk40;
    u8 unk41;
    u8 filler42[6];
    u8 unk48;
    u8 unk49;
    u8 filler[3];
} PokeathlonBox_UnkStruct0221EC14;

typedef struct PokeathlonBox_UnkStruct0221F020 {
    SpriteResource *charResObj;
    SpriteResource *plttResObj;
    u8 padding[0x10];
} PokeathlonBox_UnkStruct0221F020; // size: 0x18

typedef struct PokeathlonBox_UnkStruct0221F0E0 {
    Sprite* sprite;
    Sprite* sprites[5];
} PokeathlonBox_UnkStruct0221F0E0; // size: 0x18

typedef struct PokeathlonBox_SubGraphics {
    enum HeapID heapID;                        // 0x000 / 0x078
    SpriteList *spriteList;                    // 0x004 / 0x07C
    u8 filler8[0x128];                         // 0x008 / 0x080
    GF_2DGfxResMan* mgrs[6];                   // 0x130 / 0x1A8
    PokeathlonBox_UnkStruct0221F020 unk1C0[3]; // 0x148 / 0x1C0
    u8 filler190[0x24];                        // 0x190 / 0x208
    Sprite* sprites[5];                        // 0x1B4 / 0x22C
    u8 filler1C8[0x14];                        // 0x1C8 / 0x23C
    PokeathlonBox_UnkStruct0221F0E0 unk1DC[5]; // 0x1DC / 0x250
    Sprite* unk254;                            // 0x254 / 0x2C8
    void* unk258;                              // 0x258 / 0x2CC
    u8 filler25C[0x28];                        // 0x25C / 0x2D0
} PokeathlonBox_SubGraphics;

typedef struct PokeathlonBox_Graphics {
    enum HeapID heapID; // 0x000
    BgConfig* bgConfig; // 0x004
    Window window1; // 0x008
    Window window2; // 0x018
    Window window3; // 0x028
    Window window4; // 0x038
    Window window5; // 0x048
    Window window6; // 0x058
    u16 courseId; // 0x068
    u16 unk6A; // 0x06A
    MsgData *msgData; // 0x06C
    MessageFormat *msgFormat; // 0x070
    String *nickname; // 0x074
    PokeathlonBox_SubGraphics sub; // 0x078
} PokeathlonBox_Graphics; // size: 0x2FC

typedef struct PokeathlonBox {
    BgConfig* bgConfig; // 0x0
    u32 state; // 0x4
    u32 unk8;
    PokeathlonBox_Graphics* graphics;
    PokeathlonBox_SelectedMon selectedMons[3];
    BOOL unk28;
    SaveData* saveData; // 0x2C
    u32 courseId;
} PokeathlonBox; // size: 0x34

BOOL PokeathlonBox_Init(OverlayManager *manager);
BOOL PokeathlonBox_Main(OverlayManager *manager);
BOOL PokeathlonBox_Exit(OverlayManager *manager);
BOOL ov97_0221E6DC(OverlayManager *manager);
BOOL ov97_0221E700(OverlayManager *manager);
void PokeathlonBox_SetGraphicsBanks();
void PokeathlonBox_SetGraphicsModes(BgConfig* bgConfig);
void PokeathlonBox_SetObjCharTransferTemplate();
void ov97_0221E864(PokeathlonBox* data);
void ov97_0221E88C(void* data);
BOOL PokeathlonBox_GetBoxMon(PCStorage* storage, u32 boxno, u32 slotno, PokeathlonBox_BoxMon* ptr);
BOOL PokeathlonBox_GetLightBoxMon(PCStorage* storage, u32 boxno, u32 slotno, PokeathlonBox_BoxMon* ptr);
void PokeathlonBox_GetBoxName(String *dest, PCStorage *storage, u32 boxno);
void PokeathlonBox_CopySelectedMons(PokeathlonBox* data, PokeathlonBoxArgs* args);
void PokeathlonBox_GetPartyMonStats(Party* party, u8 slot, PokeathlonBox_MonStats* stats);
void PokeathlonBox_GetBoxMonStats(BoxPokemon* boxMon, PokeathlonBox_MonStats* stats);
void PokeathlonBox_GetLightBoxMonStats(BoxPokemon *boxMon, PokeathlonBox_MonStats* stats);
void ov97_0221EC14(int boxno, u8 slot, PokeathlonBox* data);
void ov97_0221EDE4(PokeathlonBox_MonStats* stats1, PokeathlonBox_MonStats* stats2, PartyAprijuiceModifier* aprijuiceModifier, PokeathlonBox_UnkStruct0221EC14* mon);
PokeathlonBox_Graphics* PokeathlonBox_InitGraphics(enum HeapID heapID);
void PokeathlonBox_SetupGraphics(PokeathlonBox_Graphics* graphics, BgConfig* bgConfig, u8 courseId, u32 arg3);
void ov97_0221EFD0(PokeathlonBox_Graphics* graphics, PokeathlonBox_UnkStruct0221EC14* mon);
void PokeathlonBox_RenderAndAnimateSprites(PokeathlonBox_Graphics* graphics);
void PokeathlonBox_ReleaseGraphics(PokeathlonBox_Graphics* graphics);
void ov97_0221F0E0(PokeathlonBox_SubGraphics* subGraphics);
void ov97_0221F14C(BgConfig* bgConfig, enum HeapID heapID);
void PokeathlonBox_InitBgFromTemplates(BgConfig* bgConfig);
void ov97_0221F294(PokeathlonBox_Graphics* graphics);
void ov97_0221F428(PokeathlonBox_Graphics* graphics, PokeathlonBox_UnkStruct0221EC14* mon);
void ov97_0221F56C(PokeathlonBox_Graphics* graphics, PokeathlonBox_UnkStruct0221EC14* mon);

void ov97_0221F5F8(PokeathlonBox_SubGraphics* subGraphics, PokeathlonBox_UnkStruct0221EC14* mon);
void ov97_0221F74C();
void ov97_0221F7DC(PokeathlonBox_SubGraphics* subGraphics);
void ov97_0221F9E0(PokeathlonBox_SubGraphics* subGraphics);
void ov97_0221FBDC(PokeathlonBox_SubGraphics* subGraphics);
void ov97_0221FC54(PokeathlonBox_SubGraphics* subGraphics);

#endif // POKEHEARTGOLD_POKEATHLON_BOX_H
