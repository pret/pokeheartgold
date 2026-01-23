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
#include "battle/battle_input.h"
#include "battle/overlay_12_0224E4FC.h"
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
static void BattleSystem_AdjustMessageForSide(BattleSystem *battleSystem, BattleMessage *msg);
static void BattleSystem_BufferMessage(BattleSystem *battleSystem, BattleMessage *msg);
static void BattleMessage_BufferNickname(BattleSystem *battleSystem, int bufferIndex, int param);
static void BattleMessage_BufferMove(BattleSystem *battleSystem, int bufferIndex, int param);
static void BattleMessage_BufferItem(BattleSystem *battleSystem, int bufferIndex, int param);
static void BattleMessage_BufferNumber(BattleSystem *battleSystem, int bufferIndex, int param);
static void BattleMessage_BufferNumbers(BattleSystem *battleSystem, int bufferIndex, int param, int numDigits);
static void BattleMessage_BufferType(BattleSystem *battleSystem, int bufferIndex, int param);
static void BattleMessage_BufferAbility(BattleSystem *battleSystem, int bufferIndex, int param);
static void BattleMessage_BufferStat(BattleSystem *battleSystem, int bufferIndex, int param);
static void BattleMessage_BufferStatus(BattleSystem *battleSystem, int bufferIndex, int param);
static void BattleMessage_BufferPokemon(BattleSystem *battleSystem, int bufferIndex, int param);
static void BattleMessage_BufferPoffin(BattleSystem *battleSystem, int bufferIndex, int param);
static void BattleMessage_BufferFlavorPreference(BattleSystem *battleSystem, int bufferIndex, int param);
static void BattleMessage_BufferTrainerClass(BattleSystem *battleSystem, int bufferIndex, int param);
static void BattleMessage_BufferTrainerName(BattleSystem *battleSystem, int bufferIndex, int param);
static void BattleMessage_BufferBoxName(BattleSystem *battleSystem, int bufferIndex, int param);
static void BattleMessage_ExpandPlaceholders(BattleSystem *battleSystem, MsgData *data, BattleMessage *msg);
static BOOL ov12_0223CF14(struct TextPrinterTemplate *template, u16 glyphId);

BgConfig *BattleSystem_GetBgConfig(BattleSystem *battleSystem) {
    return battleSystem->bgConfig;
}

Window *BattleSystem_GetWindow(BattleSystem *battleSystem, int index) {
    return &battleSystem->window[index];
}

u32 BattleSystem_GetBattleType(BattleSystem *battleSystem) {
    return battleSystem->battleType;
}

BattleContext *BattleSystem_GetBattleContext(BattleSystem *battleSystem) {
    return battleSystem->ctx;
}

OpponentData *BattleSystem_GetOpponentData(BattleSystem *battleSystem, int battlerId) {
    return battleSystem->opponentData[battlerId];
}

int BattleSystem_GetMaxBattlers(BattleSystem *battleSystem) {
    return battleSystem->maxBattlers;
}

Party *BattleSystem_GetParty(BattleSystem *battleSystem, int battlerId) {
    if ((battleSystem->battleType & BATTLE_TYPE_MULTI) || ((battleSystem->battleType & BATTLE_TYPE_TAG) && (ov12_0223AB0C(battleSystem, battlerId) & 1))) {
        return battleSystem->trainerParty[battlerId];
    } else if (battleSystem->battleType & BATTLE_TYPE_DOUBLES) {
        return battleSystem->trainerParty[battlerId & 1];
    } else {
        return battleSystem->trainerParty[battlerId];
    }
}

int BattleSystem_GetPartySize(BattleSystem *battleSystem, int battlerId) {
    if ((battleSystem->battleType & BATTLE_TYPE_MULTI) || ((battleSystem->battleType & BATTLE_TYPE_TAG) && (ov12_0223AB0C(battleSystem, battlerId) & 1))) {
        return Party_GetCount(battleSystem->trainerParty[battlerId]);
    } else if (battleSystem->battleType & BATTLE_TYPE_DOUBLES) {
        return Party_GetCount(battleSystem->trainerParty[battlerId & 1]);
    } else {
        return Party_GetCount(battleSystem->trainerParty[battlerId]);
    }
}

Pokemon *BattleSystem_GetPartyMon(BattleSystem *battleSystem, int battlerId, int index) {
    if ((battleSystem->battleType & BATTLE_TYPE_MULTI) || ((battleSystem->battleType & BATTLE_TYPE_TAG) && (ov12_0223AB0C(battleSystem, battlerId) & 1))) {
        return Party_GetMonByIndex(battleSystem->trainerParty[battlerId], index);
    } else if (battleSystem->battleType & BATTLE_TYPE_DOUBLES) {
        return Party_GetMonByIndex(battleSystem->trainerParty[battlerId & 1], index);
    } else {
        return Party_GetMonByIndex(battleSystem->trainerParty[battlerId], index);
    }
}

u32 *ov12_0223A8D4(BattleSystem *battleSystem) {
    return battleSystem->unk88;
}

u32 *ov12_0223A8DC(BattleSystem *battleSystem) {
    return battleSystem->unk8C;
}

SpriteSystem *BattleSystem_GetSpriteSystem(BattleSystem *battleSystem) {
    return battleSystem->spriteRenderer;
}

SpriteManager *BattleSystem_GetSpriteManager(BattleSystem *battleSystem) {
    return battleSystem->gfxHandler;
}

UnkBattleSystemSub17C *ov12_0223A8F4(BattleSystem *battleSystem, int index) {
    return &battleSystem->unk17C[index];
}

BattleInput *BattleSystem_GetBattleInput(BattleSystem *battleSystem) {
    return battleSystem->battleInput;
}

u32 *ov12_0223A908(BattleSystem *battleSystem, int index) {
    return battleSystem->unk1A0[index];
}

void ov12_0223A914(BattleSystem *battleSystem, int index, u32 *a2) {
    battleSystem->unk1A0[index] = a2;
}

BattleNumberPrinter *BattleSystem_GetHpNumPrinter(BattleSystem *battleSystem) {
    return battleSystem->hpNumPrinter;
}

BattleNumberPrinter *BattleSystem_GetLevelNumPrinter(BattleSystem *battleSystem) {
    return battleSystem->levelNumPrinter;
}

MsgData *BattleSystem_GetMessageLoader(BattleSystem *battleSystem) {
    return battleSystem->msgData;
}

u32 *ov12_0223A934(BattleSystem *battleSystem) {
    return battleSystem->unk10;
}

PaletteData *BattleSystem_GetPaletteData(BattleSystem *battleSystem) {
    return battleSystem->palette;
}

Pokedex *BattleSystem_GetPokedex(BattleSystem *battleSystem) {
    return battleSystem->pokedex;
}

u8 *BattleSystem_GetSendBufferPtr(BattleSystem *battleSystem) {
    return &battleSystem->sendBuffer[0];
}

u8 *BattleSystem_GetRecvBufferPtr(BattleSystem *battleSystem) {
    return &battleSystem->recvBuffer[0];
}

u16 *ov12_0223A954(BattleSystem *battleSystem) {
    return &battleSystem->unk23E8;
}

u16 *ov12_0223A960(BattleSystem *battleSystem) {
    return &battleSystem->unk23EA;
}

u16 *ov12_0223A96C(BattleSystem *battleSystem) {
    return &battleSystem->unk23EC;
}

u16 *ov12_0223A978(BattleSystem *battleSystem) {
    return &battleSystem->unk23EE;
}

u16 *ov12_0223A984(BattleSystem *battleSystem) {
    return &battleSystem->unk23F0;
}

u16 *ov12_0223A990(BattleSystem *battleSystem) {
    return &battleSystem->unk23F2;
}

UnkBattleSystemSub1D0 *ov12_0223A99C(BattleSystem *battleSystem) {
    return &battleSystem->unk1D0[0];
}

MessageFormat *BattleSystem_GetMessageFormat(BattleSystem *battleSystem) {
    return battleSystem->msgFormat;
}

String *BattleSystem_GetMessageBuffer(BattleSystem *battleSystem) {
    return battleSystem->msgBuffer;
}

