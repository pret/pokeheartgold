#include "global.h"
#include "heap.h"
#include "map_section.h"
#include "message_format.h"
#include "msgdata.h"
#include "pokemon.h"
#include "string_util.h"
#include "trainer_memo.h"
#include "constants/events.h"
#include "constants/pokemon.h"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0302.h"

static const u16 sFlavorMsgs[6] = {
    msg_0302_00070, msg_0302_00065, msg_0302_00066, msg_0302_00067, msg_0302_00068, msg_0302_00069,
};

static const u16 sCharactersticMsgs[6][5] = {
    { msg_0302_00071, msg_0302_00072, msg_0302_00073, msg_0302_00074, msg_0302_00075 },
    { msg_0302_00076, msg_0302_00077, msg_0302_00078, msg_0302_00079, msg_0302_00080 },
    { msg_0302_00081, msg_0302_00082, msg_0302_00083, msg_0302_00084, msg_0302_00085 },
    { msg_0302_00086, msg_0302_00087, msg_0302_00088, msg_0302_00089, msg_0302_00090 },
    { msg_0302_00091, msg_0302_00092, msg_0302_00093, msg_0302_00094, msg_0302_00095 },
    { msg_0302_00096, msg_0302_00097, msg_0302_00098, msg_0302_00099, msg_0302_00100 },
};

static int sub_0208F070(Pokemon *mon, BOOL isMine);
static void FormatNature(Unk0208E600 *a0);
static void FormatDateAndLocationMet(Unk0208E600 *a0, int msgNo);
static void FormatDateAndLocation_Migrated(Unk0208E600 *a0, int msgNo);
static void FormatCharacteristic(Unk0208E600 *a0);
static void FormatFlavorPreference(Unk0208E600 *a0);
static void FormatDateAndLocation_Egg(Unk0208E600 *a0, int msgNo, BOOL hatched);
static void FormatEggWatch(Unk0208E600 *a0);
static void sub_0208F5C8(BoxPokemon *boxMon, BOOL isEgg);
static void sub_0208F550(BoxPokemon *boxMon, int mapsec, BOOL isNotEgg);
static void SetFatefulEncounter(BoxPokemon *boxMon);
static void CopyLevelToMetLevel(BoxPokemon *boxMon);
static void SetOriginalTrainerData(BoxPokemon *boxMon, PlayerProfile *profile, HeapID heapId);

