#include "trainer_memo.h"

#include "global.h"

#include "constants/events.h"
#include "constants/map_sections.h"
#include "constants/pokemon.h"

#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0302.h"

#include "heap.h"
#include "map_section.h"
#include "message_format.h"
#include "msgdata.h"
#include "pokemon.h"
#include "string_util.h"

#define SETMETDATEPARAM_EGG 0
#define SETMETDATEPARAM_MON 1

typedef enum MetCondition {
    MET_CONDITION_WILD_ENCOUNTER,
    MET_CONDITION_WILD_ENCOUNTER_TRADED,
    MET_CONDITION_WILD_GIFT,
    MET_CONDITION_EGG_HATCHED,
    MET_CONDITION_EGG_HATCHED_TRADED,
    MET_CONDITION_EGG_HATCHED_GIFT,
    MET_CONDITION_EGG_HATCHED_GIFT_TRADED,
    MET_CONDITION_FATEFUL_ENCOUNTER,
    MET_CONDITION_FATEFUL_ENCOUNTER_TRADED,
    MET_CONDITION_FATEFUL_EGG_HATCHED,
    MET_CONDITION_FATEFUL_EGG_HATCHED_TRADED,
    MET_CONDITION_FATEFUL_EGG_HATCHED_ARRIVED,
    MET_CONDITION_FATEFUL_EGG_HATCHED_ARRIVED_TRADED,
    MET_CONDITION_FATEFUL_EGG_HATCHED_GIFT,
    MET_CONDITION_FATEFUL_EGG_HATCHED_GIFT_TRADED,
    MET_CONDITION_MIGRATED,
    MET_CONDITION_EGG,
    MET_CONDITION_EGG_TRADED,
    MET_CONDITION_FATEFUL_EGG,
    MET_CONDITION_FATEFUL_EGG_TRADED,
    MET_CONDITION_FATEFUL_EGG_ARRIVED,
} MetCondition;

static const u16 sFlavorMsgs[6] = {
    msg_0302_00070,
    msg_0302_00065,
    msg_0302_00066,
    msg_0302_00067,
    msg_0302_00068,
    msg_0302_00069,
};

static const u16 sCharactersticMsgs[6][5] = {
    { msg_0302_00071, msg_0302_00072, msg_0302_00073, msg_0302_00074, msg_0302_00075 },
    { msg_0302_00076, msg_0302_00077, msg_0302_00078, msg_0302_00079, msg_0302_00080 },
    { msg_0302_00081, msg_0302_00082, msg_0302_00083, msg_0302_00084, msg_0302_00085 },
    { msg_0302_00086, msg_0302_00087, msg_0302_00088, msg_0302_00089, msg_0302_00090 },
    { msg_0302_00091, msg_0302_00092, msg_0302_00093, msg_0302_00094, msg_0302_00095 },
    { msg_0302_00096, msg_0302_00097, msg_0302_00098, msg_0302_00099, msg_0302_00100 },
};

static MetCondition MonMetCondition(Pokemon *mon, BOOL isMine);
static void FormatNature(Unk0208E600 *a0);
static void FormatDateAndLocationMet(Unk0208E600 *a0, int msgNo);
static void FormatDateAndLocation_Migrated(Unk0208E600 *a0, int msgNo);
static void FormatCharacteristic(Unk0208E600 *a0);
static void FormatFlavorPreference(Unk0208E600 *a0);
static void FormatDateAndLocation_Egg(Unk0208E600 *a0, int msgNo, BOOL hatched);
static void FormatEggWatch(Unk0208E600 *a0);
static void BoxMon_ClearMetDateAndLocation(BoxPokemon *boxMon, int setMetDateParam);
static void BoxMon_SetMetDateAndLocation(BoxPokemon *boxMon, int mapsec, int setMetDateParam);
static void BoxMon_SetFatefulEncounter(BoxPokemon *boxMon);
static void BoxMon_CopyLevelToMetLevel(BoxPokemon *boxMon);
static void BoxMon_SetOriginalTrainerData(BoxPokemon *boxMon, PlayerProfile *profile, enum HeapID heapID);

