#include "use_item_on_mon.h"
#include "item.h"
#include "pokemon.h"
#include "party.h"
#include "constants/moves.h"
#include "constants/items.h"
#include "move.h"

BOOL CanUseItemOnPokemon(POKEMON *pokemon, u16 itemID, s32 moveIdx, HeapID heapID) {
    int atkEv;
    int defEv;
    int speedEv;
    int spAtkEv;
    int spDefEv;
    int hpEv;

    ITEMDATA *itemData = LoadItemDataOrGfx(itemID, ITEMNARC_PARAM, heapID);
    if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_PARTY_USE) != 1) {
        FreeToHeap(itemData);
        return FALSE;
    }

    u32 status = GetMonData(pokemon, MON_DATA_STATUS, NULL);
    // Sleep
    if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_SLP_HEAL) && (status & MON_STATUS_SLP_MASK)) {
        FreeToHeap(itemData);
        return TRUE;
    }

    // Poison
    if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_PSN_HEAL) && (status & (MON_STATUS_PSN_MASK | MON_STATUS_TOX_MASK))) {
        FreeToHeap(itemData);
        return TRUE;
    }

    // Burn
    if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_BRN_HEAL) && (status & MON_STATUS_BRN_MASK)) {
        FreeToHeap(itemData);
        return TRUE;
    }

    // Freeze
    if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_FRZ_HEAL) && (status & MON_STATUS_FRZ_MASK)) {
        FreeToHeap(itemData);
        return TRUE;
    }

    // Paralysis
    if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_PRZ_HEAL) && (status & MON_STATUS_PRZ_MASK)) {
        FreeToHeap(itemData);
        return TRUE;
    }

    u32 hp = GetMonData(pokemon, MON_DATA_HP, NULL);
    if ((GetItemAttr_PreloadedItemData(itemData, ITEMATTR_REVIVE) || GetItemAttr_PreloadedItemData(itemData, ITEMATTR_REVIVE_ALL)) && !GetItemAttr_PreloadedItemData(itemData, ITEMATTR_LEVEL_UP)) {
        if (hp == 0) {
            FreeToHeap(itemData);
            return TRUE;
        }
    } else if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_HP_RESTORE) && hp != 0 && hp < GetMonData(pokemon, MON_DATA_MAXHP, NULL)) {
        FreeToHeap(itemData);
        return TRUE;
    }

    if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_LEVEL_UP) && GetMonData(pokemon, MON_DATA_LEVEL, NULL) < MAX_LEVEL) {
        FreeToHeap(itemData);
        return TRUE;
    }

    if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_EVOLVE) && GetMonEvolution(NULL, pokemon, EVOCTX_ITEM_USE, itemID, NULL) != SPECIES_NONE) {
        FreeToHeap(itemData);
        return TRUE;
    }

    if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_PP_UP) || GetItemAttr_PreloadedItemData(itemData, ITEMATTR_PP_MAX)) {
        if (GetMonData(pokemon, MON_DATA_MOVE1PPUP + moveIdx, NULL) < 3 && WazaGetMaxPp(GetMonData(pokemon, MON_DATA_MOVE1 + moveIdx, NULL), 0) >= 5) {
            FreeToHeap(itemData);
            return TRUE;
        }
    }

    if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_PP_RESTORE) && MonMoveCanRestorePP(pokemon, moveIdx) == TRUE) {
        FreeToHeap(itemData);
        return TRUE;
    }

    if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_PP_RESTORE_ALL)) {
        for (int i = 0; i < MON_MOVES; i++) {
            if (MonMoveCanRestorePP(pokemon, i) == TRUE) {
                FreeToHeap(itemData);
                return TRUE;
            }
        }
    }

    hpEv = GetMonData(pokemon, MON_DATA_HP_EV, NULL);
    atkEv = GetMonData(pokemon, MON_DATA_ATK_EV, NULL);
    defEv = GetMonData(pokemon, MON_DATA_DEF_EV, NULL);
    speedEv = GetMonData(pokemon, MON_DATA_SPEED_EV, NULL);
    spAtkEv = GetMonData(pokemon, MON_DATA_SPATK_EV, NULL);
    spDefEv = GetMonData(pokemon, MON_DATA_SPDEF_EV, NULL);
    if (GetMonData(pokemon, MON_DATA_SPECIES, NULL) != SPECIES_SHEDINJA && GetItemAttr_PreloadedItemData(itemData, ITEMATTR_HP_EV_UP)) {
        int dHpEv = GetItemAttr_PreloadedItemData(itemData, ITEMATTR_HP_EV_UP_PARAM);
        if (dHpEv > 0) {
            if (hpEv < MAX_EV && (hpEv + atkEv + defEv + speedEv + spAtkEv + spDefEv) < MAX_EV_SUM) {
                FreeToHeap(itemData);
                return TRUE;
            }
        } else if (dHpEv < 0) {
            if (hpEv > 0) {
                FreeToHeap(itemData);
                return TRUE;
            } else if (CanItemModFriendship(pokemon, itemData) == TRUE) {
                FreeToHeap(itemData);
                return TRUE;
            }
        }
    }

    if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_ATK_EV_UP)) {
        int dAtkEv = GetItemAttr_PreloadedItemData(itemData, ITEMATTR_ATK_EV_UP_PARAM);
        if (dAtkEv > 0) {
            if (atkEv < MAX_EV && (hpEv + atkEv + defEv + speedEv + spAtkEv + spDefEv) < MAX_EV_SUM) {
                FreeToHeap(itemData);
                return TRUE;
            }
        } else if (dAtkEv < 0) {
            if (atkEv > 0) {
                FreeToHeap(itemData);
                return TRUE;
            } else if (CanItemModFriendship(pokemon, itemData) == TRUE) {
                FreeToHeap(itemData);
                return TRUE;
            }
        }
    }

    if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_DEF_EV_UP)) {
        int dDefEv = GetItemAttr_PreloadedItemData(itemData, ITEMATTR_DEF_EV_UP_PARAM);
        if (dDefEv > 0) {
            if (defEv < MAX_EV && (hpEv + atkEv + defEv + speedEv + spAtkEv + spDefEv) < MAX_EV_SUM) {
                FreeToHeap(itemData);
                return TRUE;
            }
        } else if (dDefEv < 0) {
            if (defEv > 0) {
                FreeToHeap(itemData);
                return TRUE;
            } else if (CanItemModFriendship(pokemon, itemData) == TRUE) {
                FreeToHeap(itemData);
                return TRUE;
            }
        }
    }

    if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_SPEED_EV_UP)) {
        int dSpeedEv = GetItemAttr_PreloadedItemData(itemData, ITEMATTR_SPEED_EV_UP_PARAM);
        if (dSpeedEv > 0) {
            if (speedEv < MAX_EV && (hpEv + atkEv + defEv + speedEv + spAtkEv + spDefEv) < MAX_EV_SUM) {
                FreeToHeap(itemData);
                return TRUE;
            }
        } else if (dSpeedEv < 0) {
            if (speedEv > 0) {
                FreeToHeap(itemData);
                return TRUE;
            } else if (CanItemModFriendship(pokemon, itemData) == TRUE) {
                FreeToHeap(itemData);
                return TRUE;
            }
        }
    }

    if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_SPATK_EV_UP)) {
        int dSpAtkEv = GetItemAttr_PreloadedItemData(itemData, ITEMATTR_SPATK_EV_UP_PARAM);
        if (dSpAtkEv > 0) {
            if (spAtkEv < MAX_EV && (hpEv + atkEv + defEv + speedEv + spAtkEv + spDefEv) < MAX_EV_SUM) {
                FreeToHeap(itemData);
                return TRUE;
            }
        } else if (dSpAtkEv < 0) {
            if (spAtkEv > 0) {
                FreeToHeap(itemData);
                return TRUE;
            } else if (CanItemModFriendship(pokemon, itemData) == TRUE) {
                FreeToHeap(itemData);
                return TRUE;
            }
        }
    }

    if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_SPDEF_EV_UP)) {
        int dSpDefEv = GetItemAttr_PreloadedItemData(itemData, ITEMATTR_SPDEF_EV_UP_PARAM);
        if (dSpDefEv > 0) {
            if (spDefEv < MAX_EV && (hpEv + atkEv + defEv + speedEv + spAtkEv + spDefEv) < MAX_EV_SUM) {
                FreeToHeap(itemData);
                return TRUE;
            }
        } else if (dSpDefEv < 0) {
            if (spDefEv > 0) {
                FreeToHeap(itemData);
                return TRUE;
            } else if (CanItemModFriendship(pokemon, itemData) == TRUE) {
                FreeToHeap(itemData);
                return TRUE;
            }
        }
    }

    FreeToHeap(itemData);
    return FALSE;
}

