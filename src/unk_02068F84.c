#include "unk_02068F84.h"
#include "font.h"

u32 sub_02068F84(MSGDATA *msgData, u32 map_sec, STRING *dest) {
    ReadMsgDataIntoString(msgData, map_sec, dest);
    return FontID_String_GetWidth(0, dest, 0);
}

void sub_02068F98(u32 mapno, HeapID heapId, STRING *dest) {
    MSGDATA *msgData;
    u32 map_sec;

    msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0279_bin, heapId);
    map_sec = MapHeader_GetMapSec(mapno);
    sub_02068F84(msgData, map_sec, dest);
    DestroyMsgData(msgData);
};