Unk0208E600 *sub_0208E600(Pokemon *mon, BOOL isMine, enum HeapID heapID, int a3) {
    Unk0208E600 *ptr = Heap_Alloc(heapID, sizeof(Unk0208E600));
    ptr->heapID = heapID;
    ptr->msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0302_bin, heapID);
    ptr->msgFmt = MessageFormat_New_Custom(9, 32, ptr->heapID);
    ptr->mon = mon;
    ptr->isMine = isMine;
    ptr->notepad.natureLine = 0;
    ptr->notepad.nature = NULL;
    ptr->notepad.dateLocationMetLine = 0;
    ptr->notepad.dateLocationMet = NULL;
    ptr->notepad.characteristicLine = 0;
    ptr->notepad.characteristic = NULL;
    ptr->notepad.flavorPreferenceLine = 0;
    ptr->notepad.flavorPreference = NULL;
    ptr->notepad.eggWatchLine = 0;
    ptr->notepad.eggWatch = NULL;

    int metCondition = MonMetCondition(ptr->mon, ptr->isMine);
    switch (metCondition) {
    case MET_CONDITION_WILD_ENCOUNTER:
        ptr->notepad.natureLine = 1;
        FormatNature(ptr);
        ptr->notepad.dateLocationMetLine = 2;
        FormatDateAndLocationMet(ptr, msg_0302_00049);
        ptr->notepad.characteristicLine = 6;
        FormatCharacteristic(ptr);
        ptr->notepad.flavorPreferenceLine = 7;
        FormatFlavorPreference(ptr);
        break;
    case MET_CONDITION_WILD_ENCOUNTER_TRADED:
        ptr->notepad.natureLine = 1;
        FormatNature(ptr);
        ptr->notepad.dateLocationMetLine = 2;
        FormatDateAndLocationMet(ptr, msg_0302_00050);
        ptr->notepad.characteristicLine = 6;
        FormatCharacteristic(ptr);
        ptr->notepad.flavorPreferenceLine = 7;
        FormatFlavorPreference(ptr);
        break;
    case MET_CONDITION_WILD_GIFT:
        ptr->notepad.natureLine = 1;
        FormatNature(ptr);
        ptr->notepad.dateLocationMetLine = 2;
        FormatDateAndLocationMet(ptr, msg_0302_00051);
        ptr->notepad.characteristicLine = 6;
        FormatCharacteristic(ptr);
        ptr->notepad.flavorPreferenceLine = 7;
        FormatFlavorPreference(ptr);
        break;
    case MET_CONDITION_EGG_HATCHED:
        ptr->notepad.natureLine = 1;
        FormatNature(ptr);
        ptr->notepad.dateLocationMetLine = 2;
        FormatDateAndLocationMet(ptr, msg_0302_00052);
        ptr->notepad.characteristicLine = 8;
        FormatCharacteristic(ptr);
        ptr->notepad.flavorPreferenceLine = 9;
        FormatFlavorPreference(ptr);
        break;
    case MET_CONDITION_EGG_HATCHED_TRADED:
        ptr->notepad.natureLine = 1;
        FormatNature(ptr);
        ptr->notepad.dateLocationMetLine = 2;
        FormatDateAndLocationMet(ptr, msg_0302_00053);
        ptr->notepad.characteristicLine = 8;
        FormatCharacteristic(ptr);
        ptr->notepad.flavorPreferenceLine = 9;
        FormatFlavorPreference(ptr);
        break;
    case MET_CONDITION_EGG_HATCHED_GIFT:
        ptr->notepad.natureLine = 1;
        FormatNature(ptr);
        ptr->notepad.dateLocationMetLine = 2;
        FormatDateAndLocationMet(ptr, msg_0302_00054);
        ptr->notepad.characteristicLine = 8;
        FormatCharacteristic(ptr);
        ptr->notepad.flavorPreferenceLine = 9;
        FormatFlavorPreference(ptr);
        break;
    case MET_CONDITION_EGG_HATCHED_GIFT_TRADED:
        ptr->notepad.natureLine = 1;
        FormatNature(ptr);
        ptr->notepad.dateLocationMetLine = 2;
        FormatDateAndLocationMet(ptr, msg_0302_00055);
        ptr->notepad.characteristicLine = 8;
        FormatCharacteristic(ptr);
        ptr->notepad.flavorPreferenceLine = 9;
        FormatFlavorPreference(ptr);
        break;
    case MET_CONDITION_FATEFUL_ENCOUNTER:
        ptr->notepad.natureLine = 1;
        FormatNature(ptr);
        ptr->notepad.dateLocationMetLine = 2;
        FormatDateAndLocationMet(ptr, msg_0302_00056);
        ptr->notepad.characteristicLine = 7;
        FormatCharacteristic(ptr);
        ptr->notepad.flavorPreferenceLine = 8;
        FormatFlavorPreference(ptr);
        break;
    case MET_CONDITION_FATEFUL_ENCOUNTER_TRADED:
        ptr->notepad.natureLine = 1;
        FormatNature(ptr);
        ptr->notepad.dateLocationMetLine = 2;
        FormatDateAndLocationMet(ptr, msg_0302_00057);
        ptr->notepad.characteristicLine = 7;
        FormatCharacteristic(ptr);
        ptr->notepad.flavorPreferenceLine = 8;
        FormatFlavorPreference(ptr);
        break;
    case MET_CONDITION_FATEFUL_EGG_HATCHED:
        ptr->notepad.natureLine = 1;
        FormatNature(ptr);
        ptr->notepad.dateLocationMetLine = 2;
        FormatDateAndLocationMet(ptr, msg_0302_00058);
        ptr->notepad.characteristicLine = 9;
        FormatCharacteristic(ptr);
        break;
    case MET_CONDITION_FATEFUL_EGG_HATCHED_TRADED:
        ptr->notepad.natureLine = 1;
        FormatNature(ptr);
        ptr->notepad.dateLocationMetLine = 2;
        FormatDateAndLocationMet(ptr, msg_0302_00059);
        ptr->notepad.characteristicLine = 9;
        FormatCharacteristic(ptr);
        break;
    case MET_CONDITION_FATEFUL_EGG_HATCHED_ARRIVED:
        ptr->notepad.natureLine = 1;
        FormatNature(ptr);
        ptr->notepad.dateLocationMetLine = 2;
        FormatDateAndLocationMet(ptr, msg_0302_00060);
        ptr->notepad.characteristicLine = 9;
        FormatCharacteristic(ptr);
        break;
    case MET_CONDITION_FATEFUL_EGG_HATCHED_ARRIVED_TRADED:
        ptr->notepad.natureLine = 1;
        FormatNature(ptr);
        ptr->notepad.dateLocationMetLine = 2;
        FormatDateAndLocationMet(ptr, msg_0302_00061);
        ptr->notepad.characteristicLine = 9;
        FormatCharacteristic(ptr);
        break;
    case MET_CONDITION_FATEFUL_EGG_HATCHED_GIFT:
        ptr->notepad.natureLine = 1;
        FormatNature(ptr);
        ptr->notepad.dateLocationMetLine = 2;
        FormatDateAndLocationMet(ptr, msg_0302_00062);
        ptr->notepad.characteristicLine = 9;
        FormatCharacteristic(ptr);
        break;
    case MET_CONDITION_FATEFUL_EGG_HATCHED_GIFT_TRADED:
        ptr->notepad.natureLine = 1;
        FormatNature(ptr);
        ptr->notepad.dateLocationMetLine = 2;
        FormatDateAndLocationMet(ptr, msg_0302_00063);
        ptr->notepad.characteristicLine = 9;
        FormatCharacteristic(ptr);
        break;
    case MET_CONDITION_MIGRATED:
        ptr->notepad.natureLine = 1;
        FormatNature(ptr);
        ptr->notepad.dateLocationMetLine = 2;
        FormatDateAndLocation_Migrated(ptr, msg_0302_00064);
        ptr->notepad.characteristicLine = 6;
        FormatCharacteristic(ptr);
        ptr->notepad.flavorPreferenceLine = 7;
        FormatFlavorPreference(ptr);
        break;
    case MET_CONDITION_EGG:
        ptr->notepad.dateLocationMetLine = 1;
        FormatDateAndLocation_Egg(ptr, msg_0302_00101, FALSE);
        ptr->notepad.eggWatchLine = 6;
        FormatEggWatch(ptr);
        break;
    case MET_CONDITION_EGG_TRADED:
        ptr->notepad.dateLocationMetLine = 1;
        FormatDateAndLocation_Egg(ptr, msg_0302_00102, TRUE);
        ptr->notepad.eggWatchLine = 6;
        FormatEggWatch(ptr);
        break;
    case MET_CONDITION_FATEFUL_EGG:
        ptr->notepad.dateLocationMetLine = 1;
        FormatDateAndLocation_Egg(ptr, msg_0302_00103, FALSE);
        ptr->notepad.eggWatchLine = 6;
        FormatEggWatch(ptr);
        break;
    case MET_CONDITION_FATEFUL_EGG_TRADED:
        ptr->notepad.dateLocationMetLine = 1;
        FormatDateAndLocation_Egg(ptr, msg_0302_00103, TRUE);
        ptr->notepad.eggWatchLine = 6;
        FormatEggWatch(ptr);
        break;
    case MET_CONDITION_FATEFUL_EGG_ARRIVED:
        ptr->notepad.dateLocationMetLine = 1;
        FormatDateAndLocation_Egg(ptr, msg_0302_00104, 0);
        ptr->notepad.eggWatchLine = 6;
        FormatEggWatch(ptr);
        break;
    }
    return ptr;
}

