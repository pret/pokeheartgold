#include "easy_chat.h"
#include "save.h"
#include "math_util.h"
#include "gf_gfx_loader.h"
#include "filesystem.h"
#include "msgdata/msg.naix"

extern const u16 _020F612C[EC_GROUP_MAX];
extern const u16 _020F6142[EC_GROUP_MAX];
extern const u8 _020F6120[6][2];
extern const struct {
    const u16 *data;
    size_t count;
} _020F6158[12];
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
        if (_020F6120[i][0] == GAME_LANGUAGE) {
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

BOOL sub_02015CAC(SAVE_EASY_CHAT_T *ec, int k) {
    u32 i;

    for (i = 0; i < 32; i++) {
        if (!((ec->unk4 >> i) & 1)) {
            return FALSE;
        }
    }
    return TRUE;
}

u16 sub_02015CC8(u16 a0) {
    int i;
    u16 n = 0;
    for (i = 0; i < 9; i++) {
        n += _020F6142[i];
    }
    return n + a0;
}

BOOL sub_02015CF0(SAVE_EASY_CHAT_T *ec, u8 idx) {
    return (ec->unk0 >> idx) & 1;
}

void sub_02015CFC(SAVE_EASY_CHAT_T *ec, u8 idx) {
    ec->unk0 |= 1 << idx;
    sub_0202893C(SAVE_EASY_CHAT);
}

struct UnkStruct_02015D14 *sub_02015D14(HeapID heapId) {
    u32 size;
    struct UnkStruct_02015D14 *ret;

    ret = AllocFromHeap(heapId, sizeof(struct UnkStruct_02015D14));
    memset(ret, 0, sizeof(struct UnkStruct_02015D14));
    ret->unk4 = GfGfxLoader_LoadFromNarc_GetSizeOut(NARC_a_2_1_2, 0, FALSE, heapId, FALSE, &size);
    ret->unk0 = size / 4;
    return ret;
}

void sub_02015D54(struct UnkStruct_02015D14 *unk) {
    FreeToHeap(unk->unk4);
    FreeToHeap(unk);
}

u32 sub_02015D68(struct UnkStruct_02015D14 *unk) {
    return unk->unk0;
}

u16 sub_02015D6C(struct UnkStruct_02015D14 *unk, int idx) {
    GF_ASSERT(unk != NULL);
    if (unk->unk0 <= idx) {
        return EC_WORD_NULL;
    } else {
        return unk->unk4[idx];
    }
}

s16 sub_02015D94(struct UnkStruct_02015D14 *unk, int value) {
    int i;

    GF_ASSERT(unk != NULL);
    for (i = 0; i < unk->unk0; i++) {
        if (value == unk->unk4[i]) {
            return i;
        }
    }

    return -1;
}

u16 sub_02015DC8(int a0) {
    if (a0 >= 11) {
        a0 = 0;
    }
    return _020F612C[a0];
}

// These two functions are required in order to force _020F6158 to link.
// However, they are unlinked in heartgold and deadstripped in linktime.
// The only reason why there's any code in here at all is because these
// functions can be found in Diamond and Pearl.
s32 DEADSTRIP__easy_chat_0(u16 a0) {
    s32 r3;
    s32 r4;

    for (r3 = 0; r3 < NELEMS(_020F6158); r3++) {
        for (r4 = 0; r4 < _020F6158[r3].count; r4++) {
            if (a0 == _020F6158[r3].data[r4])
                return _020F6158[r3].count - 1;
        }
    }
    return 0;
}

u16 DEADSTRIP__easy_chat_1(u16 a0, s32 a1) {
    s32 r7;
    s32 r2;
    s32 r0;

    for (r7 = 0; r7 < NELEMS(_020F6158); r7++) {
        for (r2 = 0; r2 < _020F6158[r7].count; r2++) {
            if (a0 == _020F6158[r7].data[r2]) {
                // ERROR: Infinite loop when reached
                for (r0 = 0; /*r0 <*/ _020F6158[r7].count; r0++) {
                    if (a1 == 0) {
                        return _020F6158[r7].data[r0];
                    }
                    a1--;
                }
                GF_ASSERT(0);
                return 0xFFFF;
            }
        }
    }
    return a0;
}
