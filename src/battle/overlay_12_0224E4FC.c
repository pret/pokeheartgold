#include "battle.h"
#include "battle_controller.h"
#include "battle_controller_opponent.h"
#include "battle_system.h"
#include "dex_mon_measures.h"
#include "filesystem.h"
#include "party.h"
#include "pokemon.h"
#include "unk_02037C94.h"
#include "overlay_12_0224E4FC.h"
#include "constants/abilities.h"
#include "constants/battle.h"
#include "constants/items.h"
#include "constants/moves.h"
#include "constants/species.h"

void BattleSystem_GetBattleMon(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId, u8 selectedMon) {
    Pokemon *mon = BattleSystem_GetPartyMon(bsys, battlerId, selectedMon);
    int i;
    int side;
    struct PokedexData *dexData;
    
    ctx->battleMons[battlerId].species = GetMonData(mon, MON_DATA_SPECIES, NULL);
    ctx->battleMons[battlerId].atk = GetMonData(mon, MON_DATA_ATK, NULL);
    ctx->battleMons[battlerId].def = GetMonData(mon, MON_DATA_DEF, NULL);
    ctx->battleMons[battlerId].speed = GetMonData(mon, MON_DATA_SPEED, NULL);
    ctx->battleMons[battlerId].spAtk = GetMonData(mon, MON_DATA_SPATK, NULL);
    ctx->battleMons[battlerId].spDef = GetMonData(mon, MON_DATA_SPDEF, NULL);
    
    for (i = 0; i < 4; i++) {
        ctx->battleMons[battlerId].moves[i] = GetMonData(mon, MON_DATA_MOVE1 + i, NULL);
        ctx->battleMons[battlerId].movePPCur[i] = GetMonData(mon, MON_DATA_MOVE1PP + i, NULL);
        ctx->battleMons[battlerId].movePP[i] = GetMonData(mon, MON_DATA_MOVE1PPUP + i, NULL);
    }
    
    ctx->battleMons[battlerId].hpIV = GetMonData(mon, MON_DATA_HP_IV, NULL);
    ctx->battleMons[battlerId].atkIV = GetMonData(mon, MON_DATA_ATK_IV, NULL);
    ctx->battleMons[battlerId].defIV = GetMonData(mon, MON_DATA_DEF_IV, NULL);
    ctx->battleMons[battlerId].speedIV = GetMonData(mon, MON_DATA_SPEED_IV, NULL);
    ctx->battleMons[battlerId].spAtkIV = GetMonData(mon, MON_DATA_SPATK_IV, NULL);
    ctx->battleMons[battlerId].spDefIV = GetMonData(mon, MON_DATA_SPDEF_IV, NULL);
    
    ctx->battleMons[battlerId].isEgg = GetMonData(mon, MON_DATA_IS_EGG, NULL);
    ctx->battleMons[battlerId].hasNickname = GetMonData(mon, MON_DATA_HAS_NICKNAME, NULL);
    
    if (!(ctx->linkStatus & (1 << 8))) { //Baton pass
        for (i = 0; i < 8; i++) {
            ctx->battleMons[battlerId].statChanges[i] = 6; //6 is the default for stat changes
        }
    }
    
    ctx->battleMons[battlerId].unk28_0 = 0;
    ctx->battleMons[battlerId].intimidateFlag = 0;
    ctx->battleMons[battlerId].traceFlag = 0;
    ctx->battleMons[battlerId].downloadFlag = 0;
    ctx->battleMons[battlerId].anticipationFlag = 0;
    ctx->battleMons[battlerId].forewarnFlag = 0;
    ctx->battleMons[battlerId].slowStartFlag = 0;
    ctx->battleMons[battlerId].slowStartEnded = 0;
    ctx->battleMons[battlerId].friskFlag = 0;
    ctx->battleMons[battlerId].moldBreakerFlag = 0;
    ctx->battleMons[battlerId].pressureFlag = 0;
    
    ctx->battleMons[battlerId].type1 = GetMonData(mon, MON_DATA_TYPE_1, NULL);
    ctx->battleMons[battlerId].type2 = GetMonData(mon, MON_DATA_TYPE_2, NULL);
    
    ctx->battleMons[battlerId].gender = GetMonGender(mon);
    ctx->battleMons[battlerId].shiny = MonIsShiny(mon);
    
    if (BattleSys_GetBattleType(bsys) & (BATTLE_TYPE_5|BATTLE_TYPE_9)) { //No abilities battle
        ctx->battleMons[battlerId].ability = 0;
        ctx->battleMons[battlerId].status = 0;
        ctx->battleMons[battlerId].item = 0;
    } else {
        ctx->battleMons[battlerId].ability = GetMonData(mon, MON_DATA_ABILITY, NULL);
        ctx->battleMons[battlerId].status = GetMonData(mon, MON_DATA_STATUS, NULL);
        ctx->battleMons[battlerId].item = GetMonData(mon, MON_DATA_HELD_ITEM, NULL);
    }
    
    if ((BattleSys_GetBattleType(bsys) & (BATTLE_TYPE_5|BATTLE_TYPE_9)) && !BattleSys_GetFieldSide(bsys, battlerId)) {
        ctx->battleMons[battlerId].forme = 0;
    } else {
        ctx->battleMons[battlerId].forme = GetMonData(mon, MON_DATA_FORME, NULL);
    }
    
    ctx->battleMons[battlerId].level = GetMonData(mon, MON_DATA_LEVEL, NULL);
    ctx->battleMons[battlerId].friendship = GetMonData(mon, MON_DATA_FRIENDSHIP, NULL);
    
    ctx->battleMons[battlerId].hp = GetMonData(mon, MON_DATA_HP, NULL);
    ctx->battleMons[battlerId].maxHp = GetMonData(mon, MON_DATA_MAXHP, NULL);
    
    ctx->battleMons[battlerId].exp = GetMonData(mon, MON_DATA_EXPERIENCE, NULL);
    ctx->battleMons[battlerId].personality = GetMonData(mon, MON_DATA_PERSONALITY, NULL);
    ctx->battleMons[battlerId].otid = GetMonData(mon, MON_DATA_OTID, NULL);
    ctx->battleMons[battlerId].metGender = GetMonData(mon, MON_DATA_MET_GENDER, NULL);
    
    ctx->battleMons[battlerId].ball = BattleSystem_GetMonBall(bsys, mon);
    
    SetDexBanksByGiratinaForme(ctx->battleMons[battlerId].forme);
    dexData = PokedexData_Create(HEAP_ID_BATTLE);
    PokedexData_LoadAll(dexData, 0, HEAP_ID_BATTLE);
    
    ctx->battleMons[battlerId].weight = PokedexData_GetWeight(dexData, ctx->battleMons[battlerId].species);
    
    PokedexData_UnloadAll(dexData);
    PokedexData_Delete(dexData);
    
    GetMonData(mon, MON_DATA_NICKNAME, ctx->battleMons[battlerId].nickname);
    GetMonData(mon, MON_DATA_OT_NAME, ctx->battleMons[battlerId].unk54);

    ctx->battleMons[battlerId].unk78 = 0;
    ctx->battleMons[battlerId].msgFlag = 0;
    
    side = BattleSys_GetFieldSide(bsys, battlerId);
    
    if (ctx->fieldSideConditionData[side].battlerBitKnockedOffItem & MaskOfFlagNo(ctx->selectedMonIndex[battlerId])) {
        ctx->battleMons[battlerId].item = 0;
        ctx->battleMons[battlerId].unk88.knockOffFlag = FALSE;
    } else if (ctx->battleMons[battlerId].item) {
        ctx->battleMons[battlerId].unk88.knockOffFlag = TRUE;
    }
}

void BattleSystem_ReloadMonData(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId, int monIndex) {
    Pokemon *mon = BattleSystem_GetPartyMon(bsys, battlerId, monIndex);
    int i;
    
    ctx->battleMons[battlerId].atk = GetMonData(mon, MON_DATA_ATK, NULL);
    ctx->battleMons[battlerId].def = GetMonData(mon, MON_DATA_DEF, NULL);
    ctx->battleMons[battlerId].speed = GetMonData(mon, MON_DATA_SPEED, NULL);
    ctx->battleMons[battlerId].spAtk = GetMonData(mon, MON_DATA_SPATK, NULL);
    ctx->battleMons[battlerId].spDef = GetMonData(mon, MON_DATA_SPDEF, NULL);
    ctx->battleMons[battlerId].level = GetMonData(mon, MON_DATA_LEVEL, NULL);
    ctx->battleMons[battlerId].friendship = GetMonData(mon, MON_DATA_FRIENDSHIP, NULL);
    ctx->battleMons[battlerId].hp = GetMonData(mon, MON_DATA_HP, NULL);
    ctx->battleMons[battlerId].maxHp = GetMonData(mon, MON_DATA_MAXHP, NULL);
    
    if (!(ctx->battleMons[battlerId].status2 & STATUS2_TRANSFORMED)) { 
        for (i = 0; i < 4; i++) {
            if (!(ctx->battleMons[battlerId].unk88.mimicedMoveIndex & MaskOfFlagNo(i))) {
                ctx->battleMons[battlerId].moves[i] = GetMonData(mon, MON_DATA_MOVE1 + i, NULL);
                ctx->battleMons[battlerId].movePPCur[i] = GetMonData(mon, MON_DATA_MOVE1PP + i, NULL);
                ctx->battleMons[battlerId].movePP[i] = GetMonData(mon, MON_DATA_MOVE1PPUP + i, NULL);
           }
        }
        ctx->battleMons[battlerId].exp = GetMonData(mon, MON_DATA_EXPERIENCE, NULL);
    }
}

void ReadBattleScriptFromNarc(BATTLECONTEXT *ctx, NarcId narcId, int fileId) {
    GF_ASSERT(GetNarcMemberSizeByIdPair(narcId, fileId) < 1600);
    ctx->scriptNarcId = narcId;
    ctx->scriptFileId = fileId;
    ctx->scriptSeqNo = 0;
    ReadWholeNarcMemberByIdPair(&ctx->battleScriptWork, narcId, fileId);
}

