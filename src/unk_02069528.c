#include "unk_02069528.h"

#include "global.h"

#include "frontier_data.h"
#include "player_data.h"
#include "save_wifi_history.h"
#include "unk_0202D230.h"
#include "unk_0205B3DC.h"

void sub_02069528(SaveData *saveData, s32 arg2, UnkStruct_02069528 *arg3) {
    FRONTIERDATA *frontierData;
    PlayerProfile *playerProfile;
    SaveWiFiHistory *saveWiFiHistory;
    s32 index;
    s32 position;

    playerProfile = Save_PlayerData_GetProfile(saveData);
    saveWiFiHistory = Save_WiFiHistory_Get(saveData);
    frontierData = Save_FrontierData_Get(saveData);
    MI_CpuFill8(arg3, 0, sizeof(UnkStruct_02069528));
    MI_CpuCopy8(PlayerProfile_GetNamePtr(playerProfile), &arg3->playerName, (PLAYER_NAME_LENGTH + 1) * sizeof(u16));
    arg3->trainerId = PlayerProfile_GetTrainerID(playerProfile);
    arg3->gameVersion = gGameVersion;
    arg3->gameLanguage = gGameLanguage;
    arg3->playerCountry = WifiHistory_GetPlayerCountry(saveWiFiHistory);
    arg3->playerRegion = WiFiHistory_GetPlayerRegion(saveWiFiHistory);
    arg3->unkC8_1 = PlayerProfile_GetTrainerGender(playerProfile);
    arg3->trainerClass = GetUnionRoomAvatarAttrBySprite(arg3->unkC8_1, PlayerProfile_GetAvatar(playerProfile), 1);

    for (index = 0, position = 0; index < 3; index++, position += 8) {
        MI_CpuCopy8(sub_0202D660(saveData, index), &arg3->unkCA[position], 8);
    }

    MI_CpuCopy8(sub_0202D660(saveData, 3), &arg3->unkC0, sizeof(arg3->unkC0));

    if (arg2 == 0) {
        arg3->unkE2 = sub_0202D5DC(frontierData, 7, 0);
        if (arg3->unkE2 != 0) {
            sub_0202D4DC(frontierData, arg2, arg3);
        }
    } else {
        arg3->unkE2 = sub_0202D564(frontierData);
        sub_0202D4DC(frontierData, arg2, arg3);
    }
}