BOOL CanUseItemOnMonInParty(PARTY *party, u16 itemID, s32 partyIdx, s32 moveIdx, HeapID heapID) {
    POKEMON *pokemon = GetPartyMonByIndex(party, partyIdx);
    return CanUseItemOnPokemon(pokemon, itemID, moveIdx, heapID);
}

BOOL UseItemOnPokemon(POKEMON *pokemon, u16 itemID, u16 moveIdx, u16 location, HeapID heapID) {
    s32 stack_data[8];
#define sp70 stack_data[7]
#define sp6C stack_data[6]
#define sp68 stack_data[5]
#define sp64 stack_data[4]
#define sp60 stack_data[3]
#define sp5C stack_data[2]
#define sp58 stack_data[1]
#define sp54 stack_data[0]
    BOOL hadEffect;
    BOOL effectFound;

    ITEMDATA *itemData = LoadItemDataOrGfx(itemID, ITEMNARC_PARAM, heapID);
    if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_PARTY_USE) != 1) {
        FreeToHeap(itemData);
        return FALSE;
    }

    hadEffect = FALSE;
    effectFound = FALSE;
    
    sp58 = sp54 = GetMonData(pokemon, MON_DATA_STATUS, NULL);
    if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_SLP_HEAL)) {
        sp58 &= ~MON_STATUS_SLP_MASK;
        effectFound = TRUE;
    }

    if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_PSN_HEAL)) {
        sp58 &= ~(MON_STATUS_PSN_MASK | MON_STATUS_TOX_MASK | 0xF00);
        effectFound = TRUE;
    }

    if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_BRN_HEAL)) {
        sp58 &= ~MON_STATUS_BRN_MASK;
        effectFound = TRUE;
    }

    if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_FRZ_HEAL)) {
        sp58 &= ~MON_STATUS_FRZ_MASK;
        effectFound = TRUE;
    }
    
    if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_PRZ_HEAL)) {
        sp58 &= ~MON_STATUS_PRZ_MASK;
        effectFound = TRUE;
    }

    if (sp54 != sp58) {
        SetMonData(pokemon, MON_DATA_STATUS, &sp58);
        hadEffect = TRUE;
    }
    
    sp54 = GetMonData(pokemon, MON_DATA_HP, NULL);
    sp58 = GetMonData(pokemon, MON_DATA_MAXHP, NULL);
    if ((GetItemAttr_PreloadedItemData(itemData, ITEMATTR_REVIVE) || GetItemAttr_PreloadedItemData(itemData, ITEMATTR_REVIVE_ALL)) && GetItemAttr_PreloadedItemData(itemData, ITEMATTR_LEVEL_UP)) {
        if (sp54 == 0) {
            RestoreMonHPBy(pokemon, sp54, sp58, GetItemAttr_PreloadedItemData(itemData, ITEMATTR_HP_RESTORE_PARAM));
            hadEffect = TRUE;
        }
        effectFound = TRUE;
    } else if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_HP_RESTORE)) {
        if (sp54 < sp58) {
            RestoreMonHPBy(pokemon, sp54, sp58, GetItemAttr_PreloadedItemData(itemData, ITEMATTR_HP_RESTORE_PARAM));
            hadEffect = TRUE;
        }
        effectFound = TRUE;
    }

    sp5C = GetMonData(pokemon, MON_DATA_LEVEL, NULL);
    if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_LEVEL_UP)) {
        if (sp5C < MAX_LEVEL) {
            AddMonData(pokemon, MON_DATA_EXPERIENCE, CalcMonExpToNextLevel(pokemon));
            CalcMonLevelAndStats(pokemon);
            if (sp54 == 0) {
                sp60 = GetMonData(pokemon, MON_DATA_MAXHP, NULL);
                RestoreMonHPBy(pokemon, sp54, sp60, sp60 - sp58);
            }
            hadEffect = TRUE;
        }
        effectFound = TRUE;
    }

    if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_EVOLVE)) {
        effectFound = TRUE;
    }

    if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_PP_UP)) {
        if (BoostMonMovePpUpBy(pokemon, moveIdx, 1) == TRUE) {
            hadEffect = TRUE;
        }
        effectFound = TRUE;
    } else if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_PP_MAX)) {
        if (BoostMonMovePpUpBy(pokemon, moveIdx, 3) == TRUE) {
            hadEffect = TRUE;
        }
        effectFound = TRUE;
    }

    if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_PP_RESTORE)) {
        if (MonMoveRestorePP(pokemon, moveIdx, GetItemAttr_PreloadedItemData(itemData, ITEMATTR_PP_RESTORE_PARAM)) == 1) {
            hadEffect = TRUE;
        }
        effectFound = TRUE;
    } else if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_PP_RESTORE_ALL)) {
        sp54 = 0;
        for (; sp54 < MON_MOVES; sp54++) {
            if (MonMoveRestorePP(pokemon, sp54, GetItemAttr_PreloadedItemData(itemData, ITEMATTR_PP_RESTORE_PARAM)) == 1) {
                hadEffect = TRUE;
            }
        }
        effectFound = TRUE;
    }
    
    sp54 = GetMonData(pokemon, MON_DATA_HP_EV, NULL);
    sp58 = GetMonData(pokemon, MON_DATA_ATK_EV, NULL);
    sp5C = GetMonData(pokemon, MON_DATA_DEF_EV, NULL);
    sp60 = GetMonData(pokemon, MON_DATA_SPEED_EV, NULL);
    sp64 = GetMonData(pokemon, MON_DATA_SPATK_EV, NULL);
    sp68 = GetMonData(pokemon, MON_DATA_SPDEF_EV, NULL);
    if (GetMonData(pokemon, MON_DATA_SPECIES, NULL) != SPECIES_SHEDINJA &&GetItemAttr_PreloadedItemData(itemData, ITEMATTR_HP_EV_UP)) {
        sp70 = GetItemAttr_PreloadedItemData(itemData, ITEMATTR_HP_EV_UP_PARAM);
        sp6C = TryModEV(sp54, sp58 + sp5C + sp60 + sp64 + sp68, sp70);
        if (sp6C != -1) {
            sp54 = sp6C;
            SetMonData(pokemon, MON_DATA_HP_EV, &sp54);
            CalcMonLevelAndStats(pokemon);
            hadEffect = TRUE;
        }

        if (sp70 > 0) {
            effectFound = TRUE;
        }
    }

    if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_ATK_EV_UP)) {
        sp70 = GetItemAttr_PreloadedItemData(itemData, ITEMATTR_ATK_EV_UP_PARAM);
        sp6C = TryModEV(sp58, sp54 + sp5C + sp60 + sp64 + sp68, sp70);
        if (sp6C != -1) {
            sp58 = sp6C;
            SetMonData(pokemon, MON_DATA_ATK_EV, &sp58);
            CalcMonLevelAndStats(pokemon);
            hadEffect = TRUE;
        }

        if (sp70 > 0) {
            effectFound = TRUE;
        }
    }

    if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_DEF_EV_UP)) {
        sp70 = GetItemAttr_PreloadedItemData(itemData, ITEMATTR_DEF_EV_UP_PARAM);
        sp6C = TryModEV(sp5C, sp54 + sp58 + sp60 + sp64 + sp68, sp70);
        if (sp6C != -1) {
            sp5C = sp6C;
            SetMonData(pokemon, MON_DATA_DEF_EV, &sp5C);
            CalcMonLevelAndStats(pokemon);
            hadEffect = TRUE;
        }

        if (sp70 > 0) {
            effectFound = TRUE;
        }
    }

    if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_SPEED_EV_UP)) {
        sp70 = GetItemAttr_PreloadedItemData(itemData, ITEMATTR_SPEED_EV_UP_PARAM);
        sp6C = TryModEV(sp60, sp54 + sp58 + sp5C + sp64 + sp68, sp70);
        if (sp6C != -1) {
            sp60 = sp6C;
            SetMonData(pokemon, MON_DATA_SPEED_EV, &sp60);
            CalcMonLevelAndStats(pokemon);
            hadEffect = TRUE;
        }

        if (sp70 > 0) {
            effectFound = TRUE;
        }
    }

    if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_SPATK_EV_UP)) {
        sp70 = GetItemAttr_PreloadedItemData(itemData, ITEMATTR_SPATK_EV_UP_PARAM);
        sp6C = TryModEV(sp64, sp54 + sp58 + sp5C + sp60 + sp68, sp70);
        if (sp6C != -1) {
            sp64 = sp6C;
            SetMonData(pokemon, MON_DATA_SPATK_EV, &sp64);
            CalcMonLevelAndStats(pokemon);
            hadEffect = TRUE;
        }

        if (sp70 > 0) {
            effectFound = TRUE;
        }
    }

    if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_SPDEF_EV_UP)) {
        sp70 = GetItemAttr_PreloadedItemData(itemData, ITEMATTR_SPDEF_EV_UP_PARAM);
        sp6C = TryModEV(sp68, sp54 + sp58 + sp5C + sp60 + sp64, sp70);
        if (sp6C != -1) {
            sp68 = sp6C;
            SetMonData(pokemon, MON_DATA_SPDEF_EV, &sp68);
            CalcMonLevelAndStats(pokemon);
            hadEffect = TRUE;
        }

        if (sp70 > 0) {
            effectFound = TRUE;
        }
    }

    if (hadEffect == FALSE && effectFound == TRUE) {
        FreeToHeap(itemData);
        return FALSE;
    }
    
    sp54 = GetMonData(pokemon, MON_DATA_FRIENDSHIP, NULL);
    if (sp54 < 100) {
        if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_FRIENDSHIP_MOD_LO)) {
            ApplyItemEffectOnMonMood(pokemon, itemID);
            DoItemFriendshipMod(pokemon, sp54, GetItemAttr_PreloadedItemData(itemData, ITEMATTR_FRIENDSHIP_MOD_LO_PARAM), location, heapID);
            FreeToHeap(itemData);
            return hadEffect;
        }
    } else if (sp54 >= 100 && sp54 < 200) {
        if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_FRIENDSHIP_MOD_MED)) {
            ApplyItemEffectOnMonMood(pokemon, itemID);
            DoItemFriendshipMod(pokemon, sp54, GetItemAttr_PreloadedItemData(itemData, ITEMATTR_FRIENDSHIP_MOD_MED_PARAM), location, heapID);
            FreeToHeap(itemData);
            return hadEffect;
        }
    } else if (sp54 >= 200 && sp54 <= 255) {
        if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_FRIENDSHIP_MOD_HI)) {
            ApplyItemEffectOnMonMood(pokemon, itemID);
            DoItemFriendshipMod(pokemon, sp54, GetItemAttr_PreloadedItemData(itemData, ITEMATTR_FRIENDSHIP_MOD_HI_PARAM), location, heapID);
            FreeToHeap(itemData);
            return hadEffect;
        }
    }

    FreeToHeap(itemData);
    return hadEffect;
}
#undef sp70
#undef sp6C
#undef sp68
#undef sp64
#undef sp60
#undef sp5C
#undef sp58
#undef sp54

