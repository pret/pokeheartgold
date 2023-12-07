#include "global.h"
#include "mystery_gift.h"
#include "scrcmd.h"

struct GetMysteryGiftGmmState {
    FieldSystem* fieldSys;
    MessageFormat* lastInteracted;
    MysteryGiftData* mgData;
};

struct ScriptMysteryGiftFuncs {
    BOOL (*check)(FieldSystem*, MysteryGiftData*);
    void (*give)(FieldSystem*, MysteryGiftData*);
    void (*messageSuccess)(struct GetMysteryGiftGmmState*, u16*, u16*);
    void (*messageFailure)(struct GetMysteryGiftGmmState*, u16*, u16*);
};

void FieldSystem_InitGetMysteryGiftGmmState(struct GetMysteryGiftGmmState* state, FieldSystem* fieldSys, MessageFormat* lastInteracted, MysteryGiftData* mgData);
int FieldSystem_GetTagOfNextMG(FieldSystem* fieldSys);
MysteryGiftData* FieldSystem_GetDataOfNextMG(FieldSystem* fieldSys);
void FieldSystem_SetQueuedMGReceived(FieldSystem* fieldSys);
BOOL MGCheck_PartySpace(FieldSystem* fieldSys, MysteryGiftData* mgData);
void MGGive_Mon(FieldSystem* fieldSys, MysteryGiftData* mgData);
void MGMessageSuccess_GiveMon(struct GetMysteryGiftGmmState* fsysUnk80, u16* pMsgBank, u16* pMsgNum);
void MGMessageFailure_GiveMon(struct GetMysteryGiftGmmState* fsysUnk80, u16* pMsgBank, u16* pMsgNum);
void MGGive_Egg(FieldSystem* fieldSys, MysteryGiftData* mgData);
void MGMessageSuccess_Egg(struct GetMysteryGiftGmmState* fsysUnk80, u16* pMsgBank, u16* pMsgNum);
BOOL MGCheck_Item(FieldSystem* fieldSys, MysteryGiftData* mgData);
void MGGive_Item(FieldSystem* fieldSys, MysteryGiftData* mgData);
void MGMessageSuccess_Item(struct GetMysteryGiftGmmState* fsysUnk80, u16* pMsgBank, u16* pMsgNum);
void MGMessageFailure_Item(struct GetMysteryGiftGmmState* fsysUnk80, u16* pMsgBank, u16* pMsgNum);
BOOL MGCheck_BattleRules(FieldSystem* fieldSys, MysteryGiftData* mgData);
void MGGive_BattleRules(FieldSystem* fieldSys, MysteryGiftData* mgData);
void MGMessageSuccess_BattleRules(struct GetMysteryGiftGmmState* fsysUnk80, u16* pMsgBank, u16* pMsgNum);
void MGMessageFailure_BattleRules(struct GetMysteryGiftGmmState* fsysUnk80, u16* pMsgBank, u16* pMsgNum);
BOOL MGCheck_Decoration(FieldSystem* fieldSys, MysteryGiftData* mgData);
void MGGive_Decoration(FieldSystem* fieldSys, MysteryGiftData* mgData);
void MGMessageSuccess_Decoration(struct GetMysteryGiftGmmState* fsysUnk80, u16* pMsgBank, u16* pMsgNum);
void MGMessageFailure_Decoration(struct GetMysteryGiftGmmState* fsysUnk80, u16* pMsgBank, u16* pMsgNum);
BOOL MGCheck_MonDeco(FieldSystem* fieldSys, MysteryGiftData* mgData);
void MGGive_MonDeco(FieldSystem* fieldSys, MysteryGiftData* mgData);
void MGMessageSuccess_MonDeco(struct GetMysteryGiftGmmState* fsysUnk80, u16* pMsgBank, u16* pMsgNum);
void MGMessageFailure_MonDeco(struct GetMysteryGiftGmmState* fsysUnk80, u16* pMsgBank, u16* pMsgNum);
void MGGive_ManaphyEgg(FieldSystem* fieldSys, MysteryGiftData* mgData);
void MGMessageSuccess_ManaphyEgg(struct GetMysteryGiftGmmState* fsysUnk80, u16* pMsgBank, u16* pMsgNum);
BOOL MGCheck_MemberCard(FieldSystem* fieldSys, MysteryGiftData* mgData);
void MGGive_MemberCard(FieldSystem* fieldSys, MysteryGiftData* mgData);
void MGMessageSuccess_MemberCard(struct GetMysteryGiftGmmState* fsysUnk80, u16* pMsgBank, u16* pMsgNum);
void MGMessageFailure_MemberCard(struct GetMysteryGiftGmmState* fsysUnk80, u16* pMsgBank, u16* pMsgNum);
BOOL MGCheck_OaksLetter(FieldSystem* fieldSys, MysteryGiftData* mgData);
void MGGive_OaksLetter(FieldSystem* fieldSys, MysteryGiftData* mgData);
void MGMessageSuccess_OaksLetter(struct GetMysteryGiftGmmState* fsysUnk80, u16* pMsgBank, u16* pMsgNum);
void MGMessageFailure_OaksLetter(struct GetMysteryGiftGmmState* fsysUnk80, u16* pMsgBank, u16* pMsgNum);
BOOL MGCheck_AzureFlute(FieldSystem* fieldSys, MysteryGiftData* mgData);
void MGGive_AzureFlute(FieldSystem* fieldSys, MysteryGiftData* mgData);
void MGMessageSuccess_AzureFlute(struct GetMysteryGiftGmmState* fsysUnk80, u16* pMsgBank, u16* pMsgNum);
void MGMessageFailure_AzureFlute(struct GetMysteryGiftGmmState* fsysUnk80, u16* pMsgBank, u16* pMsgNum);
BOOL MGCheck_PoketchApp(FieldSystem* fieldSys, MysteryGiftData* mgData);
void MGGive_PoketchApp(FieldSystem* fieldSys, MysteryGiftData* mgData);
void MGMessageSuccess_PoketchApp(struct GetMysteryGiftGmmState* fsysUnk80, u16* pMsgBank, u16* pMsgNum);
void MGMessageFailure_PoketchApp(struct GetMysteryGiftGmmState* fsysUnk80, u16* pMsgBank, u16* pMsgNum);
BOOL MGCheck_SecretKey(FieldSystem* fieldSys, MysteryGiftData* mgData);
void MGGive_SecretKey(FieldSystem* fieldSys, MysteryGiftData* mgData);
void MGMessageSuccess_SecretKey(struct GetMysteryGiftGmmState* fsysUnk80, u16* pMsgBank, u16* pMsgNum);
void MGMessageFailure_SecretKey(struct GetMysteryGiftGmmState* fsysUnk80, u16* pMsgBank, u16* pMsgNum);
BOOL MGCheck_PokewalkerCourse(FieldSystem* fieldSys, MysteryGiftData* mgData);
void MGGive_PokewalkerCourse(FieldSystem* fieldSys, MysteryGiftData* mgData);
void MGMesageSuccess_PokewalkerCourse(struct GetMysteryGiftGmmState* fsysUnk80, u16* pMsgBank, u16* pMsgNum);
void MGMesageFailure_PokewalkerCourse(struct GetMysteryGiftGmmState* fsysUnk80, u16* pMsgBank, u16* pMsgNum);
BOOL MGCheck_MemorialPhoto(FieldSystem* fieldSys, MysteryGiftData* mgData);
void MGGive_MemorialPhoto(FieldSystem* fieldSys, MysteryGiftData* mgData);
void MGMessageSuccess_MemorialPhoto(struct GetMysteryGiftGmmState* fsysUnk80, u16* pMsgBank, u16* pMsgNum);
void MGMessageFailure_MemorialPhoto(struct GetMysteryGiftGmmState* fsysUnk80, u16* pMsgBank, u16* pMsgNum);

