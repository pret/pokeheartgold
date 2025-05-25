#include "global.h"

#include "application/pokegear/radio/radio_internal.h"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0413.h"

#include "math_util.h"
#include "sound_02004A44.h"
#include "sound_radio.h"
#include "unk_02005D10.h"

typedef struct VarietyShowData {
    HeapID heapID;
    u16 state;
    u16 scriptID;
} VarietyShowData;

void RadioShow_Variety_Init(RadioShow *radioShow);
void RadioShow_Variety_Unload(RadioShow *radioShow);

BOOL RadioShow_Variety_Setup(RadioShow *radioShow) {
    VarietyShowData *data = AllocFromHeap(radioShow->heapID, sizeof(VarietyShowData));
    MI_CpuClear8(data, sizeof(VarietyShowData));
    // data->heapID = radioShow->heapID;
    radioShow->showData = data;
    RadioShow_Variety_Init(radioShow);
    StopBGM(GF_GetCurrentPlayingBGM(), 0);
    SndRadio_StartSeq(SEQ_GS_RADIO_VARIETY);
    return FALSE;
}

BOOL RadioShow_Variety_Teardown(RadioShow *radioShow) {
    if (radioShow->showData == NULL) {
        return FALSE;
    }
    RadioShow_Variety_Unload(radioShow);
    MI_CpuClear8(radioShow->showData, sizeof(VarietyShowData));
    FreeToHeap(radioShow->showData);
    radioShow->showData = NULL;
    return FALSE;
}

BOOL RadioShow_Variety_Print(RadioShow *radioShow) {
    VarietyShowData *data = radioShow->showData;

    switch (data->state) {
    case 0:
        RadioPrintInitEz(radioShow, msg_0413_00002);
        ++data->state;
        break;
    case 1:
        if (Radio_RunTextPrinter(radioShow)) {
            u16 msgID = data->scriptID + msg_0413_00004;
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
        if (ov101_021F5AB8(radioShow)) {
            RadioPrintAndPlayJingle(radioShow, msg_0413_00003);
            ++data->state;
        }
        break;
    case 4:
        if (Radio_RunTextPrinter_WaitJingle(radioShow)) {
            radioShow->unk_66_4 = 1;
            return TRUE;
        }
        break;
    }
    return FALSE;
}

void RadioShow_Variety_Init(RadioShow *radioShow) {
    VarietyShowData *data = radioShow->showData;
    radioShow->showMsgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0413_bin, radioShow->heapID);
    ReadMsgDataIntoString(radioShow->showMsgData, msg_0413_00000, radioShow->showTitle);
    ReadMsgDataIntoString(radioShow->showMsgData, msg_0413_00001, radioShow->showHost);
    data->scriptID = LCRandom() % 22;
    if (data->scriptID == radioShow->lastVarietyShowScriptID) {
        data->scriptID = (data->scriptID + 1) % 22;
    }
    radioShow->lastVarietyShowScriptID = data->scriptID;
}

void RadioShow_Variety_Unload(RadioShow *radioShow) {
    DestroyMsgData(radioShow->showMsgData);
}
