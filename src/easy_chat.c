#include "easy_chat.h"
#include "save.h"
#include "math_util.h"
#include "gf_gfx_loader.h"
#include "filesystem.h"
#include "msgdata/msg.naix"
#include "constants/species.h"
#include "constants/pokemon.h"
#include "constants/moves.h"
#include "constants/abilities.h"

#include "msgdata/msg/msg_0237.h"
#include "msgdata/msg/msg_0751.h"
#include "msgdata/msg/msg_0735.h"
#include "msgdata/msg/msg_0721.h"
#include "msgdata/msg/msg_0285.h"
#include "msgdata/msg/msg_0286.h"
#include "msgdata/msg/msg_0287.h"
#include "msgdata/msg/msg_0288.h"
#include "msgdata/msg/msg_0289.h"
#include "msgdata/msg/msg_0290.h"
#include "msgdata/msg/msg_0291.h"

static const u16 sNarcMsgCounts[EC_GROUP_MAX] = {
    EC_WORDS_POKEMON_COUNT,
    EC_WORDS_MOVE_COUNT,
    EC_WORDS_STATUS_COUNT,
    EC_WORDS_TRAINER_COUNT,
    EC_WORDS_PEOPLE_COUNT,
    EC_WORDS_GREETINGS_COUNT,
    EC_WORDS_LIFESTYLE_COUNT,
    EC_WORDS_FEELINGS_COUNT,
    EC_WORDS_TOUGH_WORDS_COUNT,
    EC_WORDS_UNION_COUNT,
    EC_WORDS_QUESTION_MARKS_COUNT,
};

static const u16 sNarcMsgBanks[EC_GROUP_MAX] = {
    NARC_msg_msg_0237_bin,
    NARC_msg_msg_0751_bin,
    NARC_msg_msg_0735_bin,
    NARC_msg_msg_0721_bin,
    NARC_msg_msg_0285_bin,
    NARC_msg_msg_0286_bin,
    NARC_msg_msg_0287_bin,
    NARC_msg_msg_0288_bin,
    NARC_msg_msg_0289_bin,
    NARC_msg_msg_0290_bin,
    NARC_msg_msg_0291_bin,
};

static const u8 sLanguageToGreetingMap[6][2] = {
    { LANGUAGE_JAPANESE, msg_0287_konnichiwa },
    { LANGUAGE_ENGLISH,  msg_0287_hello },
    { LANGUAGE_FRENCH,   msg_0287_bonjour},
    { LANGUAGE_ITALIAN,  msg_0287_ciao },
    { LANGUAGE_GERMAN,   msg_0287_hallo },
    { LANGUAGE_SPANISH,  msg_0287_hola },
};

// Several easy chat words are identical in
// the English localization. They are presented here.
// This is a leftover from Diamond that is linked
// simply because the routines that use it are
// present in source but dead-stripped at link time.
static const ECWORD _hey[] = {EC_WORD_LIFESTYLE_HEY, EC_WORD_LIFESTYLE_HEY_2};
static const ECWORD _huh_[] = {EC_WORD_LIFESTYLE_HUH_, EC_WORD_LIFESTYLE_HUH__2};
static const ECWORD _i[] = {EC_WORD_GREETINGS_I, EC_WORD_GREETINGS_I_2, EC_WORD_GREETINGS_I_3, EC_WORD_GREETINGS_I_4};
static const ECWORD _kids[] = {EC_WORD_GREETINGS_KIDS, EC_WORD_GREETINGS_KIDS_2};
static const ECWORD _no_way[] = {EC_WORD_LIFESTYLE_NO_WAY, EC_WORD_TOUGH_WORDS_NO_WAY};
static const ECWORD _anticipation[] = {EC_WORD_TRAINER(ABILITY_ANTICIPATION), EC_WORD_TOUGH_WORDS_ANTICIPATION};
static const ECWORD _you[] = {EC_WORD_GREETINGS_YOU, EC_WORD_GREETINGS_YOU_2};
static const ECWORD _simple[] = {EC_WORD_TRAINER(ABILITY_SIMPLE), EC_WORD_TOUGH_WORDS_SIMPLE};
static const ECWORD _welcome[] = {EC_WORD_LIFESTYLE_WELCOME, EC_WORD_LIFESTYLE_WELCOME_2};
static const ECWORD _wow[] = {EC_WORD_LIFESTYLE_WOW, EC_WORD_LIFESTYLE_WOW_2};
static const ECWORD _psychic[] = {EC_WORD_MOVE(MOVE_PSYCHIC), EC_WORD_STATUS(TYPE_PSYCHIC)};
static const ECWORD _ok[] = {EC_WORD_LIFESTYLE_OK, EC_WORD_LIFESTYLE_OK_2};

