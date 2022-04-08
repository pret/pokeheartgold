#include "msgfmt.h"
#include "msgdata.h"
#include "pokemon.h"
#include "trainer_data.h"
#include "pokemon_storage_system.h"
#include "gts_globe.h"
#include "easy_chat.h"
#include "map_section.h"
#include "friend_group.h"
#include "string_control_code.h"
#include "constants/map_sections.h"
#include "msgdata/msg/msg_0445.h"
#include "msgdata/msg/msg_0040.h"
#include "msgdata/msg/msg_0313.h"
#include "msgdata/msg/msg_0021.h"
#include "msgdata/msg/msg_0430.h"
#include "msgdata/msg/msg_0428.h"
#include "msgdata/msg/msg_0274.h"
#include "msgdata/msg/msg_0191.h"

void ScrStrBufs_InitSub(MSGFMT_FIELD *field);

MSGFMT *ScrStrBufs_new(HeapID heapId) {
    return ScrStrBufs_new_custom(8, 32, heapId);
}

MSGFMT *ScrStrBufs_new_custom(u32 nstr, u32 len, HeapID heapId) {
    MSGFMT *ret;
    int i;

    GF_ASSERT(nstr != 0);
    GF_ASSERT(len != 0);
    ret = AllocFromHeapAtEnd(heapId, sizeof(MSGFMT));
    if (ret != NULL) {
        ret->nstr = nstr;
        ret->heapId = heapId;
        ret->buffer = String_ctor(len, heapId);
        if (ret->buffer != NULL) {
            ret->fields = AllocFromHeapAtEnd(heapId, nstr * sizeof(MSGFMT_FIELD));
            if (ret->fields != NULL) {
                for (i = 0; i < nstr; i++) {
                    ScrStrBufs_InitSub(&ret->fields[i]);
                    ret->fields[i].msg = String_ctor(len, heapId);
                    if (ret->fields[i].msg == NULL) {
                        break;
                    }
                }
                if (i == nstr) {
                    return ret;
                }
            }
        }
    }

    return NULL;
}

void ScrStrBufs_delete(MSGFMT *msgFmt) {
    int i;
    GF_ASSERT(msgFmt->nstr != 0);
    if (msgFmt->fields != NULL) {
        for (i = 0; i < msgFmt->nstr; i++) {
            if (msgFmt->fields[i].msg == NULL) {
                break;
            }
            String_dtor(msgFmt->fields[i].msg);
        }
        FreeToHeap(msgFmt->fields);
    }
    if (msgFmt->buffer != NULL) {
        String_dtor(msgFmt->buffer);
    }
    msgFmt->nstr = 0;
    FreeToHeap(msgFmt);
}

void ScrStrBufs_InitSub(MSGFMT_FIELD *field) {
#pragma unused(field)
}

void SetStringAsPlaceholder(MSGFMT *msgFmt, u32 fieldno, const STRING *string, const MSGFMT_FIELD_ATTRS *attrs) {
    GF_ASSERT(fieldno < msgFmt->nstr);
    if (fieldno < msgFmt->nstr) {
        if (attrs != NULL) {
            msgFmt->fields[fieldno].attrs = *attrs;
        }
        StringCopy(msgFmt->fields[fieldno].msg, string);
    }
}

void BufferString(MSGFMT *msgFmt, u32 fieldno, const STRING *string, int a3, int a4, int a5) {
#pragma unused(a3, a4, a5)
    SetStringAsPlaceholder(msgFmt, fieldno, string, NULL);
}

void BufferPlayersName(MSGFMT *msgFmt, u32 fieldno, PLAYERPROFILE *playerProfile) {
    CopyU16ArrayToString(msgFmt->buffer, PlayerProfile_GetNamePtr(playerProfile));
    SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
}

void BufferRivalsName(MSGFMT *msgFmt, u32 fieldno, SAVEDATA *saveData) {
    CopyU16ArrayToString(msgFmt->buffer, Sav2_Misc_RivalName_const_get(Sav2_Misc_const_get(saveData)));
    SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
}

