#ifndef POKEHEARTGOLD_POKEATHLON_BOX_H
#define POKEHEARTGOLD_POKEATHLON_BOX_H

#include "global.h"

#include "pokeathlon/pokeathlon.h"

#include "overlay_manager.h"
#include "bg_window.h"

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

BOOL PokeathlonBox_Init(OverlayManager *manager);
BOOL PokeathlonBox_Main(OverlayManager *manager);
BOOL PokeathlonBox_Exit(OverlayManager *manager);
BOOL ov97_0221E6DC(OverlayManager *manager);
BOOL ov97_0221E700(OverlayManager *manager);

void  PokeathlonBox_SetGraphicsBanks();
void  ov97_0221E814(BgConfig* bgConfig);
void  ov97_0221E834();
void  ov97_0221E864(PokeathlonBox* data);
void  ov97_0221E88C(void*);
void* ov97_0221E91C();
void* ov97_0221E97C();
void  ov97_0221E98C(PokeathlonBox*, void*);
void* ov97_0221EC14();
u32   ov97_0221EE84(u32);
void  ov97_0221EEA4(u32, BgConfig*, u8, u32);
void  ov97_0221F010(u32);
void  ov97_0221F020(u32);

#endif // POKEHEARTGOLD_POKEATHLON_BOX_H