void sub_0208E994(Unk0208E600 *a0) {
    if (a0->notepad.nature) {
        Heap_Free(a0->notepad.nature);
    }
    if (a0->notepad.dateLocationMet) {
        Heap_Free(a0->notepad.dateLocationMet);
    }
    if (a0->notepad.characteristic) {
        Heap_Free(a0->notepad.characteristic);
    }
    if (a0->notepad.flavorPreference) {
        Heap_Free(a0->notepad.flavorPreference);
    }
    if (a0->notepad.eggWatch) {
        Heap_Free(a0->notepad.eggWatch);
    }
    MessageFormat_Delete(a0->msgFmt);
    DestroyMsgData(a0->msgData);
    Heap_Free(a0);
}

// Returns true if the Pokemon has the proper metadata to trigger the event.
BOOL MonMetadataMatchesEvent(u8 eventNo, Pokemon *mon, BOOL isMine) {
    u8 metCondition = MonMetCondition(mon, isMine);
    u8 version = GetMonData(mon, MON_DATA_MET_GAME, NULL);

    if ((metCondition == MET_CONDITION_FATEFUL_ENCOUNTER || metCondition == MET_CONDITION_FATEFUL_ENCOUNTER_TRADED) && (eventNo != EVENT_ARCEUS_HALL_OF_ORIGIN)) {
        return TRUE;
    }

    switch (eventNo) {
    case EVENT_SPIKY_EARED_PICHU:
        break;
    case EVENT_ARCEUS_HALL_OF_ORIGIN:
        if (metCondition == 1) {
            switch (version) {
            case VERSION_DIAMOND:
            case VERSION_PEARL:
            case VERSION_PLATINUM:
                if (GetMonData(mon, MON_DATA_MET_LOCATION, NULL) == sub_02017FE4(MAPSECTYPE_NORMAL, MAPSEC_HALL_OF_ORIGIN)) {
                    return TRUE;
                }
            }
        }
        break;
    case EVENT_ARCEUS_MOVIE_GIFT:
    case EVENT_CELEBI:
        break;
    }
    return FALSE;
}

static void FormatNature(Unk0208E600 *a0) {
    int nature = GetMonNature(a0->mon);
    if (nature <= NATURE_QUIRKY) {
        a0->notepad.nature = String_New(0x48, a0->heapID);
        ReadMsgDataIntoString(a0->msgData, msg_0302_00024 + nature, a0->notepad.nature);
    }
}