//PushBattleScriptFromNarc..?
void ov12_0224EBDC(BATTLECONTEXT *ctx, NarcId narcId, int fileId) {
    GF_ASSERT(GetNarcMemberSizeByIdPair(narcId, fileId) < 1600);
    GF_ASSERT(ctx->unk_B8 < 4);
    ctx->unk_BC[ctx->unk_B8] = ctx->scriptNarcId;
    ctx->unk_CC[ctx->unk_B8] = ctx->scriptFileId;
    ctx->unk_DC[ctx->unk_B8] = ctx->scriptSeqNo;
    ctx->unk_B8++;
    ctx->scriptNarcId = narcId;
    ctx->scriptFileId = fileId;
    ctx->scriptSeqNo = 0;
    ReadWholeNarcMemberByIdPair(&ctx->battleScriptWork, narcId, fileId);
}

//BattleScript_Pop..?
BOOL ov12_0224EC74(BATTLECONTEXT *ctx) {
    if (ctx->unk_B8) {
        ctx->unk_B8--;
        ReadBattleScriptFromNarc(ctx, ctx->unk_BC[ctx->unk_B8], ctx->unk_CC[ctx->unk_B8]);
        ctx->scriptSeqNo = ctx->unk_DC[ctx->unk_B8];
        return FALSE;
    }
    return TRUE;
}

//Link_QueueAdd..?
void ov12_0224ECC4(BATTLECONTEXT *ctx, int id, int battlerId, int index) {
    int i;
    
    for (i = 0; i < 16; i++) {
        if (!ctx->unk_2200[id][battlerId][i]) {
            ctx->unk_2200[id][battlerId][i] = index;
            break;
        }
    }
    
    GF_ASSERT(i < 16);
}

//Link_QueueReset..?
void ov12_0224ED00(BATTLECONTEXT *ctx, int id, int battlerId, int index) {
    int i;
    
    GF_ASSERT(index != 0);
    
    for (i = 0; i < 16; i++) {
        if (ctx->unk_2200[id][battlerId][i] == index) {
            ctx->unk_2200[id][battlerId][i] = 0;
            break;
        }
    }
    
    GF_ASSERT(i < 16);
}

BOOL Link_QueueNotEmpty(BATTLECONTEXT *ctx) {
    int i;
    int battlerId;
    int j;
    int cnt = 0;
    
    for (i = 0; i < 4; i++) {
        for (battlerId = 0; battlerId < 4; battlerId++) {
            for (j = 0; j < 16; j++) {
                cnt += ctx->unk_2200[i][battlerId][j];
            }
        }
    }
    
    if (cnt == 0) {
        ctx->queueTimeout = 0;
    }
    return (cnt == 0);
}

void Link_CheckTimeout(BATTLECONTEXT *ctx) {
    ctx->queueTimeout++;
    if (ctx->queueTimeout > 1800) {
        sub_02039AD8(1); 
    }
}

//Link_ClearServerBuffer..?
void ov12_0224EDC0(BATTLECONTEXT *ctx, int battlerId) {
    for (int i = 0; i < 256; i++) {
        ctx->unk_2300[battlerId][i] = 0;
    }
}

int GetBattlerVar(BATTLECONTEXT *ctx, int battlerId, u32 id, void *data) {
    BATTLEMON *mon = &ctx->battleMons[battlerId];
    
    switch (id) {
    case BMON_DATA_SPECIES:
        return mon->species;
    case BMON_DATA_ATK:
        return mon->atk;
    case BMON_DATA_DEF:
        return mon->def;
    case BMON_DATA_SPEED:
        return mon->speed;
    case BMON_DATA_SPATK:
        return mon->spAtk;
    case BMON_DATA_SPDEF:
        return mon->spDef;
    case BMON_DATA_MOVE1:
    case BMON_DATA_MOVE2:
    case BMON_DATA_MOVE3:
    case BMON_DATA_MOVE4:
        {
            int index = id - BMON_DATA_MOVE1; //see below
            return mon->moves[index];
        }
    case BMON_DATA_HP_IV:
        return mon->hpIV;
    case BMON_DATA_ATK_IV:
        return mon->atkIV;
    case BMON_DATA_DEF_IV:
        return mon->defIV;
    case BMON_DATA_SPEED_IV:
        return mon->speedIV;
    case BMON_DATA_SPATK_IV:
        return mon->spAtkIV;
    case BMON_DATA_SPDEF_IV:
        return mon->spDefIV;
    case BMON_DATA_IS_EGG:
        return mon->isEgg;
    case BMON_DATA_HAS_NICKNAME:
        return mon->hasNickname;
    case BMON_DATA_STAT_CHANGE_HP:
    case BMON_DATA_STAT_CHANGE_ATK:
    case BMON_DATA_STAT_CHANGE_DEF:
    case BMON_DATA_STAT_CHANGE_SPEED:
    case BMON_DATA_STAT_CHANGE_SPATK:
    case BMON_DATA_STAT_CHANGE_SPDEF:
    case BMON_DATA_STAT_CHANGE_ACC:
    case BMON_DATA_STAT_CHANGE_EVASION:
        {
            int index = id - BMON_DATA_STAT_CHANGE_HP; //see below
            return mon->statChanges[index];
        }
    case BMON_DATA_ABILITY:
        return mon->ability;
    case BMON_DATA_TYPE_1:
    case BMON_DATA_TYPE_2:
        return ov12_022584AC(ctx, battlerId, id);
    case BMON_DATA_GENDER:
        return mon->gender;
    case BMON_DATA_IS_SHINY:
        return mon->shiny;
    case BMON_DATA_MOVE1PP:
    case BMON_DATA_MOVE2PP:
    case BMON_DATA_MOVE3PP:
    case BMON_DATA_MOVE4PP:
        {
            int index = id - BMON_DATA_MOVE1PP; //annoying but required to match
            return mon->movePPCur[index];
        }
    case BMON_DATA_MOVE1PPCUR:
    case BMON_DATA_MOVE2PPCUR:
    case BMON_DATA_MOVE3PPCUR:
    case BMON_DATA_MOVE4PPCUR:
        {    
            int index = id - BMON_DATA_MOVE1PPCUR; //see above
            return mon->movePP[index];
        }
    case BMON_DATA_MOVE1MAXPP:
    case BMON_DATA_MOVE2MAXPP:
    case BMON_DATA_MOVE3MAXPP:
    case BMON_DATA_MOVE4MAXPP:
        {
            int index = id - BMON_DATA_MOVE1MAXPP; //see above
            return GetMoveMaxPP(mon->moves[index], mon->movePP[index]);
        }
    case BMON_DATA_LEVEL:
        return mon->level;
    case BMON_DATA_FRIENDSHIP:
        return mon->friendship;
    case BMON_DATA_NICKNAME:
        {
            int i;
            u16 *buffer = data;
            
            for (i = 0; i < 11; i++) {
                buffer[i] = mon->nickname[i];
            }
        }
        break;
    case BMON_DATA_NICKNAME2:
        CopyU16ArrayToString((STRING *)data, mon->nickname);
        break;
    case BMON_DATA_HP:
        return mon->hp;
    case BMON_DATA_MAXHP:
        return mon->maxHp;
    case BMON_DATA_OT_NAME:
        {
            int i;
            u16 *buffer = data;
            for (i = 0; i < 11; i++) {
                //BUG: this array doesn't have 11 elements, the reason for the bug is a typo in the original code
                //     where it used the length of a Pokemon's nickname rather than a trainer's nickname
                buffer[i] = mon->unk54[i]; 
            }
        }
        break;
    case BMON_DATA_EXP:
        return mon->exp;
    case BMON_DATA_PERSONALITY:
        return mon->personality;
    case BMON_DATA_STATUS:
        return mon->status;
    case BMON_DATA_STATUS2:
        return mon->status2;
    case BMON_DATA_OT_ID:
        return mon->otid;
    case BMON_DATA_HELD_ITEM:
        return mon->item;
    case BMON_DATA_56:
        return mon->unk78;
    case BMON_DATA_MSG_FLAG:
        return mon->msgFlag;
    case BMON_DATA_OT_GENDER:
        return mon->metGender;
    case BMON_DATA_MOVE_EFFECT:
        return mon->moveEffectFlags;
    case BMON_DATA_MOVE_EFFECT_TEMP:
        return mon->unk80;
    case BMON_DATA_DISABLED_TURNS:
        return mon->unk88.disabledTurns;
    case BMON_DATA_ENCORED_TURNS:
        return mon->unk88.encoredTurns;
    case BMON_DATA_IS_CHARGED:
        return mon->unk88.isCharged;
    case BMON_DATA_TAUNT_TURNS:
        return mon->unk88.tauntTurns;
    case BMON_DATA_PROTECT_SUCCESS_COUNT:
        return mon->unk88.protectSuccessTurns;
    case BMON_DATA_PERISH_SONG_TURNS:
        return mon->unk88.perishSongTurns;
    case BMON_DATA_ROLLOUT_TURNS:
        return mon->unk88.rolloutCount;
    case BMON_DATA_FURY_CUTTER_TURNS:
        return mon->unk88.furyCutterCount;
    case BMON_DATA_STOCKPILE_COUNT:
        return mon->unk88.stockpileCount;
    case BMON_DATA_STOCKPILE_DEF_BOOSTS:
        return mon->unk88.stockpileDefCount;
    case BMON_DATA_STOCKPILE_SPDEF_BOOSTS:
        return mon->unk88.stockpileSpDefCount;
    case BMON_DATA_TRUANT_FLAG:
        return mon->unk88.truantFlag;
    case BMON_DATA_FLASH_FIRE_ACTIVE:
        return mon->unk88.flashFire;
    case BMON_DATA_LOCKED_ON_BATTLER:
        return mon->unk88.battlerIdLockOn;
    case BMON_DATA_MIMICED_MOVE:
        return mon->unk88.mimicedMoveIndex;
    case BMON_DATA_BINDED_BATTLER:
        return mon->unk88.battlerIdBinding;
    case BMON_DATA_MEAN_LOOK_BATTLER:
        return mon->unk88.battlerIdMeanLook;
    case BMON_DATA_LAST_RESORT_COUNT:
        return mon->unk88.lastResortCount;
    case BMON_DATA_MAGNET_RISE:
        return mon->unk88.magnetRiseTurns;
    case BMON_DATA_HEAL_BLOCK:
        return mon->unk88.healBlockTurns;
    case BMON_DATA_81:
        return mon->unk88.unk4_13;
    case BMON_DATA_ITEM_KNOCKED_OFF:
        return mon->unk88.knockOffFlag;
    case BMON_DATA_METRONOME: //refers to the actual item, not the move
        return mon->unk88.metronomeTurns;
    case BMON_DATA_84:
        return mon->unk88.unk4_2B;
    case BMON_DATA_CUSTAP_FLAG:
        return mon->unk88.custapBerryFlag;
    case BMON_DATA_QUICK_CLAW_FLAG:
        return mon->unk88.quickClawFlag;
    case BMON_DATA_RECHARGE:
        return mon->unk88.rechargeCount;
    case BMON_DATA_FAKE_OUT:
        return mon->unk88.fakeOutCount;
    case BMON_DATA_SLOW_START_COUNT:
        return mon->unk88.slowStartTurns;
    case BMON_DATA_SUBSTITUTE_HP:
        return mon->unk88.substituteHp;
    case BMON_DATA_TRANSFORM_PERSONALITY:
        return mon->unk88.transformPersonality;
    case BMON_DATA_DISABLED_MOVE_NO:
        return mon->unk88.disabledMove;
    case BMON_DATA_ENCORED_MOVE_NO:
        return mon->unk88.encoredMove;
    case BMON_DATA_BINDING_MOVE_NO:
        return mon->unk88.bindingMove;
    case BMON_DATA_HELD_ITEM_RESTORE_HP:
        return mon->unk88.unk30;
    case BMON_DATA_SLOW_START_FLAG:
        return mon->slowStartFlag;
    case BMON_DATA_SLOW_START_END:
        return mon->slowStartEnded;
    case BMON_DATA_FORME:
        return mon->forme;
    case BMON_DATA_100:
        return GetBattlerVar(ctx, battlerId, ctx->tempWork, data);
    default:
        GF_ASSERT(FALSE);
    }
    
    return 0;
}

