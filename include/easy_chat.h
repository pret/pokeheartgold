#ifndef POKEHEARTGOLD_EASY_CHAT_H
#define POKEHEARTGOLD_EASY_CHAT_H

#include "pm_string.h"
#include "msgdata.h"
#include "constants/easy_chat.h"

typedef u16 ECWORD;

typedef struct EasyChatManager {
    HeapID heapId;
    MSGDATA *msgData[EC_GROUP_MAX];
} ECMAN;

typedef struct SaveEasyChat {
    u32 greetings;
    u32 trendy;
} SAVE_EASY_CHAT_T;

struct WallpaperPasswordBank {
    u32 count;
    u32 *words;
};

SAVE_EASY_CHAT_T *SaveData_EasyChat_get(SAVEDATA *saveData);
u16 GetECWordIndexByPair(u32 msgBank, u32 word);
u16 EasyChat_GetMsgBankForGroup(int category);
void GetECWordIntoStringByIndex(u16 ecWord, STRING *dest);
void EasyChatManager_delete(ECMAN *ecMan);
void EasyChatManager_ReadWordIntoString(ECMAN *ecMan, u16 ecWord, STRING *dest);
BOOL GetCategoryAndMsgNoByECWordIdx(u16 ecWord, u32 *category, u32 *msgno);
u32 Sav2_EasyChat_sizeof(void);
void Sav2_EasyChat_init(SAVE_EASY_CHAT_T *ec);
BOOL SaveEasyChat_GetTrendySayingFlag(SAVE_EASY_CHAT_T *ec, int flag);
u32 SaveEasyChat_RandomTrendySayingSet(SAVE_EASY_CHAT_T *ec);
BOOL SaveEasyChat_TrendySayingsUnlockedAllCheck(SAVE_EASY_CHAT_T *ec);
ECWORD TrendyWordIdxToECWord(int a0);
BOOL SaveEasyChat_GetGreetingsFlag(SAVE_EASY_CHAT_T *ec, u8 idx);
void SaveEasyChat_SetGreetingFlag(SAVE_EASY_CHAT_T *ec, u8 idx);
void WallpaperPasswordBank_Delete(struct WallpaperPasswordBank *pwdBank);
u32 WallpaperPasswordBank_GetNum(struct WallpaperPasswordBank *pwdBank);
ECWORD WallpaperPasswordBank_GetWordI(struct WallpaperPasswordBank *pwdBank, int idx);
s16 WallpaperPasswordBank_GetIndexOfWord(struct WallpaperPasswordBank *unk, int value);
s32 GetDuplicateWordNum(ECWORD a0);
ECWORD RemapDuplicateWord(ECWORD a0, s32 a1);

#endif //POKEHEARTGOLD_EASY_CHAT_H