static void FormatDateAndLocationMet(Unk0208E600 *a0, int msgNo) {
    String *str = String_New(0x240, a0->heapID);
    a0->notepad.dateLocationMet = String_New(0x240, a0->heapID);

    ReadMsgDataIntoString(a0->msgData, msgNo, str);

    BufferIntegerAsString(a0->msgFmt, 0, GetMonData(a0->mon, MON_DATA_MET_YEAR, NULL), 2, PRINTING_MODE_LEADING_ZEROS, TRUE);
    BufferMonthNameAbbr(a0->msgFmt, 1, GetMonData(a0->mon, MON_DATA_MET_MONTH, NULL));
    BufferIntegerAsString(a0->msgFmt, 2, GetMonData(a0->mon, MON_DATA_MET_DAY, NULL), 2, PRINTING_MODE_LEFT_ALIGN, TRUE);
    BufferIntegerAsString(a0->msgFmt, 3, GetMonData(a0->mon, MON_DATA_MET_LEVEL, NULL), 3, PRINTING_MODE_LEFT_ALIGN, TRUE);
    BufferLocationName(a0->msgFmt, 4, GetMonData(a0->mon, MON_DATA_MET_LOCATION, NULL));
    BufferIntegerAsString(a0->msgFmt, 5, GetMonData(a0->mon, MON_DATA_EGG_YEAR, NULL), 2, PRINTING_MODE_LEADING_ZEROS, TRUE);
    BufferMonthNameAbbr(a0->msgFmt, 6, GetMonData(a0->mon, MON_DATA_EGG_MONTH, NULL));
    BufferIntegerAsString(a0->msgFmt, 7, GetMonData(a0->mon, MON_DATA_EGG_DAY, NULL), 2, PRINTING_MODE_LEFT_ALIGN, TRUE);
    BufferLocationName(a0->msgFmt, 8, GetMonData(a0->mon, MON_DATA_EGG_LOCATION, NULL));

    StringExpandPlaceholders(a0->msgFmt, a0->notepad.dateLocationMet, str);
    String_Delete(str);
}

static void FormatDateAndLocation_Migrated(Unk0208E600 *a0, int msgNo) {
    int version;

    String *str = String_New(0x120, a0->heapID);
    a0->notepad.dateLocationMet = String_New(0x120, a0->heapID);

    ReadMsgDataIntoString(a0->msgData, msgNo, str);

    BufferIntegerAsString(a0->msgFmt, 0, GetMonData(a0->mon, MON_DATA_MET_YEAR, NULL), 2, PRINTING_MODE_LEADING_ZEROS, TRUE);
    BufferMonthNameAbbr(a0->msgFmt, 1, GetMonData(a0->mon, MON_DATA_MET_MONTH, NULL));
    BufferIntegerAsString(a0->msgFmt, 2, GetMonData(a0->mon, MON_DATA_MET_DAY, NULL), 2, PRINTING_MODE_LEFT_ALIGN, TRUE);
    BufferIntegerAsString(a0->msgFmt, 3, GetMonData(a0->mon, MON_DATA_MET_LEVEL, NULL), 3, PRINTING_MODE_LEFT_ALIGN, TRUE);

    version = GetMonData(a0->mon, MON_DATA_MET_GAME, NULL);
    switch (version) {
    case 0:
    case 6:
    case 9:
    case 13:
    case 14:
    default:
        BufferLocationName(a0->msgFmt, 4, sub_02017FE4(MAPSECTYPE_GIFT, MAPLOC(METLOC_DASHES)));
        break;
    case VERSION_FIRERED:
    case VERSION_LEAFGREEN:
        BufferLocationName(a0->msgFmt, 4, sub_02017FE4(MAPSECTYPE_GIFT, MAPLOC(METLOC_KANTO)));
        break;
    case VERSION_HEARTGOLD:
    case VERSION_SOULSILVER:
        BufferLocationName(a0->msgFmt, 4, sub_02017FE4(MAPSECTYPE_GIFT, MAPLOC(METLOC_JOHTO)));
        break;
    case VERSION_SAPPHIRE:
    case VERSION_RUBY:
    case VERSION_EMERALD:
        BufferLocationName(a0->msgFmt, 4, sub_02017FE4(MAPSECTYPE_GIFT, MAPLOC(METLOC_HOENN)));
        break;
    case VERSION_GAMECUBE:
        BufferLocationName(a0->msgFmt, 4, sub_02017FE4(MAPSECTYPE_GIFT, MAPLOC(METLOC_DISTANT_LAND)));
        break;
    case VERSION_DIAMOND:
    case VERSION_PEARL:
    case VERSION_PLATINUM:
        BufferLocationName(a0->msgFmt, 4, sub_02017FE4(MAPSECTYPE_GIFT, MAPLOC(METLOC_DASHES /*METLOC_SINNOH*/)));
        break;
    }

    StringExpandPlaceholders(a0->msgFmt, a0->notepad.dateLocationMet, str);
    String_Delete(str);
}

