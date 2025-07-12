#include "global.h"

#include "application/pokegear/radio/radio_internal.h"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0066_D23R0102.h"
#include "msgdata/msg/msg_0411.h"

#include "bag.h"
#include "sound_02004A44.h"
#include "sound_radio.h"
#include "sys_vars.h"
#include "unk_02005D10.h"

typedef struct BuenasPasswordData {
    enum HeapID heapID;
    u16 state;
    u16 msgID;
} BuenasPasswordData;

void RadioShow_BuenasPassword_Init(RadioShow *radioShow);
void RadioShow_BuenasPassword_Unload(RadioShow *radioShow);

BOOL RadioShow_BuenasPassword_Setup(RadioShow *radioShow) {
    BuenasPasswordData *data = Heap_Alloc(radioShow->heapID, sizeof(BuenasPasswordData));
    MI_CpuClear8(data, sizeof(BuenasPasswordData));
    // data->heapID = radioShow->heapID;
    radioShow->showData = data;
    RadioShow_BuenasPassword_Init(radioShow);
    StopBGM(GF_GetCurrentPlayingBGM(), 0);
    SndRadio_StartSeq(SEQ_GS_AIKOTOBA);
    return FALSE;
}

BOOL RadioShow_BuenasPassword_Teardown(RadioShow *radioShow) {
    RadioShow_BuenasPassword_Unload(radioShow);
    MI_CpuClear8(radioShow->showData, sizeof(BuenasPasswordData));
    Heap_Free(radioShow->showData);
    radioShow->showData = NULL;
    return FALSE;
}

BOOL RadioShow_BuenasPassword_Print(RadioShow *radioShow) {
    BuenasPasswordData *data = radioShow->showData;

    switch (data->state) {
    case 0:
        RadioPrintInitEz(radioShow, msg_0411_00002);
        ++data->state;
        break;
    case 1:
        if (Radio_RunTextPrinter(radioShow)) {
            RadioPrintInitEz(radioShow, data->msgID);
            if (data->msgID == 4) {
                Save_VarsFlags_SetFlagInArray(Save_VarsFlags_Get(radioShow->saveData), FLAG_DAILY_HEARD_BUENAS_PASSWORD);
            }
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
            RadioPrintAndPlayJingle(radioShow, msg_0411_00003);
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

void RadioShow_BuenasPassword_Init(RadioShow *radioShow) {
    BuenasPasswordData *data = radioShow->showData;
    MsgData *bpMsgData;
    u16 setID;
    String *answer;

    radioShow->showMsgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0411_bin, radioShow->heapID);
    ReadMsgDataIntoString(radioShow->showMsgData, msg_0411_00000, radioShow->showTitle);
    ReadMsgDataIntoString(radioShow->showMsgData, msg_0411_00001, radioShow->showHost);

    data->msgID = Bag_HasItem(Save_Bag_Get(radioShow->saveData), ITEM_BLUE_CARD, 1, radioShow->heapID) ? msg_0411_00004 : msg_0411_00005;
    bpMsgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0066_D23R0102_bin, radioShow->heapID);
    setID = Save_VarsFlags_GetBuenasPasswordSet(Save_VarsFlags_Get(radioShow->saveData)) % 30;
    answer = NewString_ReadMsgData(bpMsgData, msg_0066_D23R0102_00040 + setID);
    BufferString(radioShow->msgFormat, 0, answer, 2, 1, 2);
    String_Delete(answer);
    DestroyMsgData(bpMsgData);
}

void RadioShow_BuenasPassword_Unload(RadioShow *radioShow) {
    DestroyMsgData(radioShow->showMsgData);
}
