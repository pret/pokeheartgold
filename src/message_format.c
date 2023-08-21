#include "global.h"
#include "message_format.h"
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
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0445.h"
#include "msgdata/msg/msg_0040.h"
#include "msgdata/msg/msg_0313.h"
#include "msgdata/msg/msg_0021.h"
#include "msgdata/msg/msg_0430.h"
#include "msgdata/msg/msg_0428.h"
#include "msgdata/msg/msg_0274.h"
#include "msgdata/msg/msg_0191.h"

MessageFormat *MessageFormat_New(HeapID heapId) {
    return MessageFormat_New_Custom(8, 32, heapId);
}

MessageFormat *MessageFormat_New_Custom(u32 nstr, u32 len, HeapID heapId) {
    MessageFormat *ret;
    int i;

    GF_ASSERT(nstr != 0);
    GF_ASSERT(len != 0);
    ret = AllocFromHeapAtEnd(heapId, sizeof(MessageFormat));
    if (ret != NULL) {
        ret->count = nstr;
        ret->heapId = heapId;
        ret->buffer = String_New(len, heapId);
        if (ret->buffer != NULL) {
            ret->fields = AllocFromHeapAtEnd(heapId, nstr * sizeof(MessageFormatFields));
            if (ret->fields != NULL) {
                for (i = 0; i < nstr; i++) {
                    MessageFormat_InitFields(&ret->fields[i]);
                    ret->fields[i].msg = String_New(len, heapId);
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

void MessageFormat_Delete(MessageFormat *messageFormat) {
    s32 i;
    GF_ASSERT(messageFormat->count != 0);
    if (messageFormat->fields != NULL) {
        for (i = 0; i < messageFormat->count; i++) {
            if (messageFormat->fields[i].msg == NULL) {
                break;
            }
            String_Delete(messageFormat->fields[i].msg);
        }
        FreeToHeap(messageFormat->fields);
    }
    if (messageFormat->buffer != NULL) {
        String_Delete(messageFormat->buffer);
    }
    messageFormat->count = 0;
    FreeToHeap(messageFormat);
}

void MessageFormat_InitFields(MessageFormatFields *field) {
#pragma unused(field)
}

void SetStringAsPlaceholder(MessageFormat *msgFmt, u32 fieldno, const String *string, const MessageFormatAttrs *attrs) {
    GF_ASSERT(fieldno < msgFmt->count);
    if (fieldno < msgFmt->count) {
        if (attrs != NULL) {
            msgFmt->fields[fieldno].attrs = *attrs;
        }
        String_Copy(msgFmt->fields[fieldno].msg, string);
    }
}

void BufferString(MessageFormat *msgFmt, u32 fieldno, const String *string, s32 a3, s32 a4, s32 a5) {
#pragma unused(a3, a4, a5)
    SetStringAsPlaceholder(msgFmt, fieldno, string, NULL);
}

void BufferPlayersName(MessageFormat *msgFmt, u32 fieldno, PlayerProfile *playerProfile) {
    CopyU16ArrayToString(msgFmt->buffer, PlayerProfile_GetNamePtr(playerProfile));
    SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
}

void BufferRivalsName(MessageFormat *msgFmt, u32 fieldno, SaveData *saveData) {
    CopyU16ArrayToString(msgFmt->buffer, Save_Misc_RivalName_Const_Get(Save_Misc_Const_Get(saveData)));
    SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
}

void BufferFriendsName(MessageFormat *msgFmt, u32 fieldno, SaveData *saveData) {
    PlayerProfile *playerProfile = Save_PlayerData_GetProfileAddr(saveData);
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0445_bin, msgFmt->heapId);
    if (PlayerProfile_GetTrainerGender(playerProfile) == PLAYER_GENDER_MALE) {
        ReadMsgDataIntoString(msgData, msg_0445_00001, msgFmt->buffer); // Lyra
    } else {
        ReadMsgDataIntoString(msgData, msg_0445_00000, msgFmt->buffer); // Ethan
    }
    SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
    DestroyMsgData(msgData);
}

void BufferSpeciesName(MessageFormat *msgFmt, u32 fieldno, u16 species) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0237_bin, msgFmt->heapId);
    ReadMsgDataIntoString(msgData, species, msgFmt->buffer);
    SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
    DestroyMsgData(msgData);
}

void BufferBoxMonSpeciesName(MessageFormat *msgFmt, u32 fieldno, BoxPokemon *boxMon) {
    BufferSpeciesName(msgFmt, fieldno, GetBoxMonData(boxMon, MON_DATA_SPECIES, NULL));
}

void BufferBoxMonSpeciesNameWithArticle(MessageFormat *msgFmt, u32 fieldno, BoxPokemon *boxMon) {
    BufferSpeciesNameWithArticle(msgFmt, fieldno, GetBoxMonData(boxMon, MON_DATA_SPECIES, NULL));
}

void BufferSpeciesNameWithArticle(MessageFormat *msgFmt, u32 fieldno, u32 species) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0238_bin, msgFmt->heapId);
    ReadMsgDataIntoString(msgData, species, msgFmt->buffer);
    SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
    DestroyMsgData(msgData);
}