void SetBattlerVar(BATTLECONTEXT *ctx, int battlerId, u32 id, void *data) {
    u32 *data32 = (u32 *)data;
    u16 *data16 = (u16 *)data;
    s16 *datas16 = (s16 *)data;
    u8 *data8 = (u8 *)data;
    s8 *datas8 = (s8 *)data;
    BATTLEMON *mon = &ctx->battleMons[battlerId];
    
    switch (id) {
    case BMON_DATA_SPECIES:
        mon->species = *data16;
        break;
    case BMON_DATA_ATK:
        mon->atk = *data16;
        break;
    case BMON_DATA_DEF:
        mon->def = *data16;
        break;
    case BMON_DATA_SPEED:
        mon->speed = *data16;
        break;
    case BMON_DATA_SPATK:
        mon->spAtk = *data16;
        break;
    case BMON_DATA_SPDEF:
        mon->spDef = *data16;
        break;
    case BMON_DATA_MOVE1:
    case BMON_DATA_MOVE2:
    case BMON_DATA_MOVE3:
    case BMON_DATA_MOVE4:
        {
            int index = id - BMON_DATA_MOVE1;
            mon->moves[index] = *data16;
        }
        break;
    case BMON_DATA_HP_IV:
        mon->hpIV = *data8;
        break;
    case BMON_DATA_ATK_IV:
        mon->atkIV = *data8;
        break;
    case BMON_DATA_DEF_IV:
        mon->defIV = *data8;
        break;
    case BMON_DATA_SPEED_IV:
        mon->speedIV = *data8;
        break;
    case BMON_DATA_SPATK_IV:
        mon->spAtkIV = *data8;
        break;
    case BMON_DATA_SPDEF_IV:
        mon->spDefIV = *data8;
        break;
    case BMON_DATA_IS_EGG:
        mon->isEgg = *data8;
        break;
    case BMON_DATA_HAS_NICKNAME:
        mon->hasNickname = *data8;
        break;
    case BMON_DATA_STAT_CHANGE_HP:
    case BMON_DATA_STAT_CHANGE_ATK:
    case BMON_DATA_STAT_CHANGE_DEF:
    case BMON_DATA_STAT_CHANGE_SPEED:
    case BMON_DATA_STAT_CHANGE_SPATK:
    case BMON_DATA_STAT_CHANGE_SPDEF:
    case BMON_DATA_STAT_CHANGE_ACC:
    case BMON_DATA_STAT_CHANGE_EVASION:
        {
            int index = id - BMON_DATA_STAT_CHANGE_HP;
            mon->statChanges[index] = *datas8;
        }
        break;
    case BMON_DATA_ABILITY:
        mon->ability = *data8;
        break;
    case BMON_DATA_TYPE_1:
        mon->type1 = *data8;
        break;
    case BMON_DATA_TYPE_2:
        mon->type2 = *data8;
        break;
    case BMON_DATA_GENDER:
        mon->gender = *data8;
        break;
    case BMON_DATA_IS_SHINY:
        mon->shiny = *data8;
        break;
    case BMON_DATA_MOVE1PP:
    case BMON_DATA_MOVE2PP:
    case BMON_DATA_MOVE3PP:
    case BMON_DATA_MOVE4PP:
        {
            int index = id - BMON_DATA_MOVE1PP; 
            mon->movePPCur[index] = *data8;
        }
        break;
    case BMON_DATA_MOVE1PPCUR:
    case BMON_DATA_MOVE2PPCUR:
    case BMON_DATA_MOVE3PPCUR:
    case BMON_DATA_MOVE4PPCUR:
        {    
            int index = id - BMON_DATA_MOVE1PPCUR;
            mon->movePP[index] = *data8;
        }
        break;
    case BMON_DATA_MOVE1MAXPP:
    case BMON_DATA_MOVE2MAXPP:
    case BMON_DATA_MOVE3MAXPP:
    case BMON_DATA_MOVE4MAXPP:
        GF_ASSERT(FALSE);
        break;
    case BMON_DATA_LEVEL:
        mon->level = *data8;
        break;
    case BMON_DATA_FRIENDSHIP:
        mon->friendship = *data8;
        break;
    case BMON_DATA_NICKNAME:
        for (int i = 0; i < 11; i++) {
            mon->nickname[i] = data16[i];
        }
        break;
    case BMON_DATA_HP:
        mon->hp = *datas16;
        break;
    case BMON_DATA_MAXHP:
        mon->maxHp = *data16;
        break;
    case BMON_DATA_OT_NAME:
        for (int i = 0; i < 11; i++) {
            //BUG: this array doesn't have 11 elements, the reason for the bug is a typo in the original code
            //     where it used the length of a Pokemon's nickname rather than a trainer's nickname
            mon->unk54[i] = data16[i]; 
            //Side note but since this will overwrite the space in memory where the pokemon's exp is stored, there could be some funny things to come of this
        }
        break;
    case BMON_DATA_EXP:
        mon->exp = *data32;
        break;
    case BMON_DATA_PERSONALITY:
        mon->personality = *data32;
        break;
    case BMON_DATA_STATUS:
        mon->status = *data32;
        break;
    case BMON_DATA_STATUS2:
        mon->status2 = *data32;
        break;
    case BMON_DATA_OT_ID:
        mon->otid = *data32;
        break;
    case BMON_DATA_HELD_ITEM:
        mon->item = *data16;
        break;
    case BMON_DATA_56:
        mon->unk78 = *data8;
        break;
    case BMON_DATA_MSG_FLAG:
        mon->msgFlag = *data8;
        break;
    case BMON_DATA_OT_GENDER:
        mon->metGender = *data8;
        break;
    case BMON_DATA_MOVE_EFFECT:
        mon->moveEffectFlags = *data32;
        break;
    case BMON_DATA_MOVE_EFFECT_TEMP:
        mon->unk80 = *data32;
        break;
    case BMON_DATA_DISABLED_TURNS:
        mon->unk88.disabledTurns = *data8;
        break;
    case BMON_DATA_ENCORED_TURNS:
        mon->unk88.encoredTurns = *data8;
        break;
    case BMON_DATA_IS_CHARGED:
        mon->unk88.isCharged = *data8;
        break;
    case BMON_DATA_TAUNT_TURNS:
        mon->unk88.tauntTurns = *data8;
        break;
    case BMON_DATA_PROTECT_SUCCESS_COUNT:
        mon->unk88.protectSuccessTurns = *data8;
        break;
    case BMON_DATA_PERISH_SONG_TURNS:
        mon->unk88.perishSongTurns = *data8;
        break;
    case BMON_DATA_ROLLOUT_TURNS:
        mon->unk88.rolloutCount = *data8;
        break;
    case BMON_DATA_FURY_CUTTER_TURNS:
        mon->unk88.furyCutterCount = *data8;
        break;
    case BMON_DATA_STOCKPILE_COUNT:
        mon->unk88.stockpileCount = *data8;
        break;
    case BMON_DATA_STOCKPILE_DEF_BOOSTS:
        mon->unk88.stockpileDefCount = *data8;
        break;
    case BMON_DATA_STOCKPILE_SPDEF_BOOSTS:
        mon->unk88.stockpileSpDefCount = *data8;
        break;
    case BMON_DATA_TRUANT_FLAG:
        mon->unk88.truantFlag = *data8;
        break;
    case BMON_DATA_FLASH_FIRE_ACTIVE:
        mon->unk88.flashFire = *data8;
        break;
    case BMON_DATA_LOCKED_ON_BATTLER:
        mon->unk88.battlerIdLockOn = *data8;
        break;
    case BMON_DATA_MIMICED_MOVE:
        mon->unk88.mimicedMoveIndex = *data8;
        break;
    case BMON_DATA_BINDED_BATTLER:
        mon->unk88.battlerIdBinding = *data8;
        break;
    case BMON_DATA_MEAN_LOOK_BATTLER:
        mon->unk88.battlerIdMeanLook = *data8;
        break;
    case BMON_DATA_LAST_RESORT_COUNT:
        mon->unk88.lastResortCount = *data8;
        break;
    case BMON_DATA_MAGNET_RISE:
        mon->unk88.magnetRiseTurns = *data8;
        break;
    case BMON_DATA_HEAL_BLOCK:
        mon->unk88.healBlockTurns = *data8;
        break;
    case BMON_DATA_81:
        mon->unk88.unk4_13 = *data8;
        break;
    case BMON_DATA_ITEM_KNOCKED_OFF:
        mon->unk88.knockOffFlag = *data8;
        break;
    case BMON_DATA_METRONOME: //refers to the actual item, not the move
        mon->unk88.metronomeTurns = *data8;
        break;
    case BMON_DATA_84:
        mon->unk88.unk4_2B = *data8;
        break;
    case BMON_DATA_CUSTAP_FLAG:
        mon->unk88.custapBerryFlag = *data8;
        break;
    case BMON_DATA_QUICK_CLAW_FLAG:
        mon->unk88.quickClawFlag = *data8;
        break;
    case BMON_DATA_RECHARGE:
        mon->unk88.rechargeCount = *data32;
        break;
    case BMON_DATA_FAKE_OUT:
        mon->unk88.fakeOutCount = *data32;
        break;
    case BMON_DATA_SLOW_START_COUNT:
        mon->unk88.slowStartTurns = *data32;
        break;
    case BMON_DATA_SUBSTITUTE_HP:
        mon->unk88.substituteHp = *data32;
        break;
    case BMON_DATA_TRANSFORM_PERSONALITY:
        mon->unk88.transformPersonality = *data32;
        break;
    case BMON_DATA_DISABLED_MOVE_NO:
        mon->unk88.disabledMove = *data16;
        break;
    case BMON_DATA_ENCORED_MOVE_NO:
        mon->unk88.encoredMove = *data16;
        break;
    case BMON_DATA_BINDING_MOVE_NO:
        mon->unk88.bindingMove = *data16;
        break;
    case BMON_DATA_HELD_ITEM_RESTORE_HP:
        mon->unk88.unk30 = *data32;
        break;
    case BMON_DATA_SLOW_START_FLAG:
        mon->slowStartFlag = *data8;
        break;
    case BMON_DATA_SLOW_START_END:
        mon->slowStartEnded = *data8;
        break;
    case BMON_DATA_FORME:
        mon->forme = *data8;
        break;
    case BMON_DATA_100:
        SetBattlerVar(ctx, battlerId, ctx->tempWork, data);
        break;
    default:
        GF_ASSERT(FALSE);
    }
}