static const struct ScriptMysteryGiftFuncs sScriptMysteryGiftActionTable[MG_TAG_MAX - 1] = {
    { MGCheck_PartySpace, MGGive_Mon, MGMessageSuccess_GiveMon, MGMessageFailure_GiveMon },
    { MGCheck_PartySpace, MGGive_Egg, MGMessageSuccess_Egg, MGMessageFailure_GiveMon },
    { MGCheck_Item, MGGive_Item, MGMessageSuccess_Item, MGMessageFailure_Item },
    { MGCheck_BattleRules, MGGive_BattleRules, MGMessageSuccess_BattleRules, MGMessageFailure_BattleRules },
    { MGCheck_Decoration, MGGive_Decoration, MGMessageSuccess_Decoration, MGMessageFailure_Decoration },
    { MGCheck_MonDeco, MGGive_MonDeco, MGMessageSuccess_MonDeco, MGMessageFailure_MonDeco },
    { MGCheck_PartySpace, MGGive_ManaphyEgg, MGMessageSuccess_ManaphyEgg, MGMessageFailure_GiveMon },
    { MGCheck_MemberCard, MGGive_MemberCard, MGMessageSuccess_MemberCard, MGMessageFailure_MemberCard },
    { MGCheck_OaksLetter, MGGive_OaksLetter, MGMessageSuccess_OaksLetter, MGMessageFailure_OaksLetter },
    { MGCheck_AzureFlute, MGGive_AzureFlute, MGMessageSuccess_AzureFlute, MGMessageFailure_AzureFlute },
    { MGCheck_PoketchApp, MGGive_PoketchApp, MGMessageSuccess_PoketchApp, MGMessageFailure_PoketchApp },
    { MGCheck_SecretKey, MGGive_SecretKey, MGMessageSuccess_SecretKey, MGMessageFailure_SecretKey },
    { MGCheck_PartySpace, MGGive_Mon, MGMessageSuccess_GiveMon, MGMessageFailure_GiveMon },
    { MGCheck_PokewalkerCourse, MGGive_PokewalkerCourse, MGMesageSuccess_PokewalkerCourse, MGMesageFailure_PokewalkerCourse },
    { MGCheck_MemorialPhoto, MGGive_MemorialPhoto, MGMessageSuccess_MemorialPhoto, MGMessageFailure_MemorialPhoto },
};

