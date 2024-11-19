#include "save_wifi_history.h"

#include "global.h"

#include "constants/geonet_globe.h"

#define SAVE_WIFI_HISTORY_REGION_WIDTH ((SAVE_WIFI_HISTORY_REGION_MAX + 3) / 4)

struct SaveWiFiHistory {
    u32 unk_000; // unused but type needed for alignment
    u8 seenNotJapanese;
    u8 country;
    u8 region;
    u8 seenLocations[SAVE_WIFI_HISTORY_COUNTRY_MAX * SAVE_WIFI_HISTORY_REGION_WIDTH]; // does not match as a 2d array
}; // size: 0xFF8

u32 Save_WiFiHistory_sizeof(void) {
    return sizeof(SaveWiFiHistory);
}

void Save_WiFiHistory_Init(SaveWiFiHistory *wifiHistory) {
    MI_CpuClear32(wifiHistory, sizeof(SaveWiFiHistory));
    SaveSubstruct_UpdateCRC(SAVE_WIFI_HISTORY);
}

SaveWiFiHistory *Save_WiFiHistory_Get(SaveData *saveData) {
    SaveSubstruct_AssertCRC(SAVE_WIFI_HISTORY);
    return (SaveWiFiHistory *)SaveArray_Get(saveData, SAVE_WIFI_HISTORY);
}

void WiFiHistory_SetPlayerGlobeInfo(SaveWiFiHistory *wifiHistory, int country, int region) {
    GF_ASSERT(country < SAVE_WIFI_HISTORY_COUNTRY_MAX + 1);
    GF_ASSERT(region < SAVE_WIFI_HISTORY_REGION_MAX);
    wifiHistory->country = country;
    wifiHistory->region = region;
    WiFiHistory_SetLocationSeenState(wifiHistory, country, region, SAVE_WIFI_HISTORY_STATE_MINE);
    SaveSubstruct_UpdateCRC(SAVE_WIFI_HISTORY);
}

u8 WifiHistory_GetPlayerCountry(SaveWiFiHistory *wifiHistory) {
    return wifiHistory->country;
}

u8 WiFiHistory_GetPlayerRegion(SaveWiFiHistory *wifiHistory) {
    return wifiHistory->region;
}

int WiFiHistory_GetLocationSeenState(SaveWiFiHistory *wifiHistory, int country, int region) {
    GF_ASSERT(country < SAVE_WIFI_HISTORY_COUNTRY_MAX + 1);
    GF_ASSERT(region < SAVE_WIFI_HISTORY_REGION_MAX);
    if (country == 0) {
        return 0;
    }

    return (wifiHistory->seenLocations[(country - 1) * 16 + region / 4] >> ((region % 4) * 2)) & SAVE_WIFI_HISTORY_STATE_MASK;
}

void WiFiHistory_SetLocationSeenState(SaveWiFiHistory *wifiHistory, int country, int region, int state) {
    GF_ASSERT(state < SAVE_WIFI_HISTORY_STATE_MAX);
    GF_ASSERT(country < SAVE_WIFI_HISTORY_COUNTRY_MAX + 1);
    GF_ASSERT(region < SAVE_WIFI_HISTORY_REGION_MAX);
    if (country != 0) {
        u8 *pVal = &wifiHistory->seenLocations[(country - 1) * 16 + region / 4];
        *pVal &= (SAVE_WIFI_HISTORY_STATE_MASK << ((region % 4) * 2)) ^ 0xFF;
        *pVal |= state << ((region % 4) * 2);
        if (country != COUNTRY_JAPAN) {
            WiFiHistory_SetNonJapaneseFlag(wifiHistory, TRUE);
        }
        SaveSubstruct_UpdateCRC(SAVE_WIFI_HISTORY);
    }
}

u8 WiFiHistory_GetNonJapaneseFlag(SaveWiFiHistory *wifiHistory) {
    return wifiHistory->seenNotJapanese;
}

void WiFiHistory_SetNonJapaneseFlag(SaveWiFiHistory *wifiHistory, int flag) {
    wifiHistory->seenNotJapanese = flag;
    SaveSubstruct_UpdateCRC(SAVE_WIFI_HISTORY);
}

void WiFiHistory_UpgradeAllLocationsState(SaveWiFiHistory *wifiHistory) {
    int i;
    int j;
    u8 byte;
    for (i = 0; i < SAVE_WIFI_HISTORY_COUNTRY_MAX * SAVE_WIFI_HISTORY_REGION_WIDTH; ++i) {
        byte = wifiHistory->seenLocations[i];
        for (j = 0; j < 8; j += 2) {
            if (((byte >> j) & SAVE_WIFI_HISTORY_STATE_MASK) == SAVE_WIFI_HISTORY_STATE_NEW) {
                byte &= (SAVE_WIFI_HISTORY_STATE_MASK << j) ^ 0xFF;
                byte |= (SAVE_WIFI_HISTORY_STATE_OLD << j);
            }
        }
        wifiHistory->seenLocations[i] = byte;
    }
    SaveSubstruct_UpdateCRC(SAVE_WIFI_HISTORY);
}