void ov12_0224F794(BATTLECONTEXT *ctx, int battlerId, u32 varId, int data) {
    AddBattlerVar(&ctx->battleMons[battlerId], varId, data);
}

void AddBattlerVar(BATTLEMON *mon, u32 varId, int data) {
    switch (varId) {
    case BMON_DATA_ATK:
        mon->atk += data;
        break;
    case BMON_DATA_DEF:
        mon->def += data;
        break;
    case BMON_DATA_SPEED:
        mon->speed += data;
        break;
    case BMON_DATA_SPATK:
        mon->spAtk += data;
        break;
    case BMON_DATA_SPDEF:
        mon->spDef += data;
        break;
    case BMON_DATA_HP_IV:
        mon->hpIV += data;
        break;
    case BMON_DATA_ATK_IV:
        mon->atkIV += data;
        break;
    case BMON_DATA_DEF_IV:
        mon->defIV += data;
        break;
    case BMON_DATA_SPEED_IV:
        mon->speedIV += data;
        break;
    case BMON_DATA_SPATK_IV:
        mon->spAtkIV += data;
        break;
    case BMON_DATA_SPDEF_IV:
        mon->spDefIV += data;
        break;
    case BMON_DATA_STAT_CHANGE_HP:
    case BMON_DATA_STAT_CHANGE_ATK:
    case BMON_DATA_STAT_CHANGE_DEF:
    case BMON_DATA_STAT_CHANGE_SPEED:
    case BMON_DATA_STAT_CHANGE_SPATK:
    case BMON_DATA_STAT_CHANGE_SPDEF:
    case BMON_DATA_STAT_CHANGE_ACC:
    case BMON_DATA_STAT_CHANGE_EVASION:
        {
            int index = varId - BMON_DATA_STAT_CHANGE_HP;
            if (mon->statChanges[index] + data < 0) {
                mon->statChanges[index] = 0;
            } else if (mon->statChanges[index] + data > 12) {
                mon->statChanges[index] = 12;
            } else {
                mon->statChanges[index] += data;
            }
        }
        break;
    case BMON_DATA_MOVE1PP:
    case BMON_DATA_MOVE2PP:
    case BMON_DATA_MOVE3PP:
    case BMON_DATA_MOVE4PP:
        {
            int index = varId - BMON_DATA_MOVE1PP; 
            
            int maxPP = GetMoveMaxPP(mon->moves[index], mon->movePP[index]);
            if (mon->movePPCur[index] + data > maxPP) {
                mon->movePPCur[index] = maxPP;
            } else {
                mon->movePPCur[index] += data;
            }
        }
        break;
    case BMON_DATA_MOVE1PPCUR:
    case BMON_DATA_MOVE2PPCUR:
    case BMON_DATA_MOVE3PPCUR:
    case BMON_DATA_MOVE4PPCUR:
        {    
            int index = varId - BMON_DATA_MOVE1PPCUR;
            mon->movePP[index] += data;
        }
        break;
    case BMON_DATA_LEVEL:
        mon->level += data;
        break;
    case BMON_DATA_FRIENDSHIP:
        {
            int temp = mon->friendship;
            
            if (temp + data > 255) {
                temp = 255;
            } else if (temp + data < 0) {
                temp = 0;
            } else {
                temp += data;
            }
            
            mon->friendship = temp;
        }
        break;
    case BMON_DATA_HP:
        {
            if (mon->hp + data > mon->maxHp) {
                mon->hp = mon->maxHp;
            } else {
                mon->hp += data;
            }
        }
        break;
    case BMON_DATA_MAXHP:
        mon->maxHp += data;
        break;
    case BMON_DATA_EXP:
        mon->exp += data;
        break;
    case BMON_DATA_PERSONALITY:
        mon->personality += data;
        break;
    case BMON_DATA_DISABLED_TURNS:
        mon->unk88.disabledTurns += data;
        break;
    case BMON_DATA_ENCORED_TURNS:
        mon->unk88.encoredTurns += data;
        break;
    case BMON_DATA_IS_CHARGED:
        mon->unk88.isCharged += data;
        break;
    case BMON_DATA_TAUNT_TURNS:
        mon->unk88.tauntTurns += data;
        break;
    case BMON_DATA_PROTECT_SUCCESS_COUNT:
        mon->unk88.protectSuccessTurns += data;
        break;
    case BMON_DATA_PERISH_SONG_TURNS:
        mon->unk88.perishSongTurns += data;
        break;
    case BMON_DATA_ROLLOUT_TURNS:
        mon->unk88.rolloutCount += data;
        break;
    case BMON_DATA_FURY_CUTTER_TURNS:
        mon->unk88.furyCutterCount += data;
        break;
    case BMON_DATA_STOCKPILE_COUNT:
        mon->unk88.stockpileCount += data;
        break;
    case BMON_DATA_STOCKPILE_DEF_BOOSTS:
        mon->unk88.stockpileDefCount += data;
        break;
    case BMON_DATA_STOCKPILE_SPDEF_BOOSTS:
        mon->unk88.stockpileSpDefCount += data;
        break;
    case BMON_DATA_LAST_RESORT_COUNT:
        mon->unk88.lastResortCount += data;
        break;
    case BMON_DATA_MAGNET_RISE:
        mon->unk88.magnetRiseTurns += data;
        break;
    case BMON_DATA_HEAL_BLOCK:
        mon->unk88.healBlockTurns += data;
        break;
    case BMON_DATA_RECHARGE:
        mon->unk88.rechargeCount += data;
        break;
    case BMON_DATA_FAKE_OUT:
        mon->unk88.fakeOutCount += data;
        break;
    case BMON_DATA_SLOW_START_COUNT:
        mon->unk88.slowStartTurns += data;
        break;
    case BMON_DATA_SUBSTITUTE_HP:
        mon->unk88.substituteHp += data;
        break;
    case BMON_DATA_HELD_ITEM_RESTORE_HP:
        mon->unk88.unk30 += data;
        break;
    case BMON_DATA_SLOW_START_FLAG:
        mon->slowStartFlag += data;
        break;
    case BMON_DATA_SLOW_START_END:
        mon->slowStartEnded += data;
        break;
    case BMON_DATA_FORME:
        mon->forme += data;
        break;
    default:
        GF_ASSERT(FALSE);
    }
}

extern u8 sStatChangeTable[13][2];
extern u8 sSpeedHalvingItemEffects[8];

