#include "global.h"

#include "application/pokegear/radio/radio_internal.h"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0415.h"

#include "math_util.h"
#include "sound_02004A44.h"
#include "sound_radio.h"
#include "sys_flags.h"
#include "unk_02005D10.h"

typedef enum TTTPUnlockCondition {
    TTTP_COND_ALWAYS,
    TTTP_COND_GOLDENROD, // effectively always
    TTTP_COND_MAHOGANY,
    TTTP_COND_BLACKTHORN,
    TTTP_COND_VERMILION,
} TTTPUnlockCondition;

typedef struct ThatTownThesePeopleData {
    HeapID heapID;
    u16 state;
    u8 msgIDs[3];
    u8 selector;
    u8 episodeUnlockFlags[5];
    u8 unlockedEpisodes[20];
} ThatTownThesePeopleData;

void RadioShow_ThatTownThesePeople_Init(RadioShow *radioShow);
void RadioShow_ThatTownThesePeople_Unload(RadioShow *radioShow);
BOOL RadioShow_ThatTownThesePeople_EnsureUniqueMsgID(ThatTownThesePeopleData *data, u8 msgID, u8 index);

static const u8 sEpisodeUnlockFlags[] = {
    TTTP_COND_ALWAYS,
    TTTP_COND_ALWAYS,
    TTTP_COND_ALWAYS,
    TTTP_COND_ALWAYS,
    TTTP_COND_ALWAYS,
    TTTP_COND_ALWAYS,
    TTTP_COND_ALWAYS,
    TTTP_COND_GOLDENROD,
    TTTP_COND_MAHOGANY,
    TTTP_COND_BLACKTHORN,
    TTTP_COND_VERMILION,
    TTTP_COND_VERMILION,
    TTTP_COND_VERMILION,
    TTTP_COND_VERMILION,
    TTTP_COND_VERMILION,
    TTTP_COND_VERMILION,
    TTTP_COND_VERMILION,
    TTTP_COND_VERMILION,
    TTTP_COND_VERMILION,
    TTTP_COND_VERMILION,
};

BOOL RadioShow_ThatTownThesePeople_Setup(RadioShow *radioShow) {
    ThatTownThesePeopleData *data = AllocFromHeap(radioShow->heapID, sizeof(ThatTownThesePeopleData));
    MI_CpuClear8(data, sizeof(ThatTownThesePeopleData));
    // data->heapID = radioShow->heapID;
    radioShow->showData = data;
    RadioShow_ThatTownThesePeople_Init(radioShow);
    StopBGM(GF_GetCurrentPlayingBGM(), 0);
    SndRadio_StartSeq(SEQ_GS_RADIO_PT);
    return FALSE;
}

BOOL RadioShow_ThatTownThesePeople_Teardown(RadioShow *radioShow) {
    RadioShow_ThatTownThesePeople_Unload(radioShow);
    MI_CpuClear8(radioShow->showData, sizeof(ThatTownThesePeopleData));
    FreeToHeap(radioShow->showData);
    radioShow->showData = NULL;
    return FALSE;
}

BOOL RadioShow_ThatTownThesePeople_Print(RadioShow *radioShow) {
    ThatTownThesePeopleData *data = radioShow->showData;

    switch (data->state) {
    case 0:
        RadioPrintInitEz(radioShow, msg_0415_00002);
        ++data->state;
        break;
    case 1:
        if (!Radio_RunTextPrinter(radioShow)) {
            break;
        }
        ++data->state;
        // fallthrough
    case 2:
        RadioPrintInitEz(radioShow, data->msgIDs[data->selector]);
        ++data->state;
        break;
    case 3:
        if (!Radio_RunTextPrinter(radioShow)) {
            break;
        }
        ++data->selector;
        if (data->selector < 3) {
            data->state = 2;
        } else {
            ++data->state;
        }
        break;
    case 4:
        if (RadioShow_DelayAndScrollLine(radioShow)) {
            RadioPrintAndPlayJingle(radioShow, msg_0415_00003);
            ++data->state;
        }
        break;
    case 5:
        if (Radio_RunTextPrinter_WaitJingle(radioShow)) {
            radioShow->triggerCommercials = TRUE;
            return TRUE;
        }
        break;
    }

    return FALSE;
}

void RadioShow_ThatTownThesePeople_Init(RadioShow *radioShow) {
    int i;
    int num;
    u8 msgID;
    SaveVarsFlags *varsFlags;
    ThatTownThesePeopleData *data = radioShow->showData;
    radioShow->showMsgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0415_bin, radioShow->heapID);
    ReadMsgDataIntoString(radioShow->showMsgData, msg_0415_00000, radioShow->showTitle);
    ReadMsgDataIntoString(radioShow->showMsgData, msg_0415_00001, radioShow->showHost);

    MI_CpuClear8(data->episodeUnlockFlags, sizeof(data->episodeUnlockFlags));
    MI_CpuClear8(data->unlockedEpisodes, sizeof(data->unlockedEpisodes));
    varsFlags = Save_VarsFlags_Get(radioShow->saveData);
    data->episodeUnlockFlags[TTTP_COND_ALWAYS] = 1;
    data->episodeUnlockFlags[TTTP_COND_GOLDENROD] = Save_VarsFlags_FlypointFlagAction(varsFlags, FLAG_ACTION_CHECK, FLYPOINT_GOLDENROD);
    data->episodeUnlockFlags[TTTP_COND_MAHOGANY] = Save_VarsFlags_FlypointFlagAction(varsFlags, FLAG_ACTION_CHECK, FLYPOINT_MAHOGANY);
    data->episodeUnlockFlags[TTTP_COND_BLACKTHORN] = Save_VarsFlags_FlypointFlagAction(varsFlags, FLAG_ACTION_CHECK, FLYPOINT_BLACKTHORN);
    data->episodeUnlockFlags[TTTP_COND_VERMILION] = Save_VarsFlags_FlypointFlagAction(varsFlags, FLAG_ACTION_CHECK, FLYPOINT_VERMILION);
    num = 0;
    for (i = 0; i < 20; ++i) {
        if (data->episodeUnlockFlags[sEpisodeUnlockFlags[i]]) {
            data->unlockedEpisodes[num++] = i;
        }
    }
    for (i = 0; i < 3; ++i) {
        do {
            msgID = msg_0415_00004 + data->unlockedEpisodes[LCRandom() % num];
        } while (RadioShow_ThatTownThesePeople_EnsureUniqueMsgID(data, msgID, i));
        data->msgIDs[i] = msgID;
    }
}

void RadioShow_ThatTownThesePeople_Unload(RadioShow *radioShow) {
    DestroyMsgData(radioShow->showMsgData);
}

BOOL RadioShow_ThatTownThesePeople_EnsureUniqueMsgID(ThatTownThesePeopleData *data, u8 msgID, u8 index) {
    for (int i = 0; i < index; ++i) {
        if (data->msgIDs[i] == msgID) {
            return TRUE;
        }
    }
    return FALSE;
}
