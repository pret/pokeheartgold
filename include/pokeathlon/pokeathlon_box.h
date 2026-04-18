#ifndef POKEHEARTGOLD_POKEATHLON_BOX_H
#define POKEHEARTGOLD_POKEATHLON_BOX_H

#include "global.h"

#include "pokeathlon/pokeathlon.h"

#include "overlay_manager.h"
#include "bg_window.h"
#include "pokemon_storage_system.h"
#include "pokemon_types_def.h"

typedef struct PokeathlonBox_UnkStruct0221EA88 {
    s8 unk0;
    s8 unk1;
    s8 unk2;
    s8 unk3;
    s8 unk4;
    s8 unk5;
    u16 unk6;
} PokeathlonBox_UnkStruct0221EA88;

typedef struct PokeathlonBoxArgs_SelectedMon {
    u32 unk0; // 0x00
    u32 unk4; // 0x04
    u16 species; // 0x08
    u16 form; // 0x0A
    u32 personality; // 0x0C
    PokeathlonBox_UnkStruct0221EA88 unk10; // 0x10
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
    u32 unk10;
    u32 slot;
} PokeathlonBox_SelectedMon;

typedef struct PokeathlonBox {
    BgConfig* bgConfig; // 0x0
    u32 state; // 0x4
    u32 unk8;
    u32 unkC;
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
void ov97_0221EA88(Party* party, u8 slot, PokeathlonBox_UnkStruct0221EA88* a2);

void  ov97_0221EB38(BoxPokemon*, void*);
void* ov97_0221EC14();
u32   ov97_0221EE84(u32);
void  ov97_0221EEA4(u32, BgConfig*, u8, u32);
void  ov97_0221F010(u32);
void  ov97_0221F020(u32);

#endif // POKEHEARTGOLD_POKEATHLON_BOX_H
