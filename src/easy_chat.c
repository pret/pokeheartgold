#include "easy_chat.h"
#include "save.h"
#include "math_util.h"
#include "msgdata/msg.naix"

extern const u16 _020F612C[EC_GROUP_MAX];
extern const u16 _020F6142[EC_GROUP_MAX];
extern const u8 _020F6120[6][2];
void sub_02015CFC(SAVE_EASY_CHAT_T *ec, u8 a1);

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

u32 Sav2_EasyChat_sizeof(void) {
    return sizeof(SAVE_EASY_CHAT_T);
}

void Sav2_EasyChat_init(SAVE_EASY_CHAT_T *ec) {
    int i;

    ec->unk0 = 0;
    ec->unk4 = 0;
    for (i = 0; i < NELEMS(_020F6120); i++) {
        if (_020F6120[i][0] == 2) {
            sub_02015CFC(ec, _020F6120[i][1]);
            break;
        }
    }
    sub_0202893C(SAVE_EASY_CHAT);
}

SAVE_EASY_CHAT_T *sub_02015C28(SAVEDATA *saveData) {
    sub_02028900(SAVE_EASY_CHAT);
    return SavArray_get(saveData, SAVE_EASY_CHAT);
}

BOOL sub_02015C3C(SAVE_EASY_CHAT_T *ec, int flag) {
    return (ec->unk4 >> flag) & 1;
}

u32 sub_02015C48(SAVE_EASY_CHAT_T *ec) {
    u32 i;
    u32 n;
    u32 k;

    for (i = 0, n = 0; i < 32; i++) {
        if (!((ec->unk4 >> i) & 1)) {
            n++;
        }
    }

    if (n != 0) {
        k = LCRandom() % n;
        for (i = 0; i < 32; i++) {
            if (!((ec->unk4 >> i) & 1)) {
                if (k == 0) {
                    ec->unk4 |= 1 << i;
                    sub_0202893C(SAVE_EASY_CHAT);
                    return i;
                }
                k--;
            }
        }
    }
    sub_0202893C(SAVE_EASY_CHAT);
    return 32;
}