Unk0208E600 *sub_0208E600(Pokemon *mon, BOOL isMine, HeapID heapId, int a3) {
    Unk0208E600 *ptr = AllocFromHeap(heapId, sizeof(Unk0208E600));
    ptr->heapId = heapId;
    ptr->msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0302_bin, heapId);
    ptr->msgFmt = MessageFormat_New_Custom(9, 32, ptr->heapId);
    ptr->mon = mon;
    ptr->isMine = isMine;
    ptr->unk14.unk0 = 0;
    ptr->unk14.nature = NULL;
    ptr->unk14.unk8 = 0;
    ptr->unk14.dateLocationMet = NULL;
    ptr->unk14.unk10 = 0;
    ptr->unk14.characteristic = NULL;
    ptr->unk14.unk18 = 0;
    ptr->unk14.flavorPreference = NULL;
    ptr->unk14.unk20 = 0;
    ptr->unk14.eggWatch = NULL;

    int var1 = sub_0208F070(ptr->mon, ptr->isMine);
    switch (var1) {
    case 0:
        ptr->unk14.unk0 = 1;
        FormatNature(ptr);
        ptr->unk14.unk8 = 2;
        FormatDateAndLocationMet(ptr, msg_0302_00049);
        ptr->unk14.unk10 = 6;
        FormatCharacteristic(ptr);
        ptr->unk14.unk18 = 7;
        FormatFlavorPreference(ptr);
        break;
    case 1:
        ptr->unk14.unk0 = 1;
        FormatNature(ptr);
        ptr->unk14.unk8 = 2;
        FormatDateAndLocationMet(ptr, msg_0302_00050);
        ptr->unk14.unk10 = 6;
        FormatCharacteristic(ptr);
        ptr->unk14.unk18 = 7;
        FormatFlavorPreference(ptr);
        break;
    case 2:
        ptr->unk14.unk0 = 1;
        FormatNature(ptr);
        ptr->unk14.unk8 = 2;
        FormatDateAndLocationMet(ptr, msg_0302_00051);
        ptr->unk14.unk10 = 6;
        FormatCharacteristic(ptr);
        ptr->unk14.unk18 = 7;
        FormatFlavorPreference(ptr);
        break;
    case 3:
        ptr->unk14.unk0 = 1;
        FormatNature(ptr);
        ptr->unk14.unk8 = 2;
        FormatDateAndLocationMet(ptr, msg_0302_00052);
        ptr->unk14.unk10 = 8;
        FormatCharacteristic(ptr);
        ptr->unk14.unk18 = 9;
        FormatFlavorPreference(ptr);
        break;
    case 4:
        ptr->unk14.unk0 = 1;
        FormatNature(ptr);
        ptr->unk14.unk8 = 2;
        FormatDateAndLocationMet(ptr, msg_0302_00053);
        ptr->unk14.unk10 = 8;
        FormatCharacteristic(ptr);
        ptr->unk14.unk18 = 9;
        FormatFlavorPreference(ptr);
        break;
    case 5:
        ptr->unk14.unk0 = 1;
        FormatNature(ptr);
        ptr->unk14.unk8 = 2;
        FormatDateAndLocationMet(ptr, msg_0302_00054);
        ptr->unk14.unk10 = 8;
        FormatCharacteristic(ptr);
        ptr->unk14.unk18 = 9;
        FormatFlavorPreference(ptr);
        break;
    case 6:
        ptr->unk14.unk0 = 1;
        FormatNature(ptr);
        ptr->unk14.unk8 = 2;
        FormatDateAndLocationMet(ptr, msg_0302_00055);
        ptr->unk14.unk10 = 8;
        FormatCharacteristic(ptr);
        ptr->unk14.unk18 = 9;
        FormatFlavorPreference(ptr);
        break;
    case 7:
        ptr->unk14.unk0 = 1;
        FormatNature(ptr);
        ptr->unk14.unk8 = 2;
        FormatDateAndLocationMet(ptr, msg_0302_00056);
        ptr->unk14.unk10 = 7;
        FormatCharacteristic(ptr);
        ptr->unk14.unk18 = 8;
        FormatFlavorPreference(ptr);
        break;
    case 8:
        ptr->unk14.unk0 = 1;
        FormatNature(ptr);
        ptr->unk14.unk8 = 2;
        FormatDateAndLocationMet(ptr, msg_0302_00057);
        ptr->unk14.unk10 = 7;
        FormatCharacteristic(ptr);
        ptr->unk14.unk18 = 8;
        FormatFlavorPreference(ptr);
        break;
    case 9:
        ptr->unk14.unk0 = 1;
        FormatNature(ptr);
        ptr->unk14.unk8 = 2;
        FormatDateAndLocationMet(ptr, msg_0302_00058);
        ptr->unk14.unk10 = 9;
        FormatCharacteristic(ptr);
        break;
    case 10:
        ptr->unk14.unk0 = 1;
        FormatNature(ptr);
        ptr->unk14.unk8 = 2;
        FormatDateAndLocationMet(ptr, msg_0302_00059);
        ptr->unk14.unk10 = 9;
        FormatCharacteristic(ptr);
        break;
    case 11:
        ptr->unk14.unk0 = 1;
        FormatNature(ptr);
        ptr->unk14.unk8 = 2;
        FormatDateAndLocationMet(ptr, msg_0302_00060);
        ptr->unk14.unk10 = 9;
        FormatCharacteristic(ptr);
        break;
    case 12:
        ptr->unk14.unk0 = 1;
        FormatNature(ptr);
        ptr->unk14.unk8 = 2;
        FormatDateAndLocationMet(ptr, msg_0302_00061);
        ptr->unk14.unk10 = 9;
        FormatCharacteristic(ptr);
        break;
    case 13:
        ptr->unk14.unk0 = 1;
        FormatNature(ptr);
        ptr->unk14.unk8 = 2;
        FormatDateAndLocationMet(ptr, msg_0302_00062);
        ptr->unk14.unk10 = 9;
        FormatCharacteristic(ptr);
        break;
    case 14:
        ptr->unk14.unk0 = 1;
        FormatNature(ptr);
        ptr->unk14.unk8 = 2;
        FormatDateAndLocationMet(ptr, msg_0302_00063);
        ptr->unk14.unk10 = 9;
        FormatCharacteristic(ptr);
        break;
    case 15:
        ptr->unk14.unk0 = 1;
        FormatNature(ptr);
        ptr->unk14.unk8 = 2;
        FormatDateAndLocation_Migrated(ptr, msg_0302_00064);
        ptr->unk14.unk10 = 6;
        FormatCharacteristic(ptr);
        ptr->unk14.unk18 = 7;
        FormatFlavorPreference(ptr);
        break;
    case 16:
        ptr->unk14.unk8 = 1;
        FormatDateAndLocation_Egg(ptr, msg_0302_00101, FALSE);
        ptr->unk14.unk20 = 6;
        FormatEggWatch(ptr);
        break;
    case 17:
        ptr->unk14.unk8 = 1;
        FormatDateAndLocation_Egg(ptr, msg_0302_00102, TRUE);
        ptr->unk14.unk20 = 6;
        FormatEggWatch(ptr);
        break;
    case 18:
        ptr->unk14.unk8 = 1;
        FormatDateAndLocation_Egg(ptr, msg_0302_00103, FALSE);
        ptr->unk14.unk20 = 6;
        FormatEggWatch(ptr);
        break;
    case 19:
        ptr->unk14.unk8 = 1;
        FormatDateAndLocation_Egg(ptr, msg_0302_00103, TRUE);
        ptr->unk14.unk20 = 6;
        FormatEggWatch(ptr);
        break;
    case 20:
        ptr->unk14.unk8 = 1;
        FormatDateAndLocation_Egg(ptr, msg_0302_00104, 0);
        ptr->unk14.unk20 = 6;
        FormatEggWatch(ptr);
        break;
    }
    return ptr;
}

