#ifndef POKEHEARTGOLD_EASY_CHAT_H
#define POKEHEARTGOLD_EASY_CHAT_H

#include "constants/easy_chat.h"

#include "msgdata.h"
#include "pm_string.h"

typedef u16 ecword_t;

typedef struct EasyChatManager {
    HeapID heapId;
    MsgData *msgData[EC_GROUP_MAX];
} EasyChatManager;

typedef struct SaveEasyChat {
    u32 greetings;
    u32 trendy;
} SaveEasyChat;

typedef struct WallpaperPasswordBank {
    u32 count;
    u32 *words;
} WallpaperPasswordBank;

EasyChatManager *EasyChatManager_New(HeapID heapId);
void EasyChatManager_Delete(EasyChatManager *easyChatManager);
void EasyChatManager_ReadWordIntoString(EasyChatManager *easyChatManager, u16 ecWord, String *dest);
void GetECWordIntoStringByIndex(u16 ecWord, String *dest);
u16 GetECWordIndexByPair(u32 category, u32 msgNo);
BOOL GetCategoryAndMsgNoByECWordIdx(u16 ecWord, u32 *category, u32 *msgNo);
u32 Save_EasyChat_sizeof(void);
void Save_EasyChat_Init(SaveEasyChat *saveEasyChat);
SaveEasyChat *Save_EasyChat_Get(SaveData *saveData);
BOOL Save_EasyChat_GetTrendySayingFlag(SaveEasyChat *saveEasyChat, u32 flag);
u32 Save_EasyChat_SetRandomTrendySaying(SaveEasyChat *saveEasyChat);
BOOL Save_EasyChat_TrendySayingsUnlockedAllCheck(SaveEasyChat *saveEasyChat);
ecword_t TrendyWordIdxToECWord(u32 word);
BOOL Save_EasyChat_GetGreetingsFlag(SaveEasyChat *saveEasyChat, u32 flag);
void Save_EasyChat_SetGreetingFlag(SaveEasyChat *saveEasyChat, u32 flag);
WallpaperPasswordBank *WallpaperPasswordBank_Create(HeapID heapId);
void WallpaperPasswordBank_Delete(WallpaperPasswordBank *wallpaperPasswordBank);
u32 WallpaperPasswordBank_GetCount(WallpaperPasswordBank *wallpaperPasswordBank);
ecword_t WallpaperPasswordBank_GetWordAtIndex(WallpaperPasswordBank *wallpaperPasswordBank, s32 index);
s16 WallpaperPasswordBank_GetIndexOfWord(WallpaperPasswordBank *wallpaperPasswordBank, s32 word);
u16 EasyChat_GetMsgBankForGroup(s32 category);
s32 GetDuplicateWordNum(ecword_t word);
ecword_t RemapDuplicateWord(ecword_t word, s32 target);

#endif // POKEHEARTGOLD_EASY_CHAT_H