BOOL UseItemOnMonInParty(PARTY *party, u16 itemID, s32 partyIdx, u16 moveIdx, u16 location, HeapID heapID) {
    POKEMON *pokemon = GetPartyMonByIndex(party, partyIdx);
    return UseItemOnPokemon(pokemon, itemID, moveIdx, location, heapID);
}

BOOL MonMoveCanRestorePP(POKEMON *pokemon, int moveIdx) {
    u16 moveID = GetMonData(pokemon, MON_DATA_MOVE1 + moveIdx, NULL);
    if (moveID == MOVE_NONE) {
        return FALSE;
    }

    u8 pp = GetMonData(pokemon, MON_DATA_MOVE1PP + moveIdx, NULL);
    u8 ppUp = GetMonData(pokemon, MON_DATA_MOVE1PPUP + moveIdx, NULL);
    return (u8)(pp < WazaGetMaxPp(moveID, ppUp));
}

BOOL MonMoveRestorePP(POKEMON *pokemon, int moveIdx, int ppRestore) {
    u16 move_id = GetMonData(pokemon, MON_DATA_MOVE1 + moveIdx, NULL);
    if (move_id == MOVE_NONE) {
        return FALSE;
    }
    
    int ppAttr = MON_DATA_MOVE1PP + moveIdx;
    u8 pp = GetMonData(pokemon, ppAttr, NULL);
    int ppUpAttr = MON_DATA_MOVE1PPUP + moveIdx;
    u8 maxPp = WazaGetMaxPp(move_id, GetMonData(pokemon, ppUpAttr, NULL));
    if (pp < maxPp) {
        if (ppRestore == PP_RESTORE_ALL) {
            pp = maxPp;
        } else {
            pp += ppRestore;
            if (pp > maxPp) {
                pp = maxPp;
            }
        }
        SetMonData(pokemon, ppAttr, &pp);
        return TRUE;
    }
    return FALSE;
}