static void FormatDateAndLocation_Egg(Unk0208E600 *a0, int msgNo, BOOL hatched) {
    String *str = String_New(0x168, a0->heapID);
    a0->notepad.dateLocationMet = String_New(0x168, a0->heapID);

    ReadMsgDataIntoString(a0->msgData, msgNo, str);

    if (!hatched) {
        BufferIntegerAsString(a0->msgFmt, 5, GetMonData(a0->mon, MON_DATA_EGG_YEAR, NULL), 2, PRINTING_MODE_LEADING_ZEROS, TRUE);
        BufferMonthNameAbbr(a0->msgFmt, 6, GetMonData(a0->mon, MON_DATA_EGG_MONTH, NULL));
        BufferIntegerAsString(a0->msgFmt, 7, GetMonData(a0->mon, MON_DATA_EGG_DAY, NULL), 2, PRINTING_MODE_LEFT_ALIGN, TRUE);
        BufferLocationName(a0->msgFmt, 8, GetMonData(a0->mon, MON_DATA_EGG_LOCATION, NULL));
    } else {
        BufferIntegerAsString(a0->msgFmt, 5, GetMonData(a0->mon, MON_DATA_MET_YEAR, NULL), 2, PRINTING_MODE_LEADING_ZEROS, TRUE);
        BufferMonthNameAbbr(a0->msgFmt, 6, GetMonData(a0->mon, MON_DATA_MET_MONTH, NULL));
        BufferIntegerAsString(a0->msgFmt, 7, GetMonData(a0->mon, MON_DATA_MET_DAY, NULL), 2, PRINTING_MODE_LEFT_ALIGN, TRUE);
        BufferLocationName(a0->msgFmt, 8, GetMonData(a0->mon, MON_DATA_MET_LOCATION, NULL));
    }

    StringExpandPlaceholders(a0->msgFmt, a0->notepad.dateLocationMet, str);
    String_Delete(str);
}

static void FormatCharacteristic(Unk0208E600 *a0) {
    int index;
    int maxIv;

    a0->notepad.characteristic = String_New(0x48, a0->heapID);

    int hpIv = GetMonData(a0->mon, MON_DATA_HP_IV, NULL);
    int atkIv = GetMonData(a0->mon, MON_DATA_ATK_IV, NULL);
    int defIv = GetMonData(a0->mon, MON_DATA_DEF_IV, NULL);
    int speedIv = GetMonData(a0->mon, MON_DATA_SPEED_IV, NULL);
    int spAtkIv = GetMonData(a0->mon, MON_DATA_SPATK_IV, NULL);
    int spDefIv = GetMonData(a0->mon, MON_DATA_SPDEF_IV, NULL);
    u32 personality = GetMonData(a0->mon, MON_DATA_PERSONALITY, NULL);

    switch (personality % 6) {
    case 0:
    default:
        index = 0;
        maxIv = hpIv;
        if (maxIv < atkIv) {
            index = 1;
            maxIv = atkIv;
        }
        if (maxIv < defIv) {
            index = 2;
            maxIv = defIv;
        }
        if (maxIv < speedIv) {
            index = 3;
            maxIv = speedIv;
        }
        if (maxIv < spAtkIv) {
            index = 4;
            maxIv = spAtkIv;
        }
        if (maxIv < spDefIv) {
            index = 5;
            maxIv = spDefIv;
        }
        break;
    case 1:
        index = 1;
        maxIv = atkIv;
        if (maxIv < defIv) {
            index = 2;
            maxIv = defIv;
        }
        if (maxIv < speedIv) {
            index = 3;
            maxIv = speedIv;
        }
        if (maxIv < spAtkIv) {
            index = 4;
            maxIv = spAtkIv;
        }
        if (maxIv < spDefIv) {
            index = 5;
            maxIv = spDefIv;
        }
        if (maxIv < hpIv) {
            index = 0;
            maxIv = hpIv;
        }
        break;
    case 2:
        index = 2;
        maxIv = defIv;
        if (maxIv < speedIv) {
            index = 3;
            maxIv = speedIv;
        }
        if (maxIv < spAtkIv) {
            index = 4;
            maxIv = spAtkIv;
        }
        if (maxIv < spDefIv) {
            index = 5;
            maxIv = spDefIv;
        }
        if (maxIv < hpIv) {
            index = 0;
            maxIv = hpIv;
        }
        if (maxIv < atkIv) {
            index = 1;
            maxIv = atkIv;
        }
        break;
    case 3:
        index = 3;
        maxIv = speedIv;
        if (maxIv < spAtkIv) {
            index = 4;
            maxIv = spAtkIv;
        }
        if (maxIv < spDefIv) {
            index = 5;
            maxIv = spDefIv;
        }
        if (maxIv < hpIv) {
            index = 0;
            maxIv = hpIv;
        }
        if (maxIv < atkIv) {
            index = 1;
            maxIv = atkIv;
        }
        if (maxIv < defIv) {
            index = 2;
            maxIv = defIv;
        }
        break;
    case 4:
        index = 4;
        maxIv = spAtkIv;
        if (maxIv < spDefIv) {
            index = 5;
            maxIv = spDefIv;
        }
        if (maxIv < hpIv) {
            index = 0;
            maxIv = hpIv;
        }
        if (maxIv < atkIv) {
            index = 1;
            maxIv = atkIv;
        }
        if (maxIv < defIv) {
            index = 2;
            maxIv = defIv;
        }
        if (maxIv < speedIv) {
            index = 3;
            maxIv = speedIv;
        }
        break;
    case 5:
        index = 5;
        maxIv = spDefIv;
        if (maxIv < hpIv) {
            index = 0;
            maxIv = hpIv;
        }
        if (maxIv < atkIv) {
            index = 1;
            maxIv = atkIv;
        }
        if (maxIv < defIv) {
            index = 2;
            maxIv = defIv;
        }
        if (maxIv < speedIv) {
            index = 3;
            maxIv = speedIv;
        }
        if (maxIv < spAtkIv) {
            index = 4;
            maxIv = spAtkIv;
        }
        break;
    }
    ReadMsgDataIntoString(a0->msgData, sCharactersticMsgs[index][maxIv % 5], a0->notepad.characteristic);
}