void FieldSystem_InitGetMysteryGiftGmmState(struct GetMysteryGiftGmmState* state, FieldSystem* fieldSys, MessageFormat* lastInteracted, MysteryGiftData* mgData) {
    state->fieldSys = fieldSys;
    state->lastInteracted = lastInteracted;
    state->mgData = mgData;
}

int FieldSystem_GetTagOfNextMG(FieldSystem* fieldSys) {
    return GetMysteryGiftTagByIdx(GetFirstQueuedMysteryGiftIdx());
}

MysteryGiftData* FieldSystem_GetDataOfNextMG(FieldSystem* fieldSys) {
    return GetMysteryGiftDataByIdx(GetFirstQueuedMysteryGiftIdx());
}

void FieldSystem_SetQueuedMGReceived(FieldSystem* fieldSys) {
    SetMysteryGiftReceivedByIdx(GetFirstQueuedMysteryGiftIdx());
}

BOOL ScrCmd_MysteryGift(ScriptContext* ctx) {
    switch (ScriptReadHalfword(ctx)) {
    case 0:
        GetStaticPointerToSaveMysteryGift(ctx->fieldSystem->saveData, HEAP_ID_32);
        break;
    case 7:
        DeleteStaticPointerToMysteryGift(ctx->fieldSystem->saveData, FALSE);
        break;
    case 8:
        DeleteStaticPointerToMysteryGift(ctx->fieldSystem->saveData, TRUE);
        break;
    case 1:
    {
        u16* ptr = ScriptGetVarPointer(ctx);
        if (FieldSystem_GetTagOfNextMG(ctx->fieldSystem) != MG_TAG_INVALID) {
            *ptr = TRUE;
        } else {
            *ptr = FALSE;
        }
        break;
    }
    case 2:
    {
        u16* ptr = ScriptGetVarPointer(ctx);
        *ptr = FieldSystem_GetTagOfNextMG(ctx->fieldSystem);
        break;
    }
    case 3:
    {
        u16* ptr = ScriptGetVarPointer(ctx);
        const struct ScriptMysteryGiftFuncs* pFunc = &sScriptMysteryGiftActionTable[FieldSystem_GetTagOfNextMG(ctx->fieldSystem) - 1];
        *ptr = pFunc->check(ctx->fieldSystem, FieldSystem_GetDataOfNextMG(ctx->fieldSystem));
        break;
    }
    case 4:
        const struct ScriptMysteryGiftFuncs* pFunc = &sScriptMysteryGiftActionTable[FieldSystem_GetTagOfNextMG(ctx->fieldSystem) - 1];
        pFunc->give(ctx->fieldSystem, FieldSystem_GetDataOfNextMG(ctx->fieldSystem));
        FieldSystem_SetQueuedMGReceived(ctx->fieldSystem);
        break;
    case 5:
    {
        struct GetMysteryGiftGmmState gmmState;
        const struct ScriptMysteryGiftFuncs* pFunc = &sScriptMysteryGiftActionTable[FieldSystem_GetTagOfNextMG(ctx->fieldSystem) - 1];
        MessageFormat** pMsgFormat = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
        u16* pMsgBank = ScriptGetVarPointer(ctx);
        u16* pMsgNum = ScriptGetVarPointer(ctx);
        FieldSystem_InitGetMysteryGiftGmmState(&gmmState, ctx->fieldSystem, *pMsgFormat, FieldSystem_GetDataOfNextMG(ctx->fieldSystem));
        pFunc->messageSuccess(&gmmState, pMsgBank, pMsgNum);
        break;
    }
    case 6:
    {
        struct GetMysteryGiftGmmState gmmState;
        const struct ScriptMysteryGiftFuncs* pFunc = &sScriptMysteryGiftActionTable[FieldSystem_GetTagOfNextMG(ctx->fieldSystem) - 1];
        MessageFormat** pMsgFormat = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
        u16* pMsgBank = ScriptGetVarPointer(ctx);
        u16* pMsgNum = ScriptGetVarPointer(ctx);
        FieldSystem_InitGetMysteryGiftGmmState(&gmmState, ctx->fieldSystem, *pMsgFormat, FieldSystem_GetDataOfNextMG(ctx->fieldSystem));
        pFunc->messageFailure(&gmmState, pMsgBank, pMsgNum);
        break;
    }
    }
    return FALSE;
}