BOOL BoostMonMovePpUpBy(POKEMON *pokemon, int moveIdx, int nPpUp) {
    u16 move;
    u8 pp;

    int ppUpAttr = MON_DATA_MOVE1PPUP + moveIdx;
    u8 ppUp = GetMonData(pokemon, ppUpAttr, NULL);
    if (ppUp == 3) {
        return FALSE;
    }
    
    move = GetMonData(pokemon, MON_DATA_MOVE1 + moveIdx, NULL);
    if (WazaGetMaxPp(move, 0) < 5) {
        return FALSE;
    }

    int ppAttr = MON_DATA_MOVE1PP + moveIdx;
    pp = GetMonData(pokemon, ppAttr, NULL);
    u8 maxPp = WazaGetMaxPp(move, ppUp);
    if ((u32)(ppUp + nPpUp) > 3) {
        ppUp = 3;
    } else {
        ppUp = ppUp + nPpUp;
    }
    
    u8 newMaxPp = WazaGetMaxPp(move, ppUp);
    pp = pp + newMaxPp - maxPp;
    SetMonData(pokemon, ppUpAttr, &ppUp);
    SetMonData(pokemon, ppAttr, &pp);
    
    return TRUE;
}

void RestoreMonHPBy(POKEMON *pokemon, u32 hp, u32 maxHp, u32 restoration) {
    if (maxHp == 1) {
        restoration = 1;
    } else if (restoration == HP_RESTORE_ALL) {
        restoration = maxHp;
    } else if (restoration == HP_RESTORE_HALF) {
        restoration = maxHp / 2;
    } else if (restoration == HP_RESTORE_QTR) {
        restoration = maxHp / 4;
    }

    if (hp + restoration > maxHp) {
        hp = maxHp;
    } else {
        hp = hp + restoration;
    }

    SetMonData(pokemon, MON_DATA_HP, &hp);
}

