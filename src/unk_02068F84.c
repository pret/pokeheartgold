#include "unk_02068F84.h"

#include "global.h"

#include "msgdata/msg.naix"

#include "font.h"

u32 MsgData_ReadMsgIntoStringAndGetWidth(MsgData *msgData, u32 map_sec, String *dest) {
    ReadMsgDataIntoString(msgData, map_sec, dest);
    return FontID_String_GetWidth(0, dest, 0);
}

void MapID_GetLandmarkName(u32 mapno, enum HeapID heapID, String *dest) {
    MsgData *msgData;
    u32 map_sec;

    msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0279_bin, heapID);
    map_sec = MapHeader_GetMapSec(mapno);
    MsgData_ReadMsgIntoStringAndGetWidth(msgData, map_sec, dest);
    DestroyMsgData(msgData);
}
