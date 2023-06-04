#include "global.h"
#include "heap.h"
#include "msgdata.h"
#include "message_format.h"

static void CopyEncryptedMessage16(u16 *dest, const u16 *src, MAT_ENTRY *alloc);
static void ReadMsgData_ExistingNarc_ExistingString(NARC * narc, u32 group, u32 num, HeapID heap_id, STRING * dest);
static STRING * ReadMsgData_ExistingNarc_NewString(NARC * narc, u32 group, u32 num, HeapID heap_id);

static void *LoadSingleElementFromNarc(NarcId narcId, s32 fileId, HeapID heapId) {
    return AllocAndReadWholeNarcMemberByIdPair(narcId, fileId, heapId);
}

static void FreeMsgDataRawData(void *data) {
    FreeToHeap(data);
}

inline static void Decrypt1(MAT_ENTRY * arg0, u32 arg1, u32 seed) {
    seed = seed * 765 * (arg1 + 1) & 0xffff;
    seed |= seed << 16;
    arg0->offset ^= seed;
    arg0->length ^= seed;
}

inline static void Decrypt2(u16 * arg0, u32 count, u32 arg2) {
    u16 seed = (u16)((arg2 + 1) * 596947);

    while (count-- > 0) {
        *arg0 ^= seed;
        arg0++;
        seed += 18749;
    }
}

static void ReadMsgData_ExistingTable_ExistingArray(MAT *table, u32 num, u16 *dest) {
    MAT_ENTRY sp0;

    if (num < table->count) {
        sp0 = table->alloc[num];
        Decrypt1(&sp0, num, table->key);

        CopyEncryptedMessage16(dest, (const u16 *)((u8 *)table + sp0.offset), &sp0);
        Decrypt2(dest, sp0.length, num);
    } else {
        GF_ASSERT(FALSE);
    }
}

static void ReadMsgData_NewNarc_ExistingArray(NarcId narc_id, u32 group, u32 num, HeapID heap_id, u16 * dest) {
    NARC * narc = NARC_New(narc_id, heap_id);
    u16 header[2];
    MAT_ENTRY alloc;
    if (narc != NULL) {
        NARC_ReadFromMember(narc, group, 0, 4, header);
        NARC_ReadFromMember(narc, group, 8 * num + 4, 8, &alloc);
        Decrypt1(&alloc, num, header[1]);
        NARC_ReadFromMember(narc, group, alloc.offset, 2 * alloc.length, dest);
        Decrypt2(dest, alloc.length, num);
        NARC_dtor(narc);
    }
}

static void CopyEncryptedMessage16(u16 *dest, const u16 *src, MAT_ENTRY *alloc) {
    MI_CpuCopy16(src, dest, alloc->length * 2);
}

static void ReadMsgData_ExistingTable_ExistingString(MAT * table, u32 num, STRING * dest) {
    MAT_ENTRY alloc;
    u16 * buf;
    if (num < table->count) {
        alloc = table->alloc[num];
        Decrypt1(&alloc, num, table->key);
        buf = AllocFromHeapAtEnd(HEAP_ID_0, 2 * alloc.length);
        if (buf != NULL) {
            MI_CpuCopy16((char *)table + alloc.offset, buf, 2 * alloc.length);
            Decrypt2(buf, alloc.length, num);
            CopyU16ArrayToStringN(dest, buf, alloc.length);
            FreeToHeap(buf);
        }
    } else {
        GF_ASSERT(FALSE);
        StringSetEmpty(dest);
    }
}

static STRING * ReadMsgData_ExistingTable_NewString(MAT * table, u32 num, HeapID heap_id) {
    MAT_ENTRY alloc;
    u16 * buf;
    STRING * dest;
    if (num < table->count) {
        alloc = table->alloc[num];
        Decrypt1(&alloc, num, table->key);
        buf = AllocFromHeapAtEnd(heap_id, 2 * alloc.length);
        if (buf != NULL) {
            MI_CpuCopy16((char *)table + alloc.offset, buf, 2 * alloc.length);
            Decrypt2(buf, alloc.length, num);
            dest = String_New(alloc.length, heap_id);
            if (dest != NULL)
                CopyU16ArrayToStringN(dest, buf, alloc.length);
            FreeToHeap(buf);
            return dest;
        } else {
            return NULL;
        }
    } else {
        GF_ASSERT(FALSE);
        return String_New(4, heap_id);
    }
}

