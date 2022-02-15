#ifndef POKEHEARTGOLD_MSGDATA_H
#define POKEHEARTGOLD_MSGDATA_H

#include "pm_string.h"
#include "filesystem.h"
#include "msgfmt.h"
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

MSGDATA *NewMsgDataFromNarc(MsgDataLoadType type, NarcId narc, s32 fileId, HeapID heap_id);
void DestroyMsgData(MSGDATA *msgData);
STRING *NewString_ReadMsgData(MSGDATA *msgData, s32 strno);
void ReadMsgDataIntoString(MSGDATA *msgData, s32 strno, STRING *dest);
void GetSpeciesNameIntoArray(u16 species, HeapID heap_id, u16 *dest);
STRING *GetSpeciesName(u16 species, HeapID heap_id);
void ReadMsgData_NewNarc_ExistingString(NarcId narcId, s32 fileId, u32 msgId, HeapID heapId, STRING *dest);
STRING * ReadMsgData_ExpandPlaceholders(MSGFMT * a0, MSGDATA * msgData, u32 msgno, HeapID heap_id);
STRING * ReadMsgData_NewNarc_NewString(NarcId narc_id, u32 group, u32 num, u32 heap_id);
u32 MsgDataGetCount(MSGDATA *msgData);
void ReadMsgDataIntoU16Array(MSGDATA *msgData, u32 msgno, u16 *dest);
STRING * GetMoveName(u32 move, HeapID heapno);

#endif //POKEHEARTGOLD_MSGDATA_H