u8 ov12_0224FC48(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId1, int battlerId2, int flag) {
    u8 ret = 0; //0 - don't sort, 1 - sort, 2 - sort (speed tie + won random check)
    u32 speed1, speed2;
    u16 moveNo1 = 0;
    u16 moveNo2 = 0;
    u8 heldItem1;
    u8 extra1;
    u8 heldItem2;
    u8 extra2;
    s8 movePriority1 = 0;
    s8 movePriority2 = 0;
    u8 boostedPriority1 = 0; 
    u8 boostedPriority2 = 0;
    u8 loweredPriority1 = 0;
    u8 loweredPriority2 = 0;
    int action1;
    int action2;
    int movePos1;
    int movePos2;
    int ability1;
    int ability2;
    int speedStatChange1;
    int speedStatChange2;
    int i;
    
    if (ctx->battleMons[battlerId1].hp == 0 && ctx->battleMons[battlerId2].hp) {
        return 1;
    }
    if (ctx->battleMons[battlerId1].hp && ctx->battleMons[battlerId2].hp == 0) {
        return 0;
    }
    
    ability1 = GetBattlerAbility(ctx, battlerId1);
    ability2 = GetBattlerAbility(ctx, battlerId2);
    
    heldItem1 = GetBattlerHeldItemEffect(ctx, battlerId1);
    extra1 = BattleSystem_GetHeldItemDamageBoost(ctx, battlerId1, 0);
    heldItem2 = GetBattlerHeldItemEffect(ctx, battlerId2);
    extra2 = BattleSystem_GetHeldItemDamageBoost(ctx, battlerId2, 0);
    
    speedStatChange1 = ctx->battleMons[battlerId1].statChanges[3];
    speedStatChange2 = ctx->battleMons[battlerId2].statChanges[3];
    
    if (GetBattlerAbility(ctx, battlerId1) == ABILITY_SIMPLE) {
        speedStatChange1 = 6 + (speedStatChange1-6)*2;
        if (speedStatChange1 > 12) {
            speedStatChange1 = 12;
        } 
        if (speedStatChange1 < 0) {
            speedStatChange1 = 0;
        }
    }
    if (GetBattlerAbility(ctx, battlerId2) == ABILITY_SIMPLE) {
        speedStatChange2 = 6 + (speedStatChange2-6)*2;
        if (speedStatChange2 > 12) {
            speedStatChange2 = 12;
        } 
        if (speedStatChange2 < 0) {
            speedStatChange2 = 0;
        }
    }
    
    speed1 = ctx->battleMons[battlerId1].speed * sStatChangeTable[speedStatChange1][0]/sStatChangeTable[speedStatChange1][1];
    speed2 = ctx->battleMons[battlerId2].speed * sStatChangeTable[speedStatChange2][0]/sStatChangeTable[speedStatChange2][1];
    
    if (!CheckAbilityActive(bsys, ctx, 8, 0, ABILITY_CLOUD_NINE) && !CheckAbilityActive(bsys, ctx, 8, 0, ABILITY_AIR_LOCK)) {
        if ((ability1 == ABILITY_SWIFT_SWIM && ctx->fieldCondition & FIELD_CONDITION_RAIN_ALL) ||
            (ability1 == ABILITY_CHLOROPHYLL && ctx->fieldCondition & FIELD_CONDITION_SUN_ALL)) {
                speed1 *= 2;
            }        
        if ((ability2 == ABILITY_SWIFT_SWIM && ctx->fieldCondition & FIELD_CONDITION_RAIN_ALL) ||
            (ability2 == ABILITY_CHLOROPHYLL && ctx->fieldCondition & FIELD_CONDITION_SUN_ALL)) {
                speed2 *= 2;
            }
    }
    
    for (i = 0; i < NELEMS(sSpeedHalvingItemEffects); i++) {
        if (GetItemHoldEffect(ctx, ctx->battleMons[battlerId1].item, 1) == sSpeedHalvingItemEffects[i]) {
            speed1 /= 2;
            break;
        }
    }
    
    if (heldItem1 == HOLD_EFFECT_CHOICE_SPEED) {
        speed1 = speed1 * 15 / 10;
    }
    
    if (heldItem1 == HOLD_EFFECT_DITTO_SPEED_UP && ctx->battleMons[battlerId1].species == SPECIES_DITTO) {
        speed1 *= 2;
    }
    
    if (ability1 == ABILITY_QUICK_FEET && ctx->battleMons[battlerId1].status & 0xFF) {
        speed1 = speed1 * 15 / 10;
    } else if (ctx->battleMons[battlerId1].status & STATUS_PARALYSIS) {
        speed1 /= 4;
    }
    
    if (ability1 == ABILITY_SLOW_START && ctx->totalTurns - ctx->battleMons[battlerId1].unk88.slowStartTurns < 5) {
        speed1 /= 2;
    }
    
    if (ability1 == ABILITY_UNBURDEN && ctx->battleMons[battlerId1].unk88.knockOffFlag && ctx->battleMons[battlerId1].item == FALSE) {
        speed1 *= 2;
    }

    if (ctx->fieldSideConditionFlags[BattleSys_GetFieldSide(bsys, battlerId1)] & SIDE_CONDITION_TAILWIND) {
        speed1 *= 2;
    }
    
    if (heldItem1 == HOLD_EFFECT_SOMETIMES_PRIORITY) {
        if (ctx->unk_310C[battlerId1] % (100 / extra1) == 0) {
            boostedPriority1 = 1;
            
            if (!flag) {
                ctx->battleMons[battlerId1].unk88.quickClawFlag = TRUE;
            }
        }
    }
    
    if (heldItem1 == HOLD_EFFECT_PINCH_PRIORITY) {
        if (GetBattlerAbility(ctx, battlerId1) == ABILITY_GLUTTONY) {
            extra1 /= 2;
        }
        if (ctx->battleMons[battlerId1].hp <= ctx->battleMons[battlerId1].maxHp/extra1) {
            boostedPriority1 = 1;
            if (!flag) {
                ctx->battleMons[battlerId1].unk88.custapBerryFlag = TRUE;
            }
        }
    }
    
    if (heldItem1 == HOLD_EFFECT_SPEED_DOWN) {
        loweredPriority1 = 1;
    }
    
    for (i = 0; i < NELEMS(sSpeedHalvingItemEffects); i++) {
        if (GetItemHoldEffect(ctx, ctx->battleMons[battlerId2].item, 1) == sSpeedHalvingItemEffects[i]) {
            speed2 /= 2;
            break;
        }
    }
    
    if (heldItem2 == HOLD_EFFECT_CHOICE_SPEED) {
        speed2 = speed2 * 15 / 10;
    }
    
    if (heldItem2 == HOLD_EFFECT_DITTO_SPEED_UP && ctx->battleMons[battlerId2].species == SPECIES_DITTO) {
        speed2 *= 2;
    }
    
    if (ability2 == ABILITY_QUICK_FEET && ctx->battleMons[battlerId2].status & 0xFF) {
        speed2 = speed2 * 15 / 10;
    } else if (ctx->battleMons[battlerId2].status & STATUS_PARALYSIS) {
        speed2 /= 4;
    }
    
    if (ability2 == ABILITY_SLOW_START && ctx->totalTurns - ctx->battleMons[battlerId2].unk88.slowStartTurns < 5) {
        speed2 /= 2;
    }
    
    if (ability2 == ABILITY_UNBURDEN && ctx->battleMons[battlerId2].unk88.knockOffFlag && ctx->battleMons[battlerId2].item == FALSE) {
        speed2 *= 2;
    }

    if (ctx->fieldSideConditionFlags[BattleSys_GetFieldSide(bsys, battlerId2)] & SIDE_CONDITION_TAILWIND) {
        speed2 *= 2;
    }
    
    if (heldItem2 == HOLD_EFFECT_SOMETIMES_PRIORITY) {
        if (ctx->unk_310C[battlerId2] % (100 / extra2) == 0) {
            boostedPriority2 = 1;
            
            if (!flag) {
                ctx->battleMons[battlerId2].unk88.quickClawFlag = TRUE;
            }
        }
    }
    
    if (heldItem2 == HOLD_EFFECT_PINCH_PRIORITY) {
        if (GetBattlerAbility(ctx, battlerId2) == ABILITY_GLUTTONY) {
            extra2 /= 2;
        }
        if (ctx->battleMons[battlerId2].hp <= ctx->battleMons[battlerId2].maxHp/extra2) {
            boostedPriority2 = 1;
            if (!flag) {
                ctx->battleMons[battlerId2].unk88.custapBerryFlag = TRUE;
            }
        }
    }
    
    if (heldItem2 == HOLD_EFFECT_SPEED_DOWN) {
        loweredPriority2 = 1;
    }
    
    ctx->unk_21F0[battlerId1] = speed1;
    ctx->unk_21F0[battlerId2] = speed2;
    
    if (!flag) {
        action1 = ctx->unk_21A8[battlerId1][3];
        action2 = ctx->unk_21A8[battlerId2][3];
        movePos1 = ctx->movePos[battlerId1];
        movePos2 = ctx->movePos[battlerId2];
        if (action1 == 1) { //fight button
            if (ctx->turnData[battlerId1].struggleFlag) {
                moveNo1 = MOVE_STRUGGLE;
            } else {
                moveNo1 = GetBattlerVar(ctx, battlerId1, BMON_DATA_MOVE1 + movePos1, NULL);
            }
        }
        if (action2 == 1) { //fight button
            if (ctx->turnData[battlerId2].struggleFlag) {
                moveNo2 = MOVE_STRUGGLE;
            } else {
                moveNo2 = GetBattlerVar(ctx, battlerId2, BMON_DATA_MOVE1 + movePos2, NULL);
            }
        }
        movePriority1 = ctx->unk_334.moveData[moveNo1].priority;
        movePriority2 = ctx->unk_334.moveData[moveNo2].priority;
    }
    
    if (movePriority1 == movePriority2) {
        if (boostedPriority1 && boostedPriority2) {
            if (speed1 < speed2) {
                ret = 1;
            } else if (speed1 == speed2 && BattleSys_Random(bsys) & 1) {
                ret = 2;
            }
        } else if (!boostedPriority1 && boostedPriority2) {
            ret = 1;
        } else if (boostedPriority1 && !boostedPriority2) {
            ret = 0;
        } else if (loweredPriority1 && loweredPriority2) {
            if (speed1 > speed2) {
                ret = 1;
            } else if (speed1 == speed2 && BattleSys_Random(bsys)&1) {
                ret = 2;
            }
        } else if (loweredPriority1 && !loweredPriority2) {
            ret = 1;
        } else if (!loweredPriority1 && loweredPriority2) {
            ret = 0;
        } else if (ability1 == ABILITY_STALL && ability2 == ABILITY_STALL) {
            if (speed1 > speed2) {
                ret = 1;
            } else if (speed1 == speed2 && BattleSys_Random(bsys)&1) {
                ret = 2;
            }
        } else if (ability1 == ABILITY_STALL && ability2 != ABILITY_STALL) {
            ret = 1;
        } else if (ability1 != ABILITY_STALL && ability2 == ABILITY_STALL) {
            ret = 0;
        } else if (ctx->fieldCondition & FIELD_CONDITION_TRICK_ROOM) {
            if (speed1 > speed2) {
                ret = 1;
            }
            if (speed1 == speed2 && BattleSys_Random(bsys)&1) {
                ret = 2;
            }
        } else {
            if (speed1 < speed2) {
                ret = 1;
            }
            if (speed1 == speed2 && BattleSys_Random(bsys)&1) {
                ret = 2;
            }
        }
    } else if (movePriority1 < movePriority2) {
        ret = 1;
    }
    
    return ret;
}

//Function may be mislabeled
void BattleSystem_ClearExperienceEarnFlags(BATTLECONTEXT *ctx, int battlerId) {
    ctx->unk_A4[(battlerId >> 1) & 1] = 0; 
}

void BattleSystem_SetExperienceEarnFlags(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId) {
    int i = 0;
    u32 battleType = BattleSys_GetBattleType(bsys);
    
    while (i <= 2) {
        if (!(ctx->unk_3108 & MaskOfFlagNo(i)) &&
            !(ctx->unk_3108 & MaskOfFlagNo(battlerId)) &&
            ctx->battleMons[battlerId].hp) {
                ctx->unk_A4[(battlerId >> 1) & 1] |= MaskOfFlagNo(ctx->selectedMonIndex[i]);
            }
        i += 2;
        if (battleType == 0x4a || battleType == 0x4b) {
            break;
        }
    }
}

BOOL ov12_022503EC(BattleSystem *bsys, BATTLECONTEXT *ctx, int *out) {
    BOOL ret = FALSE;
    
    if (ctx->unk_2170 & (1 << 29)) {
        *out = ov12_02258348(ctx, 1, ctx->unk_2170);
        ctx->unk_2170 = 0;
        if (!(ctx->moveStatusFlag & 0x801FDA49)) {
            ret = TRUE;
        }
    } else if (ctx->unk_2170) {
        *out = ov12_02258348(ctx, 1, ctx->unk_2170);
        if (ctx->battleMons[ctx->battlerIdStatChange].hp && 
            (!(ctx->moveStatusFlag & 0x801FDA49) || 
            ((ctx->unk_2170 & (1 << 23)) && (ctx->moveStatusFlag & 0x40008)) ||
            ((ctx->unk_2170 & (1 << 28)) && (ctx->moveStatusFlag & 0x10001)))) {
                ret = TRUE;
            }
        ctx->unk_2170 = 0;
    }
    
    return ret;
}