void ReadMsgData_NewNarc_ExistingString(NarcId narc_id, s32 group, u32 num, HeapID heap_id, STRING * dest) {
    NARC * narc = NARC_New(narc_id, heap_id);
    if (narc != NULL) {
        ReadMsgData_ExistingNarc_ExistingString(narc, group, num, heap_id, dest);
        NARC_dtor(narc);
    }
}

static void ReadMsgData_ExistingNarc_ExistingString(NARC * narc, u32 group, u32 num, HeapID heap_id, STRING * dest) {
    u16 * buf;
    u32 size;
    u16 sp10[2];
    MAT_ENTRY alloc;

    NARC_ReadFromMember(narc, group, 0, 4, sp10);
    if (num < sp10[0]) {
        NARC_ReadFromMember(narc, group, 8 * num + 4, 8, &alloc);
        Decrypt1(&alloc, num, sp10[1]);
        size = alloc.length * 2;
        buf = AllocFromHeapAtEnd(heap_id, size);
        if (buf != NULL) {
            NARC_ReadFromMember(narc, group, alloc.offset, size, buf);
            Decrypt2(buf, alloc.length, num);
            CopyU16ArrayToStringN(dest, buf, alloc.length);
            FreeToHeap(buf);
            return;
        }
    } else {
        GF_ASSERT(FALSE);
        StringSetEmpty(dest);
    }
}

STRING * ReadMsgData_NewNarc_NewString(NarcId narc_id, u32 group, u32 num, HeapID heap_id) {
    NARC * narc = NARC_New(narc_id, heap_id);
    STRING * string;
    if (narc != NULL) {
        string = ReadMsgData_ExistingNarc_NewString(narc, group, num, heap_id);
        NARC_dtor(narc);
    } else {
        string = String_New(4, heap_id);
    }
    return string;
}

static STRING * ReadMsgData_ExistingNarc_NewString(NARC * narc, u32 group, u32 num, HeapID heap_id) {
    STRING * dest;
    u16 * buf;
    u32 size;
    u16 sp10[2];
    MAT_ENTRY alloc;

    NARC_ReadFromMember(narc, group, 0, 4, sp10);
    if (num < sp10[0]) {
        NARC_ReadFromMember(narc, group, 8 * num + 4, 8, &alloc);
        Decrypt1(&alloc, num, sp10[1]);
        dest = String_New(alloc.length, heap_id);
        if (dest != NULL) {
            size = alloc.length * 2;
            buf = AllocFromHeapAtEnd(heap_id, size);
            if (buf != NULL) {
                NARC_ReadFromMember(narc, group, alloc.offset, size, buf);
                Decrypt2(buf, alloc.length, num);
                CopyU16ArrayToStringN(dest, buf, alloc.length);
                FreeToHeap(buf);
            }
        }
        return dest;
    } else {
        GF_ASSERT(FALSE);
        return String_New(4, heap_id);
    }
}

static u16 GetMsgCount_ExistingTable(MAT * tbl) {
    return tbl->count;
}

static u16 GetMsgCount_TableFromNarc(NarcId narc_id, s32 file_id) {
    u16 n[2];
    ReadFromNarcMemberByIdPair(&n, narc_id, file_id, 0, 4);
    return n[0];
}

MSGDATA * NewMsgDataFromNarc(MsgDataLoadType type, NarcId narc_id, s32 file_id, HeapID heap_id) {
    MSGDATA * msgData = AllocFromHeapAtEnd(heap_id, sizeof(MSGDATA));
    if (msgData != NULL) {
        if (type == MSGDATA_LOAD_DIRECT) {
            msgData->direct = LoadSingleElementFromNarc(narc_id, file_id, heap_id);
            if (msgData->direct == NULL) {
                FreeToHeap(msgData);
                return NULL;
            }
        } else {
            msgData->lazy = NARC_New(narc_id, heap_id);
        }
        msgData->type = (u16)type;
        msgData->narc_id = (u16)narc_id;
        msgData->file_id = (u16)file_id;
        msgData->heap_id = (u16)heap_id;
    }
    return msgData;
}