s32 TryModEV(s32 ev, s32 evSum, s32 by) {
    if (ev == 0 && by < 0) {
        return -1;
    }

    if (ev >= MAX_EV && by > 0) {
        return -1;
    }

    if (ev + evSum >= MAX_EV_SUM && by > 0) {
        return -1;
    }

    ev += by;
    if (ev > MAX_EV) {
        ev = MAX_EV;
    } else if (ev < 0) {
        ev = 0;
    }

    if (ev + evSum > MAX_EV_SUM) {
        ev = MAX_EV_SUM - evSum;
    }

    return ev;
}

BOOL CanItemModFriendship(POKEMON *pokemon, ITEMDATA *itemData) {
    s32 friendship = GetMonData(pokemon, MON_DATA_FRIENDSHIP, NULL);
    if (friendship >= 255) {
        return FALSE;
    }

    if (friendship < 100) {
        return (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_FRIENDSHIP_MOD_LO) && GetItemAttr_PreloadedItemData(itemData, ITEMATTR_FRIENDSHIP_MOD_LO_PARAM) > 0);
    }

    if (friendship >= 100 && friendship < 200) {
        return (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_FRIENDSHIP_MOD_MED) && GetItemAttr_PreloadedItemData(itemData, ITEMATTR_FRIENDSHIP_MOD_MED_PARAM) > 0);
    }

    if (friendship >= 200 && friendship < 255) {
        return (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_FRIENDSHIP_MOD_HI) && GetItemAttr_PreloadedItemData(itemData, ITEMATTR_FRIENDSHIP_MOD_HI_PARAM) > 0);
    }

    return FALSE;
}

