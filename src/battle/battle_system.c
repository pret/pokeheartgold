#include "battle/battle_system.h"

#include "global.h"

#include "constants/game_stats.h"
#include "constants/message_tags.h"
#include "constants/sndseq.h"

#include "battle/battle_022378C0.h"
#include "battle/battle_02265E28.h"
#include "battle/battle_controller.h"
#include "battle/battle_controller_opponent.h"
#include "battle/battle_hp_bar.h"
#include "battle/overlay_12_0224E4FC.h"
#include "battle/overlay_12_02266024.h"
#include "battle/overlay_12_0226BEC4.h"
#include "msgdata/msg/msg_0197.h"

#include "msgdata.h"
#include "party.h"
#include "pokemon_mood.h"
#include "text.h"
#include "unk_02005D10.h"
#include "unk_0200FA24.h"
#include "unk_0202FBCC.h"

static u8 ov12_0223BFB0(u8 *buffer, u8 *index, u16 *size);
static void BattleSystem_AdjustMessageForSide(BattleSystem *bsys, BattleMessage *msg);
static void BattleSystem_BufferMessage(BattleSystem *bsys, BattleMessage *msg);
static void BattleMessage_BufferNickname(BattleSystem *bsys, int bufferIndex, int param);
static void BattleMessage_BufferMove(BattleSystem *bsys, int bufferIndex, int param);
static void BattleMessage_BufferItem(BattleSystem *bsys, int bufferIndex, int param);
static void BattleMessage_BufferNumber(BattleSystem *bsys, int bufferIndex, int param);
static void BattleMessage_BufferNumbers(BattleSystem *bsys, int bufferIndex, int param, int numDigits);
static void BattleMessage_BufferType(BattleSystem *bsys, int bufferIndex, int param);
static void BattleMessage_BufferAbility(BattleSystem *bsys, int bufferIndex, int param);
static void BattleMessage_BufferStat(BattleSystem *bsys, int bufferIndex, int param);
static void BattleMessage_BufferStatus(BattleSystem *bsys, int bufferIndex, int param);
static void BattleMessage_BufferPokemon(BattleSystem *bsys, int bufferIndex, int param);
static void BattleMessage_BufferPoffin(BattleSystem *bsys, int bufferIndex, int param);
static void BattleMessage_BufferFlavorPreference(BattleSystem *bsys, int bufferIndex, int param);
static void BattleMessage_BufferTrainerClass(BattleSystem *bsys, int bufferIndex, int param);
static void BattleMessage_BufferTrainerName(BattleSystem *bsys, int bufferIndex, int param);
static void BattleMessage_BufferBoxName(BattleSystem *bsys, int bufferIndex, int param);
static void BattleMessage_ExpandPlaceholders(BattleSystem *bsys, MsgData *data, BattleMessage *msg);
static BOOL ov12_0223CF14(struct TextPrinterTemplate *template, u16 glyphId);

BgConfig *BattleSystem_GetBgConfig(BattleSystem *bsys) {
    return bsys->bgConfig;
}

Window *BattleSystem_GetWindow(BattleSystem *bsys, int index) {
    return &bsys->window[index];
}

u32 BattleSystem_GetBattleType(BattleSystem *bsys) {
    return bsys->battleType;
}

BattleContext *BattleSystem_GetBattleContext(BattleSystem *bsys) {
    return bsys->ctx;
}

OpponentData *BattleSystem_GetOpponentData(BattleSystem *bsys, int battlerId) {
    return bsys->opponentData[battlerId];
}

int BattleSystem_GetMaxBattlers(BattleSystem *bsys) {
    return bsys->maxBattlers;
}

Party *BattleSystem_GetParty(BattleSystem *bsys, int battlerId) {
    if ((bsys->battleType & BATTLE_TYPE_MULTI) || ((bsys->battleType & BATTLE_TYPE_TAG) && (ov12_0223AB0C(bsys, battlerId) & 1))) {
        return bsys->trainerParty[battlerId];
    } else if (bsys->battleType & BATTLE_TYPE_DOUBLES) {
        return bsys->trainerParty[battlerId & 1];
    } else {
        return bsys->trainerParty[battlerId];
    }
}

int BattleSystem_GetPartySize(BattleSystem *bsys, int battlerId) {
    if ((bsys->battleType & BATTLE_TYPE_MULTI) || ((bsys->battleType & BATTLE_TYPE_TAG) && (ov12_0223AB0C(bsys, battlerId) & 1))) {
        return Party_GetCount(bsys->trainerParty[battlerId]);
    } else if (bsys->battleType & BATTLE_TYPE_DOUBLES) {
        return Party_GetCount(bsys->trainerParty[battlerId & 1]);
    } else {
        return Party_GetCount(bsys->trainerParty[battlerId]);
    }
}

Pokemon *BattleSystem_GetPartyMon(BattleSystem *bsys, int battlerId, int index) {
    if ((bsys->battleType & BATTLE_TYPE_MULTI) || ((bsys->battleType & BATTLE_TYPE_TAG) && (ov12_0223AB0C(bsys, battlerId) & 1))) {
        return Party_GetMonByIndex(bsys->trainerParty[battlerId], index);
    } else if (bsys->battleType & BATTLE_TYPE_DOUBLES) {
        return Party_GetMonByIndex(bsys->trainerParty[battlerId & 1], index);
    } else {
        return Party_GetMonByIndex(bsys->trainerParty[battlerId], index);
    }
}

u32 *ov12_0223A8D4(BattleSystem *bsys) {
    return bsys->unk88;
}

u32 *ov12_0223A8DC(BattleSystem *bsys) {
    return bsys->unk8C;
}

SpriteSystem *BattleSystem_GetSpriteRenderer(BattleSystem *bsys) {
    return bsys->spriteRenderer;
}