BOOL ov12_02250490(BattleSystem *bsys, BATTLECONTEXT *ctx, int *out) {
    BOOL ret = FALSE;
    u16 effectChance;
    
    if (ctx->unk_2174 & (1 << 29)) {
        *out = ov12_02258348(ctx, 2, ctx->unk_2174);
        ctx->unk_2174 = 0;
        if (!(ctx->moveStatusFlag & 0x801FDA49)) {
            ret = TRUE;
        }
    } else if (ctx->unk_2174 & (1 << 24)) {
        *out = ov12_02258348(ctx, 2, ctx->unk_2174);
        ctx->unk_2174 = 0;
        if (!ov12_02256838(ctx, ctx->battlerIdStatChange) && !(ctx->moveStatusFlag & 0x801FDA49)) {
            ret = TRUE;
        }
    } else if (ctx->unk_2174 & (1 << 25)) {
        *out = ov12_02258348(ctx, 2, ctx->unk_2174);
        ctx->unk_2174 = 0;
        if (ctx->battleMons[ctx->battlerIdStatChange].hp && !ov12_02256838(ctx, ctx->battlerIdStatChange) && !(ctx->moveStatusFlag & 0x801FDA49)) {
            ret = TRUE;
        }
    } else if (ctx->unk_2174 & (1 << 28)) {
        *out = ov12_02258348(ctx, 2, ctx->unk_2174);
        ctx->unk_2174 = 0; 
        if (ctx->battleMons[ctx->battlerIdStatChange].hp) {
            ret = TRUE;
        }
    } else if (ctx->unk_2174 & (1 << 26)) {
        //the inclusion of serene grace here makes me think this function has to do with secondary move effects
        if (GetBattlerAbility(ctx, ctx->battlerIdAttacker) == ABILITY_SERENE_GRACE) {
            effectChance = ctx->unk_334.moveData[ctx->moveNoCur].effectChance * 2;
        } else {
            effectChance = ctx->unk_334.moveData[ctx->moveNoCur].effectChance;
        }
        
        GF_ASSERT(effectChance);
        
        if ((BattleSys_Random(bsys) % 100) < effectChance) {
            ctx->linkStatus |= (1 << 22);
        }
        
        *out = ov12_02258348(ctx, 2, ctx->unk_2174);
        ctx->unk_2174 = 0; 
        if (!ctx->battleMons[ctx->battlerIdStatChange].hp) {
            ctx->linkStatus &= 0xFFBFFFFF;
        }
        
        ret = TRUE;
    } else if (ctx->unk_2174) {
        //the inclusion of serene grace here makes me think this function has to do with secondary move effects
        if (GetBattlerAbility(ctx, ctx->battlerIdAttacker) == ABILITY_SERENE_GRACE) {
            effectChance = ctx->unk_334.moveData[ctx->moveNoCur].effectChance * 2;
        } else {
            effectChance = ctx->unk_334.moveData[ctx->moveNoCur].effectChance;
        }
        
        GF_ASSERT(effectChance);
        
        if ((BattleSys_Random(bsys) % 100) < effectChance) {
            *out = ov12_02258348(ctx, 2, ctx->unk_2174);
            ctx->unk_2174 = 0; 
            if (ctx->battleMons[ctx->battlerIdStatChange].hp && !ov12_02256838(ctx, ctx->battlerIdStatChange) && !(ctx->moveStatusFlag & 0x801FDA49)) {
                ret = TRUE;
            }
        }
    } else if (ctx->unk_2178) {
        *out = ov12_02258348(ctx, 3, ctx->unk_2178);
        ctx->unk_2178 = 0; 
        if (ctx->battleMons[ctx->battlerIdStatChange].hp) {
            ret = TRUE;
        }
    }

    return ret;
}

int ov12_022506D4(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerIdAttacker, u16 moveNo, int a4, int a5) {
    int battlerIdTarget = 0xFF;
    int unkA;
    
    if (moveNo) {
        unkA = ctx->unk_334.moveData[moveNo].unk8;
    } else {
        unkA = a5;
    }
    
    if (unkA == 4) {
        int battlerId;
        int maxBattlers = BattleSys_GetMaxBattlers(bsys);
        OpponentData *opponent = BattleSys_GetOpponentDataByBattlerId(bsys, battlerIdAttacker);
        u8 flag = ov12_02261258(opponent);
        
        for (ctx->unk_217E = 0; ctx->unk_217E < maxBattlers; ctx->unk_217E++) {
            battlerId = ctx->unk_21EC[ctx->unk_217E];
            if (ctx->battleMons[battlerId].hp) {
                opponent = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
                if (((flag & 1) && !(ov12_02261258(opponent) & 1)) ||
                    (!(flag & 1) && (ov12_02261258(opponent) & 1))) {
                    battlerIdTarget = battlerId;
                    break;
                }
            }
        }
        
        if (ctx->unk_217E != maxBattlers) {
            ctx->unk_217E++;
        }
    } else if (unkA == 8) {
        int battlerId;
        int maxBattlers = BattleSys_GetMaxBattlers(bsys);
        
        for (ctx->unk_217E = 0; ctx->unk_217E < maxBattlers; ctx->unk_217E++) {
            battlerId = ctx->unk_21EC[ctx->unk_217E];
            if (ctx->battleMons[battlerId].hp) {
                if (battlerId != battlerIdAttacker) {
                    battlerIdTarget = battlerId;
                    break;
                }
            }
        }
        
        if (ctx->unk_217E != maxBattlers) {
            ctx->unk_217E++;
        }
    } else if (unkA == (1 << 9) && (a4 == 1)) {
        int battleType = BattleSys_GetBattleType(bsys);
        
        if ((battleType & BATTLE_TYPE_DOUBLES) && (BattleSys_Random(bsys) % 2) == 0) {
            battlerIdTarget = BattleSys_GetBattlerIdPartner(bsys, battlerIdAttacker);
            if (!ctx->battleMons[battlerIdTarget].hp) {
                battlerIdTarget = battlerIdAttacker;
            }
        } else {
            battlerIdTarget = battlerIdAttacker;
        }
    } else if (unkA == (1 << 10) && (a4 == 1)) {
        battlerIdTarget = ov12_02253DA0(bsys, ctx, battlerIdAttacker);
    } else if (unkA == (1 << 7)) {
        battlerIdTarget = ov12_02253DA0(bsys, ctx, battlerIdAttacker);
    } else if (unkA == (1 << 4) || unkA == (1 << 5) || unkA == 1 || unkA == (1 << 6)) {
        battlerIdTarget = battlerIdAttacker;
    } else if (unkA == (1 << 8)) {
        int battleType = BattleSys_GetBattleType(bsys);
        
        if (battleType & BATTLE_TYPE_DOUBLES) {
            battlerIdTarget = BattleSys_GetBattlerIdPartner(bsys, battlerIdAttacker);
        } else {
            battlerIdTarget = battlerIdAttacker;
        }
    } else if (unkA == (1 << 9)) {
        int battleType = BattleSys_GetBattleType(bsys);
        
        if (battleType & BATTLE_TYPE_DOUBLES) {
            battlerIdTarget = ctx->unk_21A8[battlerIdAttacker][1];
            if (!ctx->battleMons[battlerIdTarget].hp) {
                battlerIdTarget = battlerIdAttacker;
            }
        } else {
            battlerIdTarget = battlerIdAttacker;
        }
    } else if (unkA == 2 || a4 == 1) {
        int battleType = BattleSys_GetBattleType(bsys);
        int side = BattleSys_GetFieldSide(bsys, battlerIdAttacker)^1;
        int battlerIdOpponents[2];
        battlerIdOpponents[0] = ov12_0223ABB8(bsys, battlerIdAttacker, 0);
        battlerIdOpponents[1] = ov12_0223ABB8(bsys, battlerIdAttacker, 2);
        
        if (battleType & BATTLE_TYPE_DOUBLES) {
            if (ctx->fieldSideConditionData[side].followMeFlag && ctx->battleMons[ctx->fieldSideConditionData[side].battlerIdFollowMe].hp) {
                battlerIdTarget = ctx->fieldSideConditionData[side].battlerIdFollowMe;
            } else if (ctx->battleMons[battlerIdOpponents[0]].hp && ctx->battleMons[battlerIdOpponents[1]].hp) {
                //This looks like targeting for Outrage in double battles
                side = BattleSys_Random(bsys) & 1;
                battlerIdTarget = battlerIdOpponents[side];
            } else if (ctx->battleMons[battlerIdOpponents[0]].hp) {
                battlerIdTarget = battlerIdOpponents[0];
            } else if (ctx->battleMons[battlerIdOpponents[1]].hp) {
                battlerIdTarget = battlerIdOpponents[1];
            }
        } else if (ctx->battleMons[battlerIdAttacker^1].hp) {
            battlerIdTarget = battlerIdAttacker^1;
        }
    } else {
        int side = BattleSys_GetFieldSide(bsys, battlerIdAttacker)^1;
        int battlerIdTargetTemp = ctx->unk_21A8[battlerIdAttacker][1];
        BattleSys_GetMaxBattlers(bsys);
        
        if (ctx->fieldSideConditionData[side].followMeFlag && ctx->battleMons[ctx->fieldSideConditionData[side].battlerIdFollowMe].hp) {
            battlerIdTarget = ctx->fieldSideConditionData[side].battlerIdFollowMe;
        } else if (ctx->battleMons[battlerIdTargetTemp].hp) {
            battlerIdTarget = battlerIdTargetTemp;
        } else {
            battlerIdTargetTemp = ov12_02253DA0(bsys, ctx, battlerIdAttacker);
            if (ctx->battleMons[battlerIdTargetTemp].hp) {
                battlerIdTarget = battlerIdTargetTemp;
            }
        }
    }
    
    return battlerIdTarget;
}