void sub_0208E994(Unk0208E600 *a0) {
    if (a0->unk14.nature) {
        FreeToHeap(a0->unk14.nature);
    }
    if (a0->unk14.dateLocationMet) {
        FreeToHeap(a0->unk14.dateLocationMet);
    }
    if (a0->unk14.characteristic) {
        FreeToHeap(a0->unk14.characteristic);
    }
    if (a0->unk14.flavorPreference) {
        FreeToHeap(a0->unk14.flavorPreference);
    }
    if (a0->unk14.eggWatch) {
        FreeToHeap(a0->unk14.eggWatch);
    }
    MessageFormat_Delete(a0->msgFmt);
    DestroyMsgData(a0->msgData);
    FreeToHeap(a0);
}

// Returns true if the Pokemon has the proper metadata to trigger the event.
BOOL MonMetadataMatchesEvent(u8 eventNo, Pokemon *mon, BOOL isMine) {
    u8 var1 = sub_0208F070(mon, isMine);
    u8 version = GetMonData(mon, MON_DATA_GAME_VERSION, NULL);

    if ((var1 == 7 || var1 == 8) && (eventNo != EVENT_ARCEUS_UNK1)) {
        return TRUE;
    }

    switch (eventNo) {
    case EVENT_SPIKY_EARED_PICHU:
        break;
    case EVENT_ARCEUS_UNK1:
        if (var1 == 1) {
            switch (version) {
            case VERSION_DIAMOND:
            case VERSION_PEARL:
            case VERSION_PLATINUM:
                if (GetMonData(mon, MON_DATA_MET_LOCATION, NULL) == sub_02017FE4(MAPSECTYPE_NORMAL, 0x56)) {
                    return TRUE;
                }
            }
        }
        break;
    case EVENT_ARCEUS_UNK2:
    case EVENT_CELEBI:
        break;
  }
  return FALSE;
}

static void FormatNature(Unk0208E600 *a0) {
    int nature = GetMonNature(a0->mon);
    if (nature <= NATURE_QUIRKY) {
        a0->unk14.nature = String_New(0x48, a0->heapId);
        ReadMsgDataIntoString(a0->msgData, msg_0302_00024 + nature, a0->unk14.nature);
    }
}

static void FormatDateAndLocationMet(Unk0208E600 *a0, int msgNo) {
    String *str = String_New(0x240, a0->heapId);
    a0->unk14.dateLocationMet = String_New(0x240, a0->heapId);

    ReadMsgDataIntoString(a0->msgData, msgNo, str);

    BufferIntegerAsString(a0->msgFmt, 0, GetMonData(a0->mon, MON_DATA_MET_YEAR, NULL), 2, PRINTING_MODE_LEADING_ZEROS, TRUE);
    BufferMonthNameAbbr(a0->msgFmt, 1, GetMonData(a0->mon, MON_DATA_MET_MONTH, NULL));
    BufferIntegerAsString(a0->msgFmt, 2, GetMonData(a0->mon, MON_DATA_MET_DAY, NULL), 2, PRINTING_MODE_LEFT_ALIGN, TRUE);
    BufferIntegerAsString(a0->msgFmt, 3, GetMonData(a0->mon, MON_DATA_MET_LEVEL, NULL), 3, PRINTING_MODE_LEFT_ALIGN, TRUE);
    BufferLocationName(a0->msgFmt, 4, GetMonData(a0->mon, MON_DATA_MET_LOCATION, NULL));
    BufferIntegerAsString(a0->msgFmt, 5, GetMonData(a0->mon, MON_DATA_EGG_MET_YEAR, NULL), 2, PRINTING_MODE_LEADING_ZEROS, TRUE);
    BufferMonthNameAbbr(a0->msgFmt, 6, GetMonData(a0->mon, MON_DATA_EGG_MET_MONTH, NULL));
    BufferIntegerAsString(a0->msgFmt, 7, GetMonData(a0->mon, MON_DATA_EGG_MET_DAY, NULL), 2, PRINTING_MODE_LEFT_ALIGN, TRUE);
    BufferLocationName(a0->msgFmt, 8, GetMonData(a0->mon, MON_DATA_EGG_MET_LOCATION, NULL));

    StringExpandPlaceholders(a0->msgFmt, a0->unk14.dateLocationMet, str);
    String_Delete(str);
}

