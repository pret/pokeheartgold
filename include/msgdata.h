#ifndef POKEHEARTGOLD_MSGDATA_H
#define POKEHEARTGOLD_MSGDATA_H

#include "filesystem.h"
#include "message_format.h"
#include "pm_string.h"

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

typedef struct MsgData {
    u16 type;
    u16 heapId;
    u16 narc_id;
    u16 file_id;
    union {
        MAT *direct;
        NARC *lazy;
    };
} MsgData;

MsgData *NewMsgDataFromNarc(MsgDataLoadType type, NarcId narc, s32 fileId, HeapID heapId);
void DestroyMsgData(MsgData *msgData);
String *NewString_ReadMsgData(MsgData *msgData, s32 strno);
void ReadMsgDataIntoString(MsgData *msgData, s32 strno, String *dest);
void GetSpeciesNameIntoArray(u16 species, HeapID heapId, u16 *dest);
String *GetSpeciesName(u16 species, HeapID heapId);
void ReadMsgData_NewNarc_ExistingString(NarcId narcId, s32 fileId, u32 msgId, HeapID heapId, String *dest);
String *ReadMsgData_ExpandPlaceholders(MessageFormat *messageFormat, MsgData *msgData, u32 msgno, HeapID heapId);
String *ReadMsgData_NewNarc_NewString(NarcId narc_id, u32 group, u32 num, HeapID heapId);
u32 MsgDataGetCount(MsgData *msgData);
void ReadMsgDataIntoU16Array(MsgData *msgData, u32 msgno, u16 *dest);
String *GetMoveName(u32 move, HeapID heapno);

#endif // POKEHEARTGOLD_MSGDATA_H
