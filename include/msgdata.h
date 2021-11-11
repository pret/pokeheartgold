#ifndef POKEHEARTGOLD_MSGDATA_H
#define POKEHEARTGOLD_MSGDATA_H

#include "sys/string.h"
#include "filesystem.h"
#include "msgdata/msg.naix"

typedef enum MsgDataLoadType {
    MSGDATA_LOAD_DIRECT,
    MSGDATA_LOAD_LAZY,
} MsgDataLoadType;

typedef struct _MAT_ENTRY {
    u32 offset;
    u32 length;
} MAT_ENTRY;

typedef struct _MAT {
    u16 count;
    u16 key;
    MAT_ENTRY alloc[1];
} MAT;

typedef struct MSGDATA {
    u16 type;
    u16 heap_id;
    u16 narc_id;
    u16 file_id;
    union {
        MAT * direct;
        NARC * lazy;
    };
} MSGDATA;

MSGDATA *NewMsgDataFromNarc(MsgDataLoadType type, NarcId narc, s32 fileId, u32 heap_id);
void DestroyMsgData(MSGDATA *msgData);
STRING *NewString_ReadMsgData(MSGDATA *msgData, s32 strno);
void ReadMsgDataIntoString(MSGDATA *msgData, s32 strno, STRING *dest);

#endif //POKEHEARTGOLD_MSGDATA_H
