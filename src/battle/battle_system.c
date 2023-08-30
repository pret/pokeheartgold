#include "global.h"
#include "battle/battle_hp_bar.h"
#include "battle/battle_controller_opponent.h"
#include "battle/battle_system.h"
#include "party.h"
#include "pokemon_mood.h"
#include "battle/overlay_12_0224E4FC.h"
#include "battle/overlay_12_0226BEC4.h"
#include "constants/game_stat.h"
#include "unk_0202FBCC.h"
#include "unk_0200FA24.h"
#include "unk_02005D10.h"

static u8 ov12_0223BFB0(u8 *buffer, u8 *index, u16 *size);

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
        return Party_GetCount(bsys->trainerParty[battlerId]);
    } else if (bsys->battleType & BATTLE_TYPE_DOUBLES) {
        return Party_GetCount(bsys->trainerParty[battlerId & 1]);
    } else {
        return Party_GetCount(bsys->trainerParty[battlerId]);
    }
}

Pokemon *BattleSystem_GetPartyMon(BattleSystem *bsys, int battlerId, int index) {
    if ((bsys->battleType & BATTLE_TYPE_MULTI) || ((bsys->battleType & BATTLE_TYPE_INGAME_PARTNER) && (ov12_0223AB0C(bsys, battlerId) & 1))) {
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

PC_STORAGE *BattleSystem_GetPcStorage(BattleSystem *bsys) {
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
    
    if (BattleSystem_GetBattleType(bsys) == (BATTLE_TYPE_DOUBLES | BATTLE_TYPE_TRAINER) || ((BattleSystem_GetBattleType(bsys) & BATTLE_TYPE_INGAME_PARTNER) && !(ov12_0223AB0C(bsys, battlerId) & 1))) {
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
            if (data & STATUS2_ATTRACT_ALL) {
                data &= ~STATUS2_ATTRACT_ALL;
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
        if (GetMonData(mon, MON_DATA_MOVE1PP + movePos, NULL) != GetMonData(mon, MON_DATA_MOVE1MAXPP + movePos, NULL)) {
            AddMonData(mon, MON_DATA_MOVE1PP + movePos, data);
            if (index1 == selectedMonIndex || index2 == selectedMonIndex) {
                if (!(GetBattlerVar(ctx, battlerId, BMON_DATA_STATUS2, NULL) & STATUS2_TRANSFORMED) && !(GetBattlerVar(ctx, battlerId, BMON_DATA_MIMICED_MOVE, NULL) & MaskOfFlagNo(movePos))) {
                    AddBattlerVar(ctx, battlerId, BMON_DATA_MOVE1PP + movePos, data);
                }
            }
            ret = TRUE;
        }
    }

    if (GetItemAttr(item, ITEMATTR_PP_RESTORE_ALL, HEAP_ID_BATTLE)) {
        data = GetItemAttr(item, ITEMATTR_PP_RESTORE_PARAM, HEAP_ID_BATTLE);
        for (movePos = 0; movePos < MAX_MON_MOVES; movePos++) {
            if (GetMonData(mon, MON_DATA_MOVE1PP + movePos, NULL) != GetMonData(mon, MON_DATA_MOVE1MAXPP + movePos, NULL)) {
                AddMonData(mon, MON_DATA_MOVE1PP + movePos, data);
                if (index1 == selectedMonIndex || index2 == selectedMonIndex) {
                    if (!(GetBattlerVar(ctx, battlerId, BMON_DATA_STATUS2, NULL) & STATUS2_TRANSFORMED) && !(GetBattlerVar(ctx, battlerId, BMON_DATA_MIMICED_MOVE, NULL) & MaskOfFlagNo(movePos))) {
                        AddBattlerVar(ctx, battlerId, BMON_DATA_MOVE1PP + movePos, data);
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
        if (data && GetMonData(mon, MON_DATA_HP, NULL) != GetMonData(mon, MON_DATA_MAXHP, NULL)) {
            data = GetItemAttr(item, ITEMATTR_HP_RESTORE_PARAM, HEAP_ID_BATTLE);
            switch (data) {
            case HP_RESTORE_ALL:
                data = GetMonData(mon, MON_DATA_MAXHP, NULL);
                break;
            case HP_RESTORE_HALF:
                data = GetMonData(mon, MON_DATA_MAXHP, NULL) / 2;
                if (data == 0) {
                    data = 1;
                }
                break;
            case HP_RESTORE_QTR:
                data = GetMonData(mon, MON_DATA_MAXHP, NULL) *25 / 100;
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
            if (GetMonData(mon, MON_DATA_EGG_MET_LOCATION, NULL) == BattleSystem_GetLocation(bsys)) {
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

OPTIONS *BattleSystem_GetOptions(BattleSystem *bsys) {
    return bsys->options;
}

BOOL BattleSystem_AreBattleAnimationsOn(BattleSystem *bsys) {
    if ((bsys->battleType & BATTLE_TYPE_LINK) && !(bsys->battleSpecial & BATTLE_SPECIAL_RECORDED)) {
        return TRUE;
    }
    return (Options_GetBattleScene(bsys->options) == 0);
}

u16 BattleSystem_GetFrame(BattleSystem *bsys) {
    return Options_GetFrame(bsys->options);
}

u8 BattleSystem_GetTextFrameDelay(BattleSystem *bsys) {
    if ((bsys->battleType & BATTLE_TYPE_LINK) && !(bsys->battleSpecial & BATTLE_SPECIAL_RECORDED)) {
        return 1;
    }
    return Options_GetTextFrameDelay(bsys->options);
}

u16 BattleSystem_GetBattleStyle(BattleSystem *bsys) {
    return Options_GetBattleStyle(bsys->options);
}

void *ov12_0223B750(BattleSystem *bsys) {
    return bsys->unk1C8;
}

SOUND_CHATOT *BattleSystem_GetChatotVoice(BattleSystem *bsys, int battlerId) {
    if ((bsys->battleType & BATTLE_TYPE_MULTI) || ((bsys->battleType & BATTLE_TYPE_INGAME_PARTNER) && (ov12_0223AB0C(bsys, battlerId) & 1))) {
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
            case TERRAIN_MARSH:
            default:
                form = BURMY_PLANT;
                break;
            case TERRAIN_PLAIN:
            case TERRAIN_SAND:
            case TERRAIN_CAVE:
            case TERRAIN_ROCKS:
            case TERRAIN_ELITE_4_KAREN:
            case TERRAIN_22:
                form = BURMY_SANDY;
                break;
            case TERRAIN_BUILDING:
            case TERRAIN_BRIDGE:
            case TERRAIN_LINK:
            case TERRAIN_END:
            case TERRAIN_ELITE_4_WILL:
            case TERRAIN_ELITE_4_KOGA:
            case TERRAIN_ELITE_4_BRUNO:
            case TERRAIN_CHAMPION_LANCE:
            case TERRAIN_17:
            case TERRAIN_TOWER:
            case TERRAIN_ARCADE:
            case TERRAIN_CASTLE:
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

//used to be related to poketch in dppt
void ov12_0223B870() {
    
}

void BattleSystem_SetBackground(BattleSystem *bsys) {
    NNSG2dImageProxy *image;
    int bgX, bgY, objX, objY, data, i;
    u8 *vram;
    u32* src;
    u32* dst;
    
    bsys->unk230 = AllocFromHeap(HEAP_ID_BATTLE, 0x10000);
    bsys->unk234 = AllocFromHeap(HEAP_ID_BATTLE, 0x200);
    
    MIi_CpuCopy32((void *)0x6010000, (u32 *)bsys->unk230, 0x10000);
    dst = (u32 *)bsys->unk234;
    src = (u32 *)PaletteData_GetUnfadedBuf(bsys->palette, 0);
    MIi_CpuCopy32(src, dst, 0x200);

    vram = (u8 *)0x6400000;
    image = sub_02024B1C(bsys->unk17C[1].unk0->unk0);
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
                    bsys->unk230[bgY * 0x800 + bgX * 0x40 + i] = data + 0x70;
                }
            }
        }
    }
    
    vram = (u8 *)0x6400000;
    image = sub_02024B1C(bsys->unk17C[0].unk0->unk0);
    vram += image->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN];
    
    for (i = 0; i < 0x800; i++) {
        if (i & 1) {
            data = (vram[i / 2] & 0xF0) >> 4;
        } else {
            data = (vram[i / 2] & 0xF);
        }
        if (data) {
            bsys->unk230[0x9800 + i] = data + 0x70;
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
                    bsys->unk230[bgY * 0x800 + bgX * 0x40 + i] = data + 0x70;
                }
            }
        }
    }
    
    BG_LoadCharTilesData(bsys->bgConfig, 3, bsys->unk230, 0x10000, 0);
    
    ov12_02266008(&bsys->unk17C[0]);
    ov12_02266008(&bsys->unk17C[1]);
}

u8 *ov12_0223BAD0(BattleSystem *bsys) {
    return bsys->unk230;
}

u16 *ov12_0223BAD8(BattleSystem *bsys) {
    return bsys->unk234;
}

u16 *ov12_0223BAE0(BattleSystem *bsys) {
    return &bsys->unk2238[0];
}

u16 *ov12_0223BAEC(BattleSystem *bsys) {
    return &bsys->unk2318[0];
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
    if (bsys->battleSpecial & BATTLE_SPECIAL_RECORDED) {
        return;
    }
    GameStats_Inc(bsys->gameStats, id);
}

void ov12_0223BB44(BattleSystem *bsys) {
    if (bsys->battleSpecial & BATTLE_SPECIAL_RECORDED) {
        return;
    }
    GameStats_AddSpecial(bsys->gameStats, GAME_STAT_UNK21);
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
        hpBar->type = ov12_02265B64(ov12_02261258(bsys->opponentData[i]), BattleSystem_GetBattleType(bsys));
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

u8 BattleSystem_SetCriticalHpMusicFlag(BattleSystem *bsys, u8 flag) {
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
    if (!(bsys->battleSpecial & BATTLE_SPECIAL_RECORDED) && bsys->unk245C[battlerId] < 1024) {
        sub_02030260(battlerId, bsys->unk245C[battlerId], data);
        bsys->unk245C[battlerId]++;
    }
}

BOOL ov12_0223BE0C(BattleSystem *bsys, int battlerId, u8 *data) {
    BOOL ret;
    *data = 0xFF;
    if ((bsys->battleSpecial & BATTLE_SPECIAL_RECORDED) && (bsys->unk245C[battlerId] < 1024)) {
        *data = sub_0203027C(battlerId, bsys->unk245C[battlerId]);
        bsys->unk245C[battlerId]++;
        ret = FALSE;
    } else if ((bsys->battleSpecial & BATTLE_SPECIAL_RECORDED) && bsys->unk245C[battlerId] >= 1024) {
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
    return bsys->trainers[battlerId].items[index];
}

BOOL ov12_0223BFEC(BattleSystem *bsys) {
    return bsys->unk2474_0;
}

void ov12_0223BFFC(BattleSystem *bsys, u32 flag) {
    if (!(bsys->battleSpecial & BATTLE_SPECIAL_RECORDED) || 
        bsys->unk2474_0 ||
        ov12_022581D4(bsys, bsys->ctx, 13, 0) == 44 ||
        ov12_022581D4(bsys, bsys->ctx, 14, 0) == 44) {
        return;
    }
    
    ov12_0226AA8C(bsys->unk19C, flag);
    BeginNormalPaletteFade(3, 0, 0, 0, 16, 2, HEAP_ID_BATTLE);
    Sound_Stop();
    Sound_SetMasterVolume(0);
    bsys->unk2474_0 = TRUE;
}

BOOL ov12_0223C080(BattleSystem *bsys) {
    if (!(bsys->battleSpecial & BATTLE_SPECIAL_RECORDED) || 
        bsys->unk2474_0 ||
        ov12_022581D4(bsys, bsys->ctx, 13, 0) == 44 ||
        ov12_022581D4(bsys, bsys->ctx, 14, 0) == 44) {
        return FALSE;
    }
    return TRUE;
}

void ov12_0223C0C4(BattleSystem *bsys) {
    if (!(bsys->battleSpecial & BATTLE_SPECIAL_RECORDED) || bsys->unk247C) {
        return;
    }
    bsys->unk247C = ov12_0226BEC4(bsys);
}

u8 BattleSystem_GetChatotVoiceParam(BattleSystem *bsys, int battlerId) {
    if ((bsys->battleType & BATTLE_TYPE_MULTI) ||
        ((bsys->battleType & BATTLE_TYPE_INGAME_PARTNER) && (ov12_0223AB0C(bsys, battlerId) & 1))) {
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
    if (bsys->battleType & (BATTLE_TYPE_LINK | BATTLE_TYPE_SAFARI | BATTLE_TYPE_TOWER | BATTLE_TYPE_PAL_PARK)) {
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
