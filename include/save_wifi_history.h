#ifndef POKEHEARTGOLD_UNK_0202CA24_H
#define POKEHEARTGOLD_UNK_0202CA24_H

#include "save.h"

typedef struct SaveWiFiHistory SaveWiFiHistory;

u32 Save_WiFiHistory_sizeof(void);
void Save_WiFiHistory_Init(SaveWiFiHistory *wifiHistory);
SaveWiFiHistory *Save_WiFiHistory_Get(SaveData *saveData);
void WiFiHistory_SetPlayerGlobeInfo(SaveWiFiHistory *wifiHistory, int country, int region);
u8 WifiHistory_GetPlayerCountry(SaveWiFiHistory *wifiHistory);
u8 WiFiHistory_GetPlayerRegion(SaveWiFiHistory *wifiHistory);
int WiFiHistory_GetLocationSeenState(SaveWiFiHistory *wifiHistory, int country, int region);
void WiFiHistory_SetLocationSeenState(SaveWiFiHistory *wifiHistory, int country, int region, int state);
u8 WiFiHistory_GetNonJapaneseFlag(SaveWiFiHistory *wifiHistory);
void WiFiHistory_SetNonJapaneseFlag(SaveWiFiHistory *wifiHistory, int flag);
void WiFiHistory_UpgradeAllLocationsState(SaveWiFiHistory *wifiHistory);

#endif // POKEHEARTGOLD_UNK_0202CA24_H
