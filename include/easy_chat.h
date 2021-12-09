#ifndef POKEHEARTGOLD_EASY_CHAT_H
#define POKEHEARTGOLD_EASY_CHAT_H

#include "pm_string.h"
#include "msgdata.h"
#include "constants/easy_chat.h"

typedef struct EasyChatManager {
    HeapID heapId;
    MSGDATA *msgData[EC_GROUP_MAX];
} ECMAN;

u16 GetECWordIndexByPair(u32 msgBank, u32 word);
u16 sub_02015DC8(int group);
void GetECWordIntoStringByIndex(u16 ecWord, STRING *dest);

#endif //POKEHEARTGOLD_EASY_CHAT_H
