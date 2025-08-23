#include "global.h"

#include "application/pokegear/radio/radio_internal.h"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0417.h"

#include "sound_02004A44.h"
#include "sound_radio.h"
#include "unk_02005D10.h"

typedef struct PokeFluteData {
    HeapID heapID;
} PokeFluteData;

void RadioShow_PokeFlute_Init(RadioShow *radioShow);
void RadioShow_PokeFlute_Unload(RadioShow *radioShow);

BOOL RadioShow_PokeFlute_Setup(RadioShow *radioShow) {
    PokeFluteData *data = AllocFromHeap(radioShow->heapID, sizeof(PokeFluteData));
    MI_CpuClear8(data, sizeof(PokeFluteData));
    // data->heapID = radioShow->heapID;
    radioShow->showData = data;
    RadioShow_PokeFlute_Init(radioShow);
    StopBGM(GF_GetCurrentPlayingBGM(), 1);
    SndRadio_StartSeq(SEQ_GS_HUE);
    return FALSE;
}

BOOL RadioShow_PokeFlute_Teardown(RadioShow *radioShow) {
    RadioShow_PokeFlute_Unload(radioShow);
    MI_CpuClear8(radioShow->showData, sizeof(PokeFluteData));
    Heap_Free(radioShow->showData);
    radioShow->showData = NULL;
    return FALSE;
}

BOOL RadioShow_PokeFlute_Print(RadioShow *radioShow) {
    return FALSE;
}

void RadioShow_PokeFlute_Init(RadioShow *radioShow) {
    radioShow->showMsgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0417_bin, radioShow->heapID);
    ReadMsgDataIntoString(radioShow->showMsgData, msg_0417_00000, radioShow->showTitle);
    String_SetEmpty(radioShow->showHost);
}

void RadioShow_PokeFlute_Unload(RadioShow *radioShow) {
    DestroyMsgData(radioShow->showMsgData);
}
