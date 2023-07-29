#include "global.h"
#include "battle_system.h"
#include "party.h"

BgConfig *BattleSystem_GetBgConfig(BattleSystem *bsys) {
    return bsys->bgConfig;
}

Window *BattleSystem_GetWindow(BattleSystem *bsys, int index) {
    return &bsys->window[index];
}

u32 BattleSystem_GetBattleType(BattleSystem *bsys) {
    return bsys->battleType;
}

BATTLECONTEXT *BattleSystem_GetBattleContext(BattleSystem *bsys) {
    return bsys->ctx;
}

OpponentData *BattleSystem_GetOpponentData(BattleSystem *bsys, int battlerId) {
    return bsys->opponentData[battlerId];
}

int BattleSystem_GetMaxBattlers(BattleSystem *bsys) {
    return bsys->maxBattlers;
}

PARTY *BattleSystem_GetParty(BattleSystem *bsys, int battlerId) {
    if ((bsys->battleType & BATTLE_TYPE_MULTI) || ((bsys->battleType & BATTLE_TYPE_INGAME_PARTNER) && (ov12_0223AB0C(bsys, battlerId) & 1))) {
        return bsys->trainerParty[battlerId];
    } else if (bsys->battleType & BATTLE_TYPE_DOUBLES) {
        return bsys->trainerParty[battlerId & 1];
    } else {
        return bsys->trainerParty[battlerId];
    }
}

int BattleSystem_GetPartySize(BattleSystem *bsys, int battlerId) {
    if ((bsys->battleType & BATTLE_TYPE_MULTI) || ((bsys->battleType & BATTLE_TYPE_INGAME_PARTNER) && (ov12_0223AB0C(bsys, battlerId) & 1))) {
        return GetPartyCount(bsys->trainerParty[battlerId]);
    } else if (bsys->battleType & BATTLE_TYPE_DOUBLES) {
        return GetPartyCount(bsys->trainerParty[battlerId & 1]);
    } else {
        return GetPartyCount(bsys->trainerParty[battlerId]);
    }
}

Pokemon *BattleSystem_GetPartyMon(BattleSystem *bsys, int battlerId, int index) {
    if ((bsys->battleType & BATTLE_TYPE_MULTI) || ((bsys->battleType & BATTLE_TYPE_INGAME_PARTNER) && (ov12_0223AB0C(bsys, battlerId) & 1))) {
        return GetPartyMonByIndex(bsys->trainerParty[battlerId], index);
    } else if (bsys->battleType & BATTLE_TYPE_DOUBLES) {
        return GetPartyMonByIndex(bsys->trainerParty[battlerId & 1], index);
    } else {
        return GetPartyMonByIndex(bsys->trainerParty[battlerId], index);
    }
}

u32 *ov12_0223A8D4(BattleSystem *bsys) {
    return bsys->unk88;
}

u32 *ov12_0223A8DC(BattleSystem *bsys) {
    return bsys->unk8C;
}

u32 *ov12_0223A8E4(BattleSystem *bsys) {
    return bsys->unk90;
}

u32 *ov12_0223A8EC(BattleSystem *bsys) {
    return bsys->unk94;
}

UnkBattleSystemSub17C *ov12_0223A8F4(BattleSystem *bsys, int index) {
    return &bsys->unk17C[index];
}

u32 *ov12_0223A900(BattleSystem *bsys) {
    return bsys->unk19C;
}

u32 *ov12_0223A908(BattleSystem *bsys, int index) {
    return bsys->unk1A0[index];
}

void ov12_0223A914(BattleSystem *bsys, int index, u32 *a2) {
    bsys->unk1A0[index] = a2;
}

FontID *BattleSystem_GetHpFont(BattleSystem *bsys) {
    return bsys->hpFont;
}

FontID *BattleSystem_GetLevelFont(BattleSystem *bsys) {
    return bsys->levelFont;
}

u32 *ov12_0223A930(BattleSystem *bsys) {
    return bsys->unkC;
}

u32 *ov12_0223A934(BattleSystem *bsys) {
    return bsys->unk10;
}

void *ov12_0223A938(BattleSystem *bsys) {
    return bsys->unk28;
}

Pokedex *BattleSystem_GetPokedex(BattleSystem *bsys) {
    return bsys->pokedex;
}

u8 *BattleSystem_GetSendBufferPtr(BattleSystem *bsys) {
    return &bsys->sendBuffer[0];
}

u8 *BattleSystem_GetRecvBufferPtr(BattleSystem *bsys) {
    return &bsys->recvBuffer[0];
}

u16 *ov12_0223A954(BattleSystem *bsys) {
    return &bsys->unk23E8;
}

u16 *ov12_0223A960(BattleSystem *bsys) {
    return &bsys->unk23EA;
}

u16 *ov12_0223A96C(BattleSystem *bsys) {
    return &bsys->unk23EC;
}

u16 *ov12_0223A978(BattleSystem *bsys) {
    return &bsys->unk23EE;
}

u16 *ov12_0223A984(BattleSystem *bsys) {
    return &bsys->unk23F0;
}

u16 *ov12_0223A990(BattleSystem *bsys) {
    return &bsys->unk23F2;
}

UnkBattleSystemSub1D0 *ov12_0223A99C(BattleSystem *bsys) {
    return &bsys->unk1D0[0];
}

u32 *ov12_0223A9A4(BattleSystem *bsys) {
    return bsys->unk14;
}

String *BattleSystem_GetMessageBuffer(BattleSystem *bsys) {
    return bsys->msgBuffer;
}

u16 BattleSystem_GetTrainerIndex(BattleSystem *bsys, int battlerId) {
    if ((bsys->battleType & BATTLE_TYPE_MULTI) || ((bsys->battleType & BATTLE_TYPE_INGAME_PARTNER) && (ov12_0223AB0C(bsys, battlerId) & 1))) {
        return bsys->trainerId[battlerId];
    } else if (bsys->battleType & BATTLE_TYPE_DOUBLES) {
        return bsys->trainerId[battlerId & 1];
    } else {
        return bsys->trainerId[battlerId];
    }
}

TRAINER *BattleSystem_GetTrainer(BattleSystem *bsys, int battlerId) {
    if ((bsys->battleType & BATTLE_TYPE_MULTI) || ((bsys->battleType & BATTLE_TYPE_INGAME_PARTNER) && (ov12_0223AB0C(bsys, battlerId) & 1))) {
        return &bsys->trainers[battlerId];
    } else if (bsys->battleType & BATTLE_TYPE_DOUBLES) {
        return &bsys->trainers[battlerId & 1];
    } else {
        return &bsys->trainers[battlerId];
    }
}

PlayerProfile *BattleSystem_GetPlayerProfile(BattleSystem *bsys, int battlerId) {
    if ((bsys->battleType & BATTLE_TYPE_MULTI) || ((bsys->battleType & BATTLE_TYPE_INGAME_PARTNER) && (ov12_0223AB0C(bsys, battlerId) & 1))) {
        return bsys->playerProfile[battlerId];
    } else if (bsys->battleType & BATTLE_TYPE_DOUBLES) {
        return bsys->playerProfile[battlerId & 1];
    } else {
        return bsys->playerProfile[battlerId];
    }
}

Bag *BattleSystem_GetBag(BattleSystem *bsys) {
    return bsys->bag;
}

BagCursor *BattleSystem_GetBagCursor(BattleSystem *bsys) {
    return bsys->bagCursor;
}
