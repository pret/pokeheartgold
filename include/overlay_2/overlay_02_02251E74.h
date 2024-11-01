#ifndef POKEHEARTGOLD_OVERLAY_02_02251E74_H
#define POKEHEARTGOLD_OVERLAY_02_02251E74_H

#include "field_system.h"
#include "gear_phone.h"

String *GetPhoneBookEntryName(GearPhoneRingManager *gearPhone, HeapID heapId);
void ov02_02251EB8(GearPhoneRingManager *phoneRingManager, u8 a1, u8 a2, u8 a3, u8 a4, u8 a5);
u8 ov02_02251EE8(GearPhoneRingManager *gearPhone, u8 *a1);
BOOL ov02_02251F20(GearPhoneRingManager *gearPhone);

// the following is as of yet not decompiled
u32 ov02_022521C0(GearPhoneRingManager *gearPhone, PhoneBook *phoneBook, u32 mapId);
void ov02_022522AC(GearPhoneRingManager *gearPhone, BOOL a1);
u32 ov02_02251FDC(GearPhoneRingManager *gearPhone, PhoneBook *phoneBook, u32 mapId);

#endif // POKEHEARTGOLD_OVERLAY_02_02251E74_H