void BufferBoxMonNickname(MessageFormat *msgFmt, u32 fieldno, BoxPokemon *boxMon) {
    GetBoxMonData(boxMon, MON_DATA_NICKNAME_3, msgFmt->buffer);
    SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
}

void BufferBoxMonOTName(MessageFormat *msgFmt, u32 fieldno, BoxPokemon *boxMon) {
    GetBoxMonData(boxMon, MON_DATA_OT_NAME_2, msgFmt->buffer);
    SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
}

void BufferIntegerAsString(MessageFormat *msgFmt, u32 fieldno, s32 num, u32 numDigits, PrintingMode strconvmode, BOOL whichCharset) {
    String16_FormatInteger(msgFmt->buffer, num, numDigits, strconvmode, whichCharset);
    SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
}

void BufferMoveName(MessageFormat *msgFmt, u32 fieldno, u32 moveId) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0750_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, moveId, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferRibbonNameOrDesc(MessageFormat *msgFmt, u32 fieldno, u32 decoId) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0424_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, decoId, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferAbilityName(MessageFormat *msgFmt, u32 fieldno, u32 abilityId) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0720_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, abilityId, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferNatureName(MessageFormat *msgFmt, u32 fieldno, u32 natureId) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0034_bin, msgFmt->heapId);
    ReadMsgDataIntoString(msgData, natureId, msgFmt->buffer);
    SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
    DestroyMsgData(msgData);
}

void BufferItemName(MessageFormat *msgFmt, u32 fieldno, u32 itemId) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0222_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, itemId, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferItemNameWithIndefArticle(MessageFormat *msgFmt, u32 fieldno, u32 itemId) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0223_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, itemId, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferItemNamePlural(MessageFormat *msgFmt, u32 fieldno, u32 itemId) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0224_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, itemId, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferPocketName(MessageFormat *msgFmt, u32 fieldno, u32 pocketId) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0226_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, pocketId, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferTypeName(MessageFormat *msgFmt, u32 fieldno, u32 typeId) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0735_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, typeId, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferStatName(MessageFormat *msgFmt, u32 fieldno, u32 statId) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0443_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, statId, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferStatusName(MessageFormat *msgFmt, u32 fieldno, u32 statusId) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0044_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, statusId, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferFlavorDislikeText(MessageFormat *msgFmt, u32 fieldno, u32 flavorId) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0639_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, flavorId, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferLandmarkName(MessageFormat *msgFmt, u32 fieldno, u32 landmarkId) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0279_bin, msgFmt->heapId);
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

void BufferTrainerClassName(MessageFormat *msgFmt, u32 fieldno, u32 trainerClassId) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0730_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, trainerClassId, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferTrainerClassNameWithArticle(MessageFormat *msgFmt, u32 fieldno, u32 trainerClassId) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0731_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, trainerClassId, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferTrainerClassNameFromDataStruct(MessageFormat *msgFmt, u32 fieldno, TRAINER *trainer) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0730_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, trainer->trainerClass, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferTrainerName(MessageFormat *msgFmt, u32 fieldno, u32 trainerId) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0729_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, trainerId, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferFrontierOpponentName(MessageFormat *msgFmt, u32 fieldno, u32 opponentId) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0027_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, opponentId, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferTrainerNameFromDataStruct(MessageFormat *msgFmt, u32 fieldno, TRAINER *trainer) {
    CopyU16ArrayToString(msgFmt->buffer, trainer->name);
    SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
}

