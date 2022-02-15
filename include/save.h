#ifndef POKEHEARTGOLD_SAVE_H
#define POKEHEARTGOLD_SAVE_H

#define SAVE_LARGE_HOF            0

#define SAVE_SYSINFO              0
#define SAVE_PLAYERDATA           1
#define SAVE_PARTY                2
#define SAVE_BAG                  3
#define SAVE_FLAGS                4
#define SAVE_FLYPOINTS            5
#define SAVE_POKEDEX              6
#define SAVE_DAYCARE              7
#define SAVE_UNK_8                8
#define SAVE_MISC                 9
#define SAVE_UNK_10              10
#define SAVE_UNK_11              11
#define SAVE_DRESSUP_DATA        12
#define SAVE_MAILBOX             13
#define SAVE_FRIEND_GROUP        14
#define SAVE_UNK_15              15
#define SAVE_GAMESTATS           16
#define SAVE_SEAL_CASE           17
#define SAVE_CHATOT              18
#define SAVE_UNK_19              19
#define SAVE_UNK_20              20
#define SAVE_ROAMER              21
#define SAVE_UNK_22              22
#define SAVE_UNK_23              23
#define SAVE_UNK_24              24
#define SAVE_UNK_25              25
#define SAVE_UNK_26              26
#define SAVE_MYSTERY_GIFT        27
#define SAVE_UNK_28              28
#define SAVE_UNK_29              29
#define SAVE_EASY_CHAT           30
#define SAVE_UNK_31              31
#define SAVE_UNK_32              32
#define SAVE_FOLLOW_POKE         33
#define SAVE_GSPLAYERMISC        34
#define SAVE_SAFARI_ZONE         35
#define SAVE_PHOTO_ALBUM         36
#define SAVE_UNK_37              37
#define SAVE_APRICORN_BOX        38
#define SAVE_POKEWALKER          39
#define SAVE_UNK_40              40
#define SAVE_PCSTORAGE           41
#define SAVE_BLOCK_NUM           42

#define SAVE_PAGE_MAX            35
#define SAVE_SECTOR_SIZE     0x1000

#ifndef PM_ASM
typedef struct SaveBlock2 SAVEDATA;

SAVEDATA *SaveBlock2_new(void);
void *SavArray_get(SAVEDATA *save, int idx);
const void *SavArray_const_get(const SAVEDATA *save, int idx);
void SaveSubstruct_UpdateCRC(int idx);
BOOL SaveSubstruct_AssertCRC(int idx);
BOOL sub_020274D0(SAVEDATA *save);
SAVEDATA *SaveBlock2_get(void);
void sub_020275A4(SAVEDATA *saveData);
#endif //PM_ASM

#endif //POKEHEARTGOLD_SAVE_H
