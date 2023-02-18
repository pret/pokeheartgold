#ifndef GUARD_MSGFMT_H
#define GUARD_MSGFMT_H

#include "pm_string.h"
#include "player_data.h"
#include "save_misc_data.h"
#include "pokemon_types_def.h"
#include "trainer_data.h"
#include "pokemon_storage_system.h"

typedef struct MsgPlaceholderFieldAttrs {
    u8 data[4];
} MSGFMT_FIELD_ATTRS;

typedef struct PlaceholderField {
    MSGFMT_FIELD_ATTRS attrs;
    STRING *msg;
} MSGFMT_FIELD;

typedef struct MSGFMT {
    u32 nstr;
    HeapID heapId;
    MSGFMT_FIELD *fields;
    STRING *buffer;
} MSGFMT;

MSGFMT *ScrStrBufs_new(u32 heap_id);
MSGFMT *ScrStrBufs_new_custom(u32 nstr, u32 _strlen, HeapID heapId);
void ScrStrBufs_delete(MSGFMT *msgFmt);
void StringExpandPlaceholders(MSGFMT *msgFmt, STRING *dest, STRING *src);
void BufferString(MSGFMT *msgFmt, u32 fieldno, const STRING *string, int a3, int a4, int a5);
void BufferIntegerAsString(MSGFMT *msgFmt, u32 idx, int num, u32 numDigits, STRCONVMODE strconvmode, BOOL whichCharset);
void BufferPlayersName(MSGFMT *msgFmt, u32 idx, PLAYERPROFILE *playerProfile);
void BufferECWord(MSGFMT *msgFmt, u32 idx, u16 wordno);
void BufferSpeciesName(MSGFMT *msgFmt, u32 idx, u16 species);
void BufferSpeciesNameWithArticle(MSGFMT *msgFmt, u32 idx, u32 species);
void BufferTrainerClassName(MSGFMT *msgFmt, u32 fieldno, u32 trainerClassId);
void ScrStrBufs_InitSub(MSGFMT_FIELD *field);
void SetStringAsPlaceholder(MSGFMT *msgFmt, u32 fieldno, const STRING *string, const MSGFMT_FIELD_ATTRS *attrs);
void BufferRivalsName(MSGFMT *msgFmt, u32 fieldno, SAVEDATA *saveData);
void BufferFriendsName(MSGFMT *msgFmt, u32 fieldno, SAVEDATA *saveData);
void BufferBoxMonSpeciesName(MSGFMT *msgFmt, u32 fieldno, BoxPokemon *boxMon);
void BufferBoxMonSpeciesNameWithArticle(MSGFMT *msgFmt, u32 fieldno, BoxPokemon *boxMon);
void BufferBoxMonNickname(MSGFMT *msgFmt, u32 fieldno, BoxPokemon *boxMon);
void BufferBoxMonOTName(MSGFMT *msgFmt, u32 fieldno, BoxPokemon *boxMon);
void BufferMoveName(MSGFMT *msgFmt, u32 fieldno, u32 moveId);
void BufferRibbonNameOrDesc(MSGFMT *msgFmt, u32 fieldno, u32 decoId);
void BufferAbilityName(MSGFMT *msgFmt, u32 fieldno, u32 abilityId);
void BufferNatureName(MSGFMT *msgFmt, u32 fieldno, u32 natureId);
void BufferItemName(MSGFMT *msgFmt, u32 fieldno, u32 itemId);
void BufferItemNameWithIndefArticle(MSGFMT *msgFmt, u32 fieldno, u32 itemId);
void BufferItemNamePlural(MSGFMT *msgFmt, u32 fieldno, u32 itemId);
void BufferPocketName(MSGFMT *msgFmt, u32 fieldno, u32 pocketId);
void BufferTypeName(MSGFMT *msgFmt, u32 fieldno, u32 typeId);
void BufferStatName(MSGFMT *msgFmt, u32 fieldno, u32 statId);
void BufferStatusName(MSGFMT *msgFmt, u32 fieldno, u32 statusId);
void BufferFlavorDislikeText(MSGFMT *msgFmt, u32 fieldno, u32 flavorId);
void BufferLandmarkName(MSGFMT *msgFmt, u32 fieldno, u32 landmarkId);
void BufferTrainerClassNameWithArticle(MSGFMT *msgFmt, u32 fieldno, u32 trainerClassId);
void BufferTrainerClassNameFromDataStruct(MSGFMT *msgFmt, u32 fieldno, TRAINER *trainer);
void BufferTrainerName(MSGFMT *msgFmt, u32 fieldno, u32 trainerId);
void BufferFrontierOpponentName(MSGFMT *msgFmt, u32 fieldno, u32 opponentId);
void BufferTrainerNameFromDataStruct(MSGFMT *msgFmt, u32 fieldno, TRAINER *trainer);
void BufferDecorationName(MSGFMT *msgFmt, u32 fieldno, u32 decorationId);
void BufferGenderSymbol(MSGFMT *msgFmt, u32 fieldno, u8 gender);
void BufferPCBoxName(MSGFMT *msgFmt, u32 fieldno, PC_STORAGE *pcStorage, u32 boxno);
void BufferCountryName(MSGFMT *msgFmt, u32 fieldno, u32 countryId);
void BufferCityName(MSGFMT *msgFmt, u32 fieldno, u32 countryId, u32 cityId);
void BufferSealName(MSGFMT *msgFmt, u32 fieldno, u32 sealId);
void BufferSealNamePlural(MSGFMT *msgFmt, u32 fieldno, u32 sealId);
void BufferLocationName(MSGFMT *msgFmt, u32 fieldno, u32 mapsecId);
void BufferFashionName(MSGFMT *msgFmt, u32 fieldno, u32 fashionId);
void BufferFashionNameWithArticle(MSGFMT *msgFmt, u32 fieldno, u32 fashionId);
void BufferContestBackgroundName(MSGFMT *msgFmt, u32 fieldno, u32 bgId);
void BufferGroupName(MSGFMT *msgFmt, SAVEDATA *saveData, int groupId, int fieldno, int nameType);
void BufferWiFiPlazaActivityName(MSGFMT *msgFmt, u32 fieldno, u32 activityId);
void BufferWiFiPlazaEventName(MSGFMT *msgFmt, u32 fieldno, u32 eventId);
void BufferWiFiPlazaInstrumentName(MSGFMT *msgFmt, u32 fieldno, u32 instrumentId);
void BufferJPGreeting(MSGFMT *msgFmt, u32 fieldno, u32 timeOfDay);
void BufferENGreeting(MSGFMT *msgFmt, u32 fieldno, u32 timeOfDay);
void BufferFRGreeting(MSGFMT *msgFmt, u32 fieldno, u32 timeOfDay);
void BufferITGreeting(MSGFMT *msgFmt, u32 fieldno, u32 timeOfDay);
void BufferDEGreeting(MSGFMT *msgFmt, u32 fieldno, u32 timeOfDay);
void BufferSPGreeting(MSGFMT *msgFmt, u32 fieldno, u32 timeOfDay);
void BufferPokeathlonCourseName(MSGFMT *msgFmt, u32 fieldno, u32 courseId);
void BufferPokeathlonMedalName(MSGFMT *msgFmt, u32 fieldno, u32 medalId);
void BufferPokeathlonEventName(MSGFMT *msgFmt, u32 fieldno, u32 eventId);
void BufferApricornName(MSGFMT *msgFmt, u32 fieldno, u32 apricornId);
void BufferSafariZoneObjectName(MSGFMT *msgFmt, u32 fieldno, u32 objectId);
void BufferSafariZoneAreaName(MSGFMT *msgFmt, u32 fieldno, u32 areaId);
void BufferPokewalkerCourseName(MSGFMT *msgFmt, u32 fieldno, u32 courseId);
void BufferMonthNameAbbr(MSGFMT *msgFmt, u32 fieldno, u32 month);
void ScrStrBufs_UpperFirstChar(MSGFMT *msgFmt, u32 fieldno);
void BufferDeptStoreFloorNo(MSGFMT *msgFmt, u32 fieldno, u32 floor);
void ScrStrBufs_ResetBuffers(MSGFMT * msgFmt);

#endif //GUARD_MSGFMT_H
