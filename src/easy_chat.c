#include "global.h"
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
    EC_WORDS_TYPE_COUNT,
    EC_WORDS_ABILITY_COUNT,
    EC_WORDS_TRAINER_COUNT,
    EC_WORDS_PEOPLE_COUNT,
    EC_WORDS_GREETINGS_COUNT,
    EC_WORDS_LIFESTYLE_COUNT,
    EC_WORDS_FEELINGS_COUNT,
    EC_WORDS_TOUGH_WORDS_COUNT,
    EC_WORDS_UNION_COUNT,
};

static const u16 sNarcMsgBanks[EC_GROUP_MAX] = {
    NARC_msg_msg_0237_bin, // Species names
    NARC_msg_msg_0751_bin, // Move names
    NARC_msg_msg_0735_bin, // Type names
    NARC_msg_msg_0721_bin, // Ability names
    NARC_msg_msg_0285_bin, // Trainer
    NARC_msg_msg_0286_bin, // People
    NARC_msg_msg_0287_bin, // Greetings
    NARC_msg_msg_0288_bin, // Lifestyle
    NARC_msg_msg_0289_bin, // Feelings
    NARC_msg_msg_0290_bin, // Tough words
    NARC_msg_msg_0291_bin, // Union
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
static const ecword_t sEasyChatHey[] = {EC_WORD_GREETINGS_HEY, EC_WORD_GREETINGS_HEY_2};
static const ecword_t sEasyChatHuh_[] = {EC_WORD_GREETINGS_HUH_, EC_WORD_GREETINGS_HUH__2};
static const ecword_t sEasyChatI[] = {EC_WORD_PEOPLE_I, EC_WORD_PEOPLE_I_2, EC_WORD_PEOPLE_I_3, EC_WORD_PEOPLE_I_4};
static const ecword_t sEasyChatKids[] = {EC_WORD_PEOPLE_KIDS, EC_WORD_PEOPLE_KIDS_2};
static const ecword_t sEasyChatNoWay[] = {EC_WORD_GREETINGS_NO_WAY, EC_WORD_FEELINGS_NO_WAY};
static const ecword_t sEasyChatAnticipation[] = {EC_WORD_ABILITY(ABILITY_ANTICIPATION), EC_WORD_FEELINGS_ANTICIPATION};
static const ecword_t sEasyChatYou[] = {EC_WORD_PEOPLE_YOU, EC_WORD_PEOPLE_YOU_2};
static const ecword_t sEasyChatSimple[] = {EC_WORD_ABILITY(ABILITY_SIMPLE), EC_WORD_FEELINGS_SIMPLE};
static const ecword_t sEasyChatWelcome[] = {EC_WORD_GREETINGS_WELCOME, EC_WORD_GREETINGS_WELCOME_2};
static const ecword_t sEasyChatWow[] = {EC_WORD_GREETINGS_WOW, EC_WORD_GREETINGS_WOW_2};
static const ecword_t sEasyChatPsychic[] = {EC_WORD_MOVE(MOVE_PSYCHIC), EC_WORD_TYPE(TYPE_PSYCHIC)};
static const ecword_t sEasyChatOk[] = {EC_WORD_GREETINGS_OK, EC_WORD_GREETINGS_OK_2};

typedef struct ECIdenticalPhrases {
    const ecword_t *data;
    s32 count;
} ECIdenticalPhrases;

static const ECIdenticalPhrases sIdenticalPhrases[12] = {
    {sEasyChatAnticipation, NELEMS(sEasyChatAnticipation)},
    {sEasyChatHey, NELEMS(sEasyChatHey)},
    {sEasyChatHuh_, NELEMS(sEasyChatHuh_)},
    {sEasyChatI, NELEMS(sEasyChatI)},
    {sEasyChatKids, NELEMS(sEasyChatKids)},
    {sEasyChatNoWay, NELEMS(sEasyChatNoWay)},
    {sEasyChatOk, NELEMS(sEasyChatOk)},
    {sEasyChatPsychic, NELEMS(sEasyChatPsychic)},
    {sEasyChatSimple, NELEMS(sEasyChatSimple)},
    {sEasyChatWelcome, NELEMS(sEasyChatWelcome)},
    {sEasyChatWow, NELEMS(sEasyChatWow)},
    {sEasyChatYou, NELEMS(sEasyChatYou)},
};

EasyChatManager *EasyChatManager_New(HeapID heapId) {
    EasyChatManager *ret = AllocFromHeap(heapId, sizeof(EasyChatManager));

    for (s32 i = 0; i < EC_GROUP_MAX; i++) {
        ret->heapId = heapId; // inadvertently inside the loop
        ret->msgData[i] = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, sNarcMsgBanks[i], heapId);
    }
    return ret;
}

