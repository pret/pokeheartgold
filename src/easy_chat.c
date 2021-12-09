#include "easy_chat.h"
#include "save.h"
#include "msgdata/msg.naix"

extern const u16 _020F612C[EC_GROUP_MAX];
extern const u16 _020F6142[EC_GROUP_MAX];

BOOL GetCategoryAndMsgNoByECWordIdx(u16 ecWord, u32 *category, u32 *msgno);

ECMAN *EasyChatManager_new(HeapID heapId) {
    ECMAN *ret;
    int i;

    ret = AllocFromHeap(heapId, sizeof(ECMAN));
    for (i = 0; i < EC_GROUP_MAX; i++) {
        ret->heapId = heapId;
        ret->msgData[i] = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, _020F612C[i], heapId);
    }
    return ret;
}

void EasyChatManager_delete(ECMAN *ecMan) {
    int i;

    for (i = 0; i < EC_GROUP_MAX; i++) {
        DestroyMsgData(ecMan->msgData[i]);
    }
    FreeToHeap(ecMan);
}

void EasyChatManager_ReadWordIntoString(ECMAN *ecMan, u16 ecWord, STRING *dest) {
    u32 category, msgno;
    GetCategoryAndMsgNoByECWordIdx(ecWord, &category, &msgno);
    ReadMsgDataIntoString(ecMan->msgData[category], msgno, dest);
}

void GetECWordIntoStringByIndex(u16 ecWord, STRING *dest) {
    u32 category, msgno;
    if (ecWord != EC_WORD_NULL) {
        GetCategoryAndMsgNoByECWordIdx(ecWord, &category, &msgno);
        category = _020F612C[category];
        ReadMsgData_NewNarc_ExistingString(NARC_msgdata_msg, category, msgno, 0, dest);
    } else {
        StringSetEmpty(dest);
    }
}

u16 GetECWordIndexByPair(u32 category, u32 msgno) {
    u32 i;
    u16 k;
    u16 j;
    for (i = 0; i < 11; i++) {
        if (category == _020F612C[i]) {
            for (j = 0, k = 0; j < i; j++) {
                k += _020F6142[j];
            }
            return (u16)(k + msgno);
        }
    }
    return EC_WORD_NULL;
}

BOOL GetCategoryAndMsgNoByECWordIdx(u16 ecWord, u32 *category, u32 *msgno) {
    u32 i, j, r3;

    r3 = ecWord & EC_WORD_MASK;
    j = 0;

    for (i = 0; i < NELEMS(_020F6142); i++) {
        j += _020F6142[i];
        if (r3 < j) {
            *category = i;
            *msgno = (r3 - (j - _020F6142[i]));
            return TRUE;
        }
    }

    return FALSE;
}