static void FormatFlavorPreference(Unk0208E600 *a0) {
    a0->notepad.flavorPreference = String_New(0x48, a0->heapID);
    int index = 0;
    for (int flavor = FLAVOR_START; flavor < FLAVOR_MAX; flavor++) {
        int preference = MonGetFlavorPreference(a0->mon, flavor);
        if (preference == 1) {
            index = flavor + 1;
        }
    }
    ReadMsgDataIntoString(a0->msgData, sFlavorMsgs[index], a0->notepad.flavorPreference);
}

static void FormatEggWatch(Unk0208E600 *a0) {
    int msgNo;

    int eggCycles = GetMonData(a0->mon, MON_DATA_FRIENDSHIP, NULL);
    a0->notepad.eggWatch = String_New(0x120, a0->heapID);
    if (eggCycles <= 5) {
        msgNo = msg_0302_00105;
    } else if (eggCycles <= 10) {
        msgNo = msg_0302_00106;
    } else if (eggCycles <= 40) {
        msgNo = msg_0302_00107;
    } else {
        msgNo = msg_0302_00108;
    }
    ReadMsgDataIntoString(a0->msgData, msgNo, a0->notepad.eggWatch);
}

static MetCondition MonMetCondition(Pokemon *mon, BOOL isMine) {
    if (!GetMonData(mon, MON_DATA_IS_EGG, NULL)) {
        if (GetMonData(mon, MON_DATA_EGG_LOCATION, NULL) == 0) {
            if (GetMonData(mon, MON_DATA_MET_LOCATION, NULL) == sub_02017FE4(MAPSECTYPE_NORMAL, MAPLOC(MAPSEC_PAL_PARK))) {
                return MET_CONDITION_MIGRATED;
            }
            if (GetMonData(mon, MON_DATA_FATEFUL_ENCOUNTER, NULL) == TRUE) {
                if (isMine == TRUE) {
                    return MET_CONDITION_FATEFUL_ENCOUNTER;
                }
                return MET_CONDITION_FATEFUL_ENCOUNTER_TRADED;
            }

            if (GetMonData(mon, MON_DATA_MET_LOCATION, NULL) == sub_02017FE4(MAPSECTYPE_GIFT, MAPLOC(METLOC_LINK_TRADE))) {
                return MET_CONDITION_WILD_GIFT;
            }
            if (isMine == TRUE) {
                return MET_CONDITION_WILD_ENCOUNTER;
            }
            return MET_CONDITION_WILD_ENCOUNTER_TRADED;
        }
        if (GetMonData(mon, MON_DATA_FATEFUL_ENCOUNTER, NULL) == TRUE) {
            if (GetMonData(mon, MON_DATA_EGG_LOCATION, NULL) == sub_02017FE4(MAPSECTYPE_GIFT, MAPLOC(METLOC_LINK_TRADE_2))) {
                if (isMine == TRUE) {
                    return MET_CONDITION_FATEFUL_EGG_HATCHED_GIFT;
                }
                return MET_CONDITION_FATEFUL_EGG_HATCHED_GIFT_TRADED;
            }
            if (GetMonData(mon, MON_DATA_EGG_LOCATION, NULL) == sub_02017FE4(MAPSECTYPE_EXTERNAL, MAPLOC(METLOC_POKEMON_RANGER))) {
                if (isMine == TRUE) {
                    return MET_CONDITION_FATEFUL_EGG_HATCHED_ARRIVED;
                }
                return MET_CONDITION_FATEFUL_EGG_HATCHED_ARRIVED_TRADED;
            }
            if (isMine == TRUE) {
                return MET_CONDITION_FATEFUL_EGG_HATCHED;
            }
            return MET_CONDITION_FATEFUL_EGG_HATCHED_TRADED;
        }

        if ((GetMonData(mon, MON_DATA_EGG_LOCATION, NULL) == sub_02017FE4(MAPSECTYPE_GIFT, MAPLOC(METLOC_LINK_TRADE)))
            || (GetMonData(mon, MON_DATA_EGG_LOCATION, NULL) == sub_02017FE4(MAPSECTYPE_GIFT, MAPLOC(METLOC_DAY_CARE_COUPLE)))
            || (GetMonData(mon, MON_DATA_EGG_LOCATION, NULL) == sub_02017FE4(MAPSECTYPE_GIFT, MAPLOC(METLOC_TRAVELING_MAN)))
            || (GetMonData(mon, MON_DATA_EGG_LOCATION, NULL) == sub_02017FE4(MAPSECTYPE_GIFT, MAPLOC(METLOC_RILEY)))
            || (GetMonData(mon, MON_DATA_EGG_LOCATION, NULL) == sub_02017FE4(MAPSECTYPE_GIFT, MAPLOC(METLOC_CYNTHIA)))
            || (GetMonData(mon, MON_DATA_EGG_LOCATION, NULL) == sub_02017FE4(MAPSECTYPE_GIFT, MAPLOC(METLOC_MR_POKEMON)))
            || (GetMonData(mon, MON_DATA_EGG_LOCATION, NULL) == sub_02017FE4(MAPSECTYPE_GIFT, MAPLOC(METLOC_PRIMO)))) {
            if (isMine == TRUE) {
                return MET_CONDITION_EGG_HATCHED_GIFT;
            }
            return MET_CONDITION_EGG_HATCHED_GIFT_TRADED;
        }

        if (isMine == TRUE) {
            return MET_CONDITION_EGG_HATCHED;
        }
        return MET_CONDITION_EGG_HATCHED_TRADED;
    }

    if (isMine == TRUE) {
        if (GetMonData(mon, MON_DATA_FATEFUL_ENCOUNTER, NULL) == TRUE) {
            if (GetMonData(mon, MON_DATA_EGG_LOCATION, NULL) == sub_02017FE4(MAPSECTYPE_EXTERNAL, MAPLOC(METLOC_POKEMON_RANGER))) {
                return MET_CONDITION_FATEFUL_EGG_ARRIVED;
            }
            return MET_CONDITION_FATEFUL_EGG;
        }
        return MET_CONDITION_EGG;
    }
    if (GetMonData(mon, MON_DATA_FATEFUL_ENCOUNTER, NULL) == TRUE) {
        return MET_CONDITION_FATEFUL_EGG_TRADED;
    }
    return MET_CONDITION_EGG_TRADED;
}

