#ifndef POKEHEARTGOLD_UNK_0202CA24_H
#define POKEHEARTGOLD_UNK_0202CA24_H

#include "save.h"

typedef struct SaveWiFiHistory SaveWiFiHistory;

#define SAVE_WIFI_HISTORY_COUNTRY_MAX   255
#define SAVE_WIFI_HISTORY_REGION_MAX    64
#define SAVE_WIFI_HISTORY_STATE_UNSEEEN 0
#define SAVE_WIFI_HISTORY_STATE_NEW     1
#define SAVE_WIFI_HISTORY_STATE_OLD     2
#define SAVE_WIFI_HISTORY_STATE_MINE    3
#define SAVE_WIFI_HISTORY_STATE_MAX     4
#define SAVE_WIFI_HISTORY_STATE_MASK    3

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