u16 BattleSystem_GetTrainerIndex(BattleSystem *battleSystem, int battlerId) {
    if ((battleSystem->battleType & BATTLE_TYPE_MULTI) || ((battleSystem->battleType & BATTLE_TYPE_TAG) && (ov12_0223AB0C(battleSystem, battlerId) & 1))) {
        return battleSystem->trainerId[battlerId];
    } else if (battleSystem->battleType & BATTLE_TYPE_DOUBLES) {
        return battleSystem->trainerId[battlerId & 1];
    } else {
        return battleSystem->trainerId[battlerId];
    }
}

Trainer *BattleSystem_GetTrainer(BattleSystem *battleSystem, int battlerId) {
    if ((battleSystem->battleType & BATTLE_TYPE_MULTI) || ((battleSystem->battleType & BATTLE_TYPE_TAG) && (ov12_0223AB0C(battleSystem, battlerId) & 1))) {
        return &battleSystem->trainers[battlerId];
    } else if (battleSystem->battleType & BATTLE_TYPE_DOUBLES) {
        return &battleSystem->trainers[battlerId & 1];
    } else {
        return &battleSystem->trainers[battlerId];
    }
}

PlayerProfile *BattleSystem_GetPlayerProfile(BattleSystem *battleSystem, int battlerId) {
    if ((battleSystem->battleType & BATTLE_TYPE_MULTI) || ((battleSystem->battleType & BATTLE_TYPE_TAG) && (ov12_0223AB0C(battleSystem, battlerId) & 1))) {
        return battleSystem->playerProfile[battlerId];
    } else if (battleSystem->battleType & BATTLE_TYPE_DOUBLES) {
        return battleSystem->playerProfile[battlerId & 1];
    } else {
        return battleSystem->playerProfile[battlerId];
    }
}

Bag *BattleSystem_GetBag(BattleSystem *battleSystem) {
    return battleSystem->bag;
}

BagCursor *BattleSystem_GetBagCursor(BattleSystem *battleSystem) {
    return battleSystem->bagCursor;
}

u16 BattleSystem_GetMonBall(BattleSystem *battleSystem, Pokemon *mon) {
    if (battleSystem->unk2474_2) {
        return GetMonData(mon, MON_DATA_DP_POKEBALL, NULL);
    } else {
        return GetMonData(mon, MON_DATA_POKEBALL, NULL);
    }
}

u32 ov12_0223AAB8(BattleSystem *battleSystem) {
    return battleSystem->unk2474_3;
}

u32 BattleSystem_GetTrainerGender(BattleSystem *battleSystem, int battlerId) {
    return PlayerProfile_GetTrainerGender(battleSystem->playerProfile[battlerId]);
}

int BattleSystem_GetBattlerFromBattlerType(BattleSystem *battleSystem, int battlerType) {
    int battlerId;
    for (battlerId = 0; battlerId < battleSystem->maxBattlers; battlerId++) {
        if (ov12_02261258(battleSystem->opponentData[battlerId]) == battlerType) {
            break;
        }
    }

    GF_ASSERT(battlerId < battleSystem->maxBattlers);

    return battlerId;
}

u8 ov12_0223AB0C(BattleSystem *battleSystem, int battlerId) {
    return ov12_02261258(battleSystem->opponentData[battlerId]);
}

u8 BattleSystem_GetFieldSide(BattleSystem *battleSystem, int battlerId) {
    return ov12_02261258(battleSystem->opponentData[battlerId]) & 1;
}

void *BattleSystem_GetMessageIcon(BattleSystem *battleSystem) {
    return battleSystem->msgIcon;
}

PCStorage *BattleSystem_GetPcStorage(BattleSystem *battleSystem) {
    return battleSystem->storage;
}

Terrain BattleSystem_GetTerrainId(BattleSystem *battleSystem) {
    if (battleSystem->terrain > TERRAIN_MAX || battleSystem->terrain < 0) {
        return TERRAIN_MAX;
    }
    return battleSystem->terrain;
}

int BattleSystem_GetBackgroundId(BattleSystem *battleSystem) {
    return battleSystem->backgroundId;
}

int BattleSystem_GetLocation(BattleSystem *battleSystem) {
    return battleSystem->location;
}

int BattleSystem_GetBattlerIdPartner(BattleSystem *battleSystem, int battlerId) {
    int battlerIdPartner;
    int maxBattlers = BattleSystem_GetMaxBattlers(battleSystem);
    u32 battleType = BattleSystem_GetBattleType(battleSystem);

    if (!(battleType & BATTLE_TYPE_DOUBLES)) {
        return battlerId;
    }

    for (battlerIdPartner = 0; battlerIdPartner < maxBattlers; battlerIdPartner++) {
        if (battlerIdPartner != battlerId && BattleSystem_GetFieldSide(battleSystem, battlerIdPartner) == BattleSystem_GetFieldSide(battleSystem, battlerId)) {
            break;
        }
    }

    return battlerIdPartner;
}

int ov12_0223ABB8(BattleSystem *battleSystem, int battlerId, int side) {
    int battlerIdOpponent;
    int maxBattlers = BattleSystem_GetMaxBattlers(battleSystem);
    u32 battleType = BattleSystem_GetBattleType(battleSystem);

    if (!(battleType & BATTLE_TYPE_DOUBLES)) {
        return battlerId ^ 1;
    }

    for (battlerIdOpponent = 0; battlerIdOpponent < maxBattlers; battlerIdOpponent++) {
        if (battlerIdOpponent != battlerId && (ov12_0223AB0C(battleSystem, battlerIdOpponent) & 2) == side && BattleSystem_GetFieldSide(battleSystem, battlerIdOpponent) != BattleSystem_GetFieldSide(battleSystem, battlerId)) {
            break;
        }
    }

    return battlerIdOpponent;
}