// The GMM associated with this routine is blanked.
void BufferDecorationName(MessageFormat *msgFmt, u32 fieldno, u32 decorationId) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0737_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, decorationId, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferGenderSymbol(MessageFormat *msgFmt, u32 fieldno, u8 gender) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0040_bin, msgFmt->heapId);
    switch (gender) {
    case PLAYER_GENDER_MALE:
        ReadMsgDataIntoString(msgData, msg_0040_00055, msgFmt->buffer);
        break;
    case PLAYER_GENDER_FEMALE:
        ReadMsgDataIntoString(msgData, msg_0040_00056, msgFmt->buffer);
        break;
    default:
        String_SetEmpty(msgFmt->buffer);
        break;
    }
    SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
    DestroyMsgData(msgData);
}

void BufferPCBoxName(MessageFormat *msgFmt, u32 fieldno, PC_STORAGE *pcStorage, u32 boxno) {
    PCStorage_GetBoxName(pcStorage, boxno, msgFmt->buffer);
    SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
}

void BufferCountryName(MessageFormat *msgFmt, u32 fieldno, u32 countryId) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0798_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, countryId, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferCityName(MessageFormat *msgFmt, u32 fieldno, u32 countryId, u32 cityId) {
    MsgData *msgData;
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

void BufferECWord(MessageFormat *msgFmt, u32 fieldno, u16 ecWordIdx) {
    GetECWordIntoStringByIndex(ecWordIdx, msgFmt->buffer);
    SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
}

void BufferSealName(MessageFormat *msgFmt, u32 fieldno, u32 sealId) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0015_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, sealId, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferSealNamePlural(MessageFormat *msgFmt, u32 fieldno, u32 sealId) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0016_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, sealId, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferLocationName(MessageFormat *msgFmt, u32 fieldno, u32 mapsecId) {
    static const u16 msgBanks[] = {
        NARC_msg_msg_0279_bin,
        NARC_msg_msg_0281_bin,
        NARC_msg_msg_0280_bin,
    };
    u32 locationBank = sub_02017FAC(mapsecId);
    u32 locationId = sub_02017FCC(mapsecId);
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, msgBanks[locationBank], msgFmt->heapId);
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

void BufferFashionName(MessageFormat *msgFmt, u32 fieldno, u32 fashionId) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0216_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, fashionId, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferFashionNameWithArticle(MessageFormat *msgFmt, u32 fieldno, u32 fashionId) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0217_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, fashionId, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferContestBackgroundName(MessageFormat *msgFmt, u32 fieldno, u32 bgId) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0218_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, bgId, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferGroupName(MessageFormat *msgFmt, SaveData *saveData, s32 groupId, s32 fieldno, s32 nameType) {
    SAV_FRIEND_GRP *friendGrp = Save_FriendGroup_Get(saveData);
    u8 sp10 = sub_0202C830(friendGrp, groupId);
    u8 r7 = sub_0202C83C(friendGrp, groupId);
    String *dest = String_New(64, HEAP_ID_4);
    CopyU16ArrayToString(dest, sub_0202C7E0(friendGrp, groupId, nameType));
    BufferString(msgFmt, fieldno, dest, sp10, 1, r7);
    String_Delete(dest);
}

void BufferWiFiPlazaActivityName(MessageFormat *msgFmt, u32 fieldno, u32 activityId) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0755_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, activityId, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferWiFiPlazaEventName(MessageFormat *msgFmt, u32 fieldno, u32 eventId) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0753_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, eventId, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferWiFiPlazaInstrumentName(MessageFormat *msgFmt, u32 fieldno, u32 instrumentId) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0756_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, instrumentId, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferJPGreeting(MessageFormat *msgFmt, u32 fieldno, u32 timeOfDay) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0771_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, timeOfDay, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferENGreeting(MessageFormat *msgFmt, u32 fieldno, u32 timeOfDay) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0767_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, timeOfDay, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferFRGreeting(MessageFormat *msgFmt, u32 fieldno, u32 timeOfDay) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0768_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, timeOfDay, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferITGreeting(MessageFormat *msgFmt, u32 fieldno, u32 timeOfDay) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0770_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, timeOfDay, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferDEGreeting(MessageFormat *msgFmt, u32 fieldno, u32 timeOfDay) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0769_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, timeOfDay, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferSPGreeting(MessageFormat *msgFmt, u32 fieldno, u32 timeOfDay) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0772_bin, msgFmt->heapId);
    if (msgData != NULL) {
        ReadMsgDataIntoString(msgData, timeOfDay, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void BufferPokeathlonCourseName(MessageFormat *msgFmt, u32 fieldno, u32 courseId) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0313_bin, msgFmt->heapId);
    GF_ASSERT(courseId < 11);
    ReadMsgDataIntoString(msgData, courseId + msg_0313_00000, msgFmt->buffer);
    SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
    DestroyMsgData(msgData);
}