static const struct {
    const ECWORD *data;
    u32 count;
} sIdenticalPhrases[12] = {
    {_anticipation, NELEMS(_anticipation)},
    {_hey, NELEMS(_hey)},
    {_huh_, NELEMS(_huh_)},
    {_i, NELEMS(_i)},
    {_kids, NELEMS(_kids)},
    {_no_way, NELEMS(_no_way)},
    {_ok, NELEMS(_ok)},
    {_psychic, NELEMS(_psychic)},
    {_simple, NELEMS(_simple)},
    {_welcome, NELEMS(_welcome)},
    {_wow, NELEMS(_wow)},
    {_you, NELEMS(_you)},
};

void SaveEasyChat_SetGreetingFlag(SAVE_EASY_CHAT_T *ec, u8 a1);

BOOL GetCategoryAndMsgNoByECWordIdx(u16 ecWord, u32 *category, u32 *msgno);

ECMAN *EasyChatManager_new(HeapID heapId) {
    ECMAN *ret;
    int i;

    ret = AllocFromHeap(heapId, sizeof(ECMAN));
    for (i = 0; i < EC_GROUP_MAX; i++) {
        ret->heapId = heapId;
        ret->msgData[i] = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, sNarcMsgBanks[i], heapId);
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
        category = sNarcMsgBanks[category];
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
        if (category == sNarcMsgBanks[i]) {
            for (j = 0, k = 0; j < i; j++) {
                k += sNarcMsgCounts[j];
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

    for (i = 0; i < NELEMS(sNarcMsgCounts); i++) {
        j += sNarcMsgCounts[i];
        if (r3 < j) {
            *category = i;
            *msgno = (r3 - (j - sNarcMsgCounts[i]));
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

    ec->greetings = 0;
    ec->trendy = 0;
    for (i = 0; i < NELEMS(sLanguageToGreetingMap); i++) {
        if (sLanguageToGreetingMap[i][0] == GAME_LANGUAGE) {
            SaveEasyChat_SetGreetingFlag(ec, sLanguageToGreetingMap[i][1]);
            break;
        }
    }
    SaveSubstruct_UpdateCRC(SAVE_EASY_CHAT);
}

SAVE_EASY_CHAT_T *SaveData_EasyChat_get(SAVEDATA *saveData) {
    SaveSubstruct_AssertCRC(SAVE_EASY_CHAT);
    return SavArray_get(saveData, SAVE_EASY_CHAT);
}

BOOL SaveEasyChat_GetTrendySayingFlag(SAVE_EASY_CHAT_T *ec, int flag) {
    return (ec->trendy >> flag) & 1;
}

u32 SaveEasyChat_RandomTrendySayingSet(SAVE_EASY_CHAT_T *ec) {
    u32 i;
    u32 n;
    u32 k;

    for (i = 0, n = 0; i < 32; i++) {
        if (!((ec->trendy >> i) & 1)) {
            n++;
        }
    }

    if (n != 0) {
        k = LCRandom() % n;
        for (i = 0; i < 32; i++) {
            if (!((ec->trendy >> i) & 1)) {
                if (k == 0) {
                    ec->trendy |= 1 << i;
                    SaveSubstruct_UpdateCRC(SAVE_EASY_CHAT);
                    return i;
                }
                k--;
            }
        }
    }
    SaveSubstruct_UpdateCRC(SAVE_EASY_CHAT);
    return 32;
}

BOOL SaveEasyChat_TrendySayingsUnlockedAllCheck(SAVE_EASY_CHAT_T *ec) {
    u32 i;

    for (i = 0; i < 32; i++) {
        if (!((ec->trendy >> i) & 1)) {
            return FALSE;
        }
    }
    return TRUE;
}

ECWORD TrendyWordIdxToECWord(int a0) {
    int i;
    ECWORD n = 0;
    for (i = 0; i < EC_GROUP_UNION; i++) {
        n += sNarcMsgCounts[i];
    }
    return n + a0;
}

BOOL SaveEasyChat_GetGreetingsFlag(SAVE_EASY_CHAT_T *ec, u8 idx) {
    return (ec->greetings >> idx) & 1;
}

void SaveEasyChat_SetGreetingFlag(SAVE_EASY_CHAT_T *ec, u8 idx) {
    ec->greetings |= 1 << idx;
    SaveSubstruct_UpdateCRC(SAVE_EASY_CHAT);
}

struct WallpaperPasswordBank *WallpaperPasswordBank_Create(HeapID heapId) {
    u32 size;
    struct WallpaperPasswordBank *ret;

    ret = AllocFromHeap(heapId, sizeof(struct WallpaperPasswordBank));
    memset(ret, 0, sizeof(struct WallpaperPasswordBank));
    ret->words = GfGfxLoader_LoadFromNarc_GetSizeOut(NARC_resource_eng_pms_aikotoba_pms_aikotoba, 0, FALSE, heapId, FALSE, &size);
    ret->count = size / 4;
    return ret;
}

void WallpaperPasswordBank_Delete(struct WallpaperPasswordBank *pwdBank) {
    FreeToHeap(pwdBank->words);
    FreeToHeap(pwdBank);
}

u32 WallpaperPasswordBank_GetNum(struct WallpaperPasswordBank *pwdBank) {
    return pwdBank->count;
}

ECWORD WallpaperPasswordBank_GetWordI(struct WallpaperPasswordBank *pwdBank, int idx) {
    GF_ASSERT(pwdBank != NULL);
    if (pwdBank->count <= idx) {
        return EC_WORD_NULL;
    } else {
        return pwdBank->words[idx];
    }
}

s16 WallpaperPasswordBank_GetIndexOfWord(struct WallpaperPasswordBank *unk, int value) {
    int i;

    GF_ASSERT(unk != NULL);
    for (i = 0; i < unk->count; i++) {
        if (value == unk->words[i]) {
            return i;
        }
    }

    return -1;
}

u16 EasyChat_GetMsgBankForGroup(int category) {
    if (category >= EC_GROUP_MAX) {
        category = 0;
    }
    return sNarcMsgBanks[category];
}

// These two functions are required in order to force sIdenticalPhrases to link.
// However, they are unlinked in heartgold and deadstripped in linktime.
// The only reason why there's any code in here at all is because these
// functions can be found in Diamond and Pearl.
s32 GetDuplicateWordNum(ECWORD a0) {
    s32 r3;
    s32 r4;

    for (r3 = 0; r3 < NELEMS(sIdenticalPhrases); r3++) {
        for (r4 = 0; r4 < sIdenticalPhrases[r3].count; r4++) {
            if (a0 == sIdenticalPhrases[r3].data[r4]) {
                return sIdenticalPhrases[r3].count - 1;
            }
        }
    }
    return 0;
}

ECWORD RemapDuplicateWord(ECWORD a0, s32 a1) {
    s32 r7;
    s32 r2;
    s32 r0;

    for (r7 = 0; r7 < NELEMS(sIdenticalPhrases); r7++) {
        for (r2 = 0; r2 < sIdenticalPhrases[r7].count; r2++) {
            if (a0 == sIdenticalPhrases[r7].data[r2]) {
                // ERROR: Infinite loop when reached
                for (r0 = 0; /*r0 <*/ sIdenticalPhrases[r7].count; r0++) {
                    if (a1 == 0) {
                        return sIdenticalPhrases[r7].data[r0];
                    }
                    a1--;
                }
                GF_ASSERT(0);
                return EC_WORD_NULL;
            }
        }
    }
    return a0;
}
