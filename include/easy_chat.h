#ifndef POKEHEARTGOLD_EASY_CHAT_H
#define POKEHEARTGOLD_EASY_CHAT_H

#include "pm_string.h"
#include "msgdata.h"
#include "constants/easy_chat.h"

typedef u16 ecword_t;

typedef struct EasyChatManager {
    HeapID heapId;
    MsgData *msgData[EC_GROUP_MAX];
} EasyChatManager;

typedef struct SaveEasyChat {
    u32 greetings;
    u32 trendy;
} SAVE_EASY_CHAT_T;

struct WallpaperPasswordBank {
    u32 count;
    u32 *words;
};

EasyChatManager *EasyChatManager_New(HeapID heapId);
void EasyChatManager_Delete(EasyChatManager *easyChatManager);

SAVE_EASY_CHAT_T *Save_EasyChat_Get(SaveData *saveData);
u16 GetECWordIndexByPair(u32 msgBank, u32 word);
u16 EasyChat_GetMsgBankForGroup(int category);
void GetECWordIntoStringByIndex(u16 ecWord, String *dest);
void EasyChatManager_ReadWordIntoString(EasyChatManager *ecMan, u16 ecWord, String *dest);
BOOL GetCategoryAndMsgNoByECWordIdx(u16 ecWord, u32 *category, u32 *msgno);
u32 Save_EasyChat_sizeof(void);
void Save_EasyChat_Init(SAVE_EASY_CHAT_T *ec);
BOOL Save_EasyChat_GetTrendySayingFlag(SAVE_EASY_CHAT_T *ec, int flag);
u32 Save_EasyChat_RandomTrendySayingSet(SAVE_EASY_CHAT_T *ec);
BOOL Save_EasyChat_TrendySayingsUnlockedAllCheck(SAVE_EASY_CHAT_T *ec);
ecword_t TrendyWordIdxToECWord(int a0);
BOOL Save_EasyChat_GetGreetingsFlag(SAVE_EASY_CHAT_T *ec, u8 idx);
void Save_EasyChat_SetGreetingFlag(SAVE_EASY_CHAT_T *ec, u8 idx);
void WallpaperPasswordBank_Delete(struct WallpaperPasswordBank *pwdBank);
u32 WallpaperPasswordBank_GetNum(struct WallpaperPasswordBank *pwdBank);
ecword_t WallpaperPasswordBank_GetWordI(struct WallpaperPasswordBank *pwdBank, int idx);
s16 WallpaperPasswordBank_GetIndexOfWord(struct WallpaperPasswordBank *unk, int value);
s32 GetDuplicateWordNum(ecword_t a0);
ecword_t RemapDuplicateWord(ecword_t a0, s32 a1);
struct WallpaperPasswordBank *WallpaperPasswordBank_Create(HeapID heapId);

#endif //POKEHEARTGOLD_EASY_CHAT_H