BOOL DoItemFriendshipMod(POKEMON *pokemon, s32 friendship, s32 mod, u16 location, HeapID heapID) {
    if (friendship == 255 && mod > 0) {
        return FALSE;
    }

    if (friendship == 0 && mod < 0) {
        return FALSE;
    }

    if (mod > 0) {
        if (GetMonData(pokemon, MON_DATA_POKEBALL, NULL) == ITEM_LUXURY_BALL) {
            mod++;
        }

        if (location == GetMonData(pokemon, MON_DATA_EGG_MET_LOCATION, NULL)) {
            mod++;
        }

        if (GetItemAttr(GetMonData(pokemon, MON_DATA_HELD_ITEM, NULL), ITEMATTR_HOLD_EFFECT, heapID) == HOLD_EFFECT_FRIENDSHIP_UP) {
            mod = mod * 150 / 100;
        }
    }

    mod += friendship;
    if (mod > 255) {
        mod = 255;
    }

    if (mod < 0) {
        mod = 0;
    }

    SetMonData(pokemon, MON_DATA_FRIENDSHIP, &mod);
    return TRUE;
}

void HealParty(PARTY * party) {
    int i, j;

    int partyCount = GetPartyCount(party);
    for (i = 0; i < partyCount; i++) {
        POKEMON *pokemon = GetPartyMonByIndex(party, i);
        if (GetMonData(pokemon, MON_DATA_SPECIES_EXISTS, NULL)) {
            u32 sp8 = GetMonData(pokemon, MON_DATA_MAXHP, NULL);
            SetMonData(pokemon, MON_DATA_HP, &sp8);

            sp8 = 0;
            SetMonData(pokemon, MON_DATA_STATUS, &sp8);

            for (j = 0; j < MON_MOVES; j++) {
                if (MonMoveCanRestorePP(pokemon, j) == 1) {
                    MonMoveRestorePP(pokemon, j, PP_RESTORE_ALL);
                }
            }
        }
    }
}
