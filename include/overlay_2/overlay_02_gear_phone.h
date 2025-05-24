#ifndef POKEHEARTGOLD_OVERLAY_02_GEAR_PHONE_H
#define POKEHEARTGOLD_OVERLAY_02_GEAR_PHONE_H

#include "field_system.h"

String *GetPhoneBookEntryName(GearPhoneRingManager *gearPhone, HeapID heapId);
void ov02_02251EB8(GearPhoneRingManager *phoneRingManager, u8 callerId, u8 a2, u8 a3, u8 a4, u8 a5);
u8 ov02_02251EE8(GearPhoneRingManager *gearPhone, u8 *a1);
BOOL ov02_02251F20(GearPhoneRingManager *gearPhone);
int GetRadioMusicPlayingSeq(void);

#endif
