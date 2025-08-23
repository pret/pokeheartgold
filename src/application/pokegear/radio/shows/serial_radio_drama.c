#include "global.h"

#include "application/pokegear/radio/radio_internal.h"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0413.h"

#include "math_util.h"
#include "sound_02004A44.h"
#include "sound_radio.h"
#include "unk_02005D10.h"

typedef struct SerialRadioDramaShowData {
    enum HeapID heapID;
    u16 state;
    u16 episodeID;
} SerialRadioDramaShowData;

void RadioShow_SerialRadioDrama_Init(RadioShow *radioShow);
void RadioShow_SerialRadioDrama_Unload(RadioShow *radioShow);

BOOL RadioShow_SerialRadioDrama_Setup(RadioShow *radioShow) {
    SerialRadioDramaShowData *data = Heap_Alloc(radioShow->heapID, sizeof(SerialRadioDramaShowData));
    MI_CpuClear8(data, sizeof(SerialRadioDramaShowData));
    // data->heapID = radioShow->heapID;
    radioShow->showData = data;
    RadioShow_SerialRadioDrama_Init(radioShow);
    StopBGM(GF_GetCurrentPlayingBGM(), 0);
    SndRadio_StartSeq(SEQ_GS_RADIO_VARIETY);
    return FALSE;
}

BOOL RadioShow_SerialRadioDrama_Teardown(RadioShow *radioShow) {
    if (radioShow->showData == NULL) {
        return FALSE;
    }
    RadioShow_SerialRadioDrama_Unload(radioShow);
    MI_CpuClear8(radioShow->showData, sizeof(SerialRadioDramaShowData));
    Heap_Free(radioShow->showData);
    radioShow->showData = NULL;
    return FALSE;
}

BOOL RadioShow_SerialRadioDrama_Print(RadioShow *radioShow) {
    SerialRadioDramaShowData *data = radioShow->showData;

    switch (data->state) {
    case 0:
        RadioPrintInitEz(radioShow, msg_0413_00002);
        ++data->state;
        break;
    case 1:
        if (Radio_RunTextPrinter(radioShow)) {
            u16 msgID = data->episodeID + msg_0413_00004;
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
            RadioPrintAndPlayJingle(radioShow, msg_0413_00003);
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

void RadioShow_SerialRadioDrama_Init(RadioShow *radioShow) {
    SerialRadioDramaShowData *data = radioShow->showData;
    radioShow->showMsgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0413_bin, radioShow->heapID);
    ReadMsgDataIntoString(radioShow->showMsgData, msg_0413_00000, radioShow->showTitle);
    ReadMsgDataIntoString(radioShow->showMsgData, msg_0413_00001, radioShow->showHost);
    data->episodeID = LCRandom() % 22;
    if (data->episodeID == radioShow->lastEpisodeID) {
        data->episodeID = (data->episodeID + 1) % 22;
    }
    radioShow->lastEpisodeID = data->episodeID;
}

void RadioShow_SerialRadioDrama_Unload(RadioShow *radioShow) {
    DestroyMsgData(radioShow->showMsgData);
}
