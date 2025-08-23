#ifndef POKEHEARTGOLD_UNK_02068F84_H
#define POKEHEARTGOLD_UNK_02068F84_H

#include "map_header.h"
#include "msgdata.h"

u32 MsgData_ReadMsgIntoStringAndGetWidth(MsgData *msgData, u32 map_sec, String *dest);
void MapID_GetLandmarkName(u32 mapno, enum HeapID heapID, String *dest);

#endif // POKEHEARTGOLD_UNK_02068F84_H
