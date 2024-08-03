#ifndef GUARD_MESSAGE_FORMAT_H
#define GUARD_MESSAGE_FORMAT_H

#include "player_data.h"
#include "pm_string.h"
#include "pokemon_storage_system.h"
#include "pokemon_types_def.h"
#include "save_misc_data.h"
#include "trainer_data.h"

typedef struct MessageFormatAttrs {
    u8 data[4];
} MessageFormatAttrs;

typedef struct MessageFormatFields {
    MessageFormatAttrs attrs;
    String *msg;
} MessageFormatFields;

typedef struct MessageFormat {
    u32 count;
    HeapID heapId;
    MessageFormatFields *fields;
    String *buffer;
} MessageFormat;

MessageFormat *MessageFormat_New(HeapID heapId);
MessageFormat *MessageFormat_New_Custom(u32 nstr, u32 _strlen, HeapID heapId);
void MessageFormat_Delete(MessageFormat *messageFormat);
void StringExpandPlaceholders(MessageFormat *messageFormat, String *dest, String *src);
void BufferString(MessageFormat *messageFormat, u32 fieldno, const String *string, s32 a3, s32 a4, s32 a5);
void BufferIntegerAsString(MessageFormat *messageFormat, u32 idx, s32 num, u32 numDigits, PrintingMode strconvmode, BOOL whichCharset);
void BufferPlayersName(MessageFormat *messageFormat, u32 idx, PlayerProfile *playerProfile);
void BufferECWord(MessageFormat *messageFormat, u32 idx, u16 wordno);
void BufferSpeciesName(MessageFormat *messageFormat, u32 idx, u16 species);
void BufferSpeciesNameWithArticle(MessageFormat *messageFormat, u32 idx, u32 species);
void BufferTrainerClassName(MessageFormat *messageFormat, u32 fieldno, u32 trainerClassId);
void MessageFormat_InitFields(MessageFormatFields *fields);
void SetStringAsPlaceholder(MessageFormat *messageFormat, u32 fieldno, const String *string, const MessageFormatAttrs *attrs);
void BufferRivalsName(MessageFormat *messageFormat, u32 fieldno, SaveData *saveData);
void BufferFriendsName(MessageFormat *messageFormat, u32 fieldno, SaveData *saveData);
void BufferBoxMonSpeciesName(MessageFormat *messageFormat, u32 fieldno, BoxPokemon *boxmon);
void BufferBoxMonSpeciesNameWithArticle(MessageFormat *messageFormat, u32 fieldno, BoxPokemon *boxmon);
void BufferBoxMonNickname(MessageFormat *messageFormat, u32 fieldno, BoxPokemon *boxmon);
void BufferBoxMonOTName(MessageFormat *messageFormat, u32 fieldno, BoxPokemon *boxmon);
void BufferMoveName(MessageFormat *messageFormat, u32 fieldno, u32 moveId);
void BufferRibbonNameOrDesc(MessageFormat *messageFormat, u32 fieldno, u32 decoId);
void BufferAbilityName(MessageFormat *messageFormat, u32 fieldno, u32 abilityId);
void BufferNatureName(MessageFormat *messageFormat, u32 fieldno, u32 natureId);
void BufferItemName(MessageFormat *messageFormat, u32 fieldno, u32 itemId);
void BufferItemNameWithIndefArticle(MessageFormat *messageFormat, u32 fieldno, u32 itemId);
void BufferItemNamePlural(MessageFormat *messageFormat, u32 fieldno, u32 itemId);
void BufferPocketName(MessageFormat *messageFormat, u32 fieldno, u32 pocketId);
void BufferTypeName(MessageFormat *messageFormat, u32 fieldno, u32 typeId);
void BufferStatName(MessageFormat *messageFormat, u32 fieldno, u32 statId);
void BufferStatusName(MessageFormat *messageFormat, u32 fieldno, u32 statusId);
void BufferFlavorDislikeText(MessageFormat *messageFormat, u32 fieldno, u32 flavorId);
void BufferLandmarkName(MessageFormat *messageFormat, u32 fieldno, u32 landmarkId);
void BufferTrainerClassNameWithArticle(MessageFormat *messageFormat, u32 fieldno, u32 trainerClassId);
void BufferTrainerClassNameFromDataStruct(MessageFormat *messageFormat, u32 fieldno, Trainer *trainer);
void BufferTrainerName(MessageFormat *messageFormat, u32 fieldno, u32 trainerId);
void BufferFrontierOpponentName(MessageFormat *messageFormat, u32 fieldno, u32 opponentId);
void BufferTrainerNameFromDataStruct(MessageFormat *messageFormat, u32 fieldno, Trainer *trainer);
void BufferDecorationName(MessageFormat *messageFormat, u32 fieldno, u32 decorationId);
void BufferGenderSymbol(MessageFormat *messageFormat, u32 fieldno, u8 gender);
void BufferPCBoxName(MessageFormat *messageFormat, u32 fieldno, PCStorage *pcStorage, u32 boxno);
void BufferCountryName(MessageFormat *messageFormat, u32 fieldno, u32 countryId);
void BufferCityName(MessageFormat *messageFormat, u32 fieldno, u32 countryId, u32 cityId);
void BufferSealName(MessageFormat *messageFormat, u32 fieldno, u32 sealId);
void BufferSealNamePlural(MessageFormat *messageFormat, u32 fieldno, u32 sealId);
void BufferLocationName(MessageFormat *messageFormat, u32 fieldno, u32 mapsecId);
void BufferFashionName(MessageFormat *messageFormat, u32 fieldno, u32 fashionId);
void BufferFashionNameWithArticle(MessageFormat *messageFormat, u32 fieldno, u32 fashionId);
void BufferContestBackgroundName(MessageFormat *messageFormat, u32 fieldno, u32 bgId);
void BufferGroupName(MessageFormat *messageFormat, SaveData *saveData, s32 groupId, s32 fieldno, s32 nameType);
void BufferWiFiPlazaActivityName(MessageFormat *messageFormat, u32 fieldno, u32 activityId);
void BufferWiFiPlazaEventName(MessageFormat *messageFormat, u32 fieldno, u32 eventId);
void BufferWiFiPlazaInstrumentName(MessageFormat *messageFormat, u32 fieldno, u32 instrumentId);
void BufferJPGreeting(MessageFormat *messageFormat, u32 fieldno, u32 timeOfDay);
void BufferENGreeting(MessageFormat *messageFormat, u32 fieldno, u32 timeOfDay);
void BufferFRGreeting(MessageFormat *messageFormat, u32 fieldno, u32 timeOfDay);
void BufferITGreeting(MessageFormat *messageFormat, u32 fieldno, u32 timeOfDay);
void BufferDEGreeting(MessageFormat *messageFormat, u32 fieldno, u32 timeOfDay);
void BufferSPGreeting(MessageFormat *messageFormat, u32 fieldno, u32 timeOfDay);
void BufferPokeathlonCourseName(MessageFormat *messageFormat, u32 fieldno, u32 courseId);
void BufferPokeathlonMedalName(MessageFormat *messageFormat, u32 fieldno, u32 medalId);
void BufferPokeathlonEventName(MessageFormat *messageFormat, u32 fieldno, u32 eventId);
void BufferApricornName(MessageFormat *messageFormat, u32 fieldno, u32 apricornId);
void BufferSafariZoneObjectName(MessageFormat *messageFormat, u32 fieldno, u32 objectId);
void BufferSafariZoneAreaName(MessageFormat *messageFormat, u32 fieldno, u32 areaId);
void BufferPokewalkerCourseName(MessageFormat *messageFormat, u32 fieldno, u32 courseId);
void BufferMonthNameAbbr(MessageFormat *messageFormat, u32 fieldno, u32 month);
void MessageFormat_UpperFirstChar(MessageFormat *messageFormat, u32 fieldno);
void BufferDeptStoreFloorNo(MessageFormat *messageFormat, u32 fieldno, u32 floor);
void MessageFormat_ResetBuffers(MessageFormat *messageFormat);

#endif // GUARD_MESSAGE_FORMAT_H
