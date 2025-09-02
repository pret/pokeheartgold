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

// TODO: Rename MsgData -> MessageLoader to be in sync with pokeplat repository
typedef struct MsgData {
    u16 type;
    u16 heapID;
    u16 narc_id;
    u16 file_id;
    union {
        MAT *direct;
        NARC *lazy;
    };
} MsgData;

MsgData *NewMsgDataFromNarc(MsgDataLoadType type, NarcId narc, s32 fileId, enum HeapID heapID);
void DestroyMsgData(MsgData *msgData);
String *NewString_ReadMsgData(MsgData *msgData, s32 strno);
void ReadMsgDataIntoString(MsgData *msgData, s32 strno, String *dest);
void GetSpeciesNameIntoArray(u16 species, enum HeapID heapID, u16 *dest);
String *GetSpeciesName(u16 species, enum HeapID heapID);
void ReadMsgData_NewNarc_ExistingString(NarcId narcId, s32 fileId, u32 msgId, enum HeapID heapID, String *dest);
String *ReadMsgData_ExpandPlaceholders(MessageFormat *messageFormat, MsgData *msgData, u32 msgno, enum HeapID heapID);
String *ReadMsgData_NewNarc_NewString(NarcId narc_id, u32 group, u32 num, enum HeapID heapID);
u32 MsgDataGetCount(MsgData *msgData);
void ReadMsgDataIntoU16Array(MsgData *msgData, u32 msgno, u16 *dest);
String *GetMoveName(u32 move, enum HeapID heapno);

#endif // POKEHEARTGOLD_MSGDATA_H