void MonSetTrainerMemo(Pokemon *mon, PlayerProfile *profile, int strat, int mapsec, enum HeapID heapID) {
    BoxMonSetTrainerMemo(&mon->box, profile, strat, mapsec, heapID);
}

void BoxMonSetTrainerMemo(BoxPokemon *boxMon, PlayerProfile *profile, int strat, int mapsec, enum HeapID heapID) {
    int var;

    switch (strat) {
    case 0:
        if (mapsec > sub_02017FE4(MAPSECTYPE_GIFT, MAPLOC(METLOC_DAY_CARE_COUPLE))) {
            mapsec = sub_02017FE4(MAPSECTYPE_EXTERNAL, MAPLOC(METLOC_FARAWAY_PLACE));
        }
        if (!GetBoxMonData(boxMon, MON_DATA_IS_EGG, NULL)) {
            BoxMon_ClearMetDateAndLocation(boxMon, SETMETDATEPARAM_EGG);
            BoxMon_SetMetDateAndLocation(boxMon, mapsec, SETMETDATEPARAM_MON);
            BoxMon_CopyLevelToMetLevel(boxMon);
        } else {
            BoxMon_SetMetDateAndLocation(boxMon, mapsec, SETMETDATEPARAM_EGG);
            BoxMon_ClearMetDateAndLocation(boxMon, SETMETDATEPARAM_MON);
        }
        BoxMon_SetOriginalTrainerData(boxMon, profile, heapID);
        break;
    case 7:
        if (mapsec > sub_02017FE4(MAPSECTYPE_GIFT, MAPLOC(METLOC_DAY_CARE_COUPLE))) {
            mapsec = sub_02017FE4(MAPSECTYPE_EXTERNAL, MAPLOC(METLOC_FARAWAY_PLACE));
        }
        if (!GetBoxMonData(boxMon, MON_DATA_IS_EGG, NULL)) {
            BoxMon_ClearMetDateAndLocation(boxMon, SETMETDATEPARAM_EGG);
            BoxMon_SetMetDateAndLocation(boxMon, mapsec, SETMETDATEPARAM_MON);
            BoxMon_CopyLevelToMetLevel(boxMon);
            break;
        }
        BoxMon_SetMetDateAndLocation(boxMon, mapsec, SETMETDATEPARAM_EGG);
        BoxMon_ClearMetDateAndLocation(boxMon, SETMETDATEPARAM_MON);
        break;
    case 1:
        if (!GetBoxMonData(boxMon, MON_DATA_IS_EGG, NULL)) {
            BoxMon_ClearMetDateAndLocation(boxMon, SETMETDATEPARAM_EGG);
            BoxMon_SetMetDateAndLocation(boxMon, sub_02017FE4(MAPSECTYPE_GIFT, MAPLOC(METLOC_LINK_TRADE)), SETMETDATEPARAM_MON);
            BoxMon_CopyLevelToMetLevel(boxMon);
            break;
        }
        BoxMon_ClearMetDateAndLocation(boxMon, SETMETDATEPARAM_EGG);
        BoxMon_SetMetDateAndLocation(boxMon, sub_02017FE4(MAPSECTYPE_GIFT, MAPLOC(METLOC_LINK_TRADE)), SETMETDATEPARAM_MON);
        break;
    case 2:
        BoxMon_ClearMetDateAndLocation(boxMon, SETMETDATEPARAM_EGG);
        BoxMon_SetMetDateAndLocation(boxMon, sub_02017FE4(MAPSECTYPE_NORMAL, MAPLOC(MAPSEC_PAL_PARK)), SETMETDATEPARAM_MON);
        BoxMon_CopyLevelToMetLevel(boxMon);
        break;
    case 3:
        BoxMon_SetMetDateAndLocation(boxMon, mapsec, SETMETDATEPARAM_EGG);
        BoxMon_ClearMetDateAndLocation(boxMon, SETMETDATEPARAM_MON);
        BoxMon_SetOriginalTrainerData(boxMon, profile, heapID);
        break;
    case 4:
        if (BoxmonBelongsToPlayer(boxMon, profile, heapID) == TRUE) {
            if (!GetBoxMonData(boxMon, MON_DATA_IS_EGG, NULL)) {
                BoxMon_ClearMetDateAndLocation(boxMon, SETMETDATEPARAM_EGG);
                BoxMon_SetMetDateAndLocation(boxMon, mapsec, SETMETDATEPARAM_MON);
                BoxMon_CopyLevelToMetLevel(boxMon);
            } else {
                BoxMon_SetMetDateAndLocation(boxMon, mapsec, SETMETDATEPARAM_EGG);
                BoxMon_ClearMetDateAndLocation(boxMon, SETMETDATEPARAM_MON);
            }
        } else if (!GetBoxMonData(boxMon, MON_DATA_IS_EGG, NULL)) {
            BoxMon_ClearMetDateAndLocation(boxMon, SETMETDATEPARAM_EGG);
            BoxMon_SetMetDateAndLocation(boxMon, mapsec, SETMETDATEPARAM_MON);
            BoxMon_CopyLevelToMetLevel(boxMon);
        } else {
            BoxMon_ClearMetDateAndLocation(boxMon, SETMETDATEPARAM_EGG);
            BoxMon_SetMetDateAndLocation(boxMon, mapsec, SETMETDATEPARAM_MON);
        }
        BoxMon_SetFatefulEncounter(boxMon);
        break;
    case 5:
        if (GetBoxMonData(boxMon, MON_DATA_IS_EGG, NULL)) {
            BoxMon_SetMetDateAndLocation(boxMon, sub_02017FE4(MAPSECTYPE_GIFT, MAPLOC(METLOC_LINK_TRADE_2)), SETMETDATEPARAM_MON);
        }
        break;
    case 6:
        if (mapsec > sub_02017FE4(MAPSECTYPE_GIFT, MAPLOC(METLOC_DAY_CARE_COUPLE))) {
            mapsec = MAPSEC_MYSTERY_ZONE;
        }
        if (!BoxmonBelongsToPlayer(boxMon, profile, heapID)) {
            var = GetBoxMonData(boxMon, MON_DATA_MET_LOCATION, NULL);
            SetBoxMonData(boxMon, MON_DATA_EGG_LOCATION, &var);

            var = GetBoxMonData(boxMon, MON_DATA_MET_YEAR, NULL);
            SetBoxMonData(boxMon, MON_DATA_EGG_YEAR, &var);

            var = GetBoxMonData(boxMon, MON_DATA_MET_MONTH, NULL);
            SetBoxMonData(boxMon, MON_DATA_EGG_MONTH, &var);

            var = GetBoxMonData(boxMon, MON_DATA_MET_DAY, NULL);
            SetBoxMonData(boxMon, MON_DATA_EGG_DAY, &var);
        }
        BoxMon_SetMetDateAndLocation(boxMon, mapsec, SETMETDATEPARAM_MON);
        BoxMon_SetOriginalTrainerData(boxMon, profile, heapID);
        break;
    }
}