void EasyChatManager_Delete(EasyChatManager *easyChatManager) {
    for (s32 i = 0; i < EC_GROUP_MAX; i++) {
        DestroyMsgData(easyChatManager->msgData[i]);
    }
    FreeToHeap(easyChatManager);
}

void EasyChatManager_ReadWordIntoString(EasyChatManager *easyChatManager, u16 ecWord, String *dest) {
    u32 category;
    u32 msgNo;
    GetCategoryAndMsgNoByECWordIdx(ecWord, &category, &msgNo);
    ReadMsgDataIntoString(easyChatManager->msgData[category], msgNo, dest);
}

void GetECWordIntoStringByIndex(u16 ecWord, String *dest) {
    u32 category;
    u32 msgNo;
    if (ecWord != EC_WORD_NULL) {
        GetCategoryAndMsgNoByECWordIdx(ecWord, &category, &msgNo);
        category = sNarcMsgBanks[category];
        ReadMsgData_NewNarc_ExistingString(NARC_msgdata_msg, category, msgNo, HEAP_ID_DEFAULT, dest);
    } else {
        String_SetEmpty(dest);
    }
}

u16 GetECWordIndexByPair(u32 category, u32 msgNo) {
    u32 bank;
    u16 count;
    u16 i;
    for (bank = 0; bank < EC_GROUP_MAX; bank++) {
        if (category == sNarcMsgBanks[bank]) {
            for (i = 0, count = 0; i < bank; i++) {
                count += sNarcMsgCounts[i];
            }
            return (u16)(count + msgNo);
        }
    }
    return EC_WORD_NULL;
}

BOOL GetCategoryAndMsgNoByECWordIdx(u16 ecWord, u32 *category, u32 *msgNo) {
    u32 bank;
    u32 count;
    u32 wordId = ecWord & EC_WORD_MASK;

    count = 0;
    for (bank = 0; bank < NELEMS(sNarcMsgCounts); bank++) {
        count += sNarcMsgCounts[bank];
        if (wordId < count) {
            *category = bank;
            *msgNo = (wordId - (count - sNarcMsgCounts[bank]));
            return TRUE;
        }
    }

    return FALSE;
}

u32 Save_EasyChat_sizeof(void) {
    return sizeof(SaveEasyChat);
}

void Save_EasyChat_Init(SaveEasyChat *saveEasyChat) {
    u32 i;

    saveEasyChat->greetings = 0;
    saveEasyChat->trendy = 0;
    for (i = 0; i < NELEMS(sLanguageToGreetingMap); i++) {
        if (sLanguageToGreetingMap[i][0] == GAME_LANGUAGE) {
            Save_EasyChat_SetGreetingFlag(saveEasyChat, sLanguageToGreetingMap[i][1]);
            break;
        }
    }
    SaveSubstruct_UpdateCRC(SAVE_EASY_CHAT);
}

SaveEasyChat *Save_EasyChat_Get(SaveData *saveData) {
    SaveSubstruct_AssertCRC(SAVE_EASY_CHAT);
    return SaveArray_Get(saveData, SAVE_EASY_CHAT);
}

BOOL Save_EasyChat_GetTrendySayingFlag(SaveEasyChat *saveEasyChat, u32 flag) {
    return (saveEasyChat->trendy >> flag) & 1;
}

u32 Save_EasyChat_SetRandomTrendySaying(SaveEasyChat *saveEasyChat) {
    u32 i;
    u32 count;
    u32 bit;

    for (i = 0, count = 0; i < EC_WORDS_TOUGH_WORDS_COUNT; i++) {
        if (!((saveEasyChat->trendy >> i) & 1)) {
            count++;
        }
    }

    if (count != 0) {
        bit = LCRandom() % count;
        for (i = 0; i < EC_WORDS_TOUGH_WORDS_COUNT; i++) {
            if (!((saveEasyChat->trendy >> i) & 1)) {
                if (bit == 0) {
                    saveEasyChat->trendy |= (1 << i);
                    SaveSubstruct_UpdateCRC(SAVE_EASY_CHAT);
                    return i;
                }
                bit--;
            }
        }
    }
    SaveSubstruct_UpdateCRC(SAVE_EASY_CHAT);
    return EC_WORDS_TOUGH_WORDS_COUNT;
}