void BufferFriendsName(MSGFMT *msgFmt, u32 fieldno, SAVEDATA *saveData) {
    PLAYERPROFILE *playerProfile = Sav2_PlayerData_GetProfileAddr(saveData);
    MSGDATA *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0445_bin, msgFmt->heapId);
    if (PlayerProfile_GetTrainerGender(playerProfile) == PLAYER_GENDER_MALE) {
        ReadMsgDataIntoString(msgData, msg_0445_00001, msgFmt->buffer); // Lyra
    } else {
        ReadMsgDataIntoString(msgData, msg_0445_00000, msgFmt->buffer); // Ethan
    }
    SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
    DestroyMsgData(msgData);
}

void BufferSpeciesName(MSGFMT *msgFmt, u32 fieldno, u16 species) {
    MSGDATA *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0237_bin, msgFmt->heapId);
    ReadMsgDataIntoString(msgData, species, msgFmt->buffer);
    SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
    DestroyMsgData(msgData);
}

void BufferBoxMonSpeciesName(MSGFMT *msgFmt, u32 fieldno, BOXMON *boxmon) {
    BufferSpeciesName(msgFmt, fieldno, GetBoxMonData(boxmon, MON_DATA_SPECIES, NULL));
}

void BufferBoxMonSpeciesNameWithArticle(MSGFMT *msgFmt, u32 fieldno, BOXMON *boxmon) {
    BufferSpeciesNameWithArticle(msgFmt, fieldno, GetBoxMonData(boxmon, MON_DATA_SPECIES, NULL));
}

void BufferSpeciesNameWithArticle(MSGFMT *msgFmt, u32 fieldno, u32 species) {
    MSGDATA *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0238_bin, msgFmt->heapId);
    ReadMsgDataIntoString(msgData, species, msgFmt->buffer);
    SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
    DestroyMsgData(msgData);
}

void BufferBoxMonNickname(MSGFMT *msgFmt, u32 fieldno, BOXMON *boxmon) {
    GetBoxMonData(boxmon, MON_DATA_NICKNAME_3, msgFmt->buffer);
    SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
}

void BufferBoxMonOTName(MSGFMT *msgFmt, u32 fieldno, BOXMON *boxmon) {
    GetBoxMonData(boxmon, MON_DATA_OT_NAME_2, msgFmt->buffer);
    SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
}

void BufferIntegerAsString(MSGFMT *msgFmt, u32 fieldno, int num, u32 numDigits, STRCONVMODE strconvmode, BOOL whichCharset) {
    String16_FormatInteger(msgFmt->buffer, num, numDigits, strconvmode, whichCharset);
    SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
}

