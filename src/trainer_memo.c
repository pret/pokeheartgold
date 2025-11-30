#include "trainer_memo.h"

#include "global.h"

#include "constants/events.h"
#include "constants/map_sections.h"
#include "constants/pokemon.h"

#include "msgdata/msg.naix"
#include "msgdata/msg/pokemon_summary_screen.h"

#include "heap.h"
#include "map_section.h"
#include "message_format.h"
#include "msgdata.h"
#include "pokemon.h"
#include "string_util.h"

#define SETMETDATEPARAM_EGG 0
#define SETMETDATEPARAM_MON 1

enum MetCondition {
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
};

static const u16 sFlavorMsgs[6] = {
    PokemonSummary_Text_HappilyEatsAnything,
    PokemonSummary_Text_LikesSpicyFood,
    PokemonSummary_Text_LikesDryFood,
    PokemonSummary_Text_LikesSweetFood,
    PokemonSummary_Text_LikesBitterFood,
    PokemonSummary_Text_LikesSourFood,
};

static const u16 sCharactersticMsgs[6][5] = {
    { PokemonSummary_Text_LovesToEat, PokemonSummary_Text_OftenDozesOff, PokemonSummary_Text_OftenScattersThings, PokemonSummary_Text_ScattersThingsOften, PokemonSummary_Text_LikesToRelax },
    { PokemonSummary_Text_ProudOfItsPower, PokemonSummary_Text_LikesToTrashAbout, PokemonSummary_Text_ALittleQuickTempered, PokemonSummary_Text_LikesToFight, PokemonSummary_Text_QuickTempered },
    { PokemonSummary_Text_SturdyBody, PokemonSummary_Text_CapableOfTakingHits, PokemonSummary_Text_HighlyPersistent, PokemonSummary_Text_GoodEndurance, PokemonSummary_Text_GoodPerseverance },
    { PokemonSummary_Text_LikesToRun, PokemonSummary_Text_AlertToSounds, PokemonSummary_Text_ImpetuousAndSilly, PokemonSummary_Text_SomewhatOfAClown, PokemonSummary_Text_QuickToFlee },
    { PokemonSummary_Text_HighlyCurious, PokemonSummary_Text_Mischievous, PokemonSummary_Text_ThoroughlyCunning, PokemonSummary_Text_OftenLostInThought, PokemonSummary_Text_VeryFinicky },
    { PokemonSummary_Text_StrongWilled, PokemonSummary_Text_SomewhatVain, PokemonSummary_Text_StronglyDefiant, PokemonSummary_Text_HatesToLose, PokemonSummary_Text_SomewhatStubborn },
};

static enum MetCondition MonMetCondition(Pokemon *mon, BOOL isMine);
static void FormatNature(PokemonInfoDisplayStruct *infoDisplay);
static void FormatDateAndLocationMet(PokemonInfoDisplayStruct *infoDisplay, int msgNo);
static void FormatDateAndLocation_Migrated(PokemonInfoDisplayStruct *infoDisplay, int msgNo);
static void FormatCharacteristic(PokemonInfoDisplayStruct *infoDisplay);
static void FormatFlavorPreference(PokemonInfoDisplayStruct *infoDisplay);
static void FormatDateAndLocation_Egg(PokemonInfoDisplayStruct *infoDisplay, int msgNo, BOOL hatched);
static void FormatEggWatch(PokemonInfoDisplayStruct *infoDisplay);
static void BoxMon_ClearMetDateAndLocation(BoxPokemon *boxMon, int setMetDateParam);
static void BoxMon_SetMetDateAndLocation(BoxPokemon *boxMon, int mapsec, int setMetDateParam);
static void BoxMon_SetFatefulEncounter(BoxPokemon *boxMon);
static void BoxMon_CopyLevelToMetLevel(BoxPokemon *boxMon);
static void BoxMon_SetOriginalTrainerData(BoxPokemon *boxMon, PlayerProfile *profile, enum HeapID heapID);

