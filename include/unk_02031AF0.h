#ifndef POKEHEARTGOLD_UNK_02031AF0_H
#define POKEHEARTGOLD_UNK_02031AF0_H

#include "save.h"

typedef struct {
	u8 unk[0x28]; 
} UnkSaveStruct29;

u32 sub_02031AF0(void); 
void sub_02031AF4(UnkSaveStruct29* unk);
UnkSaveStruct29* sub_02031B00(SAVEDATA* savedata);

#endif //POKEHEARTGOLD_UNK_02031AF0_H