SpriteManager *BattleSystem_GetGfxHandler(BattleSystem *bsys) {
    return bsys->gfxHandler;
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

BattleNumberPrinter *BattleSystem_GetHpNumPrinter(BattleSystem *bsys) {
    return bsys->hpNumPrinter;
}

BattleNumberPrinter *BattleSystem_GetLevelNumPrinter(BattleSystem *bsys) {
    return bsys->levelNumPrinter;
}

MsgData *BattleSystem_GetMessageData(BattleSystem *bsys) {
    return bsys->msgData;
}

u32 *ov12_0223A934(BattleSystem *bsys) {
    return bsys->unk10;
}

PaletteData *BattleSystem_GetPaletteData(BattleSystem *bsys) {
    return bsys->palette;
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

MessageFormat *BattleSystem_GetMessageFormat(BattleSystem *bsys) {
    return bsys->msgFormat;
}

String *BattleSystem_GetMessageBuffer(BattleSystem *bsys) {
    return bsys->msgBuffer;
}

u16 BattleSystem_GetTrainerIndex(BattleSystem *bsys, int battlerId) {
    if ((bsys->battleType & BATTLE_TYPE_MULTI) || ((bsys->battleType & BATTLE_TYPE_TAG) && (ov12_0223AB0C(bsys, battlerId) & 1))) {
        return bsys->trainerId[battlerId];
    } else if (bsys->battleType & BATTLE_TYPE_DOUBLES) {
        return bsys->trainerId[battlerId & 1];
    } else {
        return bsys->trainerId[battlerId];
    }
}

Trainer *BattleSystem_GetTrainer(BattleSystem *bsys, int battlerId) {
    if ((bsys->battleType & BATTLE_TYPE_MULTI) || ((bsys->battleType & BATTLE_TYPE_TAG) && (ov12_0223AB0C(bsys, battlerId) & 1))) {
        return &bsys->trainers[battlerId];
    } else if (bsys->battleType & BATTLE_TYPE_DOUBLES) {
        return &bsys->trainers[battlerId & 1];
    } else {
        return &bsys->trainers[battlerId];
    }
}

PlayerProfile *BattleSystem_GetPlayerProfile(BattleSystem *bsys, int battlerId) {
    if ((bsys->battleType & BATTLE_TYPE_MULTI) || ((bsys->battleType & BATTLE_TYPE_TAG) && (ov12_0223AB0C(bsys, battlerId) & 1))) {
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

u16 BattleSystem_GetMonBall(BattleSystem *bsys, Pokemon *mon) {
    if (bsys->unk2474_2) {
        return GetMonData(mon, MON_DATA_DP_POKEBALL, NULL);
    } else {
        return GetMonData(mon, MON_DATA_POKEBALL, NULL);
    }
}

u32 ov12_0223AAB8(BattleSystem *bsys) {
    return bsys->unk2474_3;
}

u32 BattleSystem_GetTrainerGender(BattleSystem *bsys, int battlerId) {
    return PlayerProfile_GetTrainerGender(bsys->playerProfile[battlerId]);
}

int ov12_0223AAD8(BattleSystem *bsys, int a1) {
    int battlerId;
    for (battlerId = 0; battlerId < bsys->maxBattlers; battlerId++) {
        if (ov12_02261258(bsys->opponentData[battlerId]) == a1) {
            break;
        }
    }

    GF_ASSERT(battlerId < bsys->maxBattlers);

    return battlerId;
}

u8 ov12_0223AB0C(BattleSystem *bsys, int battlerId) {
    return ov12_02261258(bsys->opponentData[battlerId]);
}

u8 BattleSystem_GetFieldSide(BattleSystem *bsys, int battlerId) {
    return ov12_02261258(bsys->opponentData[battlerId]) & 1;
}

void *BattleSystem_GetMessageIcon(BattleSystem *bsys) {
    return bsys->msgIcon;
}

PCStorage *BattleSystem_GetPcStorage(BattleSystem *bsys) {
    return bsys->storage;
}

Terrain BattleSystem_GetTerrainId(BattleSystem *bsys) {
    if (bsys->terrain > TERRAIN_MAX || bsys->terrain < 0) {
        return TERRAIN_MAX;
    }
    return bsys->terrain;
}

int ov12_0223AB54(BattleSystem *bsys) {
    return bsys->unk2404;
}

int BattleSystem_GetLocation(BattleSystem *bsys) {
    return bsys->location;
}

int BattleSystem_GetBattlerIdPartner(BattleSystem *bsys, int battlerId) {
    int battlerIdPartner;
    int maxBattlers = BattleSystem_GetMaxBattlers(bsys);
    u32 battleType = BattleSystem_GetBattleType(bsys);

    if (!(battleType & BATTLE_TYPE_DOUBLES)) {
        return battlerId;
    }

    for (battlerIdPartner = 0; battlerIdPartner < maxBattlers; battlerIdPartner++) {
        if (battlerIdPartner != battlerId && BattleSystem_GetFieldSide(bsys, battlerIdPartner) == BattleSystem_GetFieldSide(bsys, battlerId)) {
            break;
        }
    }

    return battlerIdPartner;
}

int ov12_0223ABB8(BattleSystem *bsys, int battlerId, int side) {
    int battlerIdOpponent;
    int maxBattlers = BattleSystem_GetMaxBattlers(bsys);
    u32 battleType = BattleSystem_GetBattleType(bsys);

    if (!(battleType & BATTLE_TYPE_DOUBLES)) {
        return battlerId ^ 1;
    }

    for (battlerIdOpponent = 0; battlerIdOpponent < maxBattlers; battlerIdOpponent++) {
        if (battlerIdOpponent != battlerId && (ov12_0223AB0C(bsys, battlerIdOpponent) & 2) == side && BattleSystem_GetFieldSide(bsys, battlerIdOpponent) != BattleSystem_GetFieldSide(bsys, battlerId)) {
            break;
        }
    }

    return battlerIdOpponent;
}

BOOL BattleSystem_RecoverStatus(BattleSystem *bsys, int battlerId, int selectedMonIndex, int movePos, int item) {
    BattleContext *ctx = bsys->ctx;
    Pokemon *mon;
    BOOL ret = FALSE;
    int data;
    int index1 = ov12_022581D4(bsys, ctx, 2, battlerId);
    int index2;
    int friendship;

    if (BattleSystem_GetBattleType(bsys) == (BATTLE_TYPE_DOUBLES | BATTLE_TYPE_TRAINER) || ((BattleSystem_GetBattleType(bsys) & BATTLE_TYPE_TAG) && !(ov12_0223AB0C(bsys, battlerId) & 1))) {
        index2 = ov12_022581D4(bsys, ctx, 2, BattleSystem_GetBattlerIdPartner(bsys, battlerId));
        if (index2 == selectedMonIndex) {
            battlerId = BattleSystem_GetBattlerIdPartner(bsys, battlerId);
        }
    } else {
        index2 = index1;
    }
    mon = BattleSystem_GetPartyMon(bsys, battlerId, selectedMonIndex);
    friendship = 0;

    if (GetItemAttr(item, ITEMATTR_SLP_HEAL, HEAP_ID_BATTLE)) {
        data = GetMonData(mon, MON_DATA_STATUS, NULL);
        if (data & STATUS_SLEEP) {
            data &= ~STATUS_SLEEP;
            SetMonData(mon, MON_DATA_STATUS, &data);
            if (index1 == selectedMonIndex || index2 == selectedMonIndex) {
                data = GetBattlerVar(ctx, battlerId, BMON_DATA_STATUS, NULL);
                data &= ~STATUS_SLEEP;
                SetBattlerVar(ctx, battlerId, BMON_DATA_STATUS, &data);
                data = GetBattlerVar(ctx, battlerId, BMON_DATA_STATUS2, NULL);
                data &= ~STATUS2_NIGHTMARE;
                SetBattlerVar(ctx, battlerId, BMON_DATA_STATUS2, &data);
            }
            ret = TRUE;
        }
    }

    if (GetItemAttr(item, ITEMATTR_PSN_HEAL, HEAP_ID_BATTLE)) {
        data = GetMonData(mon, MON_DATA_STATUS, NULL);
        if (data & STATUS_POISON_ALL) {
            data &= ~STATUS_POISON_ALL;
            SetMonData(mon, MON_DATA_STATUS, &data);
            if (index1 == selectedMonIndex || index2 == selectedMonIndex) {
                data = GetBattlerVar(ctx, battlerId, BMON_DATA_STATUS, NULL);
                data &= ~STATUS_POISON_ALL;
                SetBattlerVar(ctx, battlerId, BMON_DATA_STATUS, &data);
            }
            ret = TRUE;
        }
    }

    if (GetItemAttr(item, ITEMATTR_BRN_HEAL, HEAP_ID_BATTLE)) {
        data = GetMonData(mon, MON_DATA_STATUS, NULL);
        if (data & STATUS_BURN) {
            data &= ~STATUS_BURN;
            SetMonData(mon, MON_DATA_STATUS, &data);
            if (index1 == selectedMonIndex || index2 == selectedMonIndex) {
                data = GetBattlerVar(ctx, battlerId, BMON_DATA_STATUS, NULL);
                data &= ~STATUS_BURN;
                SetBattlerVar(ctx, battlerId, BMON_DATA_STATUS, &data);
            }
            ret = TRUE;
        }
    }

    if (GetItemAttr(item, ITEMATTR_FRZ_HEAL, HEAP_ID_BATTLE)) {
        data = GetMonData(mon, MON_DATA_STATUS, NULL);
        if (data & STATUS_FREEZE) {
            data &= ~STATUS_FREEZE;
            SetMonData(mon, MON_DATA_STATUS, &data);
            if (index1 == selectedMonIndex || index2 == selectedMonIndex) {
                data = GetBattlerVar(ctx, battlerId, BMON_DATA_STATUS, NULL);
                data &= ~STATUS_FREEZE;
                SetBattlerVar(ctx, battlerId, BMON_DATA_STATUS, &data);
            }
            ret = TRUE;
        }
    }

    if (GetItemAttr(item, ITEMATTR_PRZ_HEAL, HEAP_ID_BATTLE)) {
        data = GetMonData(mon, MON_DATA_STATUS, NULL);
        if (data & STATUS_PARALYSIS) {
            data &= ~STATUS_PARALYSIS;
            SetMonData(mon, MON_DATA_STATUS, &data);
            if (index1 == selectedMonIndex || index2 == selectedMonIndex) {
                data = GetBattlerVar(ctx, battlerId, BMON_DATA_STATUS, NULL);
                data &= ~STATUS_PARALYSIS;
                SetBattlerVar(ctx, battlerId, BMON_DATA_STATUS, &data);
            }
            ret = TRUE;
        }
    }

    if (GetItemAttr(item, ITEMATTR_CFS_HEAL, HEAP_ID_BATTLE)) {
        if (index1 == selectedMonIndex || index2 == selectedMonIndex) {
            data = GetBattlerVar(ctx, battlerId, BMON_DATA_STATUS2, NULL);
            if (data & STATUS2_CONFUSION) {
                data &= ~STATUS2_CONFUSION;
                SetBattlerVar(ctx, battlerId, BMON_DATA_STATUS2, &data);
                ret = TRUE;
            }
        }
    }

    if (GetItemAttr(item, ITEMATTR_INF_HEAL, HEAP_ID_BATTLE)) {
        if (index1 == selectedMonIndex || index2 == selectedMonIndex) {
            data = GetBattlerVar(ctx, battlerId, BMON_DATA_STATUS2, NULL);
            if (data & STATUS2_ATTRACT) {
                data &= ~STATUS2_ATTRACT;
                SetBattlerVar(ctx, battlerId, BMON_DATA_STATUS2, &data);
                ret = TRUE;
            }
        }
    }

    if (GetItemAttr(item, ITEMATTR_GUARD_SPEC, HEAP_ID_BATTLE)) {
        data = ov12_022581D4(bsys, ctx, 1, battlerId);
        if (!data) {
            data = ov12_022581D4(bsys, ctx, 0, battlerId);
            data |= SIDE_CONDITION_MIST;
            ov12_022582B8(bsys, ctx, 0, battlerId, data);
            ov12_022582B8(bsys, ctx, 1, battlerId, 5);
            ret = TRUE;
        }
    }

    if (GetItemAttr(item, ITEMATTR_ATK_STAGES, HEAP_ID_BATTLE)) {
        if (index1 == selectedMonIndex || index2 == selectedMonIndex) {
            if (GetBattlerVar(ctx, battlerId, BMON_DATA_STAT_CHANGE_ATK, NULL) < STAT_UP_6) {
                AddBattlerVar(ctx, battlerId, BMON_DATA_STAT_CHANGE_ATK, 1);
                ret = TRUE;
            }
        }
    }

    if (GetItemAttr(item, ITEMATTR_DEF_STAGES, HEAP_ID_BATTLE)) {
        if (index1 == selectedMonIndex || index2 == selectedMonIndex) {
            if (GetBattlerVar(ctx, battlerId, BMON_DATA_STAT_CHANGE_DEF, NULL) < STAT_UP_6) {
                AddBattlerVar(ctx, battlerId, BMON_DATA_STAT_CHANGE_DEF, 1);
                ret = TRUE;
            }
        }
    }

    if (GetItemAttr(item, ITEMATTR_SPATK_STAGES, HEAP_ID_BATTLE)) {
        if (index1 == selectedMonIndex || index2 == selectedMonIndex) {
            if (GetBattlerVar(ctx, battlerId, BMON_DATA_STAT_CHANGE_SPATK, NULL) < STAT_UP_6) {
                AddBattlerVar(ctx, battlerId, BMON_DATA_STAT_CHANGE_SPATK, 1);
                ret = TRUE;
            }
        }
    }

    if (GetItemAttr(item, ITEMATTR_SPDEF_STAGES, HEAP_ID_BATTLE)) {
        if (index1 == selectedMonIndex || index2 == selectedMonIndex) {
            if (GetBattlerVar(ctx, battlerId, BMON_DATA_STAT_CHANGE_SPDEF, NULL) < STAT_UP_6) {
                AddBattlerVar(ctx, battlerId, BMON_DATA_STAT_CHANGE_SPDEF, 1);
                ret = TRUE;
            }
        }
    }

    if (GetItemAttr(item, ITEMATTR_SPEED_STAGES, HEAP_ID_BATTLE)) {
        if (index1 == selectedMonIndex || index2 == selectedMonIndex) {
            if (GetBattlerVar(ctx, battlerId, BMON_DATA_STAT_CHANGE_SPEED, NULL) < STAT_UP_6) {
                AddBattlerVar(ctx, battlerId, BMON_DATA_STAT_CHANGE_SPEED, 1);
                ret = TRUE;
            }
        }
    }

    if (GetItemAttr(item, ITEMATTR_ACCURACY_STAGES, HEAP_ID_BATTLE)) {
        if (index1 == selectedMonIndex || index2 == selectedMonIndex) {
            if (GetBattlerVar(ctx, battlerId, BMON_DATA_STAT_CHANGE_ACC, NULL) < STAT_UP_6) {
                AddBattlerVar(ctx, battlerId, BMON_DATA_STAT_CHANGE_ACC, 1);
                ret = TRUE;
            }
        }
    }

    if (GetItemAttr(item, ITEMATTR_CRITRATE_STAGES, HEAP_ID_BATTLE)) {
        if (index1 == selectedMonIndex || index2 == selectedMonIndex) {
            data = GetBattlerVar(ctx, battlerId, BMON_DATA_STATUS2, NULL);
            if (!(data & STATUS2_FOCUS_ENERGY)) {
                data |= STATUS2_FOCUS_ENERGY;
                SetBattlerVar(ctx, battlerId, BMON_DATA_STATUS2, &data);
                ret = TRUE;
            }
        }
    }

    if (GetItemAttr(item, ITEMATTR_PP_RESTORE, HEAP_ID_BATTLE)) {
        data = GetItemAttr(item, ITEMATTR_PP_RESTORE_PARAM, HEAP_ID_BATTLE);
        if (GetMonData(mon, MON_DATA_MOVE1_PP + movePos, NULL) != GetMonData(mon, MON_DATA_MOVE1_MAX_PP + movePos, NULL)) {
            AddMonData(mon, MON_DATA_MOVE1_PP + movePos, data);
            if (index1 == selectedMonIndex || index2 == selectedMonIndex) {
                if (!(GetBattlerVar(ctx, battlerId, BMON_DATA_STATUS2, NULL) & STATUS2_TRANSFORM) && !(GetBattlerVar(ctx, battlerId, BMON_DATA_MIMICED_MOVE, NULL) & MaskOfFlagNo(movePos))) {
                    AddBattlerVar(ctx, battlerId, BMON_DATA_CUR_PP_1 + movePos, data);
                }
            }
            ret = TRUE;
        }
    }

    if (GetItemAttr(item, ITEMATTR_PP_RESTORE_ALL, HEAP_ID_BATTLE)) {
        data = GetItemAttr(item, ITEMATTR_PP_RESTORE_PARAM, HEAP_ID_BATTLE);
        for (movePos = 0; movePos < MAX_MON_MOVES; movePos++) {
            if (GetMonData(mon, MON_DATA_MOVE1_PP + movePos, NULL) != GetMonData(mon, MON_DATA_MOVE1_MAX_PP + movePos, NULL)) {
                AddMonData(mon, MON_DATA_MOVE1_PP + movePos, data);
                if (index1 == selectedMonIndex || index2 == selectedMonIndex) {
                    if (!(GetBattlerVar(ctx, battlerId, BMON_DATA_STATUS2, NULL) & STATUS2_TRANSFORM) && !(GetBattlerVar(ctx, battlerId, BMON_DATA_MIMICED_MOVE, NULL) & MaskOfFlagNo(movePos))) {
                        AddBattlerVar(ctx, battlerId, BMON_DATA_CUR_PP_1 + movePos, data);
                    }
                }
                ret = TRUE;
            }
        }
    }

    if (GetItemAttr(item, ITEMATTR_HP_RESTORE, HEAP_ID_BATTLE)) {
        data = 0;
        if (GetItemAttr(item, ITEMATTR_REVIVE, HEAP_ID_BATTLE)) {
            if (GetMonData(mon, MON_DATA_HP, NULL) == 0) {
                data = 1;
            }
        } else {
            data = GetMonData(mon, MON_DATA_HP, NULL);
        }
        if (data && GetMonData(mon, MON_DATA_HP, NULL) != GetMonData(mon, MON_DATA_MAX_HP, NULL)) {
            data = GetItemAttr(item, ITEMATTR_HP_RESTORE_PARAM, HEAP_ID_BATTLE);
            switch (data) {
            case HP_RESTORE_ALL:
                data = GetMonData(mon, MON_DATA_MAX_HP, NULL);
                break;
            case HP_RESTORE_HALF:
                data = GetMonData(mon, MON_DATA_MAX_HP, NULL) / 2;
                if (data == 0) {
                    data = 1;
                }
                break;
            case HP_RESTORE_QTR:
                data = GetMonData(mon, MON_DATA_MAX_HP, NULL) * 25 / 100;
                if (data == 0) {
                    data = 1;
                }
                break;
            default:
                break;
            }
            AddMonData(mon, MON_DATA_HP, data);
            if (!GetItemAttr(item, ITEMATTR_REVIVE, HEAP_ID_BATTLE)) {
                if (BattleSystem_GetFieldSide(bsys, battlerId)) {
                    SetBattlerVar(ctx, battlerId, BMON_DATA_HELD_ITEM_RESTORE_HP, &data);
                } else if (index1 == selectedMonIndex || index2 == selectedMonIndex) {
                    AddBattlerVar(ctx, battlerId, BMON_DATA_HP, data);
                }
            }
            ret = TRUE;
        }
    }

    if (GetItemAttr(item, ITEMATTR_FRIENDSHIP_MOD_LO, HEAP_ID_BATTLE)) {
        if (GetMonData(mon, MON_DATA_FRIENDSHIP, NULL) < 100 && ret == TRUE) {
            friendship = GetItemAttr(item, ITEMATTR_FRIENDSHIP_MOD_LO_PARAM, HEAP_ID_BATTLE);
        }
    }

    if (GetItemAttr(item, ITEMATTR_FRIENDSHIP_MOD_MED, HEAP_ID_BATTLE)) {
        if (GetMonData(mon, MON_DATA_FRIENDSHIP, NULL) >= 100 && GetMonData(mon, MON_DATA_FRIENDSHIP, NULL) < 200 && ret == TRUE) {
            friendship = GetItemAttr(item, ITEMATTR_FRIENDSHIP_MOD_MED_PARAM, HEAP_ID_BATTLE);
        }
    }

    if (GetItemAttr(item, ITEMATTR_FRIENDSHIP_MOD_HI, HEAP_ID_BATTLE)) {
        if (GetMonData(mon, MON_DATA_FRIENDSHIP, NULL) >= 200 && ret == TRUE) {
            friendship = GetItemAttr(item, ITEMATTR_FRIENDSHIP_MOD_HI_PARAM, HEAP_ID_BATTLE);
        }
    }

    if (friendship) {
        if (friendship > 0) {
            if (BallToItemId(BattleSystem_GetMonBall(bsys, mon)) == ITEM_LUXURY_BALL) {
                friendship++;
            }
            if (GetMonData(mon, MON_DATA_EGG_LOCATION, NULL) == BattleSystem_GetLocation(bsys)) {
                friendship++;
            }
            data = GetMonData(mon, MON_DATA_HELD_ITEM, NULL);
            if (GetItemAttr(data, ITEMATTR_HOLD_EFFECT, HEAP_ID_BATTLE) == HOLD_EFFECT_FRIENDSHIP_UP) {
                friendship = friendship * 150 / 100;
            }
        }
        AddMonData(mon, MON_DATA_FRIENDSHIP, friendship);
        if (index1 == selectedMonIndex || index2 == selectedMonIndex) {
            AddBattlerVar(ctx, battlerId, BMON_DATA_FRIENDSHIP, friendship);
        }
    }

    if (ret == TRUE) {
        ApplyItemEffectOnMonMood(mon, item);
    }

    return ret;
}

u32 BattleSystem_GetBattleSpecial(BattleSystem *bsys) {
    return bsys->battleSpecial;
}

int BattleSystem_GetTimezone(BattleSystem *bsys) {
    return bsys->timezone;
}

int ov12_0223B52C(BattleSystem *bsys) {
    int ret;

    switch (bsys->unk2404) {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
        switch (bsys->timezone) {
        case 0:
        case 1:
            ret = 0;
            break;
        case 2:
            ret = 1;
            break;
        case 3:
        case 4:
            ret = 2;
            break;
        }
        break;
    default:
        ret = 0;
        break;
    }

    return ret;
}

u8 ov12_0223B580(BattleSystem *bsys, int battlerId, u8 a2) {
    u16 item;

    if (ov12_0223AB0C(bsys, battlerId) == 4 && !(bsys->battleType & BATTLE_TYPE_MULTI)) {
        if (bsys->battleType & BATTLE_TYPE_LINK) {
            if (!(a2 & MaskOfFlagNo(BattleSystem_GetBattlerIdPartner(bsys, battlerId)))) {
                return 1;
            }
        } else {
            item = ov12_022581D4(bsys, bsys->ctx, 12, 0);
            if ((ov12_022581D4(bsys, bsys->ctx, 8, 0) == 14 && item > ITEM_CHERISH_BALL) || (a2 & MaskOfFlagNo(0))) {
                return 0;
            } else {
                return 1;
            }
        }
    }
    return 0;
}

u16 BattleSystem_CheckEvolution(BattleSetup *setup, int *selectedMonIndex, int *evolutionCondition) {
    Pokemon *mon;
    u16 species = 0;

    if (setup->winFlag != BATTLE_OUTCOME_WIN && setup->winFlag != BATTLE_OUTCOME_MON_CAUGHT && setup->winFlag != BATTLE_OUTCOME_PLAYER_FLED) {
        return 0;
    }

    while (setup->levelUpFlag) {
        for (*selectedMonIndex = 0; *selectedMonIndex < PARTY_SIZE; (*selectedMonIndex)++) {
            if (setup->levelUpFlag & MaskOfFlagNo(*selectedMonIndex)) {
                setup->levelUpFlag &= MaskOfFlagNo(*selectedMonIndex) ^ 0xFFFFFFFF;
                break;
            }
        }
        if (*selectedMonIndex < PARTY_SIZE) {
            mon = Party_GetMonByIndex(setup->party[0], *selectedMonIndex);
            species = GetMonEvolution(setup->party[0], mon, EVOCTX_LEVELUP, setup->evolutionLocation, evolutionCondition);
            if (species) {
                return species;
            }
        }
    }
    return species;
}

u8 ov12_0223B688(BattleSystem *bsys) {
    return bsys->unk23FC;
}

u8 ov12_0223B694(BattleSystem *bsys) {
    GF_ASSERT(bsys->ctx != NULL);
    return ov12_022581D4(bsys, bsys->ctx, 5, 0);
}

int BattleSystem_GetSafariBallCount(BattleSystem *bsys) {
    return bsys->safariBallCnt;
}

void BattleSystem_SetSafariBallCount(BattleSystem *bsys, int cnt) {
    bsys->safariBallCnt = cnt;
}

Options *BattleSystem_GetOptions(BattleSystem *bsys) {
    return bsys->options;
}

BOOL BattleSystem_AreBattleAnimationsOn(BattleSystem *bsys) {
    if ((bsys->battleType & BATTLE_TYPE_LINK) && !(bsys->battleSpecial & BATTLE_SPECIAL_RECORDING)) {
        return TRUE;
    }
    return Options_GetBattleScene(bsys->options) == 0;
}

u32 BattleSystem_GetFrame(BattleSystem *bsys) {
    return Options_GetFrame(bsys->options);
}

u8 BattleSystem_GetTextFrameDelay(BattleSystem *bsys) {
    if ((bsys->battleType & BATTLE_TYPE_LINK) && !(bsys->battleSpecial & BATTLE_SPECIAL_RECORDING)) {
        return 1;
    }
    return Options_GetTextFrameDelay(bsys->options);
}

u32 BattleSystem_GetBattleStyle(BattleSystem *bsys) {
    return Options_GetBattleStyle(bsys->options);
}

void *ov12_0223B750(BattleSystem *bsys) {
    return bsys->unk1C8;
}

SOUND_CHATOT *BattleSystem_GetChatotVoice(BattleSystem *bsys, int battlerId) {
    if ((bsys->battleType & BATTLE_TYPE_MULTI) || ((bsys->battleType & BATTLE_TYPE_TAG) && (ov12_0223AB0C(bsys, battlerId) & 1))) {
        return bsys->chatotVoice[battlerId];
    } else if (bsys->battleType & BATTLE_TYPE_DOUBLES) {
        return bsys->chatotVoice[battlerId & 1];
    } else {
        return bsys->chatotVoice[battlerId];
    }
}

void BattleSystem_TryChangeForm(BattleSystem *bsys) {
    int i;
    AlternateForms form;
    Pokemon *mon;
    u16 species;

    if (bsys->battleType & BATTLE_TYPE_NO_EXP) {
        return;
    }

    for (i = 0; i < BattleSystem_GetPartySize(bsys, BATTLER_PLAYER); i++) {
        mon = BattleSystem_GetPartyMon(bsys, BATTLER_PLAYER, i);
        species = GetMonData(mon, MON_DATA_SPECIES_OR_EGG, NULL);
        if (species == SPECIES_BURMY && bsys->unk2418[BATTLER_PLAYER] & MaskOfFlagNo(i)) {
            switch (BattleSystem_GetTerrainId(bsys)) {
            case TERRAIN_GRASS:
            case TERRAIN_PUDDLE:
            case TERRAIN_SNOW:
            case TERRAIN_WATER:
            case TERRAIN_ICE:
            case TERRAIN_GREAT_MARSH:
            default:
                form = BURMY_PLANT;
                break;
            case TERRAIN_PLAIN:
            case TERRAIN_SAND:
            case TERRAIN_CAVE:
            case TERRAIN_MOUNTAIN:
            case TERRAIN_DISTORTION_WORLD:
            case TERRAIN_GIRATINA:
                form = BURMY_SANDY;
                break;
            case TERRAIN_BUILDING:
            case TERRAIN_UNKNOWN:
            case TERRAIN_WILL:
            case TERRAIN_KOGA:
            case TERRAIN_BRUNO:
            case TERRAIN_KAREN:
            case TERRAIN_LANCE:
            case TERRAIN_BATTLE_TOWER:
            case TERRAIN_BATTLE_FACTORY:
            case TERRAIN_BATTLE_ARCADE:
            case TERRAIN_BATTLE_CASTLE:
            case TERRAIN_BATTLE_HALL:
                form = BURMY_TRASH;
                break;
            }
            SetMonData(mon, MON_DATA_FORM, &form);
        }
    }
}

void ov12_0223B854(BattleSystem *bsys, int battlerId, int selectedMonIndex) {
    bsys->unk2418[battlerId] |= MaskOfFlagNo(selectedMonIndex);
}

// used to be related to poketch in dppt
void ov12_0223B870() {
}

void BattleSystem_SetBackground(BattleSystem *bsys) {
    NNSG2dImageProxy *image;
    int bgX, bgY, objX, objY, data, i;
    u8 *vram;
    u32 *src;
    u32 *dst;

    bsys->unk220 = Heap_Alloc(HEAP_ID_BATTLE, 0x10000);
    bsys->unk224 = Heap_Alloc(HEAP_ID_BATTLE, 0x200);

    MIi_CpuCopy32((void *)0x6010000, (u32 *)bsys->unk220, 0x10000);
    dst = (u32 *)bsys->unk224;
    src = (u32 *)PaletteData_GetUnfadedBuf(bsys->palette, PLTTBUF_MAIN_BG);
    MIi_CpuCopy32(src, dst, 0x200);

    vram = (u8 *)0x6400000;
    image = Sprite_GetImageProxy(bsys->unk17C[1].unk0->sprite);
    vram += image->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN];

    for (bgY = 20; bgY < 28; bgY++) {
        for (bgX = 16; bgX < 32; bgX++) {
            objX = bgX - 16;
            objY = bgY - 20;
            for (i = 0; i < 64; i++) {
                if (objX < 8) {
                    if (i & 1) {
                        data = (vram[objY * 0x100 + objX * 0x20 + i / 2] & 0xF0) >> 4;
                    } else {
                        data = (vram[objY * 0x100 + objX * 0x20 + i / 2] & 0xF);
                    }
                } else if (i & 1) {
                    data = (vram[0x700 + objY * 0x100 + objX * 0x20 + i / 2] & 0xF0) >> 4;
                } else {
                    data = (vram[0x700 + objY * 0x100 + objX * 0x20 + i / 2] & 0xF);
                }
                if (data) {
                    bsys->unk220[bgY * 0x800 + bgX * 0x40 + i] = data + 0x70;
                }
            }
        }
    }

    vram = (u8 *)0x6400000;
    image = Sprite_GetImageProxy(bsys->unk17C[0].unk0->sprite);
    vram += image->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN];

    for (i = 0; i < 0x800; i++) {
        if (i & 1) {
            data = (vram[i / 2] & 0xF0) >> 4;
        } else {
            data = (vram[i / 2] & 0xF);
        }
        if (data) {
            bsys->unk220[0x9800 + i] = data + 0x70;
        }
    }

    for (bgY = 28; bgY < 32; bgY++) {
        for (bgX = 0; bgX < 24; bgX++) {
            objX = bgX;
            objY = bgY - 28;
            for (i = 0; i < 0x40; i++) {
                if (i & 1) {
                    data = (vram[0x400 + (objX / 8) * 0x400 + (objX % 8) * 0x20 + objY * 0x100 + i / 2] & 0xF0) >> 4;
                } else {
                    data = (vram[0x400 + (objX / 8) * 0x400 + (objX % 8) * 0x20 + objY * 0x100 + i / 2] & 0xF);
                }
                if (data) {
                    bsys->unk220[bgY * 0x800 + bgX * 0x40 + i] = data + 0x70;
                }
            }
        }
    }

    BG_LoadCharTilesData(bsys->bgConfig, 3, bsys->unk220, 0x10000, 0);

    ov12_02266008(&bsys->unk17C[0]);
    ov12_02266008(&bsys->unk17C[1]);
}

u8 *ov12_0223BAD0(BattleSystem *bsys) {
    return bsys->unk220;
}

u16 *ov12_0223BAD8(BattleSystem *bsys) {
    return bsys->unk224;
}

u16 *ov12_0223BAE0(BattleSystem *bsys) {
    return &bsys->unk2228[0];
}

u16 *ov12_0223BAEC(BattleSystem *bsys) {
    return &bsys->unk2308[0];
}

int BattleSystem_GetWeather(BattleSystem *bsys) {
    return bsys->weather;
}

u8 ov12_0223BB04(BattleSystem *bsys) {
    return bsys->unk2421;
}

void ov12_0223BB10(BattleSystem *bsys, u8 a1) {
    bsys->unk2421 = a1;
}

int ov12_0223BB1C(BattleSystem *bsys) {
    return bsys->unk2430;
}

void BattleSystem_GameStatIncrement(BattleSystem *bsys, int id) {
    if (bsys->battleSpecial & BATTLE_SPECIAL_RECORDING) {
        return;
    }
    GameStats_Inc(bsys->gameStats, id);
}

void ov12_0223BB44(BattleSystem *bsys) {
    if (bsys->battleSpecial & BATTLE_SPECIAL_RECORDING) {
        return;
    }
    GameStats_AddScore(bsys->gameStats, SCORE_EVENT_REGISTER_SPECIES_CAUGHT);
}

void ov12_0223BB64(BattleSystem *bsys, int a1) {
    bsys->unk2440 = a1;
}

void ov12_0223BB6C(BattleSystem *bsys, u8 a1) {
    bsys->unk2442 = a1;
}

void *ov12_0223BB78(BattleSystem *bsys) {
    return bsys->unk1BC;
}

void ov12_0223BB80(BattleSystem *bsys, void *a1) {
    bsys->unk1BC = a1;
}

UnkBattleSystemSub1D0 *ov12_0223BB88(BattleSystem *bsys, int index) {
    return &bsys->unk1D0[index];
}

u8 *ov12_0223BB94(UnkBattleSystemSub1D0 *ptr, int index) {
    GF_ASSERT(index < 4);
    return ptr[index].unk0;
}

void ov12_0223BBA8(UnkBattleSystemSub1D0 *ptr, int index, int a2) {
    GF_ASSERT(index < 4);
    ptr[index].unk4 = a2;
}

void ov12_0223BBC0(UnkBattleSystemSub1D0 *ptr, int index, int a2) {
    GF_ASSERT(index < 4);
    ptr[index].unk8 = a2;
}

void ov12_0223BBD8(UnkBattleSystemSub1D0 *ptr, int index, int a2) {
    GF_ASSERT(index < 4);
    ptr[index].unkC = a2;
}

void ov12_0223BBF0(BattleSystem *bsys, u8 a1) {
    bsys->unk23FD = a1;
}

void ov12_0223BBFC(BattleSystem *bsys, u8 *a1) {
    bsys->unk23F4 = a1;
}

void ov12_0223BC08(BattleSystem *bsys, u8 *a1) {
    bsys->unk23F8 = a1;
}

void ov12_0223BC14(BattleSystem *bsys, u8 a1) {
    *bsys->unk23F4 = a1;
}

void ov12_0223BC20(BattleSystem *bsys, u8 a1) {
    *bsys->unk23F8 = a1;
}

void ov12_0223BC2C(BattleSystem *bsys, u8 a1) {
    bsys->unk23FE = a1;
}

BattleHpBar *BattleSystem_GetHpBar(BattleSystem *bsys, int battlerId) {
    return OpponentData_GetHpBar(bsys->opponentData[battlerId]);
}

void BattleSystem_HpBar_Init(BattleSystem *bsys) {
    int i;
    BattleHpBar *hpBar;

    for (i = 0; i < bsys->maxBattlers; i++) {
        hpBar = OpponentData_GetHpBar(bsys->opponentData[i]);
        hpBar->bsys = bsys;
        hpBar->type = BattleHpBar_Util_GetBarTypeFromBattlerSide(ov12_02261258(bsys->opponentData[i]), BattleSystem_GetBattleType(bsys));
        BattleHpBar_LoadResources(hpBar);
        BattleHpBar_SetEnabled(hpBar, FALSE);
    }
}

void BattleSystem_SetHpBarEnabled(BattleSystem *bsys) {
    int i;
    BattleHpBar *hpBar;

    for (i = 0; i < bsys->maxBattlers; i++) {
        hpBar = OpponentData_GetHpBar(bsys->opponentData[i]);
        if (hpBar->hp) {
            BattleHpBar_SetEnabled(hpBar, TRUE);
        }
    }
}

void BattleSystem_SetHpBarDisabled(BattleSystem *bsys) {
    int i;
    BattleHpBar *hpBar;

    for (i = 0; i < bsys->maxBattlers; i++) {
        hpBar = OpponentData_GetHpBar(bsys->opponentData[i]);
        BattleHpBar_SetEnabled(hpBar, FALSE);
    }
}

void BattleSystem_HpBar_Delete(BattleSystem *bsys) {
    int i;
    BattleHpBar *hpBar;

    for (i = 0; i < bsys->maxBattlers; i++) {
        hpBar = OpponentData_GetHpBar(bsys->opponentData[i]);
        BattleHpBar_FreeResources(hpBar);
    }
}

u8 BattleSystem_GetBattleOutcomeFlags(BattleSystem *bsys) {
    return bsys->battleOutcomeFlag;
}

void BattleSystem_SetBattleOutcomeFlags(BattleSystem *bsys, u8 battleOutcomeFlag) {
    bsys->battleOutcomeFlag = battleOutcomeFlag;
}

u8 BattleSystem_GetCriticalHpMusicFlag(BattleSystem *bsys) {
    return bsys->criticalHpMusic;
}

void BattleSystem_SetCriticalHpMusicFlag(BattleSystem *bsys, u8 flag) {
    bsys->criticalHpMusic = flag;
}

u8 BattleSystem_GetCriticalHpMusicDelay(BattleSystem *bsys) {
    return bsys->criticalHpMusicDelay;
}

void BattleSystem_SetCriticalHpMusicDelay(BattleSystem *bsys, u8 delay) {
    GF_ASSERT(delay < 15);
    bsys->criticalHpMusicDelay = delay;
}

void ov12_0223BD8C(BattleSystem *bsys, int a1) {
    bsys->unk243C = a1;
}

u16 BattleSystem_Random(BattleSystem *bsys) {
    bsys->rand = bsys->rand * 1103515245L + 24691;
    return bsys->rand / 65536L;
}

u32 BattleSystem_GetRandTemp(BattleSystem *bsys) {
    return bsys->randTemp;
}

void BattleSystem_SetRandTemp(BattleSystem *bsys, u32 temp) {
    bsys->randTemp = temp;
}

void ov12_0223BDDC(BattleSystem *bsys, int battlerId, u8 data) {
    if (!(bsys->battleSpecial & BATTLE_SPECIAL_RECORDING) && bsys->unk245C[battlerId] < 1024) {
        sub_02030260(battlerId, bsys->unk245C[battlerId], data);
        bsys->unk245C[battlerId]++;
    }
}

BOOL ov12_0223BE0C(BattleSystem *bsys, int battlerId, u8 *data) {
    BOOL ret;
    *data = 0xFF;
    if ((bsys->battleSpecial & BATTLE_SPECIAL_RECORDING) && (bsys->unk245C[battlerId] < 1024)) {
        *data = sub_0203027C(battlerId, bsys->unk245C[battlerId]);
        bsys->unk245C[battlerId]++;
        ret = FALSE;
    } else if ((bsys->battleSpecial & BATTLE_SPECIAL_RECORDING) && bsys->unk245C[battlerId] >= 1024) {
        ret = TRUE;
    }
    return ret;
}

u8 ov12_0223BE68(BattleSystem *bsys, u8 *buffer) {
    u8 i;
    u8 battlerId;
    u8 index = 0;

    for (battlerId = 0; battlerId < bsys->maxBattlers; battlerId++) {
        if (bsys->unk245C[battlerId] != bsys->unk244C[battlerId]) {
            buffer[index++] = battlerId;
            buffer[index++] = bsys->unk245C[battlerId] - bsys->unk244C[battlerId];
            for (i = 0; i < bsys->unk245C[battlerId] - bsys->unk244C[battlerId]; i++) {
                buffer[index++] = sub_0203027C(battlerId, bsys->unk244C[battlerId] + i);
            }
            bsys->unk244C[battlerId] = bsys->unk245C[battlerId];
        }
    }

    GF_ASSERT(index <= 28);

    return index;
}

void ov12_0223BF14(BattleSystem *bsys, u16 size, u8 *buffer) {
    int i;
    u8 battlerId;
    u8 byte;
    u8 index = 0;

    if (!(bsys->battleType & BATTLE_TYPE_LINK)) {
        return;
    }

    if (bsys->unk23FC) {
        return;
    }

    while (size) {
        battlerId = ov12_0223BFB0(buffer, &index, &size);
        byte = ov12_0223BFB0(buffer, &index, &size);
        for (i = 0; i < byte; i++) {
            sub_02030260(battlerId, bsys->unk2454[battlerId] + i, ov12_0223BFB0(buffer, &index, &size));
        }
        bsys->unk2454[battlerId] += byte;
    }
}

static u8 ov12_0223BFB0(u8 *buffer, u8 *index, u16 *size) {
    (*size)--;
    return buffer[(*index)++];
}

u16 ov12_0223BFC0(BattleSystem *bsys) {
    return bsys->unk2446;
}

int ov12_0223BFCC(BattleSystem *bsys, u16 battlerId) {
    return bsys->unk2464[battlerId];
}

u16 BattleSystem_GetTrainerItem(BattleSystem *bsys, int battlerId, int index) {
    return bsys->trainers[battlerId].data.items[index];
}

BOOL BattleSystem_IsRecordingPaused(BattleSystem *bsys) {
    return bsys->isRecordingPaused;
}

void ov12_0223BFFC(BattleSystem *bsys, u32 flag) {
    if (!(bsys->battleSpecial & BATTLE_SPECIAL_RECORDING) || bsys->isRecordingPaused || ov12_022581D4(bsys, bsys->ctx, 13, 0) == 44 || ov12_022581D4(bsys, bsys->ctx, 14, 0) == 44) {
        return;
    }

    ov12_0226AA8C(bsys->unk19C, flag);
    BeginNormalPaletteFade(3, 0, 0, RGB_BLACK, 16, 2, HEAP_ID_BATTLE);
    Sound_Stop();
    Sound_SetMasterVolume(0);
    bsys->isRecordingPaused = TRUE;
}

BOOL ov12_0223C080(BattleSystem *bsys) {
    if (!(bsys->battleSpecial & BATTLE_SPECIAL_RECORDING) || bsys->isRecordingPaused || ov12_022581D4(bsys, bsys->ctx, 13, 0) == 44 || ov12_022581D4(bsys, bsys->ctx, 14, 0) == 44) {
        return FALSE;
    }
    return TRUE;
}

void ov12_0223C0C4(BattleSystem *bsys) {
    if (!(bsys->battleSpecial & BATTLE_SPECIAL_RECORDING) || bsys->unk247C) {
        return;
    }
    bsys->unk247C = ov12_0226BEC4(bsys);
}

u8 BattleSystem_GetChatotVoiceParam(BattleSystem *bsys, int battlerId) {
    if ((bsys->battleType & BATTLE_TYPE_MULTI) || ((bsys->battleType & BATTLE_TYPE_TAG) && (ov12_0223AB0C(bsys, battlerId) & 1))) {
        return bsys->chatotVoiceParam[battlerId];
    } else if (bsys->battleType & BATTLE_TYPE_DOUBLES) {
        return bsys->chatotVoiceParam[battlerId & 1];
    } else {
        return bsys->chatotVoiceParam[battlerId];
    }
}

u32 ov12_0223C134(BattleSystem *bsys) {
    return bsys->unk2488;
}

u8 ov12_0223C140(BattleSystem *bsys, u32 battlerId) {
    if (battlerId >= 4) {
        return 0xFF;
    }
    if (bsys->battleType & (BATTLE_TYPE_LINK | BATTLE_TYPE_SAFARI | BATTLE_TYPE_FRONTIER | BATTLE_TYPE_PAL_PARK)) {
        return 0xFF;
    }

    if ((bsys->battleType & BATTLE_TYPE_DOUBLES) && (ov12_0223AB0C(bsys, battlerId) & 1)) {
        return 0xFF;
    }

    if (bsys->battleType & BATTLE_TYPE_MULTI) {
        return bsys->unk248C[battlerId];
    }
    if (bsys->battleType & BATTLE_TYPE_DOUBLES) {
        return bsys->unk248C[battlerId & 1];
    }
    return bsys->unk248C[battlerId];
}

void ov12_0223C1A0(BattleSystem *bsys, u8 *buffer) {
    int i;
    for (i = 0; i < bsys->maxBattlers; i++) {
        buffer[ov12_02261258(bsys->opponentData[i])] = i;
    }
}

void ov12_0223C1C4(BattleSystem *bsys, u8 *buffer) {
    int i;

    for (i = 0; i < 4; i++) {
        buffer[i] = 0xFF;
    }

    for (i = 0; i < bsys->maxBattlers; i++) {
        buffer[i] = ov12_02261258(bsys->opponentData[i]);
    }
}

void ov12_0223C1F4(BattleSystem *bsys, void **a1) {
    int i;

    for (i = 0; i < 4; i++) {
        a1[i] = NULL;
    }

    for (i = 0; i < bsys->maxBattlers; i++) {
        a1[i] = ov12_02261270(bsys->opponentData[i]);
    }
}

void ov12_0223C224(BattleSystem *bsys, int a1) {
    int i;
    BattleHpBar *hpBar;

    for (i = 0; i < bsys->maxBattlers; i++) {
        hpBar = OpponentData_GetHpBar(bsys->opponentData[i]);
        ov12_02264EE0(hpBar, a1);
    }
}

u32 CalcMoneyLoss(Party *party, PlayerProfile *profile) {
    static const u8 sBadgePenalty[] = {
        2, 4, 6, 9, 12, 16, 20, 25, 30
    };
    u8 badgeCount = PlayerProfile_CountBadges(profile);
    if (badgeCount > 8) {
        badgeCount = 8;
    }
    u32 loss = Party_GetMaxLevel(party) * 4 * sBadgePenalty[badgeCount];
    u32 money = PlayerProfile_GetMoney(profile);

    if (loss > money) {
        loss = money;
    }

    return loss;
}

void BattleSystem_SetPokedexSeen(BattleSystem *bsys, int battlerId) {
    u32 flag = ov12_02261258(bsys->opponentData[battlerId]);
    Pokemon *mon = BattleSystem_GetPartyMon(bsys, battlerId, ov12_022581D4(bsys, bsys->ctx, 2, battlerId));

    if (!(bsys->battleType & (BATTLE_TYPE_LINK | BATTLE_TYPE_FRONTIER))) {
        if ((flag & 1) || bsys->battleType == (BATTLE_TYPE_AI | BATTLE_TYPE_DOUBLES | BATTLE_TYPE_MULTI) || bsys->battleType == (BATTLE_TYPE_TRAINER | BATTLE_TYPE_AI | BATTLE_TYPE_DOUBLES | BATTLE_TYPE_MULTI)) {
            Pokedex_SetMonSeenFlag(bsys->pokedex, mon);
        }
    }
    if (!(flag & 1) && GetMonData(mon, MON_DATA_SPECIES_OR_EGG, NULL) == SPECIES_BURMY) {
        Pokedex_SetMonCaughtFlag(bsys->pokedex, mon);
    }
}

void BattleSystem_SetPokedexCaught(BattleSystem *bsys, int battlerId) {
    u32 flag = ov12_02261258(bsys->opponentData[battlerId]);

    if (!(bsys->battleType & (BATTLE_TYPE_LINK | BATTLE_TYPE_FRONTIER)) && (flag & 1)) {
        int selectedMonIndex = ov12_022581D4(bsys, bsys->ctx, 2, battlerId);
        Pokemon *mon = BattleSystem_GetPartyMon(bsys, battlerId, selectedMonIndex);
        Pokedex_SetMonCaughtFlag(bsys->pokedex, mon);
    }
}

BOOL BattleSystem_CheckMonCaught(BattleSystem *bsys, int battlerId) {
    return Pokedex_CheckMonCaughtFlag(bsys->pokedex, battlerId);
}

void BattleSystem_SetDefaultBlend() {
    G2_BlendNone();
}

u8 BattleSystem_PrintTrainerMessage(BattleSystem *bsys, int trainerId, int battlerId, int a2, int delay) {
    Window *window = BattleSystem_GetWindow(bsys, 0);
    int index;

    if (bsys->battleType & BATTLE_TYPE_FRONTIER) {
        if (trainerId == 0x2710 || bsys->battleType & BATTLE_TYPE_13) {
            String *msg;

            if (a2 == 0x64) {
                msg = MailMsg_GetExpandedString(&bsys->trainers[battlerId].winMessage, HEAP_ID_BATTLE);
            } else {
                msg = MailMsg_GetExpandedString(&bsys->trainers[battlerId].loseMessage, HEAP_ID_BATTLE);
            }
            FillWindowPixelBuffer(window, 0xFF);
            String_Copy(bsys->msgBuffer, msg);
            index = AddTextPrinterParameterized(window, 1, bsys->msgBuffer, 0, 0, delay, ov12_0223CF14);
            String_Delete(msg);
        } else {
            MsgData *data;
            String *msg;
            int stringId;
            u32 msgId;
            int i;

            if (a2 == 0x64) {
                stringId = trainerId * 3 + 1;
            } else {
                stringId = trainerId * 3 + 2;
            }

            for (i = 0; i < 4; i++) {
                if (PlayerProfile_GetVersion(bsys->playerProfile[i]) == 0) {
                    break;
                }
            }

            if (i == 4) {
                msgId = msg_0197_00724;
            } else {
                msgId = msg_0197_00723;
            }

            data = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, msgId, HEAP_ID_BATTLE);
            msg = NewString_ReadMsgData(data, stringId);
            FillWindowPixelBuffer(window, 0xFF);
            String_Copy(bsys->msgBuffer, msg);
            index = AddTextPrinterParameterized(window, 1, bsys->msgBuffer, 0, 0, delay, ov12_0223CF14);
            String_Delete(msg);
            DestroyMsgData(data);
        }
    } else {
        GetTrainerMessageByIdPair(trainerId, a2, bsys->msgBuffer, HEAP_ID_BATTLE);
        FillWindowPixelBuffer(window, 0xFF);
        index = AddTextPrinterParameterized(window, 1, bsys->msgBuffer, 0, 0, delay, ov12_0223CF14);
    }
    return index;
}

u32 BattleSystem_PrintBattleMessage(BattleSystem *bsys, MsgData *data, BattleMessage *msg, u8 delay) {
    Window *window = BattleSystem_GetWindow(bsys, 0);
    BattleSystem_AdjustMessageForSide(bsys, msg);
    BattleSystem_BufferMessage(bsys, msg);
    BattleMessage_ExpandPlaceholders(bsys, data, msg);
    FillWindowPixelBuffer(window, 0xFF);
    return AddTextPrinterParameterized(window, 1, bsys->msgBuffer, 0, 0, delay, ov12_0223CF14);
}

u32 ov12_0223C4E8(BattleSystem *bsys, Window *window, MsgData *data, BattleMessage *msg, int x, int y, int flag, int width, int delay) {
    int dx;

    BattleSystem_AdjustMessageForSide(bsys, msg);
    BattleSystem_BufferMessage(bsys, msg);
    BattleMessage_ExpandPlaceholders(bsys, data, msg);

    if (flag & 1) {
        FillWindowPixelBuffer(window, 0xFF);
    }

    if (flag & 2) {
        dx = width - FontID_String_GetWidth(0, bsys->msgBuffer, 0);
    } else {
        dx = 0;
    }

    return AddTextPrinterParameterized(window, 0, bsys->msgBuffer, x + dx, y, delay, ov12_0223CF14);
}

static void BattleSystem_AdjustMessageForSide(BattleSystem *bsys, BattleMessage *msg) {
    u32 battleType = BattleSystem_GetBattleType(bsys);

    if (msg->tag & 0x80) {
        return;
    }

    if (msg->tag & 0x40) {
        if (BattleSystem_GetFieldSide(bsys, msg->battlerId)) {
            msg->id++;
        }
        return;
    }

    switch (msg->tag & 0x3F) {
    case TAG_NONE:
    case TAG_MOVE:
    case TAG_STAT:
    case TAG_ITEM:
    case TAG_NUMBER:
    case TAG_NUMBERS:
    case TAG_TRNAME:
    case TAG_MOVE_MOVE:
    case TAG_ITEM_MOVE:
    case TAG_NUMBER_NUMBER:
    case TAG_TRNAME_TRNAME:
    case TAG_TRNAME_NICKNAME:
    case TAG_TRNAME_ITEM:
    case TAG_TRNAME_NUM:
    case TAG_TRCLASS_TRNAME:
    case TAG_TRNAME_NICKNAME_NICKNAME:
    case TAG_TRCLASS_TRNAME_NICKNAME:
    case TAG_TRCLASS_TRNAME_ITEM:
    case TAG_TRNAME_NICKNAME_TRNAME_NICKNAME:
    case TAG_TRCLASS_TRNAME_NICKNAME_NICKNAME:
    case TAG_TRCLASS_TRNAME_NICKNAME_TRNAME:
    case TAG_TRCLASS_TRNAME_TRCLASS_TRNAME:
    case TAG_TRCLASS_TRNAME_NICKNAME_TRCLASS_TRNAME_NICKNAME:
        break;
    case TAG_NONE_SIDE:
        if (BattleSystem_GetFieldSide(bsys, msg->param[0] & 0xFF)) {
            msg->id++;
        }
        break;
    case TAG_NICKNAME:
    case TAG_NICKNAME_MOVE:
    case TAG_NICKNAME_ABILITY:
    case TAG_NICKNAME_STAT:
    case TAG_NICKNAME_TYPE:
    case TAG_NICKNAME_POKE:
    case TAG_NICKNAME_ITEM:
    case TAG_NICKNAME_POFFIN:
    case TAG_NICKNAME_NUM:
    case TAG_NICKNAME_TRNAME:
    case TAG_NICKNAME_BOX:
    case TAG_NICKNAME_MOVE_MOVE:
    case TAG_NICKNAME_MOVE_NUMBER:
    case TAG_NICKNAME_ABILITY_MOVE:
    case TAG_NICKNAME_ABILITY_ITEM:
    case TAG_NICKNAME_ABILITY_STAT:
    case TAG_NICKNAME_ABILITY_TYPE:
    case TAG_NICKNAME_ABILITY_STATUS:
    case TAG_NICKNAME_ABILITY_NUMBER:
    case TAG_NICKNAME_ITEM_MOVE:
    case TAG_NICKNAME_ITEM_STAT:
    case TAG_NICKNAME_ITEM_STATUS:
    case TAG_NICKNAME_BOX_BOX:
        if (BattleSystem_GetFieldSide(bsys, msg->param[0] & 0xFF)) {
            msg->id++;
            if (battleType & BATTLE_TYPE_TRAINER) {
                msg->id++;
            }
        }
        break;
    case TAG_MOVE_SIDE:
        if (BattleSystem_GetFieldSide(bsys, msg->param[1] & 0xFF)) {
            msg->id++;
        }
        break;
    case TAG_MOVE_NICKNAME:
    case TAG_ABILITY_NICKNAME:
    case TAG_ITEM_NICKNAME_FLAVOR:
        if (BattleSystem_GetFieldSide(bsys, msg->param[1] & 0xFF)) {
            msg->id++;
            if (battleType & BATTLE_TYPE_TRAINER) {
                msg->id++;
            }
        }
        break;
    case TAG_NICKNAME_NICKNAME:
    case TAG_NICKNAME_NICKNAME_MOVE:
    case TAG_NICKNAME_NICKNAME_ABILITY:
    case TAG_NICKNAME_NICKNAME_ITEM:
        if (BattleSystem_GetFieldSide(bsys, msg->param[0] & 0xFF)) {
            msg->id += 3;
            if (battleType & BATTLE_TYPE_TRAINER) {
                msg->id += 2;
            }
            if (BattleSystem_GetFieldSide(bsys, msg->param[1] & 0xFF)) {
                msg->id++;
            }
        } else if (BattleSystem_GetFieldSide(bsys, msg->param[1] & 0xFF)) {
            msg->id++;
            if (battleType & BATTLE_TYPE_TRAINER) {
                msg->id++;
            }
        }
        break;
    case TAG_NICKNAME_ABILITY_NICKNAME:
    case TAG_NICKNAME_ITEM_NICKNAME:
    case TAG_NICKNAME_ABILITY_NICKNAME_MOVE:
    case TAG_NICKNAME_ABILITY_NICKNAME_ABILITY:
    case TAG_NICKNAME_ABILITY_NICKNAME_STAT:
    case TAG_NICKNAME_ITEM_NICKNAME_ITEM:
        if (BattleSystem_GetFieldSide(bsys, msg->param[0] & 0xFF)) {
            msg->id += 3;
            if (battleType & BATTLE_TYPE_TRAINER) {
                msg->id += 2;
            }
            if (BattleSystem_GetFieldSide(bsys, msg->param[2] & 0xFF)) {
                msg->id++;
            }
        } else if (BattleSystem_GetFieldSide(bsys, msg->param[2] & 0xFF)) {
            msg->id++;
            if (battleType & BATTLE_TYPE_TRAINER) {
                msg->id++;
            }
        }
        break;
    default:
        GF_ASSERT(FALSE);
    }
}

static void BattleSystem_BufferMessage(BattleSystem *bsys, BattleMessage *msg) {
    switch (msg->tag & 0x3F) {
    case TAG_NONE:
    case TAG_NONE_SIDE:
        break;
    case TAG_NICKNAME:
        BattleMessage_BufferNickname(bsys, 0, msg->param[0]);
        break;
    case TAG_MOVE:
    case TAG_MOVE_SIDE:
        BattleMessage_BufferMove(bsys, 0, msg->param[0]);
        break;
    case TAG_STAT:
        BattleMessage_BufferStat(bsys, 0, msg->param[0]);
        break;
    case TAG_ITEM:
        BattleMessage_BufferItem(bsys, 0, msg->param[0]);
        break;
    case TAG_NUMBER:
        BattleMessage_BufferNumber(bsys, 0, msg->param[0]);
        break;
    case TAG_NUMBERS:
        BattleMessage_BufferNumbers(bsys, 0, msg->param[0], msg->numDigits);
        break;
    case TAG_TRNAME:
        BattleMessage_BufferTrainerName(bsys, 0, msg->param[0]);
        break;
    case TAG_NICKNAME_NICKNAME:
        BattleMessage_BufferNickname(bsys, 0, msg->param[0]);
        BattleMessage_BufferNickname(bsys, 1, msg->param[1]);
        break;
    case TAG_NICKNAME_MOVE:
        BattleMessage_BufferNickname(bsys, 0, msg->param[0]);
        BattleMessage_BufferMove(bsys, 1, msg->param[1]);
        break;
    case TAG_NICKNAME_ABILITY:
        BattleMessage_BufferNickname(bsys, 0, msg->param[0]);
        BattleMessage_BufferAbility(bsys, 1, msg->param[1]);
        break;
    case TAG_NICKNAME_STAT:
        BattleMessage_BufferNickname(bsys, 0, msg->param[0]);
        BattleMessage_BufferStat(bsys, 1, msg->param[1]);
        break;
    case TAG_NICKNAME_TYPE:
        BattleMessage_BufferNickname(bsys, 0, msg->param[0]);
        BattleMessage_BufferType(bsys, 1, msg->param[1]);
        break;
    case TAG_NICKNAME_POKE:
        BattleMessage_BufferNickname(bsys, 0, msg->param[0]);
        BattleMessage_BufferPokemon(bsys, 1, msg->param[1]);
        break;
    case TAG_NICKNAME_ITEM:
        BattleMessage_BufferNickname(bsys, 0, msg->param[0]);
        BattleMessage_BufferItem(bsys, 1, msg->param[1]);
        break;
    case TAG_NICKNAME_POFFIN: // unused
        BattleMessage_BufferNickname(bsys, 0, msg->param[0]);
        BattleMessage_BufferPoffin(bsys, 1, msg->param[1]);
        break;
    case TAG_NICKNAME_NUM:
        BattleMessage_BufferNickname(bsys, 0, msg->param[0]);
        BattleMessage_BufferNumber(bsys, 1, msg->param[1]);
        break;
    case TAG_NICKNAME_TRNAME:
        BattleMessage_BufferNickname(bsys, 0, msg->param[0]);
        BattleMessage_BufferTrainerName(bsys, 1, msg->param[1]);
        break;
    case TAG_NICKNAME_BOX:
        BattleMessage_BufferNickname(bsys, 0, msg->param[0]);
        BattleMessage_BufferBoxName(bsys, 1, msg->param[1]);
        break;
    case TAG_MOVE_NICKNAME:
        BattleMessage_BufferMove(bsys, 0, msg->param[0]);
        BattleMessage_BufferNickname(bsys, 1, msg->param[1]);
        break;
    case TAG_MOVE_MOVE:
        BattleMessage_BufferMove(bsys, 0, msg->param[0]);
        BattleMessage_BufferMove(bsys, 1, msg->param[1]);
        break;
    case TAG_ABILITY_NICKNAME:
        BattleMessage_BufferAbility(bsys, 0, msg->param[0]);
        BattleMessage_BufferNickname(bsys, 1, msg->param[1]);
        break;
    case TAG_ITEM_MOVE:
        BattleMessage_BufferItem(bsys, 0, msg->param[0]);
        BattleMessage_BufferMove(bsys, 1, msg->param[1]);
        break;
    case TAG_NUMBER_NUMBER:
        BattleMessage_BufferNumber(bsys, 0, msg->param[0]);
        BattleMessage_BufferNumber(bsys, 1, msg->param[1]);
        break;
    case TAG_TRNAME_TRNAME:
        BattleMessage_BufferTrainerName(bsys, 0, msg->param[0]);
        BattleMessage_BufferTrainerName(bsys, 1, msg->param[1]);
        break;
    case TAG_TRNAME_NICKNAME:
        BattleMessage_BufferTrainerName(bsys, 0, msg->param[0]);
        BattleMessage_BufferNickname(bsys, 1, msg->param[1]);
        break;
    case TAG_TRNAME_ITEM:
        BattleMessage_BufferTrainerName(bsys, 0, msg->param[0]);
        BattleMessage_BufferItem(bsys, 1, msg->param[1]);
        break;
    case TAG_TRNAME_NUM:
        BattleMessage_BufferTrainerName(bsys, 0, msg->param[0]);
        BattleMessage_BufferNumber(bsys, 1, msg->param[1]);
        break;
    case TAG_TRCLASS_TRNAME:
        BattleMessage_BufferTrainerClass(bsys, 0, msg->param[0]);
        BattleMessage_BufferTrainerName(bsys, 1, msg->param[1]);
        break;
    case TAG_NICKNAME_NICKNAME_MOVE:
        BattleMessage_BufferNickname(bsys, 0, msg->param[0]);
        BattleMessage_BufferNickname(bsys, 1, msg->param[1]);
        BattleMessage_BufferMove(bsys, 2, msg->param[2]);
        break;
    case TAG_NICKNAME_NICKNAME_ABILITY:
        BattleMessage_BufferNickname(bsys, 0, msg->param[0]);
        BattleMessage_BufferNickname(bsys, 1, msg->param[1]);
        BattleMessage_BufferAbility(bsys, 2, msg->param[2]);
        break;
    case TAG_NICKNAME_NICKNAME_ITEM:
        BattleMessage_BufferNickname(bsys, 0, msg->param[0]);
        BattleMessage_BufferNickname(bsys, 1, msg->param[1]);
        BattleMessage_BufferItem(bsys, 2, msg->param[2]);
        break;
    case TAG_NICKNAME_MOVE_MOVE:
        BattleMessage_BufferNickname(bsys, 0, msg->param[0]);
        BattleMessage_BufferMove(bsys, 1, msg->param[1]);
        BattleMessage_BufferMove(bsys, 2, msg->param[2]);
        break;
    case TAG_NICKNAME_MOVE_NUMBER:
        BattleMessage_BufferNickname(bsys, 0, msg->param[0]);
        BattleMessage_BufferMove(bsys, 1, msg->param[1]);
        BattleMessage_BufferNumber(bsys, 2, msg->param[2]);
        break;
    case TAG_NICKNAME_ABILITY_NICKNAME:
        BattleMessage_BufferNickname(bsys, 0, msg->param[0]);
        BattleMessage_BufferAbility(bsys, 1, msg->param[1]);
        BattleMessage_BufferNickname(bsys, 2, msg->param[2]);
        break;
    case TAG_NICKNAME_ABILITY_MOVE:
        BattleMessage_BufferNickname(bsys, 0, msg->param[0]);
        BattleMessage_BufferAbility(bsys, 1, msg->param[1]);
        BattleMessage_BufferMove(bsys, 2, msg->param[2]);
        break;
    case TAG_NICKNAME_ABILITY_ITEM:
        BattleMessage_BufferNickname(bsys, 0, msg->param[0]);
        BattleMessage_BufferAbility(bsys, 1, msg->param[1]);
        BattleMessage_BufferItem(bsys, 2, msg->param[2]);
        break;
    case TAG_NICKNAME_ABILITY_STAT:
        BattleMessage_BufferNickname(bsys, 0, msg->param[0]);
        BattleMessage_BufferAbility(bsys, 1, msg->param[1]);
        BattleMessage_BufferStat(bsys, 2, msg->param[2]);
        break;
    case TAG_NICKNAME_ABILITY_TYPE:
        BattleMessage_BufferNickname(bsys, 0, msg->param[0]);
        BattleMessage_BufferAbility(bsys, 1, msg->param[1]);
        BattleMessage_BufferType(bsys, 2, msg->param[2]);
        break;
    case TAG_NICKNAME_ABILITY_STATUS:
        BattleMessage_BufferNickname(bsys, 0, msg->param[0]);
        BattleMessage_BufferAbility(bsys, 1, msg->param[1]);
        BattleMessage_BufferStatus(bsys, 2, msg->param[2]);
        break;
    case TAG_NICKNAME_ABILITY_NUMBER:
        BattleMessage_BufferNickname(bsys, 0, msg->param[0]);
        BattleMessage_BufferAbility(bsys, 1, msg->param[1]);
        BattleMessage_BufferNumber(bsys, 2, msg->param[2]);
        break;
    case TAG_NICKNAME_ITEM_NICKNAME:
        BattleMessage_BufferNickname(bsys, 0, msg->param[0]);
        BattleMessage_BufferItem(bsys, 1, msg->param[1]);
        BattleMessage_BufferNickname(bsys, 2, msg->param[2]);
        break;
    case TAG_NICKNAME_ITEM_MOVE:
        BattleMessage_BufferNickname(bsys, 0, msg->param[0]);
        BattleMessage_BufferItem(bsys, 1, msg->param[1]);
        BattleMessage_BufferMove(bsys, 2, msg->param[2]);
        break;
    case TAG_NICKNAME_ITEM_STAT:
        BattleMessage_BufferNickname(bsys, 0, msg->param[0]);
        BattleMessage_BufferItem(bsys, 1, msg->param[1]);
        BattleMessage_BufferStat(bsys, 2, msg->param[2]);
        break;
    case TAG_NICKNAME_ITEM_STATUS:
        BattleMessage_BufferNickname(bsys, 0, msg->param[0]);
        BattleMessage_BufferItem(bsys, 1, msg->param[1]);
        BattleMessage_BufferStatus(bsys, 2, msg->param[2]);
        break;
    case TAG_NICKNAME_BOX_BOX:
        BattleMessage_BufferNickname(bsys, 0, msg->param[0]);
        BattleMessage_BufferBoxName(bsys, 1, msg->param[1]);
        BattleMessage_BufferBoxName(bsys, 2, msg->param[2]);
        break;
    case TAG_ITEM_NICKNAME_FLAVOR:
        BattleMessage_BufferItem(bsys, 0, msg->param[0]);
        BattleMessage_BufferNickname(bsys, 1, msg->param[1]);
        BattleMessage_BufferFlavorPreference(bsys, 2, msg->param[2]);
        break;
    case TAG_TRNAME_NICKNAME_NICKNAME:
        BattleMessage_BufferTrainerName(bsys, 0, msg->param[0]);
        BattleMessage_BufferNickname(bsys, 1, msg->param[1]);
        BattleMessage_BufferNickname(bsys, 2, msg->param[2]);
        break;
    case TAG_TRCLASS_TRNAME_NICKNAME:
        BattleMessage_BufferTrainerClass(bsys, 0, msg->param[0]);
        BattleMessage_BufferTrainerName(bsys, 1, msg->param[1]);
        BattleMessage_BufferNickname(bsys, 2, msg->param[2]);
        break;
    case TAG_TRCLASS_TRNAME_ITEM:
        BattleMessage_BufferTrainerClass(bsys, 0, msg->param[0]);
        BattleMessage_BufferTrainerName(bsys, 1, msg->param[1]);
        BattleMessage_BufferItem(bsys, 2, msg->param[2]);
        break;
    case TAG_NICKNAME_ABILITY_NICKNAME_MOVE:
        BattleMessage_BufferNickname(bsys, 0, msg->param[0]);
        BattleMessage_BufferAbility(bsys, 1, msg->param[1]);
        BattleMessage_BufferNickname(bsys, 2, msg->param[2]);
        BattleMessage_BufferMove(bsys, 3, msg->param[3]);
        break;
    case TAG_NICKNAME_ABILITY_NICKNAME_ABILITY:
        BattleMessage_BufferNickname(bsys, 0, msg->param[0]);
        BattleMessage_BufferAbility(bsys, 1, msg->param[1]);
        BattleMessage_BufferNickname(bsys, 2, msg->param[2]);
        BattleMessage_BufferAbility(bsys, 3, msg->param[3]);
        break;
    case TAG_NICKNAME_ABILITY_NICKNAME_STAT:
        BattleMessage_BufferNickname(bsys, 0, msg->param[0]);
        BattleMessage_BufferAbility(bsys, 1, msg->param[1]);
        BattleMessage_BufferNickname(bsys, 2, msg->param[2]);
        BattleMessage_BufferStat(bsys, 3, msg->param[3]);
        break;
    case TAG_NICKNAME_ITEM_NICKNAME_ITEM:
        BattleMessage_BufferNickname(bsys, 0, msg->param[0]);
        BattleMessage_BufferItem(bsys, 1, msg->param[1]);
        BattleMessage_BufferNickname(bsys, 2, msg->param[2]);
        BattleMessage_BufferItem(bsys, 3, msg->param[3]);
        break;
    case TAG_TRNAME_NICKNAME_TRNAME_NICKNAME:
        BattleMessage_BufferTrainerName(bsys, 0, msg->param[0]);
        BattleMessage_BufferNickname(bsys, 1, msg->param[1]);
        BattleMessage_BufferTrainerName(bsys, 2, msg->param[2]);
        BattleMessage_BufferNickname(bsys, 3, msg->param[3]);
        break;
    case TAG_TRCLASS_TRNAME_NICKNAME_NICKNAME:
        BattleMessage_BufferTrainerClass(bsys, 0, msg->param[0]);
        BattleMessage_BufferTrainerName(bsys, 1, msg->param[1]);
        BattleMessage_BufferNickname(bsys, 2, msg->param[2]);
        BattleMessage_BufferNickname(bsys, 3, msg->param[3]);
        break;
    case TAG_TRCLASS_TRNAME_NICKNAME_TRNAME:
        BattleMessage_BufferTrainerClass(bsys, 0, msg->param[0]);
        BattleMessage_BufferTrainerName(bsys, 1, msg->param[1]);
        BattleMessage_BufferNickname(bsys, 2, msg->param[2]);
        BattleMessage_BufferTrainerName(bsys, 3, msg->param[3]);
        break;
    case TAG_TRCLASS_TRNAME_TRCLASS_TRNAME:
        BattleMessage_BufferTrainerClass(bsys, 0, msg->param[0]);
        BattleMessage_BufferTrainerName(bsys, 1, msg->param[1]);
        BattleMessage_BufferTrainerClass(bsys, 2, msg->param[2]);
        BattleMessage_BufferTrainerName(bsys, 3, msg->param[3]);
        break;
    case TAG_TRCLASS_TRNAME_NICKNAME_TRCLASS_TRNAME_NICKNAME:
        BattleMessage_BufferTrainerClass(bsys, 0, msg->param[0]);
        BattleMessage_BufferTrainerName(bsys, 1, msg->param[1]);
        BattleMessage_BufferNickname(bsys, 2, msg->param[2]);
        BattleMessage_BufferTrainerClass(bsys, 3, msg->param[3]);
        BattleMessage_BufferTrainerName(bsys, 4, msg->param[4]);
        BattleMessage_BufferNickname(bsys, 5, msg->param[5]);
        break;
    default:
        GF_ASSERT(FALSE);
    }
}

static void BattleMessage_BufferNickname(BattleSystem *bsys, int bufferIndex, int param) {
    Pokemon *mon = BattleSystem_GetPartyMon(bsys, param & 0xFF, (param & 0xFF00) >> 8);
    BufferBoxMonNickname(bsys->msgFormat, bufferIndex, &mon->box);
}

static void BattleMessage_BufferMove(BattleSystem *bsys, int bufferIndex, int param) {
    BufferMoveName(bsys->msgFormat, bufferIndex, param);
}

static void BattleMessage_BufferItem(BattleSystem *bsys, int bufferIndex, int param) {
    BufferItemName(bsys->msgFormat, bufferIndex, param);
}

static void BattleMessage_BufferNumber(BattleSystem *bsys, int bufferIndex, int param) {
    BufferIntegerAsString(bsys->msgFormat, bufferIndex, param, 5, PRINTING_MODE_LEFT_ALIGN, TRUE);
}

static void BattleMessage_BufferNumbers(BattleSystem *bsys, int bufferIndex, int param, int numDigits) {
    if (numDigits) {
        BufferIntegerAsString(bsys->msgFormat, bufferIndex, param, numDigits, PRINTING_MODE_RIGHT_ALIGN, TRUE);
    } else {
        BufferIntegerAsString(bsys->msgFormat, bufferIndex, param, 5, PRINTING_MODE_RIGHT_ALIGN, TRUE);
    }
}

static void BattleMessage_BufferType(BattleSystem *bsys, int bufferIndex, int param) {
    BufferTypeName(bsys->msgFormat, bufferIndex, param);
}

static void BattleMessage_BufferAbility(BattleSystem *bsys, int bufferIndex, int param) {
    BufferAbilityName(bsys->msgFormat, bufferIndex, param);
}

static void BattleMessage_BufferStat(BattleSystem *bsys, int bufferIndex, int param) {
    BufferStatName(bsys->msgFormat, bufferIndex, param);
}

static void BattleMessage_BufferStatus(BattleSystem *bsys, int bufferIndex, int param) {
    BufferStatusName(bsys->msgFormat, bufferIndex, param);
}

static void BattleMessage_BufferPokemon(BattleSystem *bsys, int bufferIndex, int param) {
    Pokemon *mon = BattleSystem_GetPartyMon(bsys, param & 0xFF, (param & 0xFF00) >> 8);
    BufferBoxMonSpeciesName(bsys->msgFormat, bufferIndex, &mon->box);
}

static void BattleMessage_BufferPoffin(BattleSystem *bsys, int bufferIndex, int param) {
    // poffins don't exist in HGSS
}

static void BattleMessage_BufferFlavorPreference(BattleSystem *bsys, int bufferIndex, int param) {
    BufferFlavorDislikeText(bsys->msgFormat, bufferIndex, param);
}

static void BattleMessage_BufferTrainerClass(BattleSystem *bsys, int bufferIndex, int param) {
    Trainer *trainer = BattleSystem_GetTrainer(bsys, param);
    BufferTrainerClassNameFromDataStruct(bsys->msgFormat, bufferIndex, trainer);
}

static void BattleMessage_BufferTrainerName(BattleSystem *bsys, int bufferIndex, int param) {
    Trainer *trainer = BattleSystem_GetTrainer(bsys, param);
    BufferTrainerNameFromDataStruct(bsys->msgFormat, bufferIndex, trainer);
}

static void BattleMessage_BufferBoxName(BattleSystem *bsys, int bufferIndex, int param) {
    BufferPCBoxName(bsys->msgFormat, bufferIndex, bsys->storage, param);
}

static void BattleMessage_ExpandPlaceholders(BattleSystem *bsys, MsgData *data, BattleMessage *msg) {
    String *str = NewString_ReadMsgData(data, msg->id);
    StringExpandPlaceholders(bsys->msgFormat, bsys->msgBuffer, str);
    String_Delete(str);
}

static BOOL ov12_0223CF14(struct TextPrinterTemplate *template, u16 glyphId) {
    BOOL ret = FALSE;

    switch (glyphId) {
    case 1:
        ret = GF_IsAnySEPlaying();
        break;
    case 2:
        ret = IsFanfarePlaying();
        break;
    case 3:
        PlayFanfare(SEQ_ME_POKEGET);
        break;
    case 4:
        PlaySE(SEQ_SE_DP_KON);
        break;
    case 5:
        PlayFanfare(SEQ_ME_LVUP);
        break;
    default:
        break;
    }

    return ret;
}
