#include "global.h"

#include "application/pokegear/radio/radio_internal.h"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0420.h"

#include "math_util.h"
#include "sound_02004A44.h"
#include "sound_radio.h"
#include "unk_02005D10.h"

typedef struct TrainerProfilesData {
    HeapID heapID;
    u16 state;
    u8 msgIDs[3];
    u8 selector;
} TrainerProfilesData;

void RadioShow_TrainerProfiles_Init(RadioShow *radioShow);
void RadioShow_TrainerProfiles_Unload(RadioShow *radioShow);
BOOL RadioShow_TrainerProfiles_EnsureUniqueMsgID(TrainerProfilesData *data, u8 msgID, u8 index);

BOOL RadioShow_TrainerProfiles_Setup(RadioShow *radioShow) {
    TrainerProfilesData *data = AllocFromHeap(radioShow->heapID, sizeof(TrainerProfilesData));
    MI_CpuClear8(data, sizeof(TrainerProfilesData));
    // data->heapID = radioShow->heapID;
    radioShow->showData = data;
    RadioShow_TrainerProfiles_Init(radioShow);
    StopBGM(GF_GetCurrentPlayingBGM(), 0);
    SndRadio_StartSeq(SEQ_GS_RADIO_TRAINER);
    return FALSE;
}

BOOL RadioShow_TrainerProfiles_Teardown(RadioShow *radioShow) {
    RadioShow_TrainerProfiles_Unload(radioShow);
    MI_CpuClear8(radioShow->showData, sizeof(TrainerProfilesData));
    FreeToHeap(radioShow->showData);
    radioShow->showData = NULL;
    return FALSE;
}

BOOL RadioShow_TrainerProfiles_Print(RadioShow *radioShow) {
    TrainerProfilesData *data = radioShow->showData;

    switch (data->state) {
    case 0:
        RadioPrintInitEz(radioShow, msg_0420_00002);
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
            RadioPrintAndPlayJingle(radioShow, msg_0420_00003);
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

void RadioShow_TrainerProfiles_Init(RadioShow *radioShow) {
    int i;
    u8 msgID;
    TrainerProfilesData *data = radioShow->showData;

    radioShow->showMsgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0420_bin, radioShow->heapID);
    ReadMsgDataIntoString(radioShow->showMsgData, msg_0420_00000, radioShow->showTitle);
    ReadMsgDataIntoString(radioShow->showMsgData, msg_0420_00001, radioShow->showHost);

    for (i = 0; i < 3; ++i) {
        do {
            msgID = msg_0420_00004 + (LCRandom() % 16);
        } while (RadioShow_TrainerProfiles_EnsureUniqueMsgID(data, msgID, i));
        data->msgIDs[i] = msgID;
    }
}

void RadioShow_TrainerProfiles_Unload(RadioShow *radioShow) {
    DestroyMsgData(radioShow->showMsgData);
}

BOOL RadioShow_TrainerProfiles_EnsureUniqueMsgID(TrainerProfilesData *data, u8 msgID, u8 index) {
    for (int i = 0; i < index; ++i) {
        if (data->msgIDs[i] == msgID) {
            return TRUE;
        }
    }
    return FALSE;
}