BOOL BattleSystem_RecoverStatus(BattleSystem *battleSystem, int battlerId, int selectedMonIndex, int movePos, int item) {
    BattleContext *ctx = battleSystem->ctx;
    Pokemon *mon;
    BOOL ret = FALSE;
    int data;
    int index1 = ov12_022581D4(battleSystem, ctx, 2, battlerId);
    int index2;
    int friendship;

    if (BattleSystem_GetBattleType(battleSystem) == (BATTLE_TYPE_DOUBLES | BATTLE_TYPE_TRAINER) || ((BattleSystem_GetBattleType(battleSystem) & BATTLE_TYPE_TAG) && !(ov12_0223AB0C(battleSystem, battlerId) & 1))) {
        index2 = ov12_022581D4(battleSystem, ctx, 2, BattleSystem_GetBattlerIdPartner(battleSystem, battlerId));
        if (index2 == selectedMonIndex) {
            battlerId = BattleSystem_GetBattlerIdPartner(battleSystem, battlerId);
        }
    } else {
        index2 = index1;
    }
    mon = BattleSystem_GetPartyMon(battleSystem, battlerId, selectedMonIndex);
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
        data = ov12_022581D4(battleSystem, ctx, 1, battlerId);
        if (!data) {
            data = ov12_022581D4(battleSystem, ctx, 0, battlerId);
            data |= SIDE_CONDITION_MIST;
            ov12_022582B8(battleSystem, ctx, 0, battlerId, data);
            ov12_022582B8(battleSystem, ctx, 1, battlerId, 5);
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
                if (BattleSystem_GetFieldSide(battleSystem, battlerId)) {
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
            if (BallToItemId(BattleSystem_GetMonBall(battleSystem, mon)) == ITEM_LUXURY_BALL) {
                friendship++;
            }
            if (GetMonData(mon, MON_DATA_EGG_LOCATION, NULL) == BattleSystem_GetLocation(battleSystem)) {
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

u32 BattleSystem_GetBattleSpecial(BattleSystem *battleSystem) {
    return battleSystem->battleSpecial;
}

int BattleSystem_GetTimezone(BattleSystem *battleSystem) {
    return battleSystem->timezone;
}

int ov12_0223B52C(BattleSystem *battleSystem) {
    int ret;

    switch (battleSystem->backgroundId) {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
        switch (battleSystem->timezone) {
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

u8 ov12_0223B580(BattleSystem *battleSystem, int battlerId, u8 a2) {
    u16 item;

    if (ov12_0223AB0C(battleSystem, battlerId) == 4 && !(battleSystem->battleType & BATTLE_TYPE_MULTI)) {
        if (battleSystem->battleType & BATTLE_TYPE_LINK) {
            if (!(a2 & MaskOfFlagNo(BattleSystem_GetBattlerIdPartner(battleSystem, battlerId)))) {
                return 1;
            }
        } else {
            item = ov12_022581D4(battleSystem, battleSystem->ctx, 12, 0);
            if ((ov12_022581D4(battleSystem, battleSystem->ctx, 8, 0) == 14 && item > ITEM_CHERISH_BALL) || (a2 & MaskOfFlagNo(0))) {
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

u8 ov12_0223B688(BattleSystem *battleSystem) {
    return battleSystem->unk23FC;
}

u8 ov12_0223B694(BattleSystem *battleSystem) {
    GF_ASSERT(battleSystem->ctx != NULL);
    return ov12_022581D4(battleSystem, battleSystem->ctx, 5, 0);
}

int BattleSystem_GetSafariBallCount(BattleSystem *battleSystem) {
    return battleSystem->safariBallCnt;
}

void BattleSystem_SetSafariBallCount(BattleSystem *battleSystem, int cnt) {
    battleSystem->safariBallCnt = cnt;
}

Options *BattleSystem_GetOptions(BattleSystem *battleSystem) {
    return battleSystem->options;
}

BOOL BattleSystem_AreBattleAnimationsOn(BattleSystem *battleSystem) {
    if ((battleSystem->battleType & BATTLE_TYPE_LINK) && !(battleSystem->battleSpecial & BATTLE_SPECIAL_RECORDING)) {
        return TRUE;
    }
    return Options_GetBattleScene(battleSystem->options) == 0;
}

u32 BattleSystem_GetFrame(BattleSystem *battleSystem) {
    return Options_GetFrame(battleSystem->options);
}

u8 BattleSystem_GetTextFrameDelay(BattleSystem *battleSystem) {
    if ((battleSystem->battleType & BATTLE_TYPE_LINK) && !(battleSystem->battleSpecial & BATTLE_SPECIAL_RECORDING)) {
        return 1;
    }
    return Options_GetTextFrameDelay(battleSystem->options);
}

u32 BattleSystem_GetBattleStyle(BattleSystem *battleSystem) {
    return Options_GetBattleStyle(battleSystem->options);
}

void *ov12_0223B750(BattleSystem *battleSystem) {
    return battleSystem->unk1C8;
}

SOUND_CHATOT *BattleSystem_GetChatotVoice(BattleSystem *battleSystem, int battlerId) {
    if ((battleSystem->battleType & BATTLE_TYPE_MULTI) || ((battleSystem->battleType & BATTLE_TYPE_TAG) && (ov12_0223AB0C(battleSystem, battlerId) & 1))) {
        return battleSystem->chatotVoice[battlerId];
    } else if (battleSystem->battleType & BATTLE_TYPE_DOUBLES) {
        return battleSystem->chatotVoice[battlerId & 1];
    } else {
        return battleSystem->chatotVoice[battlerId];
    }
}

void BattleSystem_TryChangeForm(BattleSystem *battleSystem) {
    int i;
    AlternateForms form;
    Pokemon *mon;
    u16 species;

    if (battleSystem->battleType & BATTLE_TYPE_NO_EXP) {
        return;
    }

    for (i = 0; i < BattleSystem_GetPartySize(battleSystem, BATTLER_PLAYER); i++) {
        mon = BattleSystem_GetPartyMon(battleSystem, BATTLER_PLAYER, i);
        species = GetMonData(mon, MON_DATA_SPECIES_OR_EGG, NULL);
        if (species == SPECIES_BURMY && battleSystem->unk2418[BATTLER_PLAYER] & MaskOfFlagNo(i)) {
            switch (BattleSystem_GetTerrainId(battleSystem)) {
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

void ov12_0223B854(BattleSystem *battleSystem, int battlerId, int selectedMonIndex) {
    battleSystem->unk2418[battlerId] |= MaskOfFlagNo(selectedMonIndex);
}

// used to be related to poketch in dppt
void ov12_0223B870() {
}

void BattleSystem_SetBackground(BattleSystem *battleSystem) {
    NNSG2dImageProxy *image;
    int bgX, bgY, objX, objY, data, i;
    u8 *vram;
    u32 *src;
    u32 *dst;

    battleSystem->unk220 = Heap_Alloc(HEAP_ID_BATTLE, 0x10000);
    battleSystem->unk224 = Heap_Alloc(HEAP_ID_BATTLE, 0x200);

    MIi_CpuCopy32((void *)0x6010000, (u32 *)battleSystem->unk220, 0x10000);
    dst = (u32 *)battleSystem->unk224;
    src = (u32 *)PaletteData_GetUnfadedBuf(battleSystem->palette, PLTTBUF_MAIN_BG);
    MIi_CpuCopy32(src, dst, 0x200);

    vram = (u8 *)0x6400000;
    image = Sprite_GetImageProxy(battleSystem->unk17C[1].unk0->sprite);
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
                    battleSystem->unk220[bgY * 0x800 + bgX * 0x40 + i] = data + 0x70;
                }
            }
        }
    }

    vram = (u8 *)0x6400000;
    image = Sprite_GetImageProxy(battleSystem->unk17C[0].unk0->sprite);
    vram += image->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN];

    for (i = 0; i < 0x800; i++) {
        if (i & 1) {
            data = (vram[i / 2] & 0xF0) >> 4;
        } else {
            data = (vram[i / 2] & 0xF);
        }
        if (data) {
            battleSystem->unk220[0x9800 + i] = data + 0x70;
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
                    battleSystem->unk220[bgY * 0x800 + bgX * 0x40 + i] = data + 0x70;
                }
            }
        }
    }

    BG_LoadCharTilesData(battleSystem->bgConfig, 3, battleSystem->unk220, 0x10000, 0);

    ov12_02266008(&battleSystem->unk17C[0]);
    ov12_02266008(&battleSystem->unk17C[1]);
}

u8 *ov12_0223BAD0(BattleSystem *battleSystem) {
    return battleSystem->unk220;
}

u16 *ov12_0223BAD8(BattleSystem *battleSystem) {
    return battleSystem->unk224;
}

u16 *ov12_0223BAE0(BattleSystem *battleSystem) {
    return &battleSystem->unk2228[0];
}

u16 *ov12_0223BAEC(BattleSystem *battleSystem) {
    return &battleSystem->unk2308[0];
}

int BattleSystem_GetWeather(BattleSystem *battleSystem) {
    return battleSystem->weather;
}

u8 ov12_0223BB04(BattleSystem *battleSystem) {
    return battleSystem->unk2421;
}

void ov12_0223BB10(BattleSystem *battleSystem, u8 a1) {
    battleSystem->unk2421 = a1;
}

int ov12_0223BB1C(BattleSystem *battleSystem) {
    return battleSystem->unk2430;
}

void BattleSystem_GameStatIncrement(BattleSystem *battleSystem, int id) {
    if (battleSystem->battleSpecial & BATTLE_SPECIAL_RECORDING) {
        return;
    }
    GameStats_Inc(battleSystem->gameStats, id);
}

void ov12_0223BB44(BattleSystem *battleSystem) {
    if (battleSystem->battleSpecial & BATTLE_SPECIAL_RECORDING) {
        return;
    }
    GameStats_AddScore(battleSystem->gameStats, SCORE_EVENT_REGISTER_SPECIES_CAUGHT);
}

void ov12_0223BB64(BattleSystem *battleSystem, int a1) {
    battleSystem->unk2440 = a1;
}

void ov12_0223BB6C(BattleSystem *battleSystem, u8 a1) {
    battleSystem->unk2442 = a1;
}

void *ov12_0223BB78(BattleSystem *battleSystem) {
    return battleSystem->unk1BC;
}

void ov12_0223BB80(BattleSystem *battleSystem, void *a1) {
    battleSystem->unk1BC = a1;
}

UnkBattleSystemSub1D0 *ov12_0223BB88(BattleSystem *battleSystem, int index) {
    return &battleSystem->unk1D0[index];
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

void ov12_0223BBF0(BattleSystem *battleSystem, u8 a1) {
    battleSystem->unk23FD = a1;
}

void ov12_0223BBFC(BattleSystem *battleSystem, u8 *a1) {
    battleSystem->unk23F4 = a1;
}

void ov12_0223BC08(BattleSystem *battleSystem, u8 *a1) {
    battleSystem->unk23F8 = a1;
}

void ov12_0223BC14(BattleSystem *battleSystem, u8 a1) {
    *battleSystem->unk23F4 = a1;
}

void ov12_0223BC20(BattleSystem *battleSystem, u8 a1) {
    *battleSystem->unk23F8 = a1;
}

void ov12_0223BC2C(BattleSystem *battleSystem, u8 a1) {
    battleSystem->unk23FE = a1;
}

BattleHpBar *BattleSystem_GetHpBar(BattleSystem *battleSystem, int battlerId) {
    return OpponentData_GetHpBar(battleSystem->opponentData[battlerId]);
}

void BattleSystem_HpBar_Init(BattleSystem *battleSystem) {
    int i;
    BattleHpBar *hpBar;

    for (i = 0; i < battleSystem->maxBattlers; i++) {
        hpBar = OpponentData_GetHpBar(battleSystem->opponentData[i]);
        hpBar->battleSystem = battleSystem;
        hpBar->type = BattleHpBar_Util_GetBarTypeFromBattlerSide(ov12_02261258(battleSystem->opponentData[i]), BattleSystem_GetBattleType(battleSystem));
        BattleHpBar_LoadResources(hpBar);
        BattleHpBar_SetEnabled(hpBar, FALSE);
    }
}

void BattleSystem_SetHpBarEnabled(BattleSystem *battleSystem) {
    int i;
    BattleHpBar *hpBar;

    for (i = 0; i < battleSystem->maxBattlers; i++) {
        hpBar = OpponentData_GetHpBar(battleSystem->opponentData[i]);
        if (hpBar->hp) {
            BattleHpBar_SetEnabled(hpBar, TRUE);
        }
    }
}

void BattleSystem_SetHpBarDisabled(BattleSystem *battleSystem) {
    int i;
    BattleHpBar *hpBar;

    for (i = 0; i < battleSystem->maxBattlers; i++) {
        hpBar = OpponentData_GetHpBar(battleSystem->opponentData[i]);
        BattleHpBar_SetEnabled(hpBar, FALSE);
    }
}

void BattleSystem_HpBar_Delete(BattleSystem *battleSystem) {
    int i;
    BattleHpBar *hpBar;

    for (i = 0; i < battleSystem->maxBattlers; i++) {
        hpBar = OpponentData_GetHpBar(battleSystem->opponentData[i]);
        BattleHpBar_FreeResources(hpBar);
    }
}

u8 BattleSystem_GetBattleOutcomeFlags(BattleSystem *battleSystem) {
    return battleSystem->battleOutcomeFlag;
}

void BattleSystem_SetBattleOutcomeFlags(BattleSystem *battleSystem, u8 battleOutcomeFlag) {
    battleSystem->battleOutcomeFlag = battleOutcomeFlag;
}

u8 BattleSystem_GetCriticalHpMusicFlag(BattleSystem *battleSystem) {
    return battleSystem->criticalHpMusic;
}

void BattleSystem_SetCriticalHpMusicFlag(BattleSystem *battleSystem, u8 flag) {
    battleSystem->criticalHpMusic = flag;
}

u8 BattleSystem_GetCriticalHpMusicDelay(BattleSystem *battleSystem) {
    return battleSystem->criticalHpMusicDelay;
}

void BattleSystem_SetCriticalHpMusicDelay(BattleSystem *battleSystem, u8 delay) {
    GF_ASSERT(delay < 15);
    battleSystem->criticalHpMusicDelay = delay;
}

void ov12_0223BD8C(BattleSystem *battleSystem, int a1) {
    battleSystem->unk243C = a1;
}

u16 BattleSystem_Random(BattleSystem *battleSystem) {
    battleSystem->rand = battleSystem->rand * 1103515245L + 24691;
    return battleSystem->rand / 65536L;
}

u32 BattleSystem_GetRandTemp(BattleSystem *battleSystem) {
    return battleSystem->randTemp;
}

void BattleSystem_SetRandTemp(BattleSystem *battleSystem, u32 temp) {
    battleSystem->randTemp = temp;
}

void ov12_0223BDDC(BattleSystem *battleSystem, int battlerId, u8 data) {
    if (!(battleSystem->battleSpecial & BATTLE_SPECIAL_RECORDING) && battleSystem->unk245C[battlerId] < 1024) {
        sub_02030260(battlerId, battleSystem->unk245C[battlerId], data);
        battleSystem->unk245C[battlerId]++;
    }
}

BOOL ov12_0223BE0C(BattleSystem *battleSystem, int battlerId, u8 *data) {
    BOOL ret;
    *data = 0xFF;
    if ((battleSystem->battleSpecial & BATTLE_SPECIAL_RECORDING) && (battleSystem->unk245C[battlerId] < 1024)) {
        *data = sub_0203027C(battlerId, battleSystem->unk245C[battlerId]);
        battleSystem->unk245C[battlerId]++;
        ret = FALSE;
    } else if ((battleSystem->battleSpecial & BATTLE_SPECIAL_RECORDING) && battleSystem->unk245C[battlerId] >= 1024) {
        ret = TRUE;
    }
    return ret;
}

u8 ov12_0223BE68(BattleSystem *battleSystem, u8 *buffer) {
    u8 i;
    u8 battlerId;
    u8 index = 0;

    for (battlerId = 0; battlerId < battleSystem->maxBattlers; battlerId++) {
        if (battleSystem->unk245C[battlerId] != battleSystem->unk244C[battlerId]) {
            buffer[index++] = battlerId;
            buffer[index++] = battleSystem->unk245C[battlerId] - battleSystem->unk244C[battlerId];
            for (i = 0; i < battleSystem->unk245C[battlerId] - battleSystem->unk244C[battlerId]; i++) {
                buffer[index++] = sub_0203027C(battlerId, battleSystem->unk244C[battlerId] + i);
            }
            battleSystem->unk244C[battlerId] = battleSystem->unk245C[battlerId];
        }
    }

    GF_ASSERT(index <= 28);

    return index;
}

void ov12_0223BF14(BattleSystem *battleSystem, u16 size, u8 *buffer) {
    int i;
    u8 battlerId;
    u8 byte;
    u8 index = 0;

    if (!(battleSystem->battleType & BATTLE_TYPE_LINK)) {
        return;
    }

    if (battleSystem->unk23FC) {
        return;
    }

    while (size) {
        battlerId = ov12_0223BFB0(buffer, &index, &size);
        byte = ov12_0223BFB0(buffer, &index, &size);
        for (i = 0; i < byte; i++) {
            sub_02030260(battlerId, battleSystem->unk2454[battlerId] + i, ov12_0223BFB0(buffer, &index, &size));
        }
        battleSystem->unk2454[battlerId] += byte;
    }
}

static u8 ov12_0223BFB0(u8 *buffer, u8 *index, u16 *size) {
    (*size)--;
    return buffer[(*index)++];
}

u16 ov12_0223BFC0(BattleSystem *battleSystem) {
    return battleSystem->unk2446;
}

int ov12_0223BFCC(BattleSystem *battleSystem, u16 battlerId) {
    return battleSystem->unk2464[battlerId];
}

u16 BattleSystem_GetTrainerItem(BattleSystem *battleSystem, int battlerId, int index) {
    return battleSystem->trainers[battlerId].data.items[index];
}

BOOL BattleSystem_IsRecordingPaused(BattleSystem *battleSystem) {
    return battleSystem->isRecordingPaused;
}

void ov12_0223BFFC(BattleSystem *battleSystem, u32 flag) {
    if (!(battleSystem->battleSpecial & BATTLE_SPECIAL_RECORDING) || battleSystem->isRecordingPaused || ov12_022581D4(battleSystem, battleSystem->ctx, 13, 0) == 44 || ov12_022581D4(battleSystem, battleSystem->ctx, 14, 0) == 44) {
        return;
    }

    BattleInput_PrintSystemMessage(battleSystem->battleInput, flag);
    BeginNormalPaletteFade(3, 0, 0, RGB_BLACK, 16, 2, HEAP_ID_BATTLE);
    Sound_Stop();
    Sound_SetMasterVolume(0);
    battleSystem->isRecordingPaused = TRUE;
}

BOOL ov12_0223C080(BattleSystem *battleSystem) {
    if (!(battleSystem->battleSpecial & BATTLE_SPECIAL_RECORDING) || battleSystem->isRecordingPaused || ov12_022581D4(battleSystem, battleSystem->ctx, 13, 0) == 44 || ov12_022581D4(battleSystem, battleSystem->ctx, 14, 0) == 44) {
        return FALSE;
    }
    return TRUE;
}

void ov12_0223C0C4(BattleSystem *battleSystem) {
    if (!(battleSystem->battleSpecial & BATTLE_SPECIAL_RECORDING) || battleSystem->unk247C) {
        return;
    }
    battleSystem->unk247C = ov12_0226BEC4(battleSystem);
}

u8 BattleSystem_GetChatotVoiceParam(BattleSystem *battleSystem, int battlerId) {
    if ((battleSystem->battleType & BATTLE_TYPE_MULTI) || ((battleSystem->battleType & BATTLE_TYPE_TAG) && (ov12_0223AB0C(battleSystem, battlerId) & 1))) {
        return battleSystem->chatotVoiceParam[battlerId];
    } else if (battleSystem->battleType & BATTLE_TYPE_DOUBLES) {
        return battleSystem->chatotVoiceParam[battlerId & 1];
    } else {
        return battleSystem->chatotVoiceParam[battlerId];
    }
}

Pokemon *BattleSystem_GetBugContestCaughtMon(BattleSystem *battleSystem) {
    return battleSystem->bugContestCaughtMon;
}

u8 ov12_0223C140(BattleSystem *battleSystem, u32 battlerId) {
    if (battlerId >= 4) {
        return 0xFF;
    }
    if (battleSystem->battleType & (BATTLE_TYPE_LINK | BATTLE_TYPE_SAFARI | BATTLE_TYPE_FRONTIER | BATTLE_TYPE_PAL_PARK)) {
        return 0xFF;
    }

    if ((battleSystem->battleType & BATTLE_TYPE_DOUBLES) && (ov12_0223AB0C(battleSystem, battlerId) & 1)) {
        return 0xFF;
    }

    if (battleSystem->battleType & BATTLE_TYPE_MULTI) {
        return battleSystem->unk248C[battlerId];
    }
    if (battleSystem->battleType & BATTLE_TYPE_DOUBLES) {
        return battleSystem->unk248C[battlerId & 1];
    }
    return battleSystem->unk248C[battlerId];
}

void ov12_0223C1A0(BattleSystem *battleSystem, u8 *buffer) {
    int i;
    for (i = 0; i < battleSystem->maxBattlers; i++) {
        buffer[ov12_02261258(battleSystem->opponentData[i])] = i;
    }
}

void ov12_0223C1C4(BattleSystem *battleSystem, u8 *buffer) {
    int i;

    for (i = 0; i < 4; i++) {
        buffer[i] = 0xFF;
    }

    for (i = 0; i < battleSystem->maxBattlers; i++) {
        buffer[i] = ov12_02261258(battleSystem->opponentData[i]);
    }
}

void ov12_0223C1F4(BattleSystem *battleSystem, void **a1) {
    int i;

    for (i = 0; i < 4; i++) {
        a1[i] = NULL;
    }

    for (i = 0; i < battleSystem->maxBattlers; i++) {
        a1[i] = ov12_02261270(battleSystem->opponentData[i]);
    }
}

void ov12_0223C224(BattleSystem *battleSystem, int a1) {
    int i;
    BattleHpBar *hpBar;

    for (i = 0; i < battleSystem->maxBattlers; i++) {
        hpBar = OpponentData_GetHpBar(battleSystem->opponentData[i]);
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

void BattleSystem_SetPokedexSeen(BattleSystem *battleSystem, int battlerId) {
    u32 flag = ov12_02261258(battleSystem->opponentData[battlerId]);
    Pokemon *mon = BattleSystem_GetPartyMon(battleSystem, battlerId, ov12_022581D4(battleSystem, battleSystem->ctx, 2, battlerId));

    if (!(battleSystem->battleType & (BATTLE_TYPE_LINK | BATTLE_TYPE_FRONTIER))) {
        if ((flag & 1) || battleSystem->battleType == (BATTLE_TYPE_AI | BATTLE_TYPE_DOUBLES | BATTLE_TYPE_MULTI) || battleSystem->battleType == (BATTLE_TYPE_TRAINER | BATTLE_TYPE_AI | BATTLE_TYPE_DOUBLES | BATTLE_TYPE_MULTI)) {
            Pokedex_SetMonSeenFlag(battleSystem->pokedex, mon);
        }
    }
    if (!(flag & 1) && GetMonData(mon, MON_DATA_SPECIES_OR_EGG, NULL) == SPECIES_BURMY) {
        Pokedex_SetMonCaughtFlag(battleSystem->pokedex, mon);
    }
}

void BattleSystem_SetPokedexCaught(BattleSystem *battleSystem, int battlerId) {
    u32 flag = ov12_02261258(battleSystem->opponentData[battlerId]);

    if (!(battleSystem->battleType & (BATTLE_TYPE_LINK | BATTLE_TYPE_FRONTIER)) && (flag & 1)) {
        int selectedMonIndex = ov12_022581D4(battleSystem, battleSystem->ctx, 2, battlerId);
        Pokemon *mon = BattleSystem_GetPartyMon(battleSystem, battlerId, selectedMonIndex);
        Pokedex_SetMonCaughtFlag(battleSystem->pokedex, mon);
    }
}

BOOL BattleSystem_CheckMonCaught(BattleSystem *battleSystem, int battlerId) {
    return Pokedex_CheckMonCaughtFlag(battleSystem->pokedex, battlerId);
}

void BattleSystem_SetDefaultBlend() {
    G2_BlendNone();
}

u8 BattleSystem_PrintTrainerMessage(BattleSystem *battleSystem, int trainerId, int battlerId, int a2, int delay) {
    Window *window = BattleSystem_GetWindow(battleSystem, 0);
    int index;

    if (battleSystem->battleType & BATTLE_TYPE_FRONTIER) {
        if (trainerId == 0x2710 || battleSystem->battleType & BATTLE_TYPE_13) {
            String *msg;

            if (a2 == 0x64) {
                msg = MailMsg_GetExpandedString(&battleSystem->trainers[battlerId].winMessage, HEAP_ID_BATTLE);
            } else {
                msg = MailMsg_GetExpandedString(&battleSystem->trainers[battlerId].loseMessage, HEAP_ID_BATTLE);
            }
            FillWindowPixelBuffer(window, 0xFF);
            String_Copy(battleSystem->msgBuffer, msg);
            index = AddTextPrinterParameterized(window, 1, battleSystem->msgBuffer, 0, 0, delay, ov12_0223CF14);
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
                if (PlayerProfile_GetVersion(battleSystem->playerProfile[i]) == 0) {
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
            String_Copy(battleSystem->msgBuffer, msg);
            index = AddTextPrinterParameterized(window, 1, battleSystem->msgBuffer, 0, 0, delay, ov12_0223CF14);
            String_Delete(msg);
            DestroyMsgData(data);
        }
    } else {
        GetTrainerMessageByIdPair(trainerId, a2, battleSystem->msgBuffer, HEAP_ID_BATTLE);
        FillWindowPixelBuffer(window, 0xFF);
        index = AddTextPrinterParameterized(window, 1, battleSystem->msgBuffer, 0, 0, delay, ov12_0223CF14);
    }
    return index;
}

u32 BattleSystem_PrintBattleMessage(BattleSystem *battleSystem, MsgData *data, BattleMessage *msg, u8 delay) {
    Window *window = BattleSystem_GetWindow(battleSystem, 0);
    BattleSystem_AdjustMessageForSide(battleSystem, msg);
    BattleSystem_BufferMessage(battleSystem, msg);
    BattleMessage_ExpandPlaceholders(battleSystem, data, msg);
    FillWindowPixelBuffer(window, 0xFF);
    return AddTextPrinterParameterized(window, 1, battleSystem->msgBuffer, 0, 0, delay, ov12_0223CF14);
}

u32 ov12_0223C4E8(BattleSystem *battleSystem, Window *window, MsgData *data, BattleMessage *msg, int x, int y, int flag, int width, int delay) {
    int dx;

    BattleSystem_AdjustMessageForSide(battleSystem, msg);
    BattleSystem_BufferMessage(battleSystem, msg);
    BattleMessage_ExpandPlaceholders(battleSystem, data, msg);

    if (flag & 1) {
        FillWindowPixelBuffer(window, 0xFF);
    }

    if (flag & 2) {
        dx = width - FontID_String_GetWidth(0, battleSystem->msgBuffer, 0);
    } else {
        dx = 0;
    }

    return AddTextPrinterParameterized(window, 0, battleSystem->msgBuffer, x + dx, y, delay, ov12_0223CF14);
}

static void BattleSystem_AdjustMessageForSide(BattleSystem *battleSystem, BattleMessage *msg) {
    u32 battleType = BattleSystem_GetBattleType(battleSystem);

    if (msg->tag & 0x80) {
        return;
    }

    if (msg->tag & 0x40) {
        if (BattleSystem_GetFieldSide(battleSystem, msg->battlerId)) {
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
        if (BattleSystem_GetFieldSide(battleSystem, msg->param[0] & 0xFF)) {
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
        if (BattleSystem_GetFieldSide(battleSystem, msg->param[0] & 0xFF)) {
            msg->id++;
            if (battleType & BATTLE_TYPE_TRAINER) {
                msg->id++;
            }
        }
        break;
    case TAG_MOVE_SIDE:
        if (BattleSystem_GetFieldSide(battleSystem, msg->param[1] & 0xFF)) {
            msg->id++;
        }
        break;
    case TAG_MOVE_NICKNAME:
    case TAG_ABILITY_NICKNAME:
    case TAG_ITEM_NICKNAME_FLAVOR:
        if (BattleSystem_GetFieldSide(battleSystem, msg->param[1] & 0xFF)) {
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
        if (BattleSystem_GetFieldSide(battleSystem, msg->param[0] & 0xFF)) {
            msg->id += 3;
            if (battleType & BATTLE_TYPE_TRAINER) {
                msg->id += 2;
            }
            if (BattleSystem_GetFieldSide(battleSystem, msg->param[1] & 0xFF)) {
                msg->id++;
            }
        } else if (BattleSystem_GetFieldSide(battleSystem, msg->param[1] & 0xFF)) {
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
        if (BattleSystem_GetFieldSide(battleSystem, msg->param[0] & 0xFF)) {
            msg->id += 3;
            if (battleType & BATTLE_TYPE_TRAINER) {
                msg->id += 2;
            }
            if (BattleSystem_GetFieldSide(battleSystem, msg->param[2] & 0xFF)) {
                msg->id++;
            }
        } else if (BattleSystem_GetFieldSide(battleSystem, msg->param[2] & 0xFF)) {
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

static void BattleSystem_BufferMessage(BattleSystem *battleSystem, BattleMessage *msg) {
    switch (msg->tag & 0x3F) {
    case TAG_NONE:
    case TAG_NONE_SIDE:
        break;
    case TAG_NICKNAME:
        BattleMessage_BufferNickname(battleSystem, 0, msg->param[0]);
        break;
    case TAG_MOVE:
    case TAG_MOVE_SIDE:
        BattleMessage_BufferMove(battleSystem, 0, msg->param[0]);
        break;
    case TAG_STAT:
        BattleMessage_BufferStat(battleSystem, 0, msg->param[0]);
        break;
    case TAG_ITEM:
        BattleMessage_BufferItem(battleSystem, 0, msg->param[0]);
        break;
    case TAG_NUMBER:
        BattleMessage_BufferNumber(battleSystem, 0, msg->param[0]);
        break;
    case TAG_NUMBERS:
        BattleMessage_BufferNumbers(battleSystem, 0, msg->param[0], msg->numDigits);
        break;
    case TAG_TRNAME:
        BattleMessage_BufferTrainerName(battleSystem, 0, msg->param[0]);
        break;
    case TAG_NICKNAME_NICKNAME:
        BattleMessage_BufferNickname(battleSystem, 0, msg->param[0]);
        BattleMessage_BufferNickname(battleSystem, 1, msg->param[1]);
        break;
    case TAG_NICKNAME_MOVE:
        BattleMessage_BufferNickname(battleSystem, 0, msg->param[0]);
        BattleMessage_BufferMove(battleSystem, 1, msg->param[1]);
        break;
    case TAG_NICKNAME_ABILITY:
        BattleMessage_BufferNickname(battleSystem, 0, msg->param[0]);
        BattleMessage_BufferAbility(battleSystem, 1, msg->param[1]);
        break;
    case TAG_NICKNAME_STAT:
        BattleMessage_BufferNickname(battleSystem, 0, msg->param[0]);
        BattleMessage_BufferStat(battleSystem, 1, msg->param[1]);
        break;
    case TAG_NICKNAME_TYPE:
        BattleMessage_BufferNickname(battleSystem, 0, msg->param[0]);
        BattleMessage_BufferType(battleSystem, 1, msg->param[1]);
        break;
    case TAG_NICKNAME_POKE:
        BattleMessage_BufferNickname(battleSystem, 0, msg->param[0]);
        BattleMessage_BufferPokemon(battleSystem, 1, msg->param[1]);
        break;
    case TAG_NICKNAME_ITEM:
        BattleMessage_BufferNickname(battleSystem, 0, msg->param[0]);
        BattleMessage_BufferItem(battleSystem, 1, msg->param[1]);
        break;
    case TAG_NICKNAME_POFFIN: // unused
        BattleMessage_BufferNickname(battleSystem, 0, msg->param[0]);
        BattleMessage_BufferPoffin(battleSystem, 1, msg->param[1]);
        break;
    case TAG_NICKNAME_NUM:
        BattleMessage_BufferNickname(battleSystem, 0, msg->param[0]);
        BattleMessage_BufferNumber(battleSystem, 1, msg->param[1]);
        break;
    case TAG_NICKNAME_TRNAME:
        BattleMessage_BufferNickname(battleSystem, 0, msg->param[0]);
        BattleMessage_BufferTrainerName(battleSystem, 1, msg->param[1]);
        break;
    case TAG_NICKNAME_BOX:
        BattleMessage_BufferNickname(battleSystem, 0, msg->param[0]);
        BattleMessage_BufferBoxName(battleSystem, 1, msg->param[1]);
        break;
    case TAG_MOVE_NICKNAME:
        BattleMessage_BufferMove(battleSystem, 0, msg->param[0]);
        BattleMessage_BufferNickname(battleSystem, 1, msg->param[1]);
        break;
    case TAG_MOVE_MOVE:
        BattleMessage_BufferMove(battleSystem, 0, msg->param[0]);
        BattleMessage_BufferMove(battleSystem, 1, msg->param[1]);
        break;
    case TAG_ABILITY_NICKNAME:
        BattleMessage_BufferAbility(battleSystem, 0, msg->param[0]);
        BattleMessage_BufferNickname(battleSystem, 1, msg->param[1]);
        break;
    case TAG_ITEM_MOVE:
        BattleMessage_BufferItem(battleSystem, 0, msg->param[0]);
        BattleMessage_BufferMove(battleSystem, 1, msg->param[1]);
        break;
    case TAG_NUMBER_NUMBER:
        BattleMessage_BufferNumber(battleSystem, 0, msg->param[0]);
        BattleMessage_BufferNumber(battleSystem, 1, msg->param[1]);
        break;
    case TAG_TRNAME_TRNAME:
        BattleMessage_BufferTrainerName(battleSystem, 0, msg->param[0]);
        BattleMessage_BufferTrainerName(battleSystem, 1, msg->param[1]);
        break;
    case TAG_TRNAME_NICKNAME:
        BattleMessage_BufferTrainerName(battleSystem, 0, msg->param[0]);
        BattleMessage_BufferNickname(battleSystem, 1, msg->param[1]);
        break;
    case TAG_TRNAME_ITEM:
        BattleMessage_BufferTrainerName(battleSystem, 0, msg->param[0]);
        BattleMessage_BufferItem(battleSystem, 1, msg->param[1]);
        break;
    case TAG_TRNAME_NUM:
        BattleMessage_BufferTrainerName(battleSystem, 0, msg->param[0]);
        BattleMessage_BufferNumber(battleSystem, 1, msg->param[1]);
        break;
    case TAG_TRCLASS_TRNAME:
        BattleMessage_BufferTrainerClass(battleSystem, 0, msg->param[0]);
        BattleMessage_BufferTrainerName(battleSystem, 1, msg->param[1]);
        break;
    case TAG_NICKNAME_NICKNAME_MOVE:
        BattleMessage_BufferNickname(battleSystem, 0, msg->param[0]);
        BattleMessage_BufferNickname(battleSystem, 1, msg->param[1]);
        BattleMessage_BufferMove(battleSystem, 2, msg->param[2]);
        break;
    case TAG_NICKNAME_NICKNAME_ABILITY:
        BattleMessage_BufferNickname(battleSystem, 0, msg->param[0]);
        BattleMessage_BufferNickname(battleSystem, 1, msg->param[1]);
        BattleMessage_BufferAbility(battleSystem, 2, msg->param[2]);
        break;
    case TAG_NICKNAME_NICKNAME_ITEM:
        BattleMessage_BufferNickname(battleSystem, 0, msg->param[0]);
        BattleMessage_BufferNickname(battleSystem, 1, msg->param[1]);
        BattleMessage_BufferItem(battleSystem, 2, msg->param[2]);
        break;
    case TAG_NICKNAME_MOVE_MOVE:
        BattleMessage_BufferNickname(battleSystem, 0, msg->param[0]);
        BattleMessage_BufferMove(battleSystem, 1, msg->param[1]);
        BattleMessage_BufferMove(battleSystem, 2, msg->param[2]);
        break;
    case TAG_NICKNAME_MOVE_NUMBER:
        BattleMessage_BufferNickname(battleSystem, 0, msg->param[0]);
        BattleMessage_BufferMove(battleSystem, 1, msg->param[1]);
        BattleMessage_BufferNumber(battleSystem, 2, msg->param[2]);
        break;
    case TAG_NICKNAME_ABILITY_NICKNAME:
        BattleMessage_BufferNickname(battleSystem, 0, msg->param[0]);
        BattleMessage_BufferAbility(battleSystem, 1, msg->param[1]);
        BattleMessage_BufferNickname(battleSystem, 2, msg->param[2]);
        break;
    case TAG_NICKNAME_ABILITY_MOVE:
        BattleMessage_BufferNickname(battleSystem, 0, msg->param[0]);
        BattleMessage_BufferAbility(battleSystem, 1, msg->param[1]);
        BattleMessage_BufferMove(battleSystem, 2, msg->param[2]);
        break;
    case TAG_NICKNAME_ABILITY_ITEM:
        BattleMessage_BufferNickname(battleSystem, 0, msg->param[0]);
        BattleMessage_BufferAbility(battleSystem, 1, msg->param[1]);
        BattleMessage_BufferItem(battleSystem, 2, msg->param[2]);
        break;
    case TAG_NICKNAME_ABILITY_STAT:
        BattleMessage_BufferNickname(battleSystem, 0, msg->param[0]);
        BattleMessage_BufferAbility(battleSystem, 1, msg->param[1]);
        BattleMessage_BufferStat(battleSystem, 2, msg->param[2]);
        break;
    case TAG_NICKNAME_ABILITY_TYPE:
        BattleMessage_BufferNickname(battleSystem, 0, msg->param[0]);
        BattleMessage_BufferAbility(battleSystem, 1, msg->param[1]);
        BattleMessage_BufferType(battleSystem, 2, msg->param[2]);
        break;
    case TAG_NICKNAME_ABILITY_STATUS:
        BattleMessage_BufferNickname(battleSystem, 0, msg->param[0]);
        BattleMessage_BufferAbility(battleSystem, 1, msg->param[1]);
        BattleMessage_BufferStatus(battleSystem, 2, msg->param[2]);
        break;
    case TAG_NICKNAME_ABILITY_NUMBER:
        BattleMessage_BufferNickname(battleSystem, 0, msg->param[0]);
        BattleMessage_BufferAbility(battleSystem, 1, msg->param[1]);
        BattleMessage_BufferNumber(battleSystem, 2, msg->param[2]);
        break;
    case TAG_NICKNAME_ITEM_NICKNAME:
        BattleMessage_BufferNickname(battleSystem, 0, msg->param[0]);
        BattleMessage_BufferItem(battleSystem, 1, msg->param[1]);
        BattleMessage_BufferNickname(battleSystem, 2, msg->param[2]);
        break;
    case TAG_NICKNAME_ITEM_MOVE:
        BattleMessage_BufferNickname(battleSystem, 0, msg->param[0]);
        BattleMessage_BufferItem(battleSystem, 1, msg->param[1]);
        BattleMessage_BufferMove(battleSystem, 2, msg->param[2]);
        break;
    case TAG_NICKNAME_ITEM_STAT:
        BattleMessage_BufferNickname(battleSystem, 0, msg->param[0]);
        BattleMessage_BufferItem(battleSystem, 1, msg->param[1]);
        BattleMessage_BufferStat(battleSystem, 2, msg->param[2]);
        break;
    case TAG_NICKNAME_ITEM_STATUS:
        BattleMessage_BufferNickname(battleSystem, 0, msg->param[0]);
        BattleMessage_BufferItem(battleSystem, 1, msg->param[1]);
        BattleMessage_BufferStatus(battleSystem, 2, msg->param[2]);
        break;
    case TAG_NICKNAME_BOX_BOX:
        BattleMessage_BufferNickname(battleSystem, 0, msg->param[0]);
        BattleMessage_BufferBoxName(battleSystem, 1, msg->param[1]);
        BattleMessage_BufferBoxName(battleSystem, 2, msg->param[2]);
        break;
    case TAG_ITEM_NICKNAME_FLAVOR:
        BattleMessage_BufferItem(battleSystem, 0, msg->param[0]);
        BattleMessage_BufferNickname(battleSystem, 1, msg->param[1]);
        BattleMessage_BufferFlavorPreference(battleSystem, 2, msg->param[2]);
        break;
    case TAG_TRNAME_NICKNAME_NICKNAME:
        BattleMessage_BufferTrainerName(battleSystem, 0, msg->param[0]);
        BattleMessage_BufferNickname(battleSystem, 1, msg->param[1]);
        BattleMessage_BufferNickname(battleSystem, 2, msg->param[2]);
        break;
    case TAG_TRCLASS_TRNAME_NICKNAME:
        BattleMessage_BufferTrainerClass(battleSystem, 0, msg->param[0]);
        BattleMessage_BufferTrainerName(battleSystem, 1, msg->param[1]);
        BattleMessage_BufferNickname(battleSystem, 2, msg->param[2]);
        break;
    case TAG_TRCLASS_TRNAME_ITEM:
        BattleMessage_BufferTrainerClass(battleSystem, 0, msg->param[0]);
        BattleMessage_BufferTrainerName(battleSystem, 1, msg->param[1]);
        BattleMessage_BufferItem(battleSystem, 2, msg->param[2]);
        break;
    case TAG_NICKNAME_ABILITY_NICKNAME_MOVE:
        BattleMessage_BufferNickname(battleSystem, 0, msg->param[0]);
        BattleMessage_BufferAbility(battleSystem, 1, msg->param[1]);
        BattleMessage_BufferNickname(battleSystem, 2, msg->param[2]);
        BattleMessage_BufferMove(battleSystem, 3, msg->param[3]);
        break;
    case TAG_NICKNAME_ABILITY_NICKNAME_ABILITY:
        BattleMessage_BufferNickname(battleSystem, 0, msg->param[0]);
        BattleMessage_BufferAbility(battleSystem, 1, msg->param[1]);
        BattleMessage_BufferNickname(battleSystem, 2, msg->param[2]);
        BattleMessage_BufferAbility(battleSystem, 3, msg->param[3]);
        break;
    case TAG_NICKNAME_ABILITY_NICKNAME_STAT:
        BattleMessage_BufferNickname(battleSystem, 0, msg->param[0]);
        BattleMessage_BufferAbility(battleSystem, 1, msg->param[1]);
        BattleMessage_BufferNickname(battleSystem, 2, msg->param[2]);
        BattleMessage_BufferStat(battleSystem, 3, msg->param[3]);
        break;
    case TAG_NICKNAME_ITEM_NICKNAME_ITEM:
        BattleMessage_BufferNickname(battleSystem, 0, msg->param[0]);
        BattleMessage_BufferItem(battleSystem, 1, msg->param[1]);
        BattleMessage_BufferNickname(battleSystem, 2, msg->param[2]);
        BattleMessage_BufferItem(battleSystem, 3, msg->param[3]);
        break;
    case TAG_TRNAME_NICKNAME_TRNAME_NICKNAME:
        BattleMessage_BufferTrainerName(battleSystem, 0, msg->param[0]);
        BattleMessage_BufferNickname(battleSystem, 1, msg->param[1]);
        BattleMessage_BufferTrainerName(battleSystem, 2, msg->param[2]);
        BattleMessage_BufferNickname(battleSystem, 3, msg->param[3]);
        break;
    case TAG_TRCLASS_TRNAME_NICKNAME_NICKNAME:
        BattleMessage_BufferTrainerClass(battleSystem, 0, msg->param[0]);
        BattleMessage_BufferTrainerName(battleSystem, 1, msg->param[1]);
        BattleMessage_BufferNickname(battleSystem, 2, msg->param[2]);
        BattleMessage_BufferNickname(battleSystem, 3, msg->param[3]);
        break;
    case TAG_TRCLASS_TRNAME_NICKNAME_TRNAME:
        BattleMessage_BufferTrainerClass(battleSystem, 0, msg->param[0]);
        BattleMessage_BufferTrainerName(battleSystem, 1, msg->param[1]);
        BattleMessage_BufferNickname(battleSystem, 2, msg->param[2]);
        BattleMessage_BufferTrainerName(battleSystem, 3, msg->param[3]);
        break;
    case TAG_TRCLASS_TRNAME_TRCLASS_TRNAME:
        BattleMessage_BufferTrainerClass(battleSystem, 0, msg->param[0]);
        BattleMessage_BufferTrainerName(battleSystem, 1, msg->param[1]);
        BattleMessage_BufferTrainerClass(battleSystem, 2, msg->param[2]);
        BattleMessage_BufferTrainerName(battleSystem, 3, msg->param[3]);
        break;
    case TAG_TRCLASS_TRNAME_NICKNAME_TRCLASS_TRNAME_NICKNAME:
        BattleMessage_BufferTrainerClass(battleSystem, 0, msg->param[0]);
        BattleMessage_BufferTrainerName(battleSystem, 1, msg->param[1]);
        BattleMessage_BufferNickname(battleSystem, 2, msg->param[2]);
        BattleMessage_BufferTrainerClass(battleSystem, 3, msg->param[3]);
        BattleMessage_BufferTrainerName(battleSystem, 4, msg->param[4]);
        BattleMessage_BufferNickname(battleSystem, 5, msg->param[5]);
        break;
    default:
        GF_ASSERT(FALSE);
    }
}

static void BattleMessage_BufferNickname(BattleSystem *battleSystem, int bufferIndex, int param) {
    Pokemon *mon = BattleSystem_GetPartyMon(battleSystem, param & 0xFF, (param & 0xFF00) >> 8);
    BufferBoxMonNickname(battleSystem->msgFormat, bufferIndex, &mon->box);
}

static void BattleMessage_BufferMove(BattleSystem *battleSystem, int bufferIndex, int param) {
    BufferMoveName(battleSystem->msgFormat, bufferIndex, param);
}

static void BattleMessage_BufferItem(BattleSystem *battleSystem, int bufferIndex, int param) {
    BufferItemName(battleSystem->msgFormat, bufferIndex, param);
}

static void BattleMessage_BufferNumber(BattleSystem *battleSystem, int bufferIndex, int param) {
    BufferIntegerAsString(battleSystem->msgFormat, bufferIndex, param, 5, PRINTING_MODE_LEFT_ALIGN, TRUE);
}

static void BattleMessage_BufferNumbers(BattleSystem *battleSystem, int bufferIndex, int param, int numDigits) {
    if (numDigits) {
        BufferIntegerAsString(battleSystem->msgFormat, bufferIndex, param, numDigits, PRINTING_MODE_RIGHT_ALIGN, TRUE);
    } else {
        BufferIntegerAsString(battleSystem->msgFormat, bufferIndex, param, 5, PRINTING_MODE_RIGHT_ALIGN, TRUE);
    }
}

static void BattleMessage_BufferType(BattleSystem *battleSystem, int bufferIndex, int param) {
    BufferTypeName(battleSystem->msgFormat, bufferIndex, param);
}

static void BattleMessage_BufferAbility(BattleSystem *battleSystem, int bufferIndex, int param) {
    BufferAbilityName(battleSystem->msgFormat, bufferIndex, param);
}

static void BattleMessage_BufferStat(BattleSystem *battleSystem, int bufferIndex, int param) {
    BufferStatName(battleSystem->msgFormat, bufferIndex, param);
}

static void BattleMessage_BufferStatus(BattleSystem *battleSystem, int bufferIndex, int param) {
    BufferStatusName(battleSystem->msgFormat, bufferIndex, param);
}

static void BattleMessage_BufferPokemon(BattleSystem *battleSystem, int bufferIndex, int param) {
    Pokemon *mon = BattleSystem_GetPartyMon(battleSystem, param & 0xFF, (param & 0xFF00) >> 8);
    BufferBoxMonSpeciesName(battleSystem->msgFormat, bufferIndex, &mon->box);
}

static void BattleMessage_BufferPoffin(BattleSystem *battleSystem, int bufferIndex, int param) {
    // poffins don't exist in HGSS
}

static void BattleMessage_BufferFlavorPreference(BattleSystem *battleSystem, int bufferIndex, int param) {
    BufferFlavorDislikeText(battleSystem->msgFormat, bufferIndex, param);
}

static void BattleMessage_BufferTrainerClass(BattleSystem *battleSystem, int bufferIndex, int param) {
    Trainer *trainer = BattleSystem_GetTrainer(battleSystem, param);
    BufferTrainerClassNameFromDataStruct(battleSystem->msgFormat, bufferIndex, trainer);
}

static void BattleMessage_BufferTrainerName(BattleSystem *battleSystem, int bufferIndex, int param) {
    Trainer *trainer = BattleSystem_GetTrainer(battleSystem, param);
    BufferTrainerNameFromDataStruct(battleSystem->msgFormat, bufferIndex, trainer);
}

static void BattleMessage_BufferBoxName(BattleSystem *battleSystem, int bufferIndex, int param) {
    BufferPCBoxName(battleSystem->msgFormat, bufferIndex, battleSystem->storage, param);
}

static void BattleMessage_ExpandPlaceholders(BattleSystem *battleSystem, MsgData *data, BattleMessage *msg) {
    String *str = NewString_ReadMsgData(data, msg->id);
    StringExpandPlaceholders(battleSystem->msgFormat, battleSystem->msgBuffer, str);
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
