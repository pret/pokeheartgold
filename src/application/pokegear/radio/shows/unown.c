#include "global.h"

#include "application/pokegear/radio/radio_internal.h"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0410.h"

#include "sound_02004A44.h"
#include "sound_radio.h"
#include "unk_02005D10.h"

typedef struct UnownSignalData {
    HeapID heapID;
} UnownSignalData;

void RadioShow_Unown_Init(RadioShow *radioShow);
void RadioShow_Unown_Unload(RadioShow *radioShow);

BOOL RadioShow_Unown_Setup(RadioShow *radioShow) {
    UnownSignalData *data = AllocFromHeap(radioShow->heapID, sizeof(UnownSignalData));
    MI_CpuClear8(data, sizeof(UnownSignalData));
    // data->heapID = radioShow->heapID;
    radioShow->showData = data;
    RadioShow_Unown_Init(radioShow);
    StopBGM(GF_GetCurrentPlayingBGM(), 1);
    SndRadio_StartSeq(SEQ_GS_RADIO_UNKNOWN);
    return FALSE;
}

BOOL RadioShow_Unown_Teardown(RadioShow *radioShow) {
    RadioShow_Unown_Unload(radioShow);
    MI_CpuClear8(radioShow->showData, sizeof(UnownSignalData));
    Heap_Free(radioShow->showData);
    radioShow->showData = NULL;
    return FALSE;
}

BOOL RadioShow_Unown_Print(RadioShow *radioShow) {
    return FALSE;
}

void RadioShow_Unown_Init(RadioShow *radioShow) {
    radioShow->showMsgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0410_bin, radioShow->heapID);
    ReadMsgDataIntoString(radioShow->showMsgData, msg_0410_00000, radioShow->showTitle);
    String_SetEmpty(radioShow->showHost);
}

void RadioShow_Unown_Unload(RadioShow *radioShow) {
    DestroyMsgData(radioShow->showMsgData);
}