static void FormatDateAndLocation_Migrated(Unk0208E600 *a0, int msgNo) {
    int version;

    String *str = String_New(0x120, a0->heapId);
    a0->unk14.dateLocationMet = String_New(0x120, a0->heapId);

    ReadMsgDataIntoString(a0->msgData, msgNo, str);

    BufferIntegerAsString(a0->msgFmt, 0, GetMonData(a0->mon, MON_DATA_MET_YEAR, NULL), 2, PRINTING_MODE_LEADING_ZEROS, TRUE);
    BufferMonthNameAbbr(a0->msgFmt, 1, GetMonData(a0->mon, MON_DATA_MET_MONTH, NULL));
    BufferIntegerAsString(a0->msgFmt, 2, GetMonData(a0->mon, MON_DATA_MET_DAY, NULL), 2, PRINTING_MODE_LEFT_ALIGN, TRUE);
    BufferIntegerAsString(a0->msgFmt, 3, GetMonData(a0->mon, MON_DATA_MET_LEVEL, NULL), 3, PRINTING_MODE_LEFT_ALIGN, TRUE);

    version = GetMonData(a0->mon, MON_DATA_GAME_VERSION, NULL);
    switch (version) {
    case 0:
    case 6:
    case 9:
    case 13:
    case 14:
    default:
        BufferLocationName(a0->msgFmt, 4, sub_02017FE4(MAPSECTYPE_GIFT, 7));
        break;
    case VERSION_FIRE_RED:
    case VERSION_LEAF_GREEN:
        BufferLocationName(a0->msgFmt, 4, sub_02017FE4(MAPSECTYPE_GIFT, 3));
        break;
    case VERSION_HEARTGOLD:
    case VERSION_SOULSILVER:
        BufferLocationName(a0->msgFmt, 4, sub_02017FE4(MAPSECTYPE_GIFT, 4));
        break;
    case VERSION_SAPPHIRE:
    case VERSION_RUBY:
    case VERSION_EMERALD:
        BufferLocationName(a0->msgFmt, 4, sub_02017FE4(MAPSECTYPE_GIFT, 5));
        break;
    case VERSION_GAMECUBE:
        BufferLocationName(a0->msgFmt, 4, sub_02017FE4(MAPSECTYPE_GIFT, 8));
        break;
    case VERSION_DIAMOND:
    case VERSION_PEARL:
    case VERSION_PLATINUM:
        BufferLocationName(a0->msgFmt, 4, sub_02017FE4(MAPSECTYPE_GIFT, 7));
        break;
    }

    StringExpandPlaceholders(a0->msgFmt, a0->unk14.dateLocationMet, str);
    String_Delete(str);
}

static void FormatDateAndLocation_Egg(Unk0208E600 *a0, int msgNo, BOOL hatched) {
    String *str = String_New(0x168, a0->heapId);
    a0->unk14.dateLocationMet = String_New(0x168, a0->heapId);

    ReadMsgDataIntoString(a0->msgData, msgNo, str);

    if (!hatched) {
        BufferIntegerAsString(a0->msgFmt, 5, GetMonData(a0->mon, MON_DATA_EGG_MET_YEAR, NULL), 2, PRINTING_MODE_LEADING_ZEROS, TRUE);
        BufferMonthNameAbbr(a0->msgFmt, 6, GetMonData(a0->mon, MON_DATA_EGG_MET_MONTH, NULL));
        BufferIntegerAsString(a0->msgFmt, 7, GetMonData(a0->mon, MON_DATA_EGG_MET_DAY, NULL), 2, PRINTING_MODE_LEFT_ALIGN, TRUE);
        BufferLocationName(a0->msgFmt, 8, GetMonData(a0->mon, MON_DATA_EGG_MET_LOCATION, NULL));
    } else {
        BufferIntegerAsString(a0->msgFmt, 5, GetMonData(a0->mon, MON_DATA_MET_YEAR, NULL), 2, PRINTING_MODE_LEADING_ZEROS, TRUE);
        BufferMonthNameAbbr(a0->msgFmt, 6, GetMonData(a0->mon, MON_DATA_MET_MONTH, NULL));
        BufferIntegerAsString(a0->msgFmt, 7, GetMonData(a0->mon, MON_DATA_MET_DAY, NULL), 2, PRINTING_MODE_LEFT_ALIGN, TRUE);
        BufferLocationName(a0->msgFmt, 8, GetMonData(a0->mon, MON_DATA_MET_LOCATION, NULL));
    }

    StringExpandPlaceholders(a0->msgFmt, a0->unk14.dateLocationMet, str);
    String_Delete(str);
}

