#ifndef POKEHEARTGOLD_OVERLAY_02_GEAR_PHONE_H
#define POKEHEARTGOLD_OVERLAY_02_GEAR_PHONE_H

#include "field_system.h"
#include "unk_02092BE8.h"

String *GetPhoneBookEntryName(GearPhoneRingManager *gearPhone, enum HeapID heapID);
void GearPhoneRingManager_SetCallerParams(GearPhoneRingManager *phoneRingManager, u8 callerId, u8 a2, u8 a3, u8 a4, u8 a5);
u8 ov02_02251EE8(GearPhoneRingManager *gearPhone, Unk_PokegearSTRUCT_14 *a1);
BOOL ov02_02251F20(GearPhoneRingManager *gearPhone);
int GetRadioMusicPlayingSeq(void);

#endif