void BufferPokeathlonMedalName(MessageFormat *msgFmt, u32 fieldno, u32 medalId) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0313_bin, msgFmt->heapId);
    GF_ASSERT(medalId < 5);
    ReadMsgDataIntoString(msgData, medalId + msg_0313_00015, msgFmt->buffer);
    SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
    DestroyMsgData(msgData);
}

void BufferPokeathlonEventName(MessageFormat *msgFmt, u32 fieldno, u32 eventId) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0313_bin, msgFmt->heapId);
    GF_ASSERT(eventId < 10);
    ReadMsgDataIntoString(msgData, eventId + msg_0313_00020, msgFmt->buffer);
    SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
    DestroyMsgData(msgData);
}

void BufferApricornName(MessageFormat *msgFmt, u32 fieldno, u32 apricornId) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0021_bin, msgFmt->heapId);
    if (apricornId >= 7) {
        GF_ASSERT(apricornId < 7);
        apricornId = 0;
    }
    ReadMsgDataIntoString(msgData, apricornId + msg_0021_00007, msgFmt->buffer);
    SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
    DestroyMsgData(msgData);
}

void BufferSafariZoneObjectName(MessageFormat *msgFmt, u32 fieldno, u32 objectId) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0430_bin, msgFmt->heapId);
    if (objectId >= 24) {
        GF_ASSERT(objectId < 24);
        objectId = 0;
    }
    ReadMsgDataIntoString(msgData, objectId + msg_0430_00014, msgFmt->buffer);
    SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
    DestroyMsgData(msgData);
}

void BufferSafariZoneAreaName(MessageFormat *msgFmt, u32 fieldno, u32 areaId) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0428_bin, msgFmt->heapId);
    if (areaId >= 12) {
        GF_ASSERT(areaId < 12);
        areaId = 0;
    }
    ReadMsgDataIntoString(msgData, areaId + msg_0428_00000, msgFmt->buffer);
    SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
    DestroyMsgData(msgData);
}

void BufferPokewalkerCourseName(MessageFormat *msgFmt, u32 fieldno, u32 courseId) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0274_bin, msgFmt->heapId);
    if (courseId >= 27) {
        GF_ASSERT(courseId < 27);
        courseId = 0;
    }
    ReadMsgDataIntoString(msgData, courseId + msg_0274_00091, msgFmt->buffer);
    SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
    DestroyMsgData(msgData);
}

void BufferMonthNameAbbr(MessageFormat *msgFmt, u32 fieldno, u32 month) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0239_bin, msgFmt->heapId);
    if (msgData != NULL) {
        if (month < 1 || month > 12) {
            month = 1;
        }
        ReadMsgDataIntoString(msgData, month - 1, msgFmt->buffer);
        SetStringAsPlaceholder(msgFmt, fieldno, msgFmt->buffer, NULL);
        DestroyMsgData(msgData);
    }
}

void MessageFormat_UpperFirstChar(MessageFormat *msgFmt, u32 fieldno) {
    String_UpperCharN(msgFmt->fields[fieldno].msg, 0);
}

void BufferDeptStoreFloorNo(MessageFormat *msgFmt, u32 fieldno, u32 floor) {
    s32 msgno;
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0191_bin, msgFmt->heapId);
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

void StringExpandPlaceholders(MessageFormat * msgFmt, String * dest, String * src) {
    const u16 * cstr = String_cstr(src);
    String_SetEmpty(dest);
    while (*cstr != EOS) {
        if (*cstr == EXT_CTRL_CODE_BEGIN) {
            if (MsgArray_ControlCodeIsStrVar(cstr)) {
                u32 idx = MsgArray_ControlCodeGetField(cstr, 0);
                GF_ASSERT(idx < msgFmt->count);
                String_Cat_HandleTrainerName(dest, msgFmt->fields[idx].msg);
                cstr = MsgArray_SkipControlCode(cstr);
            } else {
                const u16 * before = cstr;
                cstr = MsgArray_SkipControlCode(cstr);
                while (before < cstr) {
                    String_AddChar(dest, *before++);
                }
            }
        } else {
            String_AddChar(dest, *cstr++);
        }
    }
}

void MessageFormat_ResetBuffers(MessageFormat * msgFmt) {
    for (int i = 0; i < msgFmt->count; i++) {
        String_SetEmpty(msgFmt->fields[i].msg);
    }
}