void BufferMoveName(MSGFMT *msgFmt, u32 fieldno, u32 moveId) {
    MSGDATA *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0750_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, moveId, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferRibbonNameOrDesc(MSGFMT *msgFmt, u32 fieldno, u32 decoId) {
    MSGDATA *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0424_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, decoId, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferAbilityName(MSGFMT *msgFmt, u32 fieldno, u32 abilityId) {
    MSGDATA *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0720_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, abilityId, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferNatureName(MSGFMT *msgFmt, u32 fieldno, u32 natureId) {
    MSGDATA *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0034_bin, msgFmt->heapId);
    ReadMsgDataIntoString(msgData, natureId, msgFmt->buffer);
    SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
    DestroyMsgData(msgData);
}

void BufferItemName(MSGFMT *msgFmt, u32 fieldno, u32 itemId) {
    MSGDATA *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0222_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, itemId, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferItemNameWithIndefArticle(MSGFMT *msgFmt, u32 fieldno, u32 itemId) {
    MSGDATA *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0223_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, itemId, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferItemNamePlural(MSGFMT *msgFmt, u32 fieldno, u32 itemId) {
    MSGDATA *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0224_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, itemId, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferPocketName(MSGFMT *msgFmt, u32 fieldno, u32 pocketId) {
    MSGDATA *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0226_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, pocketId, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferTypeName(MSGFMT *msgFmt, u32 fieldno, u32 typeId) {
    MSGDATA *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0735_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, typeId, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferStatName(MSGFMT *msgFmt, u32 fieldno, u32 statId) {
    MSGDATA *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0443_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, statId, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferStatusName(MSGFMT *msgFmt, u32 fieldno, u32 statusId) {
    MSGDATA *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0044_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, statusId, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferFlavorDislikeText(MSGFMT *msgFmt, u32 fieldno, u32 flavorId) {
    MSGDATA *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0639_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, flavorId, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferLandmarkName(MSGFMT *msgFmt, u32 fieldno, u32 landmarkId) {
    MSGDATA *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0279_bin, msgFmt->heapId);
    if (msgData != NULL) {
        if (landmarkId == 0 || landmarkId >= MsgDataGetCount(msgData)) {
            DestroyMsgData(msgData);
            msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0280_bin, msgFmt->heapId);
            landmarkId = 2;
        }
        ReadMsgDataIntoString(msgData, landmarkId, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferTrainerClassName(MSGFMT *msgFmt, u32 fieldno, u32 trainerClassId) {
    MSGDATA *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0730_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, trainerClassId, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferTrainerClassNameWithArticle(MSGFMT *msgFmt, u32 fieldno, u32 trainerClassId) {
    MSGDATA *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0731_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, trainerClassId, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferTrainerClassNameFromDataStruct(MSGFMT *msgFmt, u32 fieldno, TRAINER *trainer) {
    MSGDATA *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0730_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, trainer->trainerClass, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferTrainerName(MSGFMT *msgFmt, u32 fieldno, u32 trainerId) {
    MSGDATA *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0729_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, trainerId, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferFrontierOpponentName(MSGFMT *msgFmt, u32 fieldno, u32 opponentId) {
    MSGDATA *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0027_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, opponentId, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferTrainerNameFromDataStruct(MSGFMT *msgFmt, u32 fieldno, TRAINER *trainer) {
    CopyU16ArrayToString(msgFmt->buffer, trainer->name);
    SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
}

// The GMM associated with this routine is blanked.
void BufferDecorationName(MSGFMT *msgFmt, u32 fieldno, u32 decorationId) {
    MSGDATA *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0737_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, decorationId, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferGenderSymbol(MSGFMT *msgFmt, u32 fieldno, u8 gender) {
    MSGDATA *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0040_bin, msgFmt->heapId);
    switch (gender) {
    case PLAYER_GENDER_MALE:
        ReadMsgDataIntoString(msgData, msg_0040_00055, msgFmt->buffer);
        break;
    case PLAYER_GENDER_FEMALE:
        ReadMsgDataIntoString(msgData, msg_0040_00056, msgFmt->buffer);
        break;
    default:
        StringSetEmpty(msgFmt->buffer);
        break;
    }
    SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
    DestroyMsgData(msgData);
}

void BufferPCBoxName(MSGFMT *msgFmt, u32 fieldno, PC_STORAGE *pcStorage, u32 boxno) {
    PCStorage_GetBoxName(pcStorage, boxno, msgFmt->buffer);
    SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
}

void BufferCountryName(MSGFMT *msgFmt, u32 fieldno, u32 countryId) {
    MSGDATA *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0798_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, countryId, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferCityName(MSGFMT *msgFmt, u32 fieldno, u32 countryId, u32 cityId) {
    MSGDATA *msgData;
    int msgBank = GetCityNamesMsgdataIdByCountry(countryId);
    if (msgBank != 0 && cityId != 0) {
        msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, msgBank, msgFmt->heapId);
        if (msgData != NULL) {
            ReadMsgDataIntoString(msgData, cityId, msgFmt->buffer);
            SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
            DestroyMsgData(msgData);
        }
    }
}

void BufferECWord(MSGFMT *msgFmt, u32 fieldno, u16 ecWordIdx) {
    GetECWordIntoStringByIndex(ecWordIdx, msgFmt->buffer);
    SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
}

void BufferSealName(MSGFMT *msgFmt, u32 fieldno, u32 sealId) {
    MSGDATA *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0015_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, sealId, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferSealNamePlural(MSGFMT *msgFmt, u32 fieldno, u32 sealId) {
    MSGDATA *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0016_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, sealId, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferLocationName(MSGFMT *msgFmt, u32 fieldno, u32 mapsecId) {
    static const u16 msgBanks[] = {
        NARC_msg_msg_0279_bin,
        NARC_msg_msg_0281_bin,
        NARC_msg_msg_0280_bin,
    };
    u32 locationBank = sub_02017FAC(mapsecId);
    u32 locationId = sub_02017FCC(mapsecId);
    MSGDATA *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, msgBanks[locationBank], msgFmt->heapId);
    int msgBank;
    if (msgData != NULL) {
        if (locationId < MsgDataGetCount(msgData) && (locationBank != 0 || locationId != 0)) {
            ReadMsgDataIntoString(msgData, locationId, msgFmt->buffer);
            SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
            DestroyMsgData(msgData);
        } else {
            DestroyMsgData(msgData);
            if (locationBank == 0 && locationId == 0) {
                msgBank = NARC_msg_msg_0281_bin;
                locationId = MAPLOC(METLOC_MYSTERY_ZONE);
            } else {
                msgBank = NARC_msg_msg_0280_bin;
                locationId = MAPLOC(METLOC_FARAWAY_PLACE);
            }
            msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, msgBank, msgFmt->heapId);
            if (msgData != NULL) {
                ReadMsgDataIntoString(msgData, locationId, msgFmt->buffer);
                SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
                DestroyMsgData(msgData);
            }
        }
    }
}

void BufferFashionName(MSGFMT *msgFmt, u32 fieldno, u32 fashionId) {
    MSGDATA *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0216_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, fashionId, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferFashionNameWithArticle(MSGFMT *msgFmt, u32 fieldno, u32 fashionId) {
    MSGDATA *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0217_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, fashionId, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferContestBackgroundName(MSGFMT *msgFmt, u32 fieldno, u32 bgId) {
    MSGDATA *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0218_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, bgId, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferGroupName(MSGFMT *msgFmt, SAVEDATA *saveData, int groupId, int fieldno, int nameType) {
    SAV_FRIEND_GRP *friendGrp = Save_FriendGroup_get(saveData);
    u8 sp10 = sub_0202C830(friendGrp, groupId);
    u8 r7 = sub_0202C83C(friendGrp, groupId);
    STRING *dest = String_ctor(64, 4);
    CopyU16ArrayToString(dest, sub_0202C7E0(friendGrp, groupId, nameType));
    BufferString(msgFmt, fieldno, dest, sp10, 1, r7);
    String_dtor(dest);
}

void BufferWiFiPlazaActivityName(MSGFMT *msgFmt, u32 fieldno, u32 activityId) {
    MSGDATA *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0755_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, activityId, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferWiFiPlazaEventName(MSGFMT *msgFmt, u32 fieldno, u32 eventId) {
    MSGDATA *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0753_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, eventId, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferWiFiPlazaInstrumentName(MSGFMT *msgFmt, u32 fieldno, u32 instrumentId) {
    MSGDATA *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0756_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, instrumentId, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferJPGreeting(MSGFMT *msgFmt, u32 fieldno, u32 timeOfDay) {
    MSGDATA *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0771_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, timeOfDay, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferENGreeting(MSGFMT *msgFmt, u32 fieldno, u32 timeOfDay) {
    MSGDATA *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0767_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, timeOfDay, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferFRGreeting(MSGFMT *msgFmt, u32 fieldno, u32 timeOfDay) {
    MSGDATA *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0768_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, timeOfDay, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferITGreeting(MSGFMT *msgFmt, u32 fieldno, u32 timeOfDay) {
    MSGDATA *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0770_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, timeOfDay, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferDEGreeting(MSGFMT *msgFmt, u32 fieldno, u32 timeOfDay) {
    MSGDATA *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0769_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, timeOfDay, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferSPGreeting(MSGFMT *msgFmt, u32 fieldno, u32 timeOfDay) {
    MSGDATA *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0772_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, timeOfDay, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferPokeathlonCourseName(MSGFMT *msgFmt, u32 fieldno, u32 courseId) {
    MSGDATA *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0313_bin, msgFmt->heapId);
    GF_ASSERT(courseId < 11);
    ReadMsgDataIntoString(msgData, courseId + msg_0313_00000, msgFmt->buffer);
    SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
    DestroyMsgData(msgData);
}

void BufferPokeathlonMedalName(MSGFMT *msgFmt, u32 fieldno, u32 medalId) {
    MSGDATA *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0313_bin, msgFmt->heapId);
    GF_ASSERT(medalId < 5);
    ReadMsgDataIntoString(msgData, medalId + msg_0313_00015, msgFmt->buffer);
    SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
    DestroyMsgData(msgData);
}

void BufferPokeathlonEventName(MSGFMT *msgFmt, u32 fieldno, u32 eventId) {
    MSGDATA *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0313_bin, msgFmt->heapId);
    GF_ASSERT(eventId < 10);
    ReadMsgDataIntoString(msgData, eventId + msg_0313_00020, msgFmt->buffer);
    SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
    DestroyMsgData(msgData);
}

void BufferApricornName(MSGFMT *msgFmt, u32 fieldno, u32 apricornId) {
    MSGDATA *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0021_bin, msgFmt->heapId);
    if (apricornId >= 7) {
        GF_ASSERT(apricornId < 7);
        apricornId = 0;
    }
    ReadMsgDataIntoString(msgData, apricornId + msg_0021_00007, msgFmt->buffer);
    SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
    DestroyMsgData(msgData);
}

void BufferSafariZoneObjectName(MSGFMT *msgFmt, u32 fieldno, u32 objectId) {
    MSGDATA *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0430_bin, msgFmt->heapId);
    if (objectId >= 24) {
        GF_ASSERT(objectId < 24);
        objectId = 0;
    }
    ReadMsgDataIntoString(msgData, objectId + msg_0430_00014, msgFmt->buffer);
    SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
    DestroyMsgData(msgData);
}

void BufferSafariZoneAreaName(MSGFMT *msgFmt, u32 fieldno, u32 areaId) {
    MSGDATA *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0428_bin, msgFmt->heapId);
    if (areaId >= 12) {
        GF_ASSERT(areaId < 12);
        areaId = 0;
    }
    ReadMsgDataIntoString(msgData, areaId + msg_0428_00000, msgFmt->buffer);
    SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
    DestroyMsgData(msgData);
}

void BufferPokewalkerCourseName(MSGFMT *msgFmt, u32 fieldno, u32 courseId) {
    MSGDATA *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0274_bin, msgFmt->heapId);
    if (courseId >= 27) {
        GF_ASSERT(courseId < 27);
        courseId = 0;
    }
    ReadMsgDataIntoString(msgData, courseId + msg_0274_00091, msgFmt->buffer);
    SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
    DestroyMsgData(msgData);
}

void BufferMonthNameAbbr(MSGFMT *msgFmt, u32 fieldno, u32 month) {
    MSGDATA *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0239_bin, msgFmt->heapId);
    if (msgData != NULL) {
        if (month < 1 || month > 12) {
            month = 1;
        }
        ReadMsgDataIntoString(msgData, month - 1, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void ScrStrBufs_UpperFirstChar(MSGFMT *msgFmt, u32 fieldno) {
    StrUpperCharN(msgFmt->fields[fieldno].msg, 0);
}

void BufferDeptStoreFloorNo(MSGFMT *msgFmt, u32 fieldno, u32 floor) {
    int msgno;
    MSGDATA *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0191_bin, msgFmt->heapId);
    GF_ASSERT(floor <= 6);
    if (msgData != NULL) {
        if (floor == 0) {
            msgno = msg_0191_00122;
        } else {
            msgno = msg_0191_00116 + floor - 1;
        }
        ReadMsgDataIntoString(msgData, msgno, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void StringExpandPlaceholders(MSGFMT * msgFmt, STRING * dest, STRING * src) {
    const u16 * cstr = String_c_str(src);
    StringSetEmpty(dest);
    while (*cstr != EOS) {
        if (*cstr == EXT_CTRL_CODE_BEGIN) {
            if (MsgArray_ControlCodeIsStrVar(cstr)) {
                u32 idx = MsgArray_ControlCodeGetField(cstr, 0);
                GF_ASSERT(idx < msgFmt->nstr);
                StringCat_HandleTrainerName(dest, msgFmt->fields[idx].msg);
                cstr = MsgArray_SkipControlCode(cstr);
            } else {
                const u16 * before = cstr;
                cstr = MsgArray_SkipControlCode(cstr);
                while (before < cstr) {
                    StrAddChar(dest, *before++);
                }
            }
        } else {
            StrAddChar(dest, *cstr++);
        }
    }
}

void ScrStrBufs_ResetBuffers(MSGFMT * msgFmt) {
    for (int i = 0; i < msgFmt->nstr; i++) {
        StringSetEmpty(msgFmt->fields[i].msg);
    }
}
