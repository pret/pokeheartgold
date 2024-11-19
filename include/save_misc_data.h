#ifndef POKEHEARTGOLD_SAVE_MISC_DATA_H
#define POKEHEARTGOLD_SAVE_MISC_DATA_H

#include "gf_rtc.h"
#include "gymmick.h"
#include "mail_message.h"
#include "pm_string.h"
#include "save.h"

typedef struct APRICORN_TREE {
    u8 unk_0;
    u8 unk_1;
    u16 unk_2;
} APRICORN_TREE;

#define BERRY_POT_GROWTH_STAGE_NONE     0
#define BERRY_POT_GROWTH_STAGE_PLANTED  1
#define BERRY_POT_GROWTH_STAGE_SPROUTED 2
#define BERRY_POT_GROWTH_STAGE_GROWING  3
#define BERRY_POT_GROWTH_STAGE_BLOOM    4
#define BERRY_POT_GROWTH_STAGE_BERRIES  5

typedef struct BerryPot {
    u8 berryId;
    u8 growthStage;
    u16 unk_2;
    u16 unk_4;
    u16 unk_6;
    u8 unk_8;
    u8 moisture;
    u8 unk_A;
    u8 mulch;
} BerryPot;

#define MAX_APRICORN_TREE 128
#define NUM_APRICORN_TREE 31

#define MAX_BERRY_POT 4

typedef struct SAVE_MISC_DATA {
    APRICORN_TREE apricorn_trees[MAX_APRICORN_TREE];
    BerryPot berry_pots[MAX_BERRY_POT];
    struct GF_RTC_DateTime berry_datetime;
    Gymmick gymmick;
    u16 rivalName[PLAYER_NAME_LENGTH + 1];
    u8 unk_0280[8]; // 3 chunks of size (4, 2, 2)
    u8 filler_0288[0x10];
    u16 favoriteMonSpecies;
    u8 favoriteMonForm : 7;
    u8 favoriteMonIsEgg : 1;
    u8 extraChunksExist : 1;
    u8 unk_029B_1 : 4;
    u8 filer_029C[4];
    MailMessage battleGreetingEC;
    u32 unk_02A8[2][5];
    u8 unk_02D0[5];
    u8 dummy_02D5[3];
    u32 togepiEggPersonality;
    u8 togepiEggGender;
    u8 dummy_02DD[3];
} SAVE_MISC_DATA;

void Save_BerryPots_Init(BerryPot *berryPot);
void Save_BerryPotRTC_Init(struct GF_RTC_DateTime *dateTime);
u32 Save_Misc_sizeof(void);
void Save_Misc_Init(SAVE_MISC_DATA *saveMiscData);
SAVE_MISC_DATA *Save_Misc_Get(SaveData *saveData);
const SAVE_MISC_DATA *Save_Misc_Const_Get(const SaveData *saveData);
APRICORN_TREE *Save_FieldApricornTrees_Get(SaveData *saveData);
BerryPot *Save_BerryPots_Get(SaveData *saveData);
struct GF_RTC_DateTime *Save_BerryPotRTC_Get(SaveData *saveData);
Gymmick *Save_GetGymmickPtr(SaveData *saveData);
const u16 *Save_Misc_RivalName_Const_Get(const SAVE_MISC_DATA *saveMiscData);
void Save_Misc_RivalName_Set(SAVE_MISC_DATA *saveMiscData, const String *name);
void SaveMisc_SetExtraChunksExist(SAVE_MISC_DATA *saveMiscData);
BOOL SaveMisc_CheckExtraChunksExist(SAVE_MISC_DATA *saveMiscData);
void SaveMisc_SetFavoriteMon(SAVE_MISC_DATA *saveMiscData, int species, int form, int isEgg);
void SaveMisc_GetFavoriteMon(SAVE_MISC_DATA *saveMiscData, int *species, int *form, int *isEgg);
BOOL sub_0202AA44(SAVE_MISC_DATA *saveMiscData, int a1, int a2);
void sub_0202AA9C(SAVE_MISC_DATA *saveMiscData, int a1);
u8 sub_0202AAD4(SAVE_MISC_DATA *saveMiscData, int a1);
void sub_0202AB18(SAVE_MISC_DATA *saveMiscData, u8 a1, u8 a2, u8 a3);
void SaveMisc_SetTogepiPersonalityGender(SAVE_MISC_DATA *saveMiscData, int personality, u8 gender);
void SaveMisc_GetTogepiPersonalityGender(SAVE_MISC_DATA *saveMiscData, int *personality, u8 *gender);
void SaveMisc_GetBattleGreeting(SAVE_MISC_DATA *saveMiscData, MailMessage *mailMessage);
void SaveMisc_SetBattleGreeting(SAVE_MISC_DATA *saveMiscData, MailMessage *mailMessage);
void sub_0202AC0C(SAVE_MISC_DATA *saveMiscData, u8 *a1);
void sub_0202AC1C(SAVE_MISC_DATA *saveMiscData, u8 a1);
void sub_0202AC38(SAVE_MISC_DATA *saveMiscData, int a1, u32 *a2, u32 *a3, u8 *a4);
void sub_0202AC60(SAVE_MISC_DATA *saveMiscData, int a1, u32 a2, u32 a3, u8 a4);

#endif // POKEHEARTGOLD_SAVE_MISC_DATA_H
