#include "global.h"

#include "application/pokegear/radio/radio_internal.h"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0418.h"

#include "sound_02004A44.h"
#include "sound_radio.h"
#include "unk_02005D10.h"

typedef struct TeamRocketRadioData {
    enum HeapID heapID;
    u8 state;
} TeamRocketRadioData;

void RadioShow_TeamRocket_Init(RadioShow *radioShow);
void RadioShow_TeamRocket_Unload(RadioShow *radioShow);

BOOL RadioShow_TeamRocket_Setup(RadioShow *radioShow) {
    TeamRocketRadioData *data = Heap_Alloc(radioShow->heapID, sizeof(TeamRocketRadioData));
    MI_CpuClear8(data, sizeof(TeamRocketRadioData));
    // data->heapID = radioShow->heapID;
    radioShow->showData = data;
    RadioShow_TeamRocket_Init(radioShow);
    StopBGM(GF_GetCurrentPlayingBGM(), 1);
    data->state = 0;
    SndRadio_StartSeq(SEQ_GS_SENKYO_R);
    return FALSE;
}

BOOL RadioShow_TeamRocket_Teardown(RadioShow *radioShow) {
    RadioShow_TeamRocket_Unload(radioShow);
    MI_CpuClear8(radioShow->showData, sizeof(TeamRocketRadioData));
    Heap_Free(radioShow->showData);
    radioShow->showData = NULL;
    return FALSE;
}

BOOL RadioShow_TeamRocket_Print(RadioShow *radioShow) {
    TeamRocketRadioData *data = radioShow->showData;

    switch (data->state) {
    case 0:
        RadioPrintInitEz(radioShow, msg_0418_00002);
        ++data->state;
        break;
    case 1:
        if (Radio_RunTextPrinter(radioShow)) {
            data->state = 0;
        }
        break;
    }
    return FALSE;
}

void RadioShow_TeamRocket_Init(RadioShow *radioShow) {
    radioShow->showMsgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0418_bin, radioShow->heapID);
    ReadMsgDataIntoString(radioShow->showMsgData, msg_0418_00000, radioShow->showTitle);
    ReadMsgDataIntoString(radioShow->showMsgData, msg_0418_00001, radioShow->showHost);
}

void RadioShow_TeamRocket_Unload(RadioShow *radioShow) {
    DestroyMsgData(radioShow->showMsgData);
}