static void FormatCharacteristic(Unk0208E600 *a0) {
    int index;
    int maxIv;

    a0->unk14.characteristic = String_New(0x48, a0->heapId);

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
    ReadMsgDataIntoString(a0->msgData, sCharactersticMsgs[index][maxIv % 5], a0->unk14.characteristic);
}

static void FormatFlavorPreference(Unk0208E600 *a0) {
    a0->unk14.flavorPreference = String_New(0x48, a0->heapId);
    int index = 0;
    for (int flavor = FLAVOR_START; flavor < FLAVOR_MAX; flavor++) {
        int preference = MonGetFlavorPreference(a0->mon, flavor);
        if (preference == 1) {
            index = flavor + 1;
        }
    }
    ReadMsgDataIntoString(a0->msgData, sFlavorMsgs[index], a0->unk14.flavorPreference);
}

static void FormatEggWatch(Unk0208E600 *a0) {
    int msgNo;

    int eggCycles = GetMonData(a0->mon, MON_DATA_FRIENDSHIP, NULL);
    a0->unk14.eggWatch = String_New(0x120, a0->heapId);
    if (eggCycles <= 5) {
        msgNo = msg_0302_00105;
    } else if (eggCycles <= 10) {
        msgNo = msg_0302_00106;
    } else if (eggCycles <= 40) {
        msgNo = msg_0302_00107;
    } else {
        msgNo = msg_0302_00108;
    }
    ReadMsgDataIntoString(a0->msgData, msgNo, a0->unk14.eggWatch);
}

