#ifndef POKEHEARTGOLD_UNK_0202CA24_H
#define POKEHEARTGOLD_UNK_0202CA24_H

#include "save.h"

typedef struct SaveWiFiHistory SaveWiFiHistory;

u32 Save_WiFiHistory_sizeof(void);
void Save_WiFiHistory_Init(SaveWiFiHistory *saveUnk26);
SaveWiFiHistory *Save_WiFiHistory_Get(SaveData *saveData);
void WiFiHistory_SetPlayerGlobeInfo(SaveWiFiHistory *saveUnk26, int a1, int a2);
u8 WifiHistory_GetPlayerCountry(SaveWiFiHistory *saveUnk26);
u8 WiFiHistory_GetPlayerRegion(SaveWiFiHistory *saveUnk26);
int WiFiHistory_GetLocationSeenState(SaveWiFiHistory *saveUnk26, int a1, int a2);
void WiFiHistory_SetLocationSeenState(SaveWiFiHistory *saveUnk26, int a1, int a2, int a3);
u8 WiFiHistory_GetNonJapaneseFlag(SaveWiFiHistory *saveUnk26);
void WiFiHistory_SetNonJapaneseFlag(SaveWiFiHistory *saveUnk26, int a1);
void WiFiHistory_UpgradeAllLocationsState(SaveWiFiHistory *saveUnk26);

#endif //POKEHEARTGOLD_UNK_0202CA24_H
