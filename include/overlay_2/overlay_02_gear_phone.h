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

#define CALL_TRIGGER_ELM_EGG_HATCHED          0
#define CALL_TRIGGER_ELM_POKERUS              1
#define CALL_TRIGGER_BIKE_SHOP_STEPS          2
#define CALL_TRIGGER_BILL_PC_FULL             3
#define CALL_TRIGGER_OAK_UNK4                 4
#define CALL_TRIGGER_DAYCARE_UNK5             5
#define CALL_TRIGGER_BAOBA_UNK6               6
#define CALL_TRIGGER_BAOBA_NEXT_TEST          7
#define CALL_TRIGGER_BAOBA_OBJECT_ARRANGEMENT 8
#define CALL_TRIGGER_BAOBA_MORE_OBJECTS       9
#define CALL_TRIGGER_BAOBA_EVEN_MORE_OBJECTS  10
#define CALL_TRIGGER_BAOBA_MEMORY_LOSS        11
#define CALL_TRIGGER_MOM_BOUGHT_SOMETHING     12
#define NUM_CALL_TRIGGERS                     13

String *GetPhoneBookEntryName(GearPhoneRingManager *gearPhone, enum HeapID heapID);
void GearPhoneRingManager_SetCallerParams(GearPhoneRingManager *phoneRingManager, u8 callerId, u8 a2, u8 a3, u8 a4, u8 a5);
u8 ov02_02251EE8(GearPhoneRingManager *gearPhone, Unk_PokegearSTRUCT_14 *a1);
BOOL ov02_02251F20(GearPhoneRingManager *gearPhone);
enum RadioMusicPlayingSeq GetRadioMusicPlayingSeq(void);

#endif