// decomp.me: https://decomp.me/scratch/bTdPf
#ifdef NONMATCHING
static int sub_0208F070(Pokemon *mon, BOOL isMine) {
    if (!GetMonData(mon, MON_DATA_IS_EGG, NULL)) {
        if (GetMonData(mon, MON_DATA_EGG_MET_LOCATION, NULL) == 0) {
            if (GetMonData(mon, MON_DATA_MET_LOCATION, NULL) == sub_02017FE4(MAPSECTYPE_NORMAL, 0x37)) {
                return 15;
            }
            if (GetMonData(mon, MON_DATA_FATEFUL_ENCOUNTER, NULL) == TRUE) {
                if (isMine == TRUE) {
                    return 7;
                }
                return 8;
            }

            if (GetMonData(mon, MON_DATA_MET_LOCATION, NULL) == sub_02017FE4(MAPSECTYPE_GIFT, 1)) {
                return 2;
            }
            // This condition does not match...
            if (isMine == TRUE) {
                return 0;
            }
            return 1;
        }
        if (GetMonData(mon, MON_DATA_FATEFUL_ENCOUNTER, NULL) == TRUE) {
            if (GetMonData(mon, MON_DATA_EGG_MET_LOCATION, NULL) == sub_02017FE4(MAPSECTYPE_GIFT, 2)) {
                if (isMine == TRUE) {
                    return 13;
                }
                return 14;
            }
            if (GetMonData(mon, MON_DATA_EGG_MET_LOCATION, NULL) == sub_02017FE4(MAPSECTYPE_EXTERNAL, 1)) {
                if (isMine == TRUE) {
                    return 11;
                }
                return 12;
            }
            if (isMine == TRUE) {
                return 9;
            }
            return 10;
        }

        if ((GetMonData(mon, MON_DATA_EGG_MET_LOCATION, NULL) == sub_02017FE4(MAPSECTYPE_GIFT, 1)) ||
            (GetMonData(mon, MON_DATA_EGG_MET_LOCATION, NULL) == sub_02017FE4(MAPSECTYPE_GIFT, 0)) ||
            (GetMonData(mon, MON_DATA_EGG_MET_LOCATION, NULL) == sub_02017FE4(MAPSECTYPE_GIFT, 9)) ||
            (GetMonData(mon, MON_DATA_EGG_MET_LOCATION, NULL) == sub_02017FE4(MAPSECTYPE_GIFT, 10)) ||
            (GetMonData(mon, MON_DATA_EGG_MET_LOCATION, NULL) == sub_02017FE4(MAPSECTYPE_GIFT, 11)) ||
            (GetMonData(mon, MON_DATA_EGG_MET_LOCATION, NULL) == sub_02017FE4(MAPSECTYPE_GIFT, 13)) ||
            (GetMonData(mon, MON_DATA_EGG_MET_LOCATION, NULL) == sub_02017FE4(MAPSECTYPE_GIFT, 14))) {
                if (isMine == TRUE) {
                    return 5;
                }
                return 6;
        }

        if (isMine == TRUE) {
            return 3;
        }
        return 4;
    }

    if (isMine == TRUE) {
        if (GetMonData(mon, MON_DATA_FATEFUL_ENCOUNTER, NULL) == TRUE) {
            if (GetMonData(mon, MON_DATA_EGG_MET_LOCATION, NULL) == sub_02017FE4(MAPSECTYPE_EXTERNAL, 1)) {
                return 20;
            }
            return 18;
        }
        return 16;
    }
    if (GetMonData(mon, MON_DATA_FATEFUL_ENCOUNTER, NULL) == TRUE) {
        return 19;
    }
    return 17;
}
#else
asm int sub_0208F070(Pokemon *a0, BOOL isMine) {
	push {r4, r5, r6, lr}
	add r4, r1, #0
	mov r1, #0x4c
	mov r2, #0
	add r5, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _0208F084
	b _0208F212
_0208F084:
	add r0, r5, #0
	mov r1, #0x98
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _0208F0F0
	add r0, r5, #0
	mov r1, #0x99
	mov r2, #0
	bl GetMonData
	add r6, r0, #0
	mov r0, #0
	mov r1, #0x37
	bl sub_02017FE4
	cmp r6, r0
	bne _0208F0AE
	mov r0, #0xf
	pop {r4, r5, r6, pc}
_0208F0AE:
	add r0, r5, #0
	mov r1, #0x6e
	mov r2, #0
	bl GetMonData
	cmp r0, #1
	bne _0208F0C8
	cmp r4, #1
	bne _0208F0C4
	mov r0, #7
	pop {r4, r5, r6, pc}
_0208F0C4:
	mov r0, #8
	pop {r4, r5, r6, pc}
_0208F0C8:
	add r0, r5, #0
	mov r1, #0x99
	mov r2, #0
	bl GetMonData
	add r5, r0, #0
	mov r0, #1
	add r1, r0, #0
	bl sub_02017FE4
	cmp r5, r0
	bne _0208F0E4
	mov r0, #2
	pop {r4, r5, r6, pc}
_0208F0E4:
	cmp r4, #1
	bne _0208F0EC
	mov r0, #0
	pop {r4, r5, r6, pc}
_0208F0EC:
	mov r0, #1
	pop {r4, r5, r6, pc}
_0208F0F0:
	add r0, r5, #0
	mov r1, #0x6e
	mov r2, #0
	bl GetMonData
	cmp r0, #1
	bne _0208F152
	add r0, r5, #0
	mov r1, #0x98
	mov r2, #0
	bl GetMonData
	add r6, r0, #0
	mov r0, #1
	mov r1, #2
	bl sub_02017FE4
	cmp r6, r0
	bne _0208F122
	cmp r4, #1
	bne _0208F11E
	mov r0, #0xd
	pop {r4, r5, r6, pc}
_0208F11E:
	mov r0, #0xe
	pop {r4, r5, r6, pc}
_0208F122:
	add r0, r5, #0
	mov r1, #0x98
	mov r2, #0
	bl GetMonData
	add r5, r0, #0
	mov r0, #2
	mov r1, #1
	bl sub_02017FE4
	cmp r5, r0
	bne _0208F146
	cmp r4, #1
	bne _0208F142
	mov r0, #0xb
	pop {r4, r5, r6, pc}
_0208F142:
	mov r0, #0xc
	pop {r4, r5, r6, pc}
_0208F146:
	cmp r4, #1
	bne _0208F14E
	mov r0, #9
	pop {r4, r5, r6, pc}
_0208F14E:
	mov r0, #0xa
	pop {r4, r5, r6, pc}
_0208F152:
	add r0, r5, #0
	mov r1, #0x98
	mov r2, #0
	bl GetMonData
	add r6, r0, #0
	mov r0, #1
	add r1, r0, #0
	bl sub_02017FE4
	cmp r6, r0
	beq _0208F1FA
	add r0, r5, #0
	mov r1, #0x98
	mov r2, #0
	bl GetMonData
	add r6, r0, #0
	mov r0, #1
	mov r1, #0
	bl sub_02017FE4
	cmp r6, r0
	beq _0208F1FA
	add r0, r5, #0
	mov r1, #0x98
	mov r2, #0
	bl GetMonData
	add r6, r0, #0
	mov r0, #1
	mov r1, #9
	bl sub_02017FE4
	cmp r6, r0
	beq _0208F1FA
	add r0, r5, #0
	mov r1, #0x98
	mov r2, #0
	bl GetMonData
	add r6, r0, #0
	mov r0, #1
	mov r1, #0xa
	bl sub_02017FE4
	cmp r6, r0
	beq _0208F1FA
	add r0, r5, #0
	mov r1, #0x98
	mov r2, #0
	bl GetMonData
	add r6, r0, #0
	mov r0, #1
	mov r1, #0xb
	bl sub_02017FE4
	cmp r6, r0
	beq _0208F1FA
	add r0, r5, #0
	mov r1, #0x98
	mov r2, #0
	bl GetMonData
	add r6, r0, #0
	mov r0, #1
	mov r1, #0xd
	bl sub_02017FE4
	cmp r6, r0
	beq _0208F1FA
	add r0, r5, #0
	mov r1, #0x98
	mov r2, #0
	bl GetMonData
	add r5, r0, #0
	mov r0, #1
	mov r1, #0xe
	bl sub_02017FE4
	cmp r5, r0
	bne _0208F206
_0208F1FA:
	cmp r4, #1
	bne _0208F202
	mov r0, #5
	pop {r4, r5, r6, pc}
_0208F202:
	mov r0, #6
	pop {r4, r5, r6, pc}
_0208F206:
	cmp r4, #1
	bne _0208F20E
	mov r0, #3
	pop {r4, r5, r6, pc}
_0208F20E:
	mov r0, #4
	pop {r4, r5, r6, pc}
_0208F212:
	cmp r4, #1
	bne _0208F248
	add r0, r5, #0
	mov r1, #0x6e
	mov r2, #0
	bl GetMonData
	cmp r0, #1
	bne _0208F244
	add r0, r5, #0
	mov r1, #0x98
	mov r2, #0
	bl GetMonData
	add r4, r0, #0
	mov r0, #2
	mov r1, #1
	bl sub_02017FE4
	cmp r4, r0
	bne _0208F240
	mov r0, #0x14
	pop {r4, r5, r6, pc}
_0208F240:
	mov r0, #0x12
	pop {r4, r5, r6, pc}
_0208F244:
	mov r0, #0x10
	pop {r4, r5, r6, pc}
_0208F248:
	add r0, r5, #0
	mov r1, #0x6e
	mov r2, #0
	bl GetMonData
	cmp r0, #1
	bne _0208F25A
	mov r0, #0x13
	pop {r4, r5, r6, pc}
_0208F25A:
	mov r0, #0x11
	pop {r4, r5, r6, pc}
}
#endif //NONMATCHING

