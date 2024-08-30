#include "save_wifi_history.h"

#include "global.h"

#include "constants/geonet_globe.h"

struct SaveWiFiHistory {
    u32 unk_000; // unused but type needed for alignment
    u8 seenNotJapanese;
    u8 country;
    u8 region;
    u8 seenLocations[255 * 16]; // does not match as a 2d array
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
    GF_ASSERT(country < 256);
    GF_ASSERT(region < 64);
    wifiHistory->country = country;
    wifiHistory->region  = region;
    WiFiHistory_SetLocationSeenState(wifiHistory, country, region, 3);
    SaveSubstruct_UpdateCRC(SAVE_WIFI_HISTORY);
}

u8 WifiHistory_GetPlayerCountry(SaveWiFiHistory *wifiHistory) {
    return wifiHistory->country;
}

u8 WiFiHistory_GetPlayerRegion(SaveWiFiHistory *wifiHistory) {
    return wifiHistory->region;
}

int WiFiHistory_GetLocationSeenState(SaveWiFiHistory *wifiHistory, int country, int region) {
    GF_ASSERT(country < 256);
    GF_ASSERT(region < 64);
    if (country == 0) {
        return 0;
    }

    return (wifiHistory->seenLocations[(country - 1) * 16 + region / 4] >> ((region % 4) * 2)) & 3;
}

void WiFiHistory_SetLocationSeenState(SaveWiFiHistory *wifiHistory, int country, int region, int state) {
    GF_ASSERT(state < 4);
    GF_ASSERT(country < 256);
    GF_ASSERT(region < 64);
    if (country != 0) {
        u8 *pVal = &wifiHistory->seenLocations[(country - 1) * 16 + region / 4];
        *pVal &= (3 << ((region % 4) * 2)) ^ 0xFF;
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
    for (i = 0; i < 255 * 16; ++i) {
        byte = wifiHistory->seenLocations[i];
        for (j = 0; j < 8; j += 2) {
            if (((byte >> j) & 3) == 1) {
                byte &= (3 << j) ^ 0xFF;
                byte |= (2 << j);
            }
        }
        wifiHistory->seenLocations[i] = byte;
    }
    SaveSubstruct_UpdateCRC(SAVE_WIFI_HISTORY);
}
