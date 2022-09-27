#ifndef POKEHEARTGOLD_SAVE_MISC_DATA_H
#define POKEHEARTGOLD_SAVE_MISC_DATA_H

#include "save.h"
#include "mail_message.h"
#include "gf_rtc.h"
#include "gymmick.h"
#include "pm_string.h"

typedef struct APRICORN_TREE {
    u8 unk_0;
    u8 unk_1;
    u16 unk_2;
} APRICORN_TREE;

typedef struct BERRY_POT {
    u8 unk_0;
    u8 unk_1;
    u8 filler_2[10];
} BERRY_POT;

#define MAX_APRICORN_TREE 128
#define NUM_APRICORN_TREE 31

#define MAX_BERRY_POT      4

typedef struct SAVE_MISC_DATA {
    APRICORN_TREE apricorn_trees[MAX_APRICORN_TREE];
    BERRY_POT berry_pots[MAX_BERRY_POT];
    struct GF_RTC_DateTime berry_datetime;
    struct Gymmick gymmick;
    u16 rivalName[OT_NAME_LENGTH + 1];
    u8 unk_0280[8]; // 3 chunks of size (4, 2, 2)
    u8 filler_0288[0x10];
    u16 unk_0298;
    u8 unk_029A_0:7;
    u8 unk_029A_7:1;
    u8 extraChunksExist:1;
    u8 unk_029B_1:4;
    u8 filer_029C[4];
    MAIL_MESSAGE battleGreetingEC;
    u32 unk_02A8[2][5];
    u8 unk_02D0[5];
    u8 dummy_02D5[3];
    u32 togepiEggPersonality;
    u8 togepiEggGender;
    u8 dummy_02DD[3];
} SAVE_MISC_DATA;

void Sav2_BerryPots_init(BERRY_POT *berryPot);
void Sav2_BerryPotRTC_init(struct GF_RTC_DateTime *dateTime);
u32 Sav2_Misc_sizeof(void);
void Sav2_Misc_init(SAVE_MISC_DATA *saveMiscData);
SAVE_MISC_DATA *Sav2_Misc_get(SAVEDATA *saveData);
const SAVE_MISC_DATA *Sav2_Misc_const_get(const SAVEDATA *saveData);
APRICORN_TREE *Sav2_FieldApricornTrees_get(SAVEDATA *saveData);
BERRY_POT *Sav2_BerryPots_get(SAVEDATA *saveData);
struct GF_RTC_DateTime *Sav2_BerryPotRTC_get(SAVEDATA *saveData);
struct Gymmick *Sav2_GetGymmickPtr(SAVEDATA *saveData);
const u16 *Sav2_Misc_RivalName_const_get(const SAVE_MISC_DATA *saveMiscData);
void Sav2_Misc_RivalName_set(SAVE_MISC_DATA *saveMiscData, const STRING *name);
void SaveMisc_SetExtraChunksExist(SAVE_MISC_DATA *saveMiscData);
BOOL SaveMisc_CheckExtraChunksExist(SAVE_MISC_DATA *saveMiscData);
void sub_0202A9E8(SAVE_MISC_DATA *saveMiscData, int a1, int a2, int a3);
void sub_0202AA20(SAVE_MISC_DATA *saveMiscData, int *a1, int *a2, int *a3);
BOOL sub_0202AA44(SAVE_MISC_DATA *saveMiscData, int a1, int a2);
void sub_0202AA9C(SAVE_MISC_DATA *saveMiscData, int a1);
u8 sub_0202AAD4(SAVE_MISC_DATA *saveMiscData, int a1);
void sub_0202AB18(SAVE_MISC_DATA *saveMiscData, u8 a1, u8 a2, u8 a3);
void SaveMisc_SetTogepiPersonalityGender(SAVE_MISC_DATA * saveMiscData, int personality, u8 gender);
void SaveMisc_GetTogepiPersonalityGender(SAVE_MISC_DATA * saveMiscData, int *a1, u8 *a2);
void SaveMisc_GetBattleGreeting(SAVE_MISC_DATA *saveMiscData, MAIL_MESSAGE *a1);
void SaveMisc_SetBattleGreeting(SAVE_MISC_DATA *saveMiscData, MAIL_MESSAGE *a1);
void sub_0202AC0C(SAVE_MISC_DATA *saveMiscData, u8 *a1);
void sub_0202AC1C(SAVE_MISC_DATA *saveMiscData, u8 a1);
void sub_0202AC38(SAVE_MISC_DATA *saveMiscData, int a1, u32 *a2, u32 *a3, u8 *a4);
void sub_0202AC60(SAVE_MISC_DATA *saveMiscData, int a1, u32 a2, u32 a3, u8 a4);

#endif //POKEHEARTGOLD_SAVE_MISC_DATA_H