void MonSetTrainerMemo(Pokemon *mon, PlayerProfile *profile, int strat, int mapsec, HeapID heapId) {
    BoxMonSetTrainerMemo(&mon->box, profile, strat, mapsec, heapId);
}

void BoxMonSetTrainerMemo(BoxPokemon *boxMon, PlayerProfile *profile, int strat, int mapsec, HeapID heapId) {
    int var;

    switch (strat) {
    case 0:
        if (mapsec > sub_02017FE4(MAPSECTYPE_GIFT, 0)) {
            mapsec = sub_02017FE4(MAPSECTYPE_EXTERNAL, 2);
        }
        if (!GetBoxMonData(boxMon, MON_DATA_IS_EGG, NULL)) {
            sub_0208F5C8(boxMon, FALSE);
            sub_0208F550(boxMon, mapsec, TRUE);
            CopyLevelToMetLevel(boxMon);
        } else {
            sub_0208F550(boxMon, mapsec, FALSE);
            sub_0208F5C8(boxMon, TRUE);
        }
        SetOriginalTrainerData(boxMon, profile, heapId);
        break;
    case 7:
        if (mapsec > sub_02017FE4(MAPSECTYPE_GIFT, 0)) {
            mapsec = sub_02017FE4(MAPSECTYPE_EXTERNAL, 2);
        }
        if (!GetBoxMonData(boxMon, MON_DATA_IS_EGG, NULL)) {
            sub_0208F5C8(boxMon, FALSE);
            sub_0208F550(boxMon, mapsec, TRUE);
            CopyLevelToMetLevel(boxMon);
            break;
        }
        sub_0208F550(boxMon, mapsec, FALSE);
        sub_0208F5C8(boxMon, TRUE);
        break;
    case 1:
        if (!GetBoxMonData(boxMon, MON_DATA_IS_EGG, NULL)) {
            sub_0208F5C8(boxMon, FALSE);
            sub_0208F550(boxMon, sub_02017FE4(MAPSECTYPE_GIFT, 1), TRUE);
            CopyLevelToMetLevel(boxMon);
            break;
        }
        sub_0208F5C8(boxMon, FALSE);
        sub_0208F550(boxMon, sub_02017FE4(MAPSECTYPE_GIFT, 1), TRUE);
        break;
    case 2:
        sub_0208F5C8(boxMon, FALSE);
        sub_0208F550(boxMon, sub_02017FE4(MAPSECTYPE_NORMAL, 0x37), TRUE);
        CopyLevelToMetLevel(boxMon);
        break;
    case 3:
        sub_0208F550(boxMon, mapsec, FALSE);
        sub_0208F5C8(boxMon, TRUE);
        SetOriginalTrainerData(boxMon, profile, heapId);
        break;
    case 4:
        if (BoxmonBelongsToPlayer(boxMon, profile, heapId) == TRUE) {
            if (!GetBoxMonData(boxMon, MON_DATA_IS_EGG, NULL)) {
                sub_0208F5C8(boxMon, FALSE);
                sub_0208F550(boxMon, mapsec, TRUE);
                CopyLevelToMetLevel(boxMon);
            } else {
                sub_0208F550(boxMon, mapsec, 0);
                sub_0208F5C8(boxMon, TRUE);
            }
        } else if (!GetBoxMonData(boxMon, MON_DATA_IS_EGG, NULL)) {
                sub_0208F5C8(boxMon, FALSE);
                sub_0208F550(boxMon, mapsec, TRUE);
                CopyLevelToMetLevel(boxMon);
        } else {
            sub_0208F5C8(boxMon, FALSE);
            sub_0208F550(boxMon, mapsec, TRUE);
        }
        SetFatefulEncounter(boxMon);
        break;
    case 5:
        if (GetBoxMonData(boxMon, MON_DATA_IS_EGG, NULL)) {
            sub_0208F550(boxMon, sub_02017FE4(MAPSECTYPE_GIFT, 2), TRUE);
        }
        break;
    case 6:
        if (mapsec > sub_02017FE4(MAPSECTYPE_GIFT, 0)) {
            mapsec = 0;
        }
        if (!BoxmonBelongsToPlayer(boxMon, profile, heapId)) {
            var = GetBoxMonData(boxMon, MON_DATA_MET_LOCATION, NULL);
            SetBoxMonData(boxMon, MON_DATA_EGG_MET_LOCATION, &var);

            var = GetBoxMonData(boxMon, MON_DATA_MET_YEAR, NULL);
            SetBoxMonData(boxMon, MON_DATA_EGG_MET_YEAR, &var);

            var = GetBoxMonData(boxMon, MON_DATA_MET_MONTH, NULL);
            SetBoxMonData(boxMon, MON_DATA_EGG_MET_MONTH, &var);

            var = GetBoxMonData(boxMon, MON_DATA_MET_DAY, NULL);
            SetBoxMonData(boxMon, MON_DATA_EGG_MET_DAY, &var);
        }
        sub_0208F550(boxMon, mapsec, TRUE);
        SetOriginalTrainerData(boxMon, profile, heapId);
        break;
    }
}

