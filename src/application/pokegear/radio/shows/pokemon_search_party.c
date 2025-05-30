#include "global.h"

#include "constants/badge.h"

#include "application/pokegear/radio/radio_internal.h"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0419.h"

#include "math_util.h"
#include "sound_02004A44.h"
#include "sound_radio.h"
#include "sys_flags.h"
#include "unk_02005D10.h"

typedef enum PSPEpisodeUnlockFlag {
    PSP_EPISODE_UNLOCK_ALWAYS,
    PSP_EPISODE_UNLOCK_AZALEA_ROCKETS, // effectively always
    PSP_EPISODE_UNLOCK_PLAINBADGE,
    PSP_EPISODE_UNLOCK_TOWER_ROCKETS,
    PSP_EPISODE_UNLOCK_8BADGES,
    PSP_EPISODE_UNLOCK_9BADGES,
    PSP_EPISODE_UNLOCK_VERMILION,
    PSP_EPISODE_UNLOCK_16BADGES,
} PSPEpisodeUnlockFlag;

typedef struct PokemonSearchPartyData {
    HeapID heapID;
    u16 state;
    u16 episodeID;
    u8 episodeUnlockFlags[8];
    u8 unlockedEpisodes[13];
} PokemonSearchPartyData;

void RadioShow_PokemonSearchParty_Init(RadioShow *radioShow);
void RadioShow_PokemonSearchParty_Unload(RadioShow *radioShow);

static const u8 sEpisodeUnlockFlags[] = {
    PSP_EPISODE_UNLOCK_ALWAYS,
    PSP_EPISODE_UNLOCK_ALWAYS,
    PSP_EPISODE_UNLOCK_AZALEA_ROCKETS,
    PSP_EPISODE_UNLOCK_PLAINBADGE,
    PSP_EPISODE_UNLOCK_TOWER_ROCKETS,
    PSP_EPISODE_UNLOCK_8BADGES,
    PSP_EPISODE_UNLOCK_9BADGES,
    PSP_EPISODE_UNLOCK_VERMILION,
    PSP_EPISODE_UNLOCK_VERMILION,
    PSP_EPISODE_UNLOCK_VERMILION,
    PSP_EPISODE_UNLOCK_16BADGES,
    PSP_EPISODE_UNLOCK_16BADGES,
    PSP_EPISODE_UNLOCK_16BADGES,
};

BOOL RadioShow_PokemonSearchParty_Setup(RadioShow *radioShow) {
    PokemonSearchPartyData *data = AllocFromHeap(radioShow->heapID, sizeof(PokemonSearchPartyData));
    MI_CpuClear8(data, sizeof(PokemonSearchPartyData));
    // data->heapID = radioShow->heapID;
    radioShow->showData = data;
    RadioShow_PokemonSearchParty_Init(radioShow);
    StopBGM(GF_GetCurrentPlayingBGM(), 0);
    SndRadio_StartSeq(SEQ_GS_RADIO_VARIETY);
    return FALSE;
}

BOOL RadioShow_PokemonSearchParty_Teardown(RadioShow *radioShow) {
    RadioShow_PokemonSearchParty_Unload(radioShow);
    MI_CpuClear8(radioShow->showData, sizeof(PokemonSearchPartyData));
    FreeToHeap(radioShow->showData);
    radioShow->showData = NULL;
    return FALSE;
}

BOOL RadioShow_PokemonSearchParty_Print(RadioShow *radioShow) {
    PokemonSearchPartyData *data = radioShow->showData;

    switch (data->state) {
    case 0:
        RadioPrintInitEz(radioShow, msg_0419_00002);
        ++data->state;
        break;
    case 1:
        if (Radio_RunTextPrinter(radioShow)) {
            u16 msgID = msg_0419_00004 + data->unlockedEpisodes[data->episodeID];
            RadioPrintInitEz(radioShow, msgID);
            ++data->state;
        }
        break;
    case 2:
        if (Radio_RunTextPrinter(radioShow)) {
            ++data->state;
        }
        break;
    case 3:
        if (RadioShow_DelayAndScrollLine(radioShow)) {
            RadioPrintAndPlayJingle(radioShow, msg_0419_00003);
            ++data->state;
        }
        break;
    case 4:
        if (Radio_RunTextPrinter_WaitJingle(radioShow)) {
            radioShow->triggerCommercials = TRUE;
            return TRUE;
        }
        break;
    }

    return FALSE;
}

void RadioShow_PokemonSearchParty_Init(RadioShow *radioShow) {
    u8 badgeCount;
    u8 num = 0;
    u8 i;
    PokemonSearchPartyData *data = radioShow->showData;
    SaveVarsFlags *varsFlags;
    PlayerProfile *profile;

    radioShow->showMsgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0419_bin, radioShow->heapID);
    ReadMsgDataIntoString(radioShow->showMsgData, msg_0419_00000, radioShow->showTitle);
    ReadMsgDataIntoString(radioShow->showMsgData, msg_0419_00001, radioShow->showHost);
    MI_CpuClear8(data->episodeUnlockFlags, sizeof(data->episodeUnlockFlags));
    MI_CpuClear8(data->unlockedEpisodes, sizeof(data->unlockedEpisodes));

    varsFlags = Save_VarsFlags_Get(radioShow->saveData);
    profile = Save_PlayerData_GetProfile(radioShow->saveData);
    data->episodeUnlockFlags[PSP_EPISODE_UNLOCK_ALWAYS] = 1;
    data->episodeUnlockFlags[PSP_EPISODE_UNLOCK_AZALEA_ROCKETS] = Save_VarsFlags_CheckFlagInArray(varsFlags, FLAG_BEAT_AZALEA_ROCKETS);
    data->episodeUnlockFlags[PSP_EPISODE_UNLOCK_PLAINBADGE] = PlayerProfile_TestBadgeFlag(profile, BADGE_PLAIN);
    data->episodeUnlockFlags[PSP_EPISODE_UNLOCK_TOWER_ROCKETS] = Save_VarsFlags_CheckFlagInArray(varsFlags, FLAG_BEAT_RADIO_TOWER_ROCKETS);
    badgeCount = PlayerProfile_CountBadges(profile);
    if (badgeCount >= 8) {
        data->episodeUnlockFlags[PSP_EPISODE_UNLOCK_8BADGES] = 1;
    }
    if (badgeCount >= 9) {
        data->episodeUnlockFlags[PSP_EPISODE_UNLOCK_9BADGES] = 1;
    }
    if (badgeCount >= 16) {
        data->episodeUnlockFlags[PSP_EPISODE_UNLOCK_16BADGES] = 1;
    }
    data->episodeUnlockFlags[PSP_EPISODE_UNLOCK_VERMILION] = Save_VarsFlags_FlypointFlagAction(varsFlags, FLAG_ACTION_CHECK, FLYPOINT_VERMILION);
    for (i = 0; i < NELEMS(sEpisodeUnlockFlags); ++i) {
        if (data->episodeUnlockFlags[sEpisodeUnlockFlags[i]]) {
            data->unlockedEpisodes[num++] = i;
        }
    }
    data->episodeID = LCRandom() % num;
    if (data->episodeID == radioShow->lastEpisodeID) {
        data->episodeID = (data->episodeID + 1) % num;
    }
    radioShow->lastEpisodeID = data->episodeID;
}

void RadioShow_PokemonSearchParty_Unload(RadioShow *radioShow) {
    DestroyMsgData(radioShow->showMsgData);
}