void ov12_02250A18(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerIdAttacker, u16 moveNo) {
    int side;
    int battlerId;
    int battlerIdTarget;
    int moveType;
    int maxBattlers;
    
    if (ctx->battlerIdTarget == 0xFF) {
        return;
    }
    
    if (GetBattlerAbility(ctx, battlerIdAttacker) == ABILITY_NORMALIZE || GetBattlerAbility(ctx, battlerIdAttacker) == ABILITY_MOLD_BREAKER) {
        return;
    }
    
    side = BattleSys_GetFieldSide(bsys, battlerIdAttacker)^1;
    
    if (ctx->fieldSideConditionData[side].followMeFlag && ctx->battleMons[ctx->fieldSideConditionData[side].battlerIdFollowMe].hp) {
        return;
    }
    
    moveType = BattleSystem_GetMoveType(bsys, ctx, battlerIdAttacker, moveNo);
    if (!moveType) {
        moveType = ctx->unk_334.moveData[moveNo].type;
    }
    
    maxBattlers = BattleSys_GetMaxBattlers(bsys);
    
    if (moveType == TYPE_ELECTRIC &&
        (ctx->unk_334.moveData[moveNo].unk8 == 0 || ctx->unk_334.moveData[moveNo].unk8 == 2) &&
        !(ctx->linkStatus & 0x20) &&
        CheckAbilityActive(bsys, ctx, 9, battlerIdAttacker, ABILITY_LIGHTNINGROD)) {
        for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
            battlerIdTarget = ctx->unk_21EC[battlerId];
            if (GetBattlerAbility(ctx, battlerIdTarget) == ABILITY_LIGHTNINGROD && ctx->battleMons[battlerIdTarget].hp && battlerIdAttacker != battlerIdTarget) {
                break;
            }
        }
        if (battlerIdTarget != ctx->battlerIdTarget) {
            ctx->selfTurnData[battlerIdTarget].lightningRodFlag = TRUE;
            ctx->battlerIdTarget = battlerIdTarget;
        }
    } else if (moveType == TYPE_WATER &&
        (ctx->unk_334.moveData[moveNo].unk8 == 0 || ctx->unk_334.moveData[moveNo].unk8 == 2) &&
        !(ctx->linkStatus & 0x20) &&
        CheckAbilityActive(bsys, ctx, 9, battlerIdAttacker, ABILITY_STORM_DRAIN)) {
        for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
            battlerIdTarget = ctx->unk_21EC[battlerId];
            if (GetBattlerAbility(ctx, battlerIdTarget) == ABILITY_STORM_DRAIN && ctx->battleMons[battlerIdTarget].hp && battlerIdAttacker != battlerIdTarget) {
                break;
            }
        }
        if (battlerIdTarget != ctx->battlerIdTarget) {
            ctx->selfTurnData[battlerIdTarget].stormDrainFlag = TRUE;
            ctx->battlerIdTarget = battlerIdTarget;
        } 
    }
}

BOOL ov12_02250BBC(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BOOL ret = FALSE;
    
    if (!(ctx->moveStatusFlag & 0x801FDA49) && ctx->selfTurnData[ctx->battlerIdTarget].lightningRodFlag) {
        ctx->selfTurnData[ctx->battlerIdTarget].lightningRodFlag = FALSE;
        ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 180);
        ctx->unk_C = ctx->unk_8;
        ctx->unk_8 = 22;
        ret = TRUE;
    }
    
    if (!(ctx->moveStatusFlag & 0x801FDA49) && ctx->selfTurnData[ctx->battlerIdTarget].stormDrainFlag) {
        ctx->selfTurnData[ctx->battlerIdTarget].stormDrainFlag = FALSE;
        ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 180);
        ctx->unk_C = ctx->unk_8;
        ctx->unk_8 = 22;
        ret = TRUE;
    }
    
    return ret;
}

void CopyBattleMonToPartyMon(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId) {  
    
    if (!ctx->battleMons[battlerId].item) {
        ov12_022585A8(ctx, battlerId);
    }
    
    BattleController_EmitBattleMonToPartyMonCopy(bsys, ctx, battlerId);
}

void LockBattlerIntoCurrentMove(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId) {
    ctx->battleMons[battlerId].status2 |= STATUS2_LOCKED_INTO_MOVE;
    ctx->moveNoLockedInto[battlerId] = ctx->moveNoCur;
}

void UnlockBattlerOutOfCurrentMove(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId) {
    ctx->battleMons[battlerId].status2 &= ~STATUS2_LOCKED_INTO_MOVE;
    ctx->battleMons[battlerId].status2 &= ~(3 << 8); //??
    ctx->battleMons[battlerId].moveEffectFlags &= 0xDFFBFF3F;
    ctx->battleMons[battlerId].unk88.rolloutCount = 0;
    ctx->battleMons[battlerId].unk88.furyCutterCount = 0;
}

int GetBattlerStatusCondition(BATTLECONTEXT *ctx, int battlerId) {
    if (ctx->battleMons[battlerId].status & STATUS_SLEEP) {
        return CONDITION_SLEEP;
    } else if (ctx->battleMons[battlerId].status & STATUS_POISON) {
        return CONDITION_POISON;
    } else if (ctx->battleMons[battlerId].status & STATUS_BURN) {
        return CONDITION_BURN;
    } else if (ctx->battleMons[battlerId].status & STATUS_FREEZE) {
        return CONDITION_FREEZE;
    } else if (ctx->battleMons[battlerId].status & STATUS_PARALYSIS) {
        return CONDITION_PARALYSIS;
    } else if (ctx->battleMons[battlerId].status & STATUS_BAD_POISON) {
        return CONDITION_POISON;
    }
    
    return CONDITION_NONE;
}

BOOL ov12_02250D4C(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int state = BattleSys_GetBattleType(bsys);  //note: this should be battleType for the following three if statements, but it won't match if an additional variable is used
    int trainerIndex;
    
    if (state & 0x84) {
        return FALSE;
    }
    
    if (!(state & BATTLE_TYPE_TRAINER)) {
        return FALSE;
    }
    
    if (state & BATTLE_TYPE_DOUBLES) {
        return FALSE;
    }
    
    trainerIndex = BattleSys_GetTrainerIndex(bsys, 1);
    state = 0;
    
    do {
        switch (state) {
        case 0:
            if (ctx->battleMons[1].unk78 == 1 && !(ctx->linkStatus2 & 0x20) && TrainerMessageWithIdPairExists(trainerIndex, 13, HEAP_ID_BATTLE)) {
                ctx->linkStatus2 |= 0x20;
                ctx->msgWork = 13;
                return TRUE;
            }
            state++;
            break;
        case 1:
            if (!(ctx->battleMons[1].msgFlag & 2) && ctx->battleMons[1].hp <= ctx->battleMons[1].maxHp / 2 && TrainerMessageWithIdPairExists(trainerIndex, 14, HEAP_ID_BATTLE)) {
                ctx->battleMons[1].msgFlag |= 2;
                ctx->msgWork = 14;
                return TRUE;
            }
            state++;
            break;
        case 2:
            if (!(ctx->battleMons[1].msgFlag & 3)) {
                int i;
                int aliveMons;
                PARTY *party;
                Pokemon *mon;
                
                party = BattleSys_GetParty(bsys, 1);
                aliveMons = 0;
                
                for (i = 0; i < GetPartyCount(party); i++) {
                    mon = GetPartyMonByIndex(party, i);
                    if (GetMonData(mon, MON_DATA_HP, NULL)) {
                        aliveMons++;
                    }
                }
                if (aliveMons == 1 && TrainerMessageWithIdPairExists(trainerIndex, 15, HEAP_ID_BATTLE)) {
                    ctx->battleMons[1].msgFlag |= 3;
                    ctx->msgWork = 15;
                    return TRUE;
                }
            }
            state++;
            break;
        case 3:
            if (!(ctx->battleMons[1].msgFlag & 4)) {
                int i;
                int aliveMons;
                PARTY *party;
                Pokemon *mon;
                
                party = BattleSys_GetParty(bsys, 1);
                aliveMons = 0;
                
                for (i = 0; i < GetPartyCount(party); i++) {
                    mon = GetPartyMonByIndex(party, i);
                    if (GetMonData(mon, MON_DATA_HP, NULL)) {
                        aliveMons++;
                    }
                }
                if (aliveMons == 1 && (ctx->battleMons[1].hp <= ctx->battleMons[1].maxHp / 2) && TrainerMessageWithIdPairExists(trainerIndex, 16, HEAP_ID_BATTLE)) {
                    ctx->battleMons[1].msgFlag |= 4;
                    ctx->msgWork = 16;
                    return TRUE;
                }
            }
            state++;
            break;
        case 4:
            break;
        }
    } while (state != 4);
    
    return FALSE;
}

//This is technically a correct function name but it doesn't account for the other battle context initilzation functions 
//which init different parts of the struct, so this can be more descriptive once the variables are ID'd
void BattleContext_Init(BATTLECONTEXT *ctx) {
    int battlerId;
    
    //related to damage calculation
    ctx->damage = 0;
    ctx->criticalMultiplier = 1;
    ctx->criticalCnt = 0;
    ctx->movePower = 0;
    ctx->unk_2158 = 10;
    ctx->moveType = 0;
    ctx->unk_2164 = 0;
    ctx->moveStatusFlag = 0;
    
    ctx->battlerIdFainted = 0xFF;
    
    //related to statusing a mon..?
    ctx->unk_2170 = 0;
    ctx->unk_2174 = 0;
    ctx->unk_2178 = 0;
    
    //related to stat (maybe status?) changes
    ctx->unk_88 = 0;
    ctx->statChangeParam = 0;
    ctx->battlerIdStatChange = 0xFF;
    
    //related to multi hit moves
    ctx->multiHitCount = 0;
    ctx->multiHitCountTemp = 0;
    ctx->unk_217E = 0;
    ctx->unk_2180 = 0;
    ctx->unk_38 = 0;
    ctx->unk_2184 = 0;
    ctx->checkMultiHit = 0;
    
    //unidentified states for different state machines
    ctx->unk_10 = 0;
    ctx->unk_18 = 0;
    ctx->unk_20 = 0;
    ctx->unk_28 = 0;
    ctx->unk_30 = 0;
    ctx->unk_3C = 0;
    ctx->unk_40 = 0;
    ctx->unk_48 = 0;
    ctx->unk_4C = 0;
    ctx->unk_50 = 0;
    ctx->unk_54 = 0;
    
    ctx->linkStatus &= 0xFF800000;
    ctx->linkStatus2 &= 0xFFFFFEA1;
    
    ctx->magnitude = 0;
    
    for (battlerId = 0; battlerId < 4; battlerId++) {
        MIi_CpuClearFast(0, (u32 *) &ctx->selfTurnData[battlerId], sizeof(SelfTurnData));
        ctx->unk_21A4[battlerId] = 6;
    }
}