BOOL Save_EasyChat_TrendySayingsUnlockedAllCheck(SaveEasyChat *saveEasyChat) {
    for (u32 i = 0; i < EC_WORDS_TOUGH_WORDS_COUNT; i++) {
        if (!((saveEasyChat->trendy >> i) & 1)) {
            return FALSE;
        }
    }
    return TRUE;
}

ecword_t TrendyWordIdxToECWord(u32 word) {
    s32 i;
    u16 count = 0;
    for (i = 0; i < EC_GROUP_TOUGH_WORDS; i++) {
        count += sNarcMsgCounts[i];
    }
    return (ecword_t)(count + word);
}

BOOL Save_EasyChat_GetGreetingsFlag(SaveEasyChat *saveEasyChat, u32 flag) {
    return (saveEasyChat->greetings >> flag) & 1;
}

void Save_EasyChat_SetGreetingFlag(SaveEasyChat *saveEasyChat, u32 flag) {
    saveEasyChat->greetings |= (1 << flag);
    SaveSubstruct_UpdateCRC(SAVE_EASY_CHAT);
}

WallpaperPasswordBank *WallpaperPasswordBank_Create(HeapID heapId) {
    u32 size;
    WallpaperPasswordBank *ret = AllocFromHeap(heapId, sizeof(WallpaperPasswordBank));

    memset(ret, 0, sizeof(WallpaperPasswordBank));
    ret->words = GfGfxLoader_LoadFromNarc_GetSizeOut(NARC_resource_eng_pms_aikotoba_pms_aikotoba, 0, FALSE, heapId, FALSE, &size);
    ret->count = size / sizeof(*ret->words);
    return ret;
}

void WallpaperPasswordBank_Delete(WallpaperPasswordBank *wallpaperPasswordBank) {
    FreeToHeap(wallpaperPasswordBank->words);
    FreeToHeap(wallpaperPasswordBank);
}

u32 WallpaperPasswordBank_GetCount(WallpaperPasswordBank *wallpaperPasswordBank) {
    return wallpaperPasswordBank->count;
}

ecword_t WallpaperPasswordBank_GetWordAtIndex(WallpaperPasswordBank *wallpaperPasswordBank, s32 index) {
    GF_ASSERT(wallpaperPasswordBank != NULL);
    if (wallpaperPasswordBank->count <= index) {
        return EC_WORD_NULL;
    } else {
        return wallpaperPasswordBank->words[index];
    }
}

s16 WallpaperPasswordBank_GetIndexOfWord(WallpaperPasswordBank *wallpaperPasswordBank, s32 word) {
    GF_ASSERT(wallpaperPasswordBank != NULL);
    for (s32 i = 0; i < wallpaperPasswordBank->count; i++) {
        if (word == wallpaperPasswordBank->words[i]) {
            return i;
        }
    }

    return EC_WORD_NULL;
}

u16 EasyChat_GetMsgBankForGroup(s32 category) {
    if (category >= EC_GROUP_MAX) {
        category = 0;
    }
    return sNarcMsgBanks[category];
}

// These two functions are required in order to force sIdenticalPhrases to link.
// However, they are unlinked in heartgold and deadstripped in linktime.
// The only reason why there's any code in here at all is because these
// functions can be found in Diamond and Pearl.
s32 GetDuplicateWordNum(ecword_t word) {
    for (s32 i = 0; i < NELEMS(sIdenticalPhrases); i++) {
        for (s32 j = 0; j < sIdenticalPhrases[i].count; j++) {
            if (word == sIdenticalPhrases[i].data[j]) {
                return sIdenticalPhrases[i].count - 1;
            }
        }
    }
    return 0;
}

ecword_t RemapDuplicateWord(ecword_t word, s32 target) {
    for (s32 phrases = 0; phrases < NELEMS(sIdenticalPhrases); phrases++) {
        for (s32 phraseCount = 0; phraseCount < sIdenticalPhrases[phrases].count; phraseCount++) {
            if (word == sIdenticalPhrases[phrases].data[phraseCount]) {
                // ERROR: Infinite loop when reached
                for (s32 targetCount = 0; /*targetCount <*/ sIdenticalPhrases[phrases].count; targetCount++) {
                    if (target == 0) {
                        return sIdenticalPhrases[phrases].data[targetCount];
                    }
                    target--;
                }
                GF_ASSERT(FALSE);
                return EC_WORD_NULL;
            }
        }
    }
    return word;
}
