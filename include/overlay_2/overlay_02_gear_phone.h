#ifndef POKEHEARTGOLD_OVERLAY_02_GEAR_PHONE_H
#define POKEHEARTGOLD_OVERLAY_02_GEAR_PHONE_H

#include "field_system.h"
#include "unk_02092BE8.h"

enum RadioMusicPlayingSeq {
    RADIO_MUSIC_SEQ_NONE = 0,
    RADIO_MUSIC_SEQ_MARCH,
    RADIO_MUSIC_SEQ_LULLABY,
    RADIO_MUSIC_SEQ_HOENN_SOUNDS,
    RADIO_MUSIC_SEQ_SINNOH_SOUNDS,
    RADIO_MUSIC_SEQ_POKEFLUTE,
    RADIO_MUSIC_SEQ_UNOWN,
};

String *GetPhoneBookEntryName(GearPhoneRingManager *gearPhone, enum HeapID heapID);
void GearPhoneRingManager_SetCallerParams(GearPhoneRingManager *phoneRingManager, u8 callerId, u8 a2, u8 a3, u8 a4, u8 a5);
u8 ov02_02251EE8(GearPhoneRingManager *gearPhone, Unk_PokegearSTRUCT_14 *a1);
BOOL ov02_02251F20(GearPhoneRingManager *gearPhone);
enum RadioMusicPlayingSeq GetRadioMusicPlayingSeq(void);

#endif