static void SetOriginalTrainerData(BoxPokemon *boxMon, PlayerProfile *profile, HeapID heapId) {
    u32 otId = PlayerProfile_GetTrainerID(profile);
    u32 gender = PlayerProfile_GetTrainerGender(profile);
    String *name = PlayerProfile_GetPlayerName_NewString(profile, heapId);

    SetBoxMonData(boxMon, MON_DATA_OTID, &otId);
    SetBoxMonData(boxMon, MON_DATA_MET_GENDER, &gender);
    SetBoxMonData(boxMon, MON_DATA_OT_NAME_2, name);

    String_Delete(name);
}

static void sub_0208F550(BoxPokemon *boxMon, int mapsec, BOOL isNotEgg) {
    RTCDate date;

    GF_RTC_CopyDate(&date);
    if (!isNotEgg) {
        SetBoxMonData(boxMon, MON_DATA_EGG_MET_LOCATION, &mapsec);
        SetBoxMonData(boxMon, MON_DATA_EGG_MET_YEAR, &date.year);
        SetBoxMonData(boxMon, MON_DATA_EGG_MET_MONTH, &date.month);
        SetBoxMonData(boxMon, MON_DATA_EGG_MET_DAY, &date.day);
        return;
    }
    SetBoxMonData(boxMon, MON_DATA_MET_LOCATION, &mapsec);
    SetBoxMonData(boxMon, MON_DATA_MET_YEAR, &date.year);
    SetBoxMonData(boxMon, MON_DATA_MET_MONTH, &date.month);
    SetBoxMonData(boxMon, MON_DATA_MET_DAY, &date.day);
}

static void sub_0208F5C8(BoxPokemon *boxMon, BOOL isEgg) {
    int zero = 0;
    if (!isEgg) {
        SetBoxMonData(boxMon, MON_DATA_EGG_MET_LOCATION, &zero);
        SetBoxMonData(boxMon, MON_DATA_EGG_MET_YEAR, &zero);
        SetBoxMonData(boxMon, MON_DATA_EGG_MET_MONTH, &zero);
        SetBoxMonData(boxMon, MON_DATA_EGG_MET_DAY, &zero);
        return;
    }
    SetBoxMonData(boxMon, MON_DATA_MET_LOCATION, &zero);
    SetBoxMonData(boxMon, MON_DATA_MET_YEAR, &zero);
    SetBoxMonData(boxMon, MON_DATA_MET_MONTH, &zero);
    SetBoxMonData(boxMon, MON_DATA_MET_DAY, &zero);
}

static void CopyLevelToMetLevel(BoxPokemon *boxMon) {
    int level = GetBoxMonData(boxMon, MON_DATA_LEVEL, NULL);
    SetBoxMonData(boxMon, MON_DATA_MET_LEVEL, &level);
}

static void SetFatefulEncounter(BoxPokemon *boxMon) {
    int var = 1;
    SetBoxMonData(boxMon, MON_DATA_FATEFUL_ENCOUNTER, &var);
}