static void BoxMon_SetOriginalTrainerData(BoxPokemon *boxMon, PlayerProfile *profile, enum HeapID heapID) {
    u32 otId = PlayerProfile_GetTrainerID(profile);
    u32 gender = PlayerProfile_GetTrainerGender(profile);
    String *name = PlayerProfile_GetPlayerName_NewString(profile, heapID);

    SetBoxMonData(boxMon, MON_DATA_OT_ID, &otId);
    SetBoxMonData(boxMon, MON_DATA_OT_GENDER, &gender);
    SetBoxMonData(boxMon, MON_DATA_OT_NAME_STRING, name);

    String_Delete(name);
}

static void BoxMon_SetMetDateAndLocation(BoxPokemon *boxMon, int mapsec, int setMetDateParam) {
    RTCDate date;

    GF_RTC_CopyDate(&date);
    if (setMetDateParam == SETMETDATEPARAM_EGG) {
        SetBoxMonData(boxMon, MON_DATA_EGG_LOCATION, &mapsec);
        SetBoxMonData(boxMon, MON_DATA_EGG_YEAR, &date.year);
        SetBoxMonData(boxMon, MON_DATA_EGG_MONTH, &date.month);
        SetBoxMonData(boxMon, MON_DATA_EGG_DAY, &date.day);
    } else {
        SetBoxMonData(boxMon, MON_DATA_MET_LOCATION, &mapsec);
        SetBoxMonData(boxMon, MON_DATA_MET_YEAR, &date.year);
        SetBoxMonData(boxMon, MON_DATA_MET_MONTH, &date.month);
        SetBoxMonData(boxMon, MON_DATA_MET_DAY, &date.day);
    }
}

static void BoxMon_ClearMetDateAndLocation(BoxPokemon *boxMon, int setMetDateParam) {
    int zero = 0;
    if (setMetDateParam == SETMETDATEPARAM_EGG) {
        SetBoxMonData(boxMon, MON_DATA_EGG_LOCATION, &zero);
        SetBoxMonData(boxMon, MON_DATA_EGG_YEAR, &zero);
        SetBoxMonData(boxMon, MON_DATA_EGG_MONTH, &zero);
        SetBoxMonData(boxMon, MON_DATA_EGG_DAY, &zero);
    } else {
        SetBoxMonData(boxMon, MON_DATA_MET_LOCATION, &zero);
        SetBoxMonData(boxMon, MON_DATA_MET_YEAR, &zero);
        SetBoxMonData(boxMon, MON_DATA_MET_MONTH, &zero);
        SetBoxMonData(boxMon, MON_DATA_MET_DAY, &zero);
    }
}

static void BoxMon_CopyLevelToMetLevel(BoxPokemon *boxMon) {
    int level = GetBoxMonData(boxMon, MON_DATA_LEVEL, NULL);
    SetBoxMonData(boxMon, MON_DATA_MET_LEVEL, &level);
}

static void BoxMon_SetFatefulEncounter(BoxPokemon *boxMon) {
    int var = 1;
    SetBoxMonData(boxMon, MON_DATA_FATEFUL_ENCOUNTER, &var);
}
