#include "constants/species.h"

#include "application/pokedex/pokedex_internal.h"
#include "files/msgdata/msg.naix"

#include "msgdata.h"
#include "unk_02091278.h"

#if defined(HEARTGOLD)
#define ZUKAN_FLAVOR_GMM (msg_0803)
#elif defined(SOULSILVER)
#define ZUKAN_FLAVOR_GMM (msg_0804)
#else
#error "Unable to determine game"
#endif // HGSS

static int deadstrip_0(int a0);
static String *ov18_021E5A10(int msgBank, int msgNum, enum HeapID heapId);
static void ov18_021E5A50(u16 species, int language, int *pMsgNo, int *pLanguageFlag, int *pLanguageFlagNativeMask);

static const int ov18_021F970C[] = {
    msg_0828,
    msg_0823,
    msg_0824,
    msg_0825,
    msg_0826,
    msg_0827,
};

static const int ov18_021F96F4[] = {
    msg_0822,
    msg_0817,
    msg_0818,
    msg_0819,
    msg_0820,
    msg_0821,
};

static const int ov18_021F9724[] = {
    msg_0810,
    msg_0805,
    msg_0806,
    msg_0807,
    msg_0808,
    msg_0809,
};

String *ov18_021E590C(u16 species, int language, enum HeapID heapId) {
    int languageMsgNum;
    int unused;
    int msgNum;
    int msgBank;

    ov18_021E5A50(species, language, &languageMsgNum, &unused, &msgNum);
    if (msgNum == DEX_LANGUAGE_FLAG_MAX) {
        return GetSpeciesName(species, heapId);
    } else {
        int msgBanks[6];
        ARRAY_ASSIGN(msgBanks, ov18_021F96F4);

        msgBank = msgBanks[msgNum];
        msgNum = languageMsgNum;
    }
    return ov18_021E5A10(msgBank, msgNum, heapId);
}

String *ov18_021E595C(u16 species, int language, enum HeapID heapId) {
    int languageMsgNum;
    int unused;
    int msgNum;
    int msgBank;

    ov18_021E5A50(species, language, &languageMsgNum, &unused, &msgNum);
    if (msgNum == DEX_LANGUAGE_FLAG_MAX) {
        msgNum = species;
        msgBank = msg_0816;
    } else {
        int msgBanks[6];
        ARRAY_ASSIGN(msgBanks, ov18_021F970C);

        msgBank = msgBanks[msgNum];
        msgNum = languageMsgNum;
    }
    return ov18_021E5A10(msgBank, msgNum, heapId);
}

String *ov18_021E59A8(u16 species, int language, int a2, enum HeapID heapId) {
    int languageMsgNum;
    int unused;
    int msgNum;
    int msgBank;

    ov18_021E5A50(species, language, &languageMsgNum, &unused, &msgNum);
    if (msgNum == DEX_LANGUAGE_FLAG_MAX) {
        GF_ASSERT(a2 < 1);
        msgNum = species + a2;
        msgBank = ZUKAN_FLAVOR_GMM;
    } else {
        int msgBanks[6];
        ARRAY_ASSIGN(msgBanks, ov18_021F9724);

        GF_ASSERT(a2 < 1);
        msgBank = msgBanks[msgNum];
        msgNum = languageMsgNum + a2;
    }
    return ov18_021E5A10(msgBank, msgNum, heapId);
}

static String *ov18_021E5A10(int msgBank, int msgNum, enum HeapID heapId) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, msgBank, heapId);
    if (msgData != NULL) {
        String *ret = String_New(256, heapId);
        if (ret != NULL) {
            ReadMsgDataIntoString(msgData, msgNum, ret);
        }
        DestroyMsgData(msgData);
        return ret;
    }

    return NULL;
}

static inline int ov18_021E5A50_sub(int languageFlag) {
    GF_ASSERT(languageFlag < DEX_LANGUAGE_FLAG_MAX);
    if (languageFlag == DEX_LANGUAGE_FLAG_NATIVE) {
        languageFlag = DEX_LANGUAGE_FLAG_MAX;
    }
    return languageFlag;
}

static inline BOOL ov18_021E5A50_sub2(int species, int languageFlag) {
    if (species > MAX_SPECIES && languageFlag != DEX_LANGUAGE_FLAG_MAX) {
        return FALSE;
    } else {
        return TRUE;
    }
}

static void ov18_021E5A50(u16 species, int language, int *pMsgNo, int *pLanguageFlag, int *pLanguageFlagNativeMask) {
    *pLanguageFlag = LanguageToDexFlag(language);
    GF_ASSERT(*pLanguageFlag < DEX_LANGUAGE_FLAG_MAX);
    *pMsgNo = species;
    *pLanguageFlagNativeMask = ov18_021E5A50_sub(*pLanguageFlag);
    GF_ASSERT(ov18_021E5A50_sub2(*pMsgNo, *pLanguageFlagNativeMask));
}