PokemonInfoDisplayStruct *sub_0208E600(Pokemon *mon, BOOL isMine, enum HeapID heapID, int a3) {
    PokemonInfoDisplayStruct *ptr = Heap_Alloc(heapID, sizeof(PokemonInfoDisplayStruct));
    ptr->heapID = heapID;
    ptr->msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_pokemon_summary_screen_bin, heapID);
    ptr->msgFmt = MessageFormat_New_Custom(9, 32, ptr->heapID);
    ptr->mon = mon;
    ptr->isMine = isMine;
    ptr->nature.line = 0;
    ptr->nature.string = NULL;
    ptr->metDateAndLocation.line = 0;
    ptr->metDateAndLocation.string = NULL;
    ptr->characteristic.line = 0;
    ptr->characteristic.string = NULL;
    ptr->flavorPreference.line = 0;
    ptr->flavorPreference.string = NULL;
    ptr->eggWatch.line = 0;
    ptr->eggWatch.string = NULL;

    switch (MonMetCondition(ptr->mon, ptr->isMine)) {
    case MET_CONDITION_WILD_ENCOUNTER:
        ptr->nature.line = 1;
        FormatNature(ptr);
        ptr->metDateAndLocation.line = 2;
        FormatDateAndLocationMet(ptr, PokemonSummary_Text_MetCondition_WildEncounter);
        ptr->characteristic.line = 6;
        FormatCharacteristic(ptr);
        ptr->flavorPreference.line = 7;
        FormatFlavorPreference(ptr);
        break;
    case MET_CONDITION_WILD_ENCOUNTER_TRADED:
        ptr->nature.line = 1;
        FormatNature(ptr);
        ptr->metDateAndLocation.line = 2;
        FormatDateAndLocationMet(ptr, PokemonSummary_Text_MetCondition_WildEncounterTraded);
        ptr->characteristic.line = 6;
        FormatCharacteristic(ptr);
        ptr->flavorPreference.line = 7;
        FormatFlavorPreference(ptr);
        break;
    case MET_CONDITION_WILD_GIFT:
        ptr->nature.line = 1;
        FormatNature(ptr);
        ptr->metDateAndLocation.line = 2;
        FormatDateAndLocationMet(ptr, PokemonSummary_Text_MetCondition_WildEncounterGift);
        ptr->characteristic.line = 6;
        FormatCharacteristic(ptr);
        ptr->flavorPreference.line = 7;
        FormatFlavorPreference(ptr);
        break;
    case MET_CONDITION_EGG_HATCHED:
        ptr->nature.line = 1;
        FormatNature(ptr);
        ptr->metDateAndLocation.line = 2;
        FormatDateAndLocationMet(ptr, PokemonSummary_Text_MetCondition_EggHatched);
        ptr->characteristic.line = 8;
        FormatCharacteristic(ptr);
        ptr->flavorPreference.line = 9;
        FormatFlavorPreference(ptr);
        break;
    case MET_CONDITION_EGG_HATCHED_TRADED:
        ptr->nature.line = 1;
        FormatNature(ptr);
        ptr->metDateAndLocation.line = 2;
        FormatDateAndLocationMet(ptr, PokemonSummary_Text_MetCondition_EggHatchedTraded);
        ptr->characteristic.line = 8;
        FormatCharacteristic(ptr);
        ptr->flavorPreference.line = 9;
        FormatFlavorPreference(ptr);
        break;
    case MET_CONDITION_EGG_HATCHED_GIFT:
        ptr->nature.line = 1;
        FormatNature(ptr);
        ptr->metDateAndLocation.line = 2;
        FormatDateAndLocationMet(ptr, PokemonSummary_Text_MetCondition_EggHatchedGift);
        ptr->characteristic.line = 8;
        FormatCharacteristic(ptr);
        ptr->flavorPreference.line = 9;
        FormatFlavorPreference(ptr);
        break;
    case MET_CONDITION_EGG_HATCHED_GIFT_TRADED:
        ptr->nature.line = 1;
        FormatNature(ptr);
        ptr->metDateAndLocation.line = 2;
        FormatDateAndLocationMet(ptr, PokemonSummary_Text_MetCondition_EggHatchedGiftTraded);
        ptr->characteristic.line = 8;
        FormatCharacteristic(ptr);
        ptr->flavorPreference.line = 9;
        FormatFlavorPreference(ptr);
        break;
    case MET_CONDITION_FATEFUL_ENCOUNTER:
        ptr->nature.line = 1;
        FormatNature(ptr);
        ptr->metDateAndLocation.line = 2;
        FormatDateAndLocationMet(ptr, PokemonSummary_Text_MetCondition_FatefulEncounter);
        ptr->characteristic.line = 7;
        FormatCharacteristic(ptr);
        ptr->flavorPreference.line = 8;
        FormatFlavorPreference(ptr);
        break;
    case MET_CONDITION_FATEFUL_ENCOUNTER_TRADED:
        ptr->nature.line = 1;
        FormatNature(ptr);
        ptr->metDateAndLocation.line = 2;
        FormatDateAndLocationMet(ptr, PokemonSummary_Text_MetCondition_FatefulEncounterTraded);
        ptr->characteristic.line = 7;
        FormatCharacteristic(ptr);
        ptr->flavorPreference.line = 8;
        FormatFlavorPreference(ptr);
        break;
    case MET_CONDITION_FATEFUL_EGG_HATCHED:
        ptr->nature.line = 1;
        FormatNature(ptr);
        ptr->metDateAndLocation.line = 2;
        FormatDateAndLocationMet(ptr, PokemonSummary_Text_MetCondition_FatefulEggHatched);
        ptr->characteristic.line = 9;
        FormatCharacteristic(ptr);
        break;
    case MET_CONDITION_FATEFUL_EGG_HATCHED_TRADED:
        ptr->nature.line = 1;
        FormatNature(ptr);
        ptr->metDateAndLocation.line = 2;
        FormatDateAndLocationMet(ptr, PokemonSummary_Text_MetCondition_FatefulEggHatchedTraded);
        ptr->characteristic.line = 9;
        FormatCharacteristic(ptr);
        break;
    case MET_CONDITION_FATEFUL_EGG_HATCHED_ARRIVED:
        ptr->nature.line = 1;
        FormatNature(ptr);
        ptr->metDateAndLocation.line = 2;
        FormatDateAndLocationMet(ptr, PokemonSummary_Text_MetCondition_FatefulEggHatchedArrived);
        ptr->characteristic.line = 9;
        FormatCharacteristic(ptr);
        break;
    case MET_CONDITION_FATEFUL_EGG_HATCHED_ARRIVED_TRADED:
        ptr->nature.line = 1;
        FormatNature(ptr);
        ptr->metDateAndLocation.line = 2;
        FormatDateAndLocationMet(ptr, PokemonSummary_Text_MetCondition_FatefulEggHatchedArrivedTraded);
        ptr->characteristic.line = 9;
        FormatCharacteristic(ptr);
        break;
    case MET_CONDITION_FATEFUL_EGG_HATCHED_GIFT:
        ptr->nature.line = 1;
        FormatNature(ptr);
        ptr->metDateAndLocation.line = 2;
        FormatDateAndLocationMet(ptr, PokemonSummary_Text_MetCondition_FatefulEggHatchedGift);
        ptr->characteristic.line = 9;
        FormatCharacteristic(ptr);
        break;
    case MET_CONDITION_FATEFUL_EGG_HATCHED_GIFT_TRADED:
        ptr->nature.line = 1;
        FormatNature(ptr);
        ptr->metDateAndLocation.line = 2;
        FormatDateAndLocationMet(ptr, PokemonSummary_Text_MetCondition_FatefulEggHatchedGiftTraded);
        ptr->characteristic.line = 9;
        FormatCharacteristic(ptr);
        break;
    case MET_CONDITION_MIGRATED:
        ptr->nature.line = 1;
        FormatNature(ptr);
        ptr->metDateAndLocation.line = 2;
        FormatDateAndLocation_Migrated(ptr, PokemonSummary_Text_MetCondition_Migrated);
        ptr->characteristic.line = 6;
        FormatCharacteristic(ptr);
        ptr->flavorPreference.line = 7;
        FormatFlavorPreference(ptr);
        break;
    case MET_CONDITION_EGG:
        ptr->metDateAndLocation.line = 1;
        FormatDateAndLocation_Egg(ptr, PokemonSummary_Text_MetCondition_Egg, FALSE);
        ptr->eggWatch.line = 6;
        FormatEggWatch(ptr);
        break;
    case MET_CONDITION_EGG_TRADED:
        ptr->metDateAndLocation.line = 1;
        FormatDateAndLocation_Egg(ptr, PokemonSummary_Text_MetCondition_EggTraded, TRUE);
        ptr->eggWatch.line = 6;
        FormatEggWatch(ptr);
        break;
    case MET_CONDITION_FATEFUL_EGG:
        ptr->metDateAndLocation.line = 1;
        FormatDateAndLocation_Egg(ptr, PokemonSummary_Text_MetCondition_FatefulEgg, FALSE);
        ptr->eggWatch.line = 6;
        FormatEggWatch(ptr);
        break;
    case MET_CONDITION_FATEFUL_EGG_TRADED:
        ptr->metDateAndLocation.line = 1;
        FormatDateAndLocation_Egg(ptr, PokemonSummary_Text_MetCondition_FatefulEgg, TRUE);
        ptr->eggWatch.line = 6;
        FormatEggWatch(ptr);
        break;
    case MET_CONDITION_FATEFUL_EGG_ARRIVED:
        ptr->metDateAndLocation.line = 1;
        FormatDateAndLocation_Egg(ptr, PokemonSummary_Text_MetCondition_FatefulEggArrived, FALSE);
        ptr->eggWatch.line = 6;
        FormatEggWatch(ptr);
        break;
    }
    return ptr;
}

