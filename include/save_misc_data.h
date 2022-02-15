#ifndef POKEHEARTGOLD_SAVE_MISC_DATA_H
#define POKEHEARTGOLD_SAVE_MISC_DATA_H

#include "save.h"
#include "mail_message.h"
#include "gf_rtc.h"
#include "gymmick.h"

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
    u8 unk_029B_0:1;
    u8 unk_029B_1:4;
    u8 filer_029C[4];
    MAIL_MESSAGE unk_02A0;
    u32 unk_02A8[2][5];
    u8 unk_02D0[5];
    u8 dummy_02D5[3];
    u32 unk_02D8;
    u8 unk_02DC;
    u8 dummy_02DD[3];
} SAVE_MISC_DATA;

const SAVE_MISC_DATA *Sav2_Misc_const_get(const SAVEDATA *saveData);
const u16 *Sav2_Misc_RivalName_const_get(const SAVE_MISC_DATA *misc);

#endif //POKEHEARTGOLD_SAVE_MISC_DATA_H
