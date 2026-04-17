#ifndef POKEHEARTGOLD_POKEATHLON_BOX_H
#define POKEHEARTGOLD_POKEATHLON_BOX_H

#include "global.h"

#include "pokeathlon/pokeathlon.h"

#include "overlay_manager.h"
#include "bg_window.h"
#include "pokemon_storage_system.h"

typedef struct PokeathlonBox {
    BgConfig* bgConfig; // 0x0
    u32 state; // 0x4
    u32 unk8;
    u32 unkC;
    u32 unk10;
    u8 filler14[20];
    BOOL unk28;
    BOOL flashChipDetected; // 0x2C
    u32 unk30;
} PokeathlonBox; // size: 0x34

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
    u16 nickname[20];
} PokeathlonBox_BoxMon;

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

void* ov97_0221E91C();
void* ov97_0221E97C();
void  ov97_0221E98C(PokeathlonBox*, void*);
void* ov97_0221EC14();
u32   ov97_0221EE84(u32);
void  ov97_0221EEA4(u32, BgConfig*, u8, u32);
void  ov97_0221F010(u32);
void  ov97_0221F020(u32);

#endif // POKEHEARTGOLD_POKEATHLON_BOX_H