void sub_0208E994(PokemonInfoDisplayStruct *infoDisplay) {
    if (infoDisplay->nature.string != NULL) {
        Heap_Free(infoDisplay->nature.string);
    }
    if (infoDisplay->metDateAndLocation.string != NULL) {
        Heap_Free(infoDisplay->metDateAndLocation.string);
    }
    if (infoDisplay->characteristic.string != NULL) {
        Heap_Free(infoDisplay->characteristic.string);
    }
    if (infoDisplay->flavorPreference.string != NULL) {
        Heap_Free(infoDisplay->flavorPreference.string);
    }
    if (infoDisplay->eggWatch.string != NULL) {
        Heap_Free(infoDisplay->eggWatch.string);
    }

    MessageFormat_Delete(infoDisplay->msgFmt);
    DestroyMsgData(infoDisplay->msgData);
    Heap_Free(infoDisplay);
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

static void FormatNature(PokemonInfoDisplayStruct *infoDisplay) {
    int nature = GetMonNature(infoDisplay->mon);
    if (nature <= NATURE_NUM - 1) {
        infoDisplay->nature.string = String_New(0x48, infoDisplay->heapID);
        ReadMsgDataIntoString(infoDisplay->msgData, PokemonSummary_Text_Nature_Hardy + nature, infoDisplay->nature.string);
    }
}

static void FormatDateAndLocationMet(PokemonInfoDisplayStruct *infoDisplay, int msgNo) {
    String *str = String_New(0x240, infoDisplay->heapID);
    infoDisplay->metDateAndLocation.string = String_New(0x240, infoDisplay->heapID);

    ReadMsgDataIntoString(infoDisplay->msgData, msgNo, str);
    BufferIntegerAsString(infoDisplay->msgFmt, 0, GetMonData(infoDisplay->mon, MON_DATA_MET_YEAR, NULL), 2, PRINTING_MODE_LEADING_ZEROS, TRUE);
    BufferMonthNameAbbr(infoDisplay->msgFmt, 1, GetMonData(infoDisplay->mon, MON_DATA_MET_MONTH, NULL));
    BufferIntegerAsString(infoDisplay->msgFmt, 2, GetMonData(infoDisplay->mon, MON_DATA_MET_DAY, NULL), 2, PRINTING_MODE_LEFT_ALIGN, TRUE);
    BufferIntegerAsString(infoDisplay->msgFmt, 3, GetMonData(infoDisplay->mon, MON_DATA_MET_LEVEL, NULL), 3, PRINTING_MODE_LEFT_ALIGN, TRUE);
    BufferLocationName(infoDisplay->msgFmt, 4, GetMonData(infoDisplay->mon, MON_DATA_MET_LOCATION, NULL));
    BufferIntegerAsString(infoDisplay->msgFmt, 5, GetMonData(infoDisplay->mon, MON_DATA_EGG_YEAR, NULL), 2, PRINTING_MODE_LEADING_ZEROS, TRUE);
    BufferMonthNameAbbr(infoDisplay->msgFmt, 6, GetMonData(infoDisplay->mon, MON_DATA_EGG_MONTH, NULL));
    BufferIntegerAsString(infoDisplay->msgFmt, 7, GetMonData(infoDisplay->mon, MON_DATA_EGG_DAY, NULL), 2, PRINTING_MODE_LEFT_ALIGN, TRUE);
    BufferLocationName(infoDisplay->msgFmt, 8, GetMonData(infoDisplay->mon, MON_DATA_EGG_LOCATION, NULL));

    StringExpandPlaceholders(infoDisplay->msgFmt, infoDisplay->metDateAndLocation.string, str);
    String_Delete(str);
}

static void FormatDateAndLocation_Migrated(PokemonInfoDisplayStruct *infoDisplay, int msgNo) {
    String *str = String_New(0x120, infoDisplay->heapID);
    infoDisplay->metDateAndLocation.string = String_New(0x120, infoDisplay->heapID);

    ReadMsgDataIntoString(infoDisplay->msgData, msgNo, str);
    BufferIntegerAsString(infoDisplay->msgFmt, 0, GetMonData(infoDisplay->mon, MON_DATA_MET_YEAR, NULL), 2, PRINTING_MODE_LEADING_ZEROS, TRUE);
    BufferMonthNameAbbr(infoDisplay->msgFmt, 1, GetMonData(infoDisplay->mon, MON_DATA_MET_MONTH, NULL));
    BufferIntegerAsString(infoDisplay->msgFmt, 2, GetMonData(infoDisplay->mon, MON_DATA_MET_DAY, NULL), 2, PRINTING_MODE_LEFT_ALIGN, TRUE);
    BufferIntegerAsString(infoDisplay->msgFmt, 3, GetMonData(infoDisplay->mon, MON_DATA_MET_LEVEL, NULL), 3, PRINTING_MODE_LEFT_ALIGN, TRUE);

    switch (GetMonData(infoDisplay->mon, MON_DATA_MET_GAME, NULL)) {
    default:
        BufferLocationName(infoDisplay->msgFmt, 4, sub_02017FE4(MAPSECTYPE_GIFT, MAPLOC(METLOC_DASHES)));
        break;
    case VERSION_FIRERED:
    case VERSION_LEAFGREEN:
        BufferLocationName(infoDisplay->msgFmt, 4, sub_02017FE4(MAPSECTYPE_GIFT, MAPLOC(METLOC_KANTO)));
        break;
    case VERSION_HEARTGOLD:
    case VERSION_SOULSILVER:
        BufferLocationName(infoDisplay->msgFmt, 4, sub_02017FE4(MAPSECTYPE_GIFT, MAPLOC(METLOC_JOHTO)));
        break;
    case VERSION_RUBY:
    case VERSION_SAPPHIRE:
    case VERSION_EMERALD:
        BufferLocationName(infoDisplay->msgFmt, 4, sub_02017FE4(MAPSECTYPE_GIFT, MAPLOC(METLOC_HOENN)));
        break;
    case VERSION_GAMECUBE:
        BufferLocationName(infoDisplay->msgFmt, 4, sub_02017FE4(MAPSECTYPE_GIFT, MAPLOC(METLOC_DISTANT_LAND)));
        break;
    case VERSION_DIAMOND:
    case VERSION_PEARL:
    case VERSION_PLATINUM:
        BufferLocationName(infoDisplay->msgFmt, 4, sub_02017FE4(MAPSECTYPE_GIFT, MAPLOC(METLOC_DASHES /*METLOC_SINNOH*/)));
        break;
    }

    StringExpandPlaceholders(infoDisplay->msgFmt, infoDisplay->metDateAndLocation.string, str);
    String_Delete(str);
}

static void FormatDateAndLocation_Egg(PokemonInfoDisplayStruct *infoDisplay, int msgNo, BOOL hatched) {
    String *str = String_New(0x168, infoDisplay->heapID);
    infoDisplay->metDateAndLocation.string = String_New(0x168, infoDisplay->heapID);

    ReadMsgDataIntoString(infoDisplay->msgData, msgNo, str);

    if (!hatched) {
        BufferIntegerAsString(infoDisplay->msgFmt, 5, GetMonData(infoDisplay->mon, MON_DATA_EGG_YEAR, NULL), 2, PRINTING_MODE_LEADING_ZEROS, TRUE);
        BufferMonthNameAbbr(infoDisplay->msgFmt, 6, GetMonData(infoDisplay->mon, MON_DATA_EGG_MONTH, NULL));
        BufferIntegerAsString(infoDisplay->msgFmt, 7, GetMonData(infoDisplay->mon, MON_DATA_EGG_DAY, NULL), 2, PRINTING_MODE_LEFT_ALIGN, TRUE);
        BufferLocationName(infoDisplay->msgFmt, 8, GetMonData(infoDisplay->mon, MON_DATA_EGG_LOCATION, NULL));
    } else {
        BufferIntegerAsString(infoDisplay->msgFmt, 5, GetMonData(infoDisplay->mon, MON_DATA_MET_YEAR, NULL), 2, PRINTING_MODE_LEADING_ZEROS, TRUE);
        BufferMonthNameAbbr(infoDisplay->msgFmt, 6, GetMonData(infoDisplay->mon, MON_DATA_MET_MONTH, NULL));
        BufferIntegerAsString(infoDisplay->msgFmt, 7, GetMonData(infoDisplay->mon, MON_DATA_MET_DAY, NULL), 2, PRINTING_MODE_LEFT_ALIGN, TRUE);
        BufferLocationName(infoDisplay->msgFmt, 8, GetMonData(infoDisplay->mon, MON_DATA_MET_LOCATION, NULL));
    }

    StringExpandPlaceholders(infoDisplay->msgFmt, infoDisplay->metDateAndLocation.string, str);
    String_Delete(str);
}

static void FormatCharacteristic(PokemonInfoDisplayStruct *infoDisplay) {
    int index, maxIV;

    infoDisplay->characteristic.string = String_New(0x48, infoDisplay->heapID);

    int hpIV = GetMonData(infoDisplay->mon, MON_DATA_HP_IV, NULL);
    int atkIV = GetMonData(infoDisplay->mon, MON_DATA_ATK_IV, NULL);
    int defIV = GetMonData(infoDisplay->mon, MON_DATA_DEF_IV, NULL);
    int speedIV = GetMonData(infoDisplay->mon, MON_DATA_SPEED_IV, NULL);
    int spAtkIV = GetMonData(infoDisplay->mon, MON_DATA_SPATK_IV, NULL);
    int spDefIV = GetMonData(infoDisplay->mon, MON_DATA_SPDEF_IV, NULL);
    u32 personality = GetMonData(infoDisplay->mon, MON_DATA_PERSONALITY, NULL);

    switch (personality % 6) {
    case 0:
    default:
        index = 0;
        maxIV = hpIV;
        if (maxIV < atkIV) {
            index = 1;
            maxIV = atkIV;
        }
        if (maxIV < defIV) {
            index = 2;
            maxIV = defIV;
        }
        if (maxIV < speedIV) {
            index = 3;
            maxIV = speedIV;
        }
        if (maxIV < spAtkIV) {
            index = 4;
            maxIV = spAtkIV;
        }
        if (maxIV < spDefIV) {
            index = 5;
            maxIV = spDefIV;
        }
        break;
    case 1:
        index = 1;
        maxIV = atkIV;
        if (maxIV < defIV) {
            index = 2;
            maxIV = defIV;
        }
        if (maxIV < speedIV) {
            index = 3;
            maxIV = speedIV;
        }
        if (maxIV < spAtkIV) {
            index = 4;
            maxIV = spAtkIV;
        }
        if (maxIV < spDefIV) {
            index = 5;
            maxIV = spDefIV;
        }
        if (maxIV < hpIV) {
            index = 0;
            maxIV = hpIV;
        }
        break;
    case 2:
        index = 2;
        maxIV = defIV;
        if (maxIV < speedIV) {
            index = 3;
            maxIV = speedIV;
        }
        if (maxIV < spAtkIV) {
            index = 4;
            maxIV = spAtkIV;
        }
        if (maxIV < spDefIV) {
            index = 5;
            maxIV = spDefIV;
        }
        if (maxIV < hpIV) {
            index = 0;
            maxIV = hpIV;
        }
        if (maxIV < atkIV) {
            index = 1;
            maxIV = atkIV;
        }
        break;
    case 3:
        index = 3;
        maxIV = speedIV;
        if (maxIV < spAtkIV) {
            index = 4;
            maxIV = spAtkIV;
        }
        if (maxIV < spDefIV) {
            index = 5;
            maxIV = spDefIV;
        }
        if (maxIV < hpIV) {
            index = 0;
            maxIV = hpIV;
        }
        if (maxIV < atkIV) {
            index = 1;
            maxIV = atkIV;
        }
        if (maxIV < defIV) {
            index = 2;
            maxIV = defIV;
        }
        break;
    case 4:
        index = 4;
        maxIV = spAtkIV;
        if (maxIV < spDefIV) {
            index = 5;
            maxIV = spDefIV;
        }
        if (maxIV < hpIV) {
            index = 0;
            maxIV = hpIV;
        }
        if (maxIV < atkIV) {
            index = 1;
            maxIV = atkIV;
        }
        if (maxIV < defIV) {
            index = 2;
            maxIV = defIV;
        }
        if (maxIV < speedIV) {
            index = 3;
            maxIV = speedIV;
        }
        break;
    case 5:
        index = 5;
        maxIV = spDefIV;
        if (maxIV < hpIV) {
            index = 0;
            maxIV = hpIV;
        }
        if (maxIV < atkIV) {
            index = 1;
            maxIV = atkIV;
        }
        if (maxIV < defIV) {
            index = 2;
            maxIV = defIV;
        }
        if (maxIV < speedIV) {
            index = 3;
            maxIV = speedIV;
        }
        if (maxIV < spAtkIV) {
            index = 4;
            maxIV = spAtkIV;
        }
        break;
    }
    ReadMsgDataIntoString(infoDisplay->msgData, sCharactersticMsgs[index][maxIV % 5], infoDisplay->characteristic.string);
}

static void FormatFlavorPreference(PokemonInfoDisplayStruct *infoDisplay) {
    infoDisplay->flavorPreference.string = String_New(0x48, infoDisplay->heapID);
    int index = 0;
    for (int flavor = FLAVOR_START; flavor < FLAVOR_MAX; flavor++) {
        if (MonGetFlavorPreference(infoDisplay->mon, flavor) == 1) {
            index = flavor + 1;
        }
    }
    ReadMsgDataIntoString(infoDisplay->msgData, sFlavorMsgs[index], infoDisplay->flavorPreference.string);
}

static void FormatEggWatch(PokemonInfoDisplayStruct *infoDisplay) {
    int msgNo;
    int eggCycles = GetMonData(infoDisplay->mon, MON_DATA_FRIENDSHIP, NULL);

    infoDisplay->eggWatch.string = String_New(0x120, infoDisplay->heapID);

    if (eggCycles <= 5) {
        msgNo = PokemonSummary_Text_EggWatch_ItWillHatchSoon;
    } else if (eggCycles <= 10) {
        msgNo = PokemonSummary_Text_EggWatch_CloseToHatching;
    } else if (eggCycles <= 40) {
        msgNo = PokemonSummary_Text_EggWatch_NotCloseToHatching;
    } else {
        msgNo = PokemonSummary_Text_EggWatch_LongTimeToHatch;
    }
    ReadMsgDataIntoString(infoDisplay->msgData, msgNo, infoDisplay->eggWatch.string);
}

static enum MetCondition MonMetCondition(Pokemon *mon, BOOL isMine) {
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
    int fatefulEncounter = TRUE;
    SetBoxMonData(boxMon, MON_DATA_FATEFUL_ENCOUNTER, &fatefulEncounter);
}
