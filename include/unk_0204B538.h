#ifndef POKEHEARTGOLD_UNK_0204B538_H
#define POKEHEARTGOLD_UNK_0204B538_H

#include "field_types_def.h"
#include "message_format.h"
#include "scrcmd_9.h"

MessageFormat *sub_0204B538(SaveData *saveData, u16 numEligiblePokemon, u16 a2, u8 a3, u8 *numLegendaryPokemonSeen);
u32 sub_0204B5E8(u8 a0);
u16 sub_0204B610(FieldSystem *fieldSystem, u16 *a1);
BOOL sub_0204B66C(FieldSystem *fieldSystem, u16 *a1);
BOOL sub_0204B690(FieldSystem *fieldSystem, u16 *a1);
void sub_0204B6AC(UnkStruct_Fsys_A0 *a0, SaveData *saveData);
void sub_0204B708(UnkStruct_Fsys_A0 *a0);
void sub_0204B720(UnkStruct_Fsys_A0 *a0, u32 a1);
u16 sub_0204B73C(UnkStruct_Fsys_A0 *a0, u8 a1, u8 a2, u32 a3);
u32 sub_0204BA04(UnkStruct_Fsys_A0 *a0, UnkStruct_0204B7D0 *a1, u16 a2, u32 a3, u16 *a4, u16 *a5, UnkStruct_0204A824_7E8 *a6, HeapID heapId);
void sub_0204BA50(UnkStruct_Fsys_A0 *a0, UnkStruct_0204B7D0 *a1, u16 a2, u32 a3, UnkStruct_0204A824_7E8 *a4, HeapID heapId);

#endif // POKEHEARTGOLD_UNK_0204B538_H