void ov12_02251038(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int battleType;
    
    for (int battlerId = 0; battlerId < 4; battlerId++) {
        ctx->moveNoHitBattler[battlerId] = 0xFF;
        ctx->unk_21A0[battlerId] = 6;
        ctx->unk_310C[battlerId] = BattleSys_Random(bsys);
    }
    
    ctx->prizeMoneyValue = 1;
    
    ctx->meFirstTotal = 1;
    
    battleType = BattleSys_GetBattleType(bsys);
    
    if (!(battleType & BATTLE_TYPE_DOUBLES)) {
        ctx->unk_3108 |= MaskOfFlagNo(2);
        ctx->unk_3108 |= MaskOfFlagNo(3);
    }
    
    ctx->unk_311C = 6;
    ctx->unk_311D = 6;   
}

void InitSwitchWork(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId) {
    int i;
    int maxBattlers;
    u8 *data;
    UnkBattlemonSub unkStruct = ctx->battleMons[battlerId].unk88;
    
    maxBattlers = BattleSys_GetMaxBattlers(bsys);
    BattleSys_GetBattleType(bsys);
    ctx->unk_21A8[battlerId][0] = 40;
    
    if (!(ctx->linkStatus & (1 << 8))) { //not baton pass
        for (i = 0; i < maxBattlers; i++) {
            if ((ctx->battleMons[i].status2 & STATUS2_MEAN_LOOK) && (ctx->battleMons[i].unk88.battlerIdMeanLook == battlerId)) {
                ctx->battleMons[i].status2 &= ~STATUS2_MEAN_LOOK;
            }
            if ((ctx->battleMons[i].moveEffectFlags & MOVE_EFFECT_LOCK_ON) && ctx->battleMons[i].unk88.battlerIdLockOn == battlerId) {
                ctx->battleMons[i].moveEffectFlags &= ~MOVE_EFFECT_LOCK_ON;
                ctx->battleMons[i].unk88.battlerIdLockOn = 0;
            }
        }
        ctx->battleMons[battlerId].status2 = 0;
        ctx->battleMons[battlerId].moveEffectFlags = 0;
    } else { //baton pass
        ctx->battleMons[battlerId].status2 &= 0x15100007; //this is probably a collection of all the baton passable conditions
        ctx->battleMons[battlerId].moveEffectFlags &= 0x0FA3843F; //same thing but with baton passable move effects, probably like leech seed, substitute, etc
        for (i = 0; i < maxBattlers; i++) {
            if ((ctx->battleMons[i].moveEffectFlags & MOVE_EFFECT_LOCK_ON) && ctx->battleMons[i].unk88.battlerIdLockOn == battlerId) {
                ctx->battleMons[i].moveEffectFlags &= ~MOVE_EFFECT_LOCK_ON;
                ctx->battleMons[i].moveEffectFlags |= 16;
            }
        }
    }
    
    for (i = 0; i < maxBattlers; i++) {
        if (ctx->battleMons[i].status2 & (MaskOfFlagNo(battlerId) << STATUS2_ATTRACT_SHIFT)) {
            ctx->battleMons[i].status2 &= (MaskOfFlagNo(battlerId) << STATUS2_ATTRACT_SHIFT) ^ 0xFFFFFFFF;
        }
        if ((ctx->battleMons[i].status2 & STATUS2_BINDING_ALL) && ctx->battleMons[i].unk88.battlerIdBinding == battlerId) {
            ctx->battleMons[i].status2 &= ~STATUS2_BINDING_ALL;
        }
    }
    
    data = (u8 *)&ctx->battleMons[battlerId].unk88;
    for (i = 0; i < sizeof(UnkBattlemonSub); i++) {
        data[i] = 0;
    }
    
    if (ctx->linkStatus & (1 << 8)) {
        ctx->battleMons[battlerId].unk88.substituteHp = unkStruct.substituteHp;
        ctx->battleMons[battlerId].unk88.battlerIdLockOn = unkStruct.battlerIdLockOn;
        ctx->battleMons[battlerId].unk88.perishSongTurns = unkStruct.perishSongTurns;
        ctx->battleMons[battlerId].unk88.battlerIdMeanLook = unkStruct.battlerIdMeanLook;
        ctx->battleMons[battlerId].unk88.magnetRiseTurns = unkStruct.magnetRiseTurns;
        ctx->battleMons[battlerId].unk88.unk4_13 = unkStruct.unk4_13;
        ctx->battleMons[battlerId].unk88.healBlockTurns = unkStruct.healBlockTurns;
    }
    
    ctx->battleMons[battlerId].unk88.fakeOutCount = ctx->totalTurns + 1;
    ctx->battleMons[battlerId].unk88.slowStartTurns = ctx->totalTurns + 1;
    ctx->battleMons[battlerId].unk88.truantFlag = (ctx->totalTurns + 1) & 1;
   
    ctx->moveNoProtect[battlerId] = 0;
    ctx->moveNoHit[battlerId] = 0;
    ctx->moveNoHitBattler[battlerId] = 0xFF;
    ctx->moveNoHitType[battlerId] = 0;
    ctx->moveNoBattlerPrev[battlerId] = 0;
    ctx->moveNoCopied[battlerId] = 0;
    ctx->moveNoCopiedHit[battlerId][0] = 0;
    ctx->moveNoCopiedHit[battlerId][1] = 0;
    ctx->moveNoCopiedHit[battlerId][2] = 0;
    ctx->moveNoCopiedHit[battlerId][3] = 0;
    ctx->moveNoSketch[battlerId] = 0;
    ctx->conversion2Move[battlerId] = 0;
    ctx->conversion2BattlerId[battlerId] = 0;
    ctx->conversion2Type[battlerId] = 0;
    ctx->moveNoMetronome[battlerId] = 0;
    
    ctx->fieldCondition &= (MaskOfFlagNo(battlerId) << 8) ^ 0xFFFFFFFF; //??
    
    if (ctx->battleMons[battlerId].moveEffectFlags & MOVE_EFFECT_POWER_TRICK) {
        i = ctx->battleMons[battlerId].atk;
        ctx->battleMons[battlerId].atk = ctx->battleMons[battlerId].def;
        ctx->battleMons[battlerId].def = i;
    }
    
    for (i = 0; i < maxBattlers; i++) {
        if (i != battlerId && BattleSys_GetFieldSide(bsys, i) != BattleSys_GetFieldSide(bsys, battlerId)) {
            ctx->moveNoCopied[i] = 0;
        }
        ctx->moveNoCopiedHit[i][battlerId] = 0;
    }
    
    ov12_02258584(ctx, battlerId);
    ov12_0225859C(ctx, battlerId);
    ov12_022585A8(ctx, battlerId);
}

void InitFaintedWork(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId) {
    int i;
    int maxBattlers;
    u8 *data;
    
    maxBattlers = BattleSys_GetMaxBattlers(bsys);

    for (int stat = 0; stat < 8; stat++) {
        ctx->battleMons[battlerId].statChanges[stat] = 6;
    }
    
    ctx->battleMons[battlerId].status2 = 0;
    ctx->battleMons[battlerId].moveEffectFlags = 0;
    
    for (i = 0; i < maxBattlers; i++) {
        if ((ctx->battleMons[i].status2 & STATUS2_MEAN_LOOK) && ctx->battleMons[i].unk88.battlerIdMeanLook == battlerId) {
            ctx->battleMons[i].status2 &= ~STATUS2_MEAN_LOOK;
        }
        if (ctx->battleMons[i].status2 & (MaskOfFlagNo(battlerId) << STATUS2_ATTRACT_SHIFT)) {
            ctx->battleMons[i].status2 &= (MaskOfFlagNo(battlerId) << STATUS2_ATTRACT_SHIFT) ^ 0xFFFFFFFF;
        }
        if ((ctx->battleMons[i].status2 & STATUS2_BINDING_ALL) && ctx->battleMons[i].unk88.battlerIdBinding == battlerId) {
            ctx->battleMons[i].status2 &= STATUS2_BINDING_ALL ^ 0xFFFFFFFF;
        }
    }
    
    data = (u8 *)&ctx->battleMons[battlerId].unk88;
    for (i = 0; i < sizeof(UnkBattlemonSub); i++) {
        data[i] = 0;
    }
    
    data = (u8 *)&ctx->turnData[battlerId];
    for (i = 0; i < sizeof(TurnData); i++) {
        data[i] = 0;
    }
    
    ctx->battleMons[battlerId].unk88.fakeOutCount = ctx->totalTurns + 1;
    ctx->battleMons[battlerId].unk88.slowStartTurns = ctx->totalTurns + 1;
    ctx->battleMons[battlerId].unk88.truantFlag = (ctx->totalTurns + 1) & 1;
    
    ctx->moveNoProtect[battlerId] = 0;
    ctx->moveNoHit[battlerId] = 0;
    ctx->moveNoHitBattler[battlerId] = 0xFF;
    ctx->moveNoHitType[battlerId] = 0;
    ctx->moveNoBattlerPrev[battlerId] = 0;
    ctx->moveNoCopied[battlerId] = 0;
    ctx->moveNoCopiedHit[battlerId][0] = 0;
    ctx->moveNoCopiedHit[battlerId][1] = 0;
    ctx->moveNoCopiedHit[battlerId][2] = 0;
    ctx->moveNoCopiedHit[battlerId][3] = 0;
    ctx->moveNoSketch[battlerId] = 0;
    ctx->conversion2Move[battlerId] = 0;
    ctx->conversion2BattlerId[battlerId] = 0;
    ctx->conversion2Type[battlerId] = 0;
    ctx->moveNoMetronome[battlerId] = 0;
    
    ctx->fieldCondition &= (MaskOfFlagNo(battlerId) << 8) ^ 0xFFFFFFFF; //??
    
    for (i = 0; i < maxBattlers; i++) {
        if (i != battlerId && BattleSys_GetFieldSide(bsys, i) != BattleSys_GetFieldSide(bsys, battlerId)) {
            ctx->moveNoCopied[i] = 0;
        }
        ctx->moveNoCopiedHit[i][battlerId] = 0;
    }

    ctx->unk_13C[battlerId] &= ~1;
    
    ov12_02258584(ctx, battlerId);
    ov12_0225859C(ctx, battlerId);
    ov12_022585A8(ctx, battlerId);
}
