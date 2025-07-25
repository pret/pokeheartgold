#include "global.h"

#include "application/pokegear/radio/radio_internal.h"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0409.h"

#include "sound_02004A44.h"
#include "sound_radio.h"
#include "unk_02005D10.h"

typedef struct MahoganySignalData {
    enum HeapID heapID;
    u8 state;
} MahoganySignalData;

void RadioShow_MahoganySignal_Init(RadioShow *radioShow);
void RadioShow_MahoganySignal_Unload(RadioShow *radioShow);

BOOL RadioShow_MahoganySignal_Setup(RadioShow *radioShow) {
    MahoganySignalData *data = Heap_Alloc(radioShow->heapID, sizeof(MahoganySignalData));
    MI_CpuClear8(data, sizeof(MahoganySignalData));
    // data->heapID = radioShow->heapID;
    radioShow->showData = data;
    RadioShow_MahoganySignal_Init(radioShow);
    StopBGM(GF_GetCurrentPlayingBGM(), 1);
    data->state = 0;
    SndRadio_StartSeq(SEQ_GS_KAIDENPA);
    return FALSE;
}

BOOL RadioShow_MahoganySignal_Teardown(RadioShow *radioShow) {
    RadioShow_MahoganySignal_Unload(radioShow);
    MI_CpuClear8(radioShow->showData, sizeof(MahoganySignalData));
    Heap_Free(radioShow->showData);
    radioShow->showData = NULL;
    return FALSE;
}

BOOL RadioShow_MahoganySignal_Print(RadioShow *radioShow) {
    return FALSE;
}

void RadioShow_MahoganySignal_Init(RadioShow *radioShow) {
    radioShow->showMsgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0409_bin, radioShow->heapID);
    ReadMsgDataIntoString(radioShow->showMsgData, msg_0409_00000, radioShow->showTitle);
    String_SetEmpty(radioShow->showHost);
}

void RadioShow_MahoganySignal_Unload(RadioShow *radioShow) {
    DestroyMsgData(radioShow->showMsgData);
}
