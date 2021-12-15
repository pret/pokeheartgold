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

u16 GetECWordIndexByPair(u32 msgBank, u32 word);
u16 EasyChat_GetMsgBankForGroup(int category);
void GetECWordIntoStringByIndex(u16 ecWord, STRING *dest);

#endif //POKEHEARTGOLD_EASY_CHAT_H