void DestroyMsgData(MSGDATA * msgData) {
    if (msgData != NULL) {
        switch (msgData->type) {
        case MSGDATA_LOAD_DIRECT:
            FreeMsgDataRawData(msgData->direct);
            break;
        case MSGDATA_LOAD_LAZY:
            NARC_dtor(msgData->lazy);
            break;
        }
        FreeToHeap(msgData);
    }
}

void ReadMsgDataIntoString(MSGDATA * msgData, s32 msg_no, STRING * dest) {
    switch (msgData->type) {
    case MSGDATA_LOAD_DIRECT:
        ReadMsgData_ExistingTable_ExistingString(msgData->direct, msg_no, dest);
        break;
    case MSGDATA_LOAD_LAZY:
        ReadMsgData_ExistingNarc_ExistingString(msgData->lazy, msgData->file_id, msg_no, (HeapID) msgData->heap_id, dest);
        break;
    }
}

STRING *NewString_ReadMsgData(MSGDATA *msgData, s32 msg_no) {
    switch (msgData->type) {
    case MSGDATA_LOAD_DIRECT:
        return ReadMsgData_ExistingTable_NewString(msgData->direct, msg_no, (HeapID) msgData->heap_id);
    case MSGDATA_LOAD_LAZY:
        return ReadMsgData_ExistingNarc_NewString(msgData->lazy, msgData->file_id, msg_no, (HeapID) msgData->heap_id);
    default:
        return NULL;
    }
}

u32 MsgDataGetCount(MSGDATA * msgData) {
    switch (msgData->type) {
    case MSGDATA_LOAD_DIRECT:
        return GetMsgCount_ExistingTable(msgData->direct);
    case MSGDATA_LOAD_LAZY:
        return GetMsgCount_TableFromNarc((NarcId)msgData->narc_id, msgData->file_id);
    default:
        return 0;
    }
}

void ReadMsgDataIntoU16Array(MSGDATA * msgData, u32 msg_no, u16 * dest) {
    switch (msgData->type) {
    case MSGDATA_LOAD_DIRECT:
        ReadMsgData_ExistingTable_ExistingArray(msgData->direct, msg_no, dest);
        break;
    case MSGDATA_LOAD_LAZY:
        ReadMsgData_NewNarc_ExistingArray((NarcId)msgData->narc_id, msgData->file_id, msg_no, (HeapID) msgData->heap_id, dest);
        break;
    }
}

void GetSpeciesNameIntoArray(u16 species, HeapID heap_id, u16 * dest) {
    MSGDATA * msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0237_bin, heap_id);
    ReadMsgDataIntoU16Array(msgData, species, dest);
    DestroyMsgData(msgData);
}

STRING * ReadMsgData_ExpandPlaceholders(MessageFormat * messageFormat, MSGDATA * msgData, u32 msgno, HeapID heap_id) {
    STRING * ret = NULL;
    STRING * r4 = String_New(1024, HEAP_ID_0);
    STRING * r5;
    if (r4 != NULL) {
        r5 = NewString_ReadMsgData(msgData, msgno);
        if (r5 != NULL) {
            StringExpandPlaceholders(messageFormat, r4, r5);
            ret = StringDup(r4, heap_id);
            String_dtor(r5);
        }
        String_dtor(r4);
    }
    return ret;
}

STRING * GetMoveName(u32 move, HeapID heapno) {
    MSGDATA * msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0750_bin, heapno);
    STRING * ret;
    if (msgData != NULL) {
        ret = String_New(16, heapno);
        if (ret != NULL) {
            ReadMsgDataIntoString(msgData, move, ret);
        }
        DestroyMsgData(msgData);
        return ret;
    }
    return NULL;
}

STRING * GetSpeciesName(u16 species, HeapID heap_id) {
    STRING * ret;
    MSGDATA * msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0237_bin, heap_id);
    if (msgData != NULL) {
        ret = NewString_ReadMsgData(msgData, species);
        DestroyMsgData(msgData);
        return ret;
    }
    return NULL;
}
