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
    u32 unk84; // 0x84
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
    u32 personality;
    u16 species;
    s8 isShiny;
    s8 form;
    s8 gender;
    s8 unk9;
    u16 nickname[11];
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

typedef struct PokeathlonBox_UnkStruct0221EE84 {
    enum HeapID heapID; // 0x000
    BgConfig* bgConfig; // 0x004
    Window window1; // 0x008
    Window window2; // 0x018
    Window window3; // 0x028
    Window window4; // 0x038
    Window window5; // 0x048
    Window window6; // 0x058
    u16 unk68; // 0x068
    u16 unk6A; // 0x06A
    MsgData *msgData; // 0x06C
    MessageFormat *msgFormat; // 0x070
    String *nickname; // 0x074
    enum HeapID heapID2; // 0x078
    u8 filler7C[0x280]; // 0x07C
} PokeathlonBox_UnkStruct0221EE84; // size: 0x2FC

typedef struct PokeathlonBox {
    BgConfig* bgConfig; // 0x0
    u32 state; // 0x4
    u32 unk8;
    PokeathlonBox_UnkStruct0221EE84* unkC;
    PokeathlonBox_SelectedMon selectedMons[3];
    BOOL unk28;
    SaveData* saveData; // 0x2C
    u32 unk30;
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
PokeathlonBox_UnkStruct0221EE84* ov97_0221EE84(enum HeapID heapID);
void ov97_0221EEA4(PokeathlonBox_UnkStruct0221EE84* data, BgConfig* bgConfig, u8 arg2, u32 arg3);

void ov97_0221EFD0(PokeathlonBox_UnkStruct0221EE84*, PokeathlonBox_UnkStruct0221EC14*);
void ov97_0221F010(PokeathlonBox_UnkStruct0221EE84*);
void ov97_0221F020(PokeathlonBox_UnkStruct0221EE84*);
void ov97_0221F14C(BgConfig*, enum HeapID);
void ov97_0221F294(PokeathlonBox_UnkStruct0221EE84*);
void ov97_0221F7DC(enum HeapID*);
void ov97_0221F9E0(enum HeapID*);

#endif // POKEHEARTGOLD_POKEATHLON_BOX_H
