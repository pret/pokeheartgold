#include "battle.h"
#include "battle_controller.h"
#include "battle_controller_opponent.h"
#include "battle_system.h"
#include "dex_mon_measures.h"
#include "filesystem.h"
#include "item.h"
#include "party.h"
#include "pokemon.h"
#include "unk_02037C94.h"
#include "overlay_12_0224E4FC.h"
#include "constants/abilities.h"
#include "constants/battle.h"
#include "constants/items.h"
#include "constants/moves.h"
#include "constants/species.h"
#include "msgdata/msg/msg_0197.h"

static BOOL CheckFlyingImmunity(BATTLECONTEXT *ctx, int item, int index);
static void ApplyEffectivenessFlags(int effectiveness, u32 *moveStatusFlag);

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
    
    if (BattleSystem_GetBattleType(bsys) & (BATTLE_TYPE_5|BATTLE_TYPE_9)) { //No abilities battle
        ctx->battleMons[battlerId].ability = 0;
        ctx->battleMons[battlerId].status = 0;
        ctx->battleMons[battlerId].item = 0;
    } else {
        ctx->battleMons[battlerId].ability = GetMonData(mon, MON_DATA_ABILITY, NULL);
        ctx->battleMons[battlerId].status = GetMonData(mon, MON_DATA_STATUS, NULL);
        ctx->battleMons[battlerId].item = GetMonData(mon, MON_DATA_HELD_ITEM, NULL);
    }
    
    if ((BattleSystem_GetBattleType(bsys) & (BATTLE_TYPE_5|BATTLE_TYPE_9)) && !BattleSystem_GetFieldSide(bsys, battlerId)) {
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
    
    side = BattleSystem_GetFieldSide(bsys, battlerId);
    
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
        CopyU16ArrayToString((String *)data, mon->nickname);
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

u8 CheckSortSpeed(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId1, int battlerId2, int flag) {
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
    
    if (!CheckAbilityActive(bsys, ctx, CHECK_ABILITY_ALL_HP, 0, ABILITY_CLOUD_NINE) && !CheckAbilityActive(bsys, ctx, CHECK_ABILITY_ALL_HP, 0, ABILITY_AIR_LOCK)) {
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

    if (ctx->fieldSideConditionFlags[BattleSystem_GetFieldSide(bsys, battlerId1)] & SIDE_CONDITION_TAILWIND) {
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

    if (ctx->fieldSideConditionFlags[BattleSystem_GetFieldSide(bsys, battlerId2)] & SIDE_CONDITION_TAILWIND) {
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
            } else if (speed1 == speed2 && BattleSystem_Random(bsys) & 1) {
                ret = 2;
            }
        } else if (!boostedPriority1 && boostedPriority2) {
            ret = 1;
        } else if (boostedPriority1 && !boostedPriority2) {
            ret = 0;
        } else if (loweredPriority1 && loweredPriority2) {
            if (speed1 > speed2) {
                ret = 1;
            } else if (speed1 == speed2 && BattleSystem_Random(bsys)&1) {
                ret = 2;
            }
        } else if (loweredPriority1 && !loweredPriority2) {
            ret = 1;
        } else if (!loweredPriority1 && loweredPriority2) {
            ret = 0;
        } else if (ability1 == ABILITY_STALL && ability2 == ABILITY_STALL) {
            if (speed1 > speed2) {
                ret = 1;
            } else if (speed1 == speed2 && BattleSystem_Random(bsys)&1) {
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
            if (speed1 == speed2 && BattleSystem_Random(bsys)&1) {
                ret = 2;
            }
        } else {
            if (speed1 < speed2) {
                ret = 1;
            }
            if (speed1 == speed2 && BattleSystem_Random(bsys)&1) {
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
    u32 battleType = BattleSystem_GetBattleType(bsys);
    
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
        
        if ((BattleSystem_Random(bsys) % 100) < effectChance) {
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
        
        if ((BattleSystem_Random(bsys) % 100) < effectChance) {
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
        int maxBattlers = BattleSystem_GetMaxBattlers(bsys);
        OpponentData *opponent = BattleSystem_GetOpponentDataByBattlerId(bsys, battlerIdAttacker);
        u8 flag = ov12_02261258(opponent);
        
        for (ctx->unk_217E = 0; ctx->unk_217E < maxBattlers; ctx->unk_217E++) {
            battlerId = ctx->turnOrder[ctx->unk_217E];
            if (ctx->battleMons[battlerId].hp) {
                opponent = BattleSystem_GetOpponentDataByBattlerId(bsys, battlerId);
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
        int maxBattlers = BattleSystem_GetMaxBattlers(bsys);
        
        for (ctx->unk_217E = 0; ctx->unk_217E < maxBattlers; ctx->unk_217E++) {
            battlerId = ctx->turnOrder[ctx->unk_217E];
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
        int battleType = BattleSystem_GetBattleType(bsys);
        
        if ((battleType & BATTLE_TYPE_DOUBLES) && (BattleSystem_Random(bsys) % 2) == 0) {
            battlerIdTarget = BattleSystem_GetBattlerIdPartner(bsys, battlerIdAttacker);
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
        int battleType = BattleSystem_GetBattleType(bsys);
        
        if (battleType & BATTLE_TYPE_DOUBLES) {
            battlerIdTarget = BattleSystem_GetBattlerIdPartner(bsys, battlerIdAttacker);
        } else {
            battlerIdTarget = battlerIdAttacker;
        }
    } else if (unkA == (1 << 9)) {
        int battleType = BattleSystem_GetBattleType(bsys);
        
        if (battleType & BATTLE_TYPE_DOUBLES) {
            battlerIdTarget = ctx->unk_21A8[battlerIdAttacker][1];
            if (!ctx->battleMons[battlerIdTarget].hp) {
                battlerIdTarget = battlerIdAttacker;
            }
        } else {
            battlerIdTarget = battlerIdAttacker;
        }
    } else if (unkA == 2 || a4 == 1) {
        int battleType = BattleSystem_GetBattleType(bsys);
        int side = BattleSystem_GetFieldSide(bsys, battlerIdAttacker)^1;
        int battlerIdOpponents[2];
        battlerIdOpponents[0] = ov12_0223ABB8(bsys, battlerIdAttacker, 0);
        battlerIdOpponents[1] = ov12_0223ABB8(bsys, battlerIdAttacker, 2);
        
        if (battleType & BATTLE_TYPE_DOUBLES) {
            if (ctx->fieldSideConditionData[side].followMeFlag && ctx->battleMons[ctx->fieldSideConditionData[side].battlerIdFollowMe].hp) {
                battlerIdTarget = ctx->fieldSideConditionData[side].battlerIdFollowMe;
            } else if (ctx->battleMons[battlerIdOpponents[0]].hp && ctx->battleMons[battlerIdOpponents[1]].hp) {
                //This looks like targeting for Outrage in double battles
                side = BattleSystem_Random(bsys) & 1;
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
        int side = BattleSystem_GetFieldSide(bsys, battlerIdAttacker)^1;
        int battlerIdTargetTemp = ctx->unk_21A8[battlerIdAttacker][1];
        BattleSystem_GetMaxBattlers(bsys);
        
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
    
    side = BattleSystem_GetFieldSide(bsys, battlerIdAttacker)^1;
    
    if (ctx->fieldSideConditionData[side].followMeFlag && ctx->battleMons[ctx->fieldSideConditionData[side].battlerIdFollowMe].hp) {
        return;
    }
    
    moveType = BattleSystem_GetMoveType(bsys, ctx, battlerIdAttacker, moveNo);
    if (!moveType) {
        moveType = ctx->unk_334.moveData[moveNo].type;
    }
    
    maxBattlers = BattleSystem_GetMaxBattlers(bsys);
    
    if (moveType == TYPE_ELECTRIC &&
        (ctx->unk_334.moveData[moveNo].unk8 == 0 || ctx->unk_334.moveData[moveNo].unk8 == 2) &&
        !(ctx->linkStatus & 0x20) &&
        CheckAbilityActive(bsys, ctx, CHECK_ABILITY_ALL_HP_NOT_USER, battlerIdAttacker, ABILITY_LIGHTNINGROD)) {
        for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
            battlerIdTarget = ctx->turnOrder[battlerId];
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
        CheckAbilityActive(bsys, ctx, CHECK_ABILITY_ALL_HP_NOT_USER, battlerIdAttacker, ABILITY_STORM_DRAIN)) {
        for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
            battlerIdTarget = ctx->turnOrder[battlerId];
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
    int state = BattleSystem_GetBattleType(bsys);  //note: this should be battleType for the following three if statements, but it won't match if an additional variable is used
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
    
    trainerIndex = BattleSystem_GetTrainerIndex(bsys, 1);
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
                
                party = BattleSystem_GetParty(bsys, 1);
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
                
                party = BattleSystem_GetParty(bsys, 1);
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
    
    //related to stat changes
    ctx->statChangeType = 0;
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
        ctx->unk_310C[battlerId] = BattleSystem_Random(bsys);
    }
    
    ctx->prizeMoneyValue = 1;
    
    ctx->meFirstTotal = 1;
    
    battleType = BattleSystem_GetBattleType(bsys);
    
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
    
    maxBattlers = BattleSystem_GetMaxBattlers(bsys);
    BattleSystem_GetBattleType(bsys);
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
        ctx->battleMons[battlerId].status2 &= STATUS2_BATON_PASSABLE; 
        ctx->battleMons[battlerId].moveEffectFlags &= MOVE_EFFECT_BATON_PASSABLE;
        for (i = 0; i < maxBattlers; i++) {
            if ((ctx->battleMons[i].moveEffectFlags & MOVE_EFFECT_LOCK_ON) && ctx->battleMons[i].unk88.battlerIdLockOn == battlerId) {
                ctx->battleMons[i].moveEffectFlags &= ~MOVE_EFFECT_LOCK_ON;
                ctx->battleMons[i].moveEffectFlags |= STATUS2_4;
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
        if (i != battlerId && BattleSystem_GetFieldSide(bsys, i) != BattleSystem_GetFieldSide(bsys, battlerId)) {
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
    
    maxBattlers = BattleSystem_GetMaxBattlers(bsys);

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
        if (i != battlerId && BattleSystem_GetFieldSide(bsys, i) != BattleSystem_GetFieldSide(bsys, battlerId)) {
            ctx->moveNoCopied[i] = 0;
        }
        ctx->moveNoCopiedHit[i][battlerId] = 0;
    }

    ctx->unk_13C[battlerId] &= ~1;
    
    ov12_02258584(ctx, battlerId);
    ov12_0225859C(ctx, battlerId);
    ov12_022585A8(ctx, battlerId);
}

//BattleContext_InitTurnData..? BattleContext_InitStartTurn..?
void ov12_02251710(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int battlerId;
    
    for (battlerId = 0; battlerId < 4; battlerId++) {
        MIi_CpuClearFast(0, (u32 *)&ctx->turnData[battlerId], sizeof(TurnData));
        MIi_CpuClearFast(0, (u32 *)&ctx->moveFail[battlerId], sizeof(MoveFailFlags));
        ctx->battleMons[battlerId].status2 &= ~STATUS2_FLINCH;
        if (ctx->battleMons[battlerId].unk88.rechargeCount + 1 < ctx->totalTurns) {
            ctx->battleMons[battlerId].status2 &= ~STATUS2_RECHARGE;
        }
        if ((ctx->battleMons[battlerId].status & STATUS_SLEEP) && (ctx->battleMons[battlerId].status2 & STATUS2_LOCKED_INTO_MOVE)) {
            UnlockBattlerOutOfCurrentMove(bsys, ctx, battlerId);
        }
        if ((ctx->battleMons[battlerId].status & STATUS_SLEEP) && (ctx->battleMons[battlerId].status2 & STATUS2_RAGE)) {
            ctx->battleMons[battlerId].status2 &= ~STATUS2_RAGE;
        }
    }
    
    ctx->fieldSideConditionData[0].followMeFlag = 0;
    ctx->fieldSideConditionData[1].followMeFlag = 0;
}

u32 StruggleCheck(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId, u32 nonSelectableMoves, u32 struggleCheckFlags) {
    int movePos;
    int item = GetBattlerHeldItemEffect(ctx, battlerId);
    
    for (movePos = 0; movePos < 4; movePos++) {
        if (!(ctx->battleMons[battlerId].moves[movePos]) && (struggleCheckFlags & STRUGGLE_CHECK_NO_MOVES)) {
            nonSelectableMoves |= MaskOfFlagNo(movePos);
        }
        if (!(ctx->battleMons[battlerId].movePPCur[movePos]) && (struggleCheckFlags & STRUGGLE_CHECK_NO_PP)) {
            nonSelectableMoves |= MaskOfFlagNo(movePos);
        }
        if ((ctx->battleMons[battlerId].moves[movePos] == ctx->battleMons[battlerId].unk88.disabledMove) && (struggleCheckFlags & STRUGGLE_CHECK_DISABLED)) {
            nonSelectableMoves |= MaskOfFlagNo(movePos);
        }
        if ((ctx->battleMons[battlerId].moves[movePos] == ctx->moveNoBattlerPrev[battlerId]) && (struggleCheckFlags & STRUGGLE_CHECK_TORMENT) && (ctx->battleMons[battlerId].status2 & STATUS2_TORMENT)) {
            nonSelectableMoves |= MaskOfFlagNo(movePos);
        }
        if (ctx->battleMons[battlerId].unk88.tauntTurns && (struggleCheckFlags & STRUGGLE_CHECK_TAUNT) && !(ctx->unk_334.moveData[ctx->battleMons[battlerId].moves[movePos]].power)) {
            nonSelectableMoves |= MaskOfFlagNo(movePos);
        }
        if (BattleContext_CheckMoveImprisoned(bsys, ctx, battlerId, ctx->battleMons[battlerId].moves[movePos]) && (struggleCheckFlags & STRUGGLE_CHECK_IMPRISON)) {
            nonSelectableMoves |= MaskOfFlagNo(movePos);
        }        
        if (BattleContext_CheckMoveUnuseableInGravity(bsys, ctx, battlerId, ctx->battleMons[battlerId].moves[movePos]) && (struggleCheckFlags & STRUGGLE_CHECK_GRAVITY)) {
            nonSelectableMoves |= MaskOfFlagNo(movePos);
        }
        if (BattleContext_CheckMoveHealBlocked(bsys, ctx, battlerId, ctx->battleMons[battlerId].moves[movePos]) && (struggleCheckFlags & STRUGGLE_CHECK_HEAL_BLOCK)) {
            nonSelectableMoves |= MaskOfFlagNo(movePos);
        }
        if ((ctx->battleMons[battlerId].unk88.encoredMove) && (ctx->battleMons[battlerId].unk88.encoredMove != ctx->battleMons[battlerId].moves[movePos])) {
            //BUG: The flag check for encore is missing in this if statement, though it's unclear if this effects anything functionally
            nonSelectableMoves |= MaskOfFlagNo(movePos);
        }
        if ((item == HOLD_EFFECT_CHOICE_ATK || item == HOLD_EFFECT_CHOICE_SPEED || item == HOLD_EFFECT_CHOICE_SPATK) && (struggleCheckFlags & STRUGGLE_CHECK_CHOICED)) {
            if (BattleMon_GetMoveIndex(&ctx->battleMons[battlerId], ctx->battleMons[battlerId].unk88.moveNoChoice) == 4) {
                ctx->battleMons[battlerId].unk88.moveNoChoice = 0;
            } else if (ctx->battleMons[battlerId].unk88.moveNoChoice && ctx->battleMons[battlerId].unk88.moveNoChoice != ctx->battleMons[battlerId].moves[movePos]) {
                nonSelectableMoves |= MaskOfFlagNo(movePos);
            }
        }
    }
    return nonSelectableMoves;
}

//Buffer messages related to being unable to select moves?
BOOL ov12_02251A28(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId, int movePos, BATTLEMSG *msg) {
    BOOL ret = TRUE;
    
    if (StruggleCheck(bsys, ctx, battlerId, 0, STRUGGLE_CHECK_DISABLED) & MaskOfFlagNo(movePos)) {
        msg->tag = 10;
        msg->id = msg_0197_00609;
        msg->param[0] = CreateNicknameTag(ctx, battlerId);
        msg->param[1] = ctx->battleMons[battlerId].moves[movePos];
        ret = FALSE;
    } else if (StruggleCheck(bsys, ctx, battlerId, 0, STRUGGLE_CHECK_TORMENT) & MaskOfFlagNo(movePos)) {
        msg->tag = 2;
        msg->id = msg_0197_00612;
        msg->param[0] = CreateNicknameTag(ctx, battlerId);
        ret = FALSE;
    } else if (StruggleCheck(bsys, ctx, battlerId, 0, STRUGGLE_CHECK_TAUNT) & MaskOfFlagNo(movePos)) {
        msg->tag = 10;
        msg->id = msg_0197_00613;
        msg->param[0] = CreateNicknameTag(ctx, battlerId);
        msg->param[1] = ctx->battleMons[battlerId].moves[movePos];
        ret = FALSE;
    } else if (StruggleCheck(bsys, ctx, battlerId, 0, STRUGGLE_CHECK_IMPRISON) & MaskOfFlagNo(movePos)) {
        msg->tag = 10;
        msg->id = msg_0197_00616;
        msg->param[0] = CreateNicknameTag(ctx, battlerId);
        msg->param[1] = ctx->battleMons[battlerId].moves[movePos];
        ret = FALSE;
    } else if (StruggleCheck(bsys, ctx, battlerId, 0, STRUGGLE_CHECK_GRAVITY) & MaskOfFlagNo(movePos)) {
        msg->tag = 10;
        msg->id = msg_0197_01001;
        msg->param[0] = CreateNicknameTag(ctx, battlerId);
        msg->param[1] = ctx->battleMons[battlerId].moves[movePos];
        ret = FALSE;
    } else if (StruggleCheck(bsys, ctx, battlerId, 0, STRUGGLE_CHECK_HEAL_BLOCK) & MaskOfFlagNo(movePos)) {
        msg->tag = 34;
        msg->id = msg_0197_01057;
        msg->param[0] = CreateNicknameTag(ctx, battlerId);
        msg->param[1] = MOVE_HEAL_BLOCK;
        msg->param[2] = ctx->battleMons[battlerId].moves[movePos];
        ret = FALSE;
    } else if (StruggleCheck(bsys, ctx, battlerId, 0, STRUGGLE_CHECK_CHOICED) & MaskOfFlagNo(movePos)) {
        msg->tag = 24;
        msg->id = msg_0197_00911;
        msg->param[0] = ctx->battleMons[battlerId].item;
        msg->param[1] = ctx->battleMons[battlerId].unk88.moveNoChoice;
        ret = FALSE;
    } else if (StruggleCheck(bsys, ctx, battlerId, 0, STRUGGLE_CHECK_NO_PP) & MaskOfFlagNo(movePos)) {
        msg->tag = 0;
        msg->id = msg_0197_00823;
        ret = FALSE;
    } 
    
    return ret;
}

int BattleMon_GetMoveIndex(BATTLEMON *mon, u16 moveNo) {
    int movePos;
    
    for (movePos = 0; movePos < 4; movePos++) {
        if (mon->moves[movePos] == moveNo) {
            break;
        }
    }
    
    return movePos;
}

extern u8 sTypeEffectiveness[112][3];

//static
BOOL ov12_02251C74(BATTLECONTEXT *ctx, int battlerIdAttacker, int battlerIdTarget, int index) {
    int item = GetBattlerHeldItemEffect(ctx, battlerIdTarget);
    BOOL ret = TRUE;
    
    if (item == HOLD_EFFECT_SPEED_DOWN_GROUNDED || (ctx->battleMons[battlerIdTarget].moveEffectFlags & MOVE_EFFECT_INGRAIN)) {
        if (sTypeEffectiveness[index][1] == TYPE_FLYING && sTypeEffectiveness[index][2] == TYPE_MUL_NO_EFFECT) {
            ret = FALSE;
        }
    }
    
    if (ctx->turnData[battlerIdTarget].roostFlag && sTypeEffectiveness[index][1] == TYPE_FLYING) {
        ret = FALSE;
    }
    
    if (ctx->fieldCondition & FIELD_CONDITION_GRAVITY) {
        if (sTypeEffectiveness[index][1] == TYPE_FLYING && sTypeEffectiveness[index][2] == TYPE_MUL_NO_EFFECT) {
            ret = FALSE;
        }
    }
    
    if (ctx->battleMons[battlerIdTarget].moveEffectFlags & MOVE_EFFECT_MIRACLE_EYE) {
        if (sTypeEffectiveness[index][1] == TYPE_DARK && sTypeEffectiveness[index][2] == TYPE_MUL_NO_EFFECT) {
            ret = FALSE;
        }
    }
    
    return ret;
}

#ifdef NONMATCHING
//FIXME: Matches up to regswaps: https://decomp.me/scratch/h06Ji -adrienn
int ov12_02251D28(BattleSystem *bsys, BATTLECONTEXT *ctx, int moveNo, int moveTypeDefault, int battlerIdAttacker, int battlerIdTarget, int damage, u32 *moveStatusFlags) {
    int i;
    u8 moveType;
    u8 itemAttacker;
    u8 itemTarget;
    u8 extraAttacker; 
    u8 extraTarget;
    u32 movePower;

    if (moveNo == MOVE_STRUGGLE) {
        return damage;
    }
    
    itemAttacker = GetBattlerHeldItemEffect(ctx, battlerIdAttacker);
    extraAttacker = BattleSystem_GetHeldItemDamageBoost(ctx, battlerIdAttacker, 0);
    itemTarget = GetBattlerHeldItemEffect(ctx,  battlerIdTarget);
    extraTarget = BattleSystem_GetHeldItemDamageBoost(ctx, battlerIdTarget, 0);
    
    if (GetBattlerAbility(ctx, battlerIdAttacker) == ABILITY_NORMALIZE) {
        moveType = TYPE_NORMAL;
    } else if (moveTypeDefault) {
        moveType = moveTypeDefault;
    } else {
        moveType = ctx->unk_334.moveData[moveNo].type;
    }
    
    movePower = ctx->unk_334.moveData[moveNo].power;

    //STAB
    if (!(ctx->linkStatus & (1 << 11)) && (GetBattlerVar(ctx, battlerIdAttacker, BMON_DATA_TYPE_1, NULL) == moveType || GetBattlerVar(ctx, battlerIdAttacker, BMON_DATA_TYPE_2, NULL) == moveType)) {
        if (GetBattlerAbility(ctx, battlerIdAttacker) == ABILITY_ADAPTABILITY) {
            damage *= 2;
        } else {
            damage = damage * 15 / 10;
        }
    }
    
    if (CheckBattlerAbilityIfNotIgnored(ctx, battlerIdAttacker, battlerIdTarget, ABILITY_LEVITATE) == TRUE && moveType == TYPE_GROUND && itemTarget != HOLD_EFFECT_SPEED_DOWN_GROUNDED) {
        *moveStatusFlags |= MOVE_STATUS_LEVITATE_IMMUNE;
    } else if (ctx->battleMons[battlerIdTarget].unk88.magnetRiseTurns && !(ctx->battleMons[battlerIdTarget].moveEffectFlags & MOVE_EFFECT_INGRAIN) && moveType == TYPE_GROUND && itemTarget != HOLD_EFFECT_SPEED_DOWN_GROUNDED) {
        *moveStatusFlags |= MOVE_STATUS_MAGNET_RISE_IMMUNE;
    } else {
        i = 0;
        do {
            if (sTypeEffectiveness[i][0] == TYPE_FORESIGHT) {
                if ((ctx->battleMons[battlerIdTarget].status2 & STATUS2_FORESIGHT) || GetBattlerAbility(ctx, battlerIdAttacker) == ABILITY_SCRAPPY) {
                    break;
                } else {
                    i++;
                    continue;
                }
            }
            if (sTypeEffectiveness[i][0] == moveType) {
                u8 monType = sTypeEffectiveness[i][1];
                if (monType == GetBattlerVar(ctx, battlerIdTarget, BMON_DATA_TYPE_1, NULL) && ov12_02251C74(ctx, battlerIdAttacker, battlerIdTarget, i) == TRUE) {
                    damage = ov12_022583B4(ctx, battlerIdAttacker, sTypeEffectiveness[i][2], damage, movePower, moveStatusFlags);
                }
                if (monType == GetBattlerVar(ctx, battlerIdTarget, BMON_DATA_TYPE_2, NULL) && GetBattlerVar(ctx, battlerIdTarget, BMON_DATA_TYPE_1, NULL) != GetBattlerVar(ctx, battlerIdTarget, BMON_DATA_TYPE_2, NULL) && ov12_02251C74(ctx, battlerIdAttacker, battlerIdTarget, i) == TRUE) {
                    damage = ov12_022583B4(ctx, battlerIdAttacker, sTypeEffectiveness[i][2], damage, movePower, moveStatusFlags);
                }
            }
            i++;
        } while (sTypeEffectiveness[i][0] != TYPE_ENDTABLE);
    }
    
    if (CheckBattlerAbilityIfNotIgnored(ctx, battlerIdAttacker, battlerIdTarget, ABILITY_WONDER_GUARD) == TRUE && ov12_02258440(ctx, moveNo) &&
        (!(*moveStatusFlags & MOVE_STATUS_SUPER_EFFECTIVE) || ((*moveStatusFlags & MOVE_STATUS_ANY_EFFECTIVE) == MOVE_STATUS_ANY_EFFECTIVE)) && movePower) {
        *moveStatusFlags |= MOVE_STATUS_WONDER_GUARD_IMMUNE;
    } else if (!(ctx->linkStatus & (1 << 11)) && !(ctx->linkStatus & (1 << 15))) {
        if ((*moveStatusFlags & MOVE_STATUS_SUPER_EFFECTIVE) && movePower) {
            if (CheckBattlerAbilityIfNotIgnored(ctx, battlerIdAttacker, battlerIdTarget, ABILITY_FILTER) == TRUE || CheckBattlerAbilityIfNotIgnored(ctx, battlerIdAttacker, battlerIdTarget, ABILITY_SOLID_ROCK) == TRUE) {
                damage = DamageDivide(damage * 3, 4);
            }
            if (itemAttacker == HOLD_EFFECT_POWER_UP_SE) {
                damage = damage * (100 + extraAttacker) / 100;
            }
        }
        if ((*moveStatusFlags & MOVE_STATUS_NOT_VERY_EFFECTIVE) && movePower) {
            if (GetBattlerAbility(ctx, battlerIdAttacker) == ABILITY_TINTED_LENS) {
                damage *= 2;
            }
        }
    } else {
        *moveStatusFlags &= ~MOVE_STATUS_SUPER_EFFECTIVE;
        *moveStatusFlags &= ~MOVE_STATUS_NOT_VERY_EFFECTIVE;
    }
    
    return damage;
}
#else
extern s32 _s32_div_f(s32 a1, s32 a2);

asm int ov12_02251D28(BattleSystem *bsys, BATTLECONTEXT *ctx, int moveNo, int moveTypeDefault, int battlerIdAttacker, int battlerIdTarget, int damage, u32 *moveStatusFlag) {
    push {r3, r4, r5, r6, r7, lr}
    sub sp, #0x30
    ldr r0, [sp, #0x50]
    add r5, r1, #0
    str r0, [sp, #0x50]
    ldr r0, [sp, #0x54]
    str r2, [sp, #8]
    str r0, [sp, #0x54]
    add r0, r2, #0
    add r4, r3, #0
    ldr r7, [sp, #0x48]
    ldr r6, [sp, #0x4c]
    cmp r0, #0xa5
    bne _02251D4A
    ldr r0, [sp, #0x50]
    add sp, #0x30
    pop {r3, r4, r5, r6, r7, pc}
_02251D4A:
    add r0, r5, #0
    add r1, r7, #0
    bl GetBattlerHeldItemEffect
    lsl r0, r0, #0x18
    lsr r0, r0, #0x18
    str r0, [sp, #0x24]
    add r0, r5, #0
    add r1, r7, #0
    mov r2, #0
    bl BattleSystem_GetHeldItemDamageBoost
    lsl r0, r0, #0x18
    lsr r0, r0, #0x18
    str r0, [sp, #0x1c]
    add r0, r5, #0
    add r1, r6, #0
    bl GetBattlerHeldItemEffect
    lsl r0, r0, #0x18
    lsr r0, r0, #0x18
    str r0, [sp, #0x20]
    add r0, r5, #0
    add r1, r6, #0
    mov r2, #0
    bl BattleSystem_GetHeldItemDamageBoost
    add r0, r5, #0
    add r1, r7, #0
    bl GetBattlerAbility
    cmp r0, #0x60
    bne _02251D92
    mov r0, #0
    str r0, [sp, #0x28]
    b _02251DAA
_02251D92:
    cmp r4, #0
    beq _02251D9E
    lsl r0, r4, #0x18
    lsr r0, r0, #0x18
    str r0, [sp, #0x28]
    b _02251DAA
_02251D9E:
    ldr r0, [sp, #8]
    lsl r0, r0, #4
    add r1, r5, r0
    ldr r0, =0x000003E2
    ldrb r0, [r1, r0]
    str r0, [sp, #0x28]
_02251DAA:
    ldr r0, [sp, #8]
    lsl r0, r0, #4
    add r1, r5, r0
    ldr r0, =0x000003E1
    ldrb r0, [r1, r0]
    str r0, [sp, #0x14]
    ldr r0, =0x0000213C
    ldr r1, [r5, r0]
    mov r0, #2
    lsl r0, r0, #0xa
    tst r0, r1
    bne _02251E08
    add r0, r5, #0
    add r1, r7, #0
    mov r2, #0x1b
    mov r3, #0
    bl GetBattlerVar
    ldr r1, [sp, #0x28]
    cmp r1, r0
    beq _02251DE6
    add r0, r5, #0
    add r1, r7, #0
    mov r2, #0x1c
    mov r3, #0
    bl GetBattlerVar
    ldr r1, [sp, #0x28]
    cmp r1, r0
    bne _02251E08
_02251DE6:
    add r0, r5, #0
    add r1, r7, #0
    bl GetBattlerAbility
    cmp r0, #0x5b
    bne _02251DFA
    ldr r0, [sp, #0x50]
    lsl r0, r0, #1
    str r0, [sp, #0x50]
    b _02251E08
_02251DFA:
    ldr r1, [sp, #0x50]
    mov r0, #0xf
    mul r0, r1
    mov r1, #0xa
    bl _s32_div_f
    str r0, [sp, #0x50]
_02251E08:
    add r0, r5, #0
    add r1, r7, #0
    add r2, r6, #0
    mov r3, #0x1a
    bl CheckBattlerAbilityIfNotIgnored
    cmp r0, #1
    bne _02251E34
    ldr r0, [sp, #0x28]
    cmp r0, #4
    bne _02251E34
    ldr r0, [sp, #0x20]
    cmp r0, #0x6a
    beq _02251E34
    ldr r0, [sp, #0x54]
    ldr r1, [r0, #0]
    mov r0, #2
    lsl r0, r0, #0xa
    orr r1, r0
    ldr r0, [sp, #0x54]
    str r1, [r0]
    b _02251F50
_02251E34:
    mov r0, #0xc0
    add r1, r6, #0
    mul r1, r0
    ldr r0, =0x00002DCC
    add r3, r5, r1
    ldr r2, [r3, r0]
    lsl r2, r2, #0x10
    lsr r2, r2, #0x1d
    beq _02251E6C
    sub r0, #0xc
    ldr r2, [r3, r0]
    mov r0, #1
    lsl r0, r0, #0xa
    tst r2, r0
    bne _02251E6C
    ldr r2, [sp, #0x28]
    cmp r2, #4
    bne _02251E6C
    ldr r2, [sp, #0x20]
    cmp r2, #0x6a
    beq _02251E6C
    ldr r1, [sp, #0x54]
    lsl r0, r0, #0xa
    ldr r1, [r1, #0]
    orr r1, r0
    ldr r0, [sp, #0x54]
    str r1, [r0]
    b _02251F50
_02251E6C:
    add r0, r5, r1
    mov r4, #0
    str r0, [sp, #0x18]
_02251E72:
    lsl r0, r4, #1
    ldr r1, =sTypeEffectiveness
    add r0, r4, r0
    add r1, r1, r0
    str r1, [sp, #0xc]
    ldr r1,  =sTypeEffectiveness
    ldrb r1, [r1, r0]
    cmp r1, #0xfe
    bne _02251EA2
    ldr r1, [sp, #0x18]
    ldr r0, =0x00002DB0
    ldr r1, [r1, r0]
    mov r0, #2
    lsl r0, r0, #0x1c
    tst r0, r1
    bne _02251F50
    add r0, r5, #0
    add r1, r7, #0
    bl GetBattlerAbility
    cmp r0, #0x71
    beq _02251F50
    add r4, r4, #1
    b _02251F44
_02251EA2:
    ldr r0, [sp, #0x28]
    cmp r0, r1
    bne _02251F42
    ldr r0, [sp, #0xc]
    add r1, r6, #0
    ldrb r0, [r0, #1]
    mov r2, #0x1b
    mov r3, #0
    str r0, [sp, #0x10]
    add r0, r5, #0
    bl GetBattlerVar
    ldr r1, [sp, #0x10]
    cmp r1, r0
    bne _02251EE8
    add r0, r5, #0
    add r1, r7, #0
    add r2, r6, #0
    add r3, r4, #0
    bl ov12_02251C74
    cmp r0, #1
    bne _02251EE8
    ldr r0, [sp, #0x14]
    ldr r2, [sp, #0xc]
    str r0, [sp]
    ldr r0, [sp, #0x54]
    ldr r3, [sp, #0x50]
    str r0, [sp, #4]
    ldrb r2, [r2, #2]
    add r0, r5, #0
    add r1, r7, #0
    bl ov12_022583B4
    str r0, [sp, #0x50]
_02251EE8:
    add r0, r5, #0
    add r1, r6, #0
    mov r2, #0x1c
    mov r3, #0
    bl GetBattlerVar
    ldr r1, [sp, #0x10]
    cmp r1, r0
    bne _02251F42
    add r0, r5, #0
    add r1, r6, #0
    mov r2, #0x1b
    mov r3, #0
    bl GetBattlerVar
    str r0, [sp, #0x2c]
    add r0, r5, #0
    add r1, r6, #0
    mov r2, #0x1c
    mov r3, #0
    bl GetBattlerVar
    ldr r1, [sp, #0x2c]
    cmp r1, r0
    beq _02251F42
    add r0, r5, #0
    add r1, r7, #0
    add r2, r6, #0
    add r3, r4, #0
    bl ov12_02251C74
    cmp r0, #1
    bne _02251F42
    ldr r0, [sp, #0x14]
    ldr r2, [sp, #0xc]
    str r0, [sp]
    ldr r0, [sp, #0x54]
    ldr r3, [sp, #0x50]
    str r0, [sp, #4]
    ldrb r2, [r2, #2]
    add r0, r5, #0
    add r1, r7, #0
    bl ov12_022583B4
    str r0, [sp, #0x50]
_02251F42:
    add r4, r4, #1
_02251F44:
    lsl r0, r4, #1
    add r1, r4, r0
    ldr r0, =sTypeEffectiveness
    ldrb r0, [r0, r1]
    cmp r0, #0xff
    bne _02251E72
_02251F50:
    add r0, r5, #0
    add r1, r7, #0
    add r2, r6, #0
    mov r3, #0x19
    bl CheckBattlerAbilityIfNotIgnored
    cmp r0, #1
    bne _02251F94
    ldr r1, [sp, #8]
    add r0, r5, #0
    bl ov12_02258440
    cmp r0, #0
    beq _02251F94
    ldr r0, [sp, #0x54]
    ldr r1, [r0, #0]
    mov r0, #2
    tst r0, r1
    beq _02251F7E
    mov r0, #6
    and r0, r1
    cmp r0, #6
    bne _02251F94
_02251F7E:
    ldr r0, [sp, #0x14]
    cmp r0, #0
    beq _02251F94
    ldr r0, [sp, #0x54]
    ldr r1, [r0, #0]
    mov r0, #1
    lsl r0, r0, #0x12
    orr r1, r0
    ldr r0, [sp, #0x54]
    str r1, [r0]
    b _02252036
_02251F94:
    ldr r0, =0x0000213C
    ldr r2, [r5, r0]
    mov r0, #2
    lsl r0, r0, #0xa
    add r1, r2, #0
    tst r1, r0
    bne _02252022
    lsl r0, r0, #4
    tst r0, r2
    bne _02252022
    ldr r0, [sp, #0x54]
    ldr r1, [r0, #0]
    mov r0, #2
    tst r0, r1
    beq _02251FFE
    ldr r0, [sp, #0x14]
    cmp r0, #0
    beq _02251FFE
    add r0, r5, #0
    add r1, r7, #0
    add r2, r6, #0
    mov r3, #0x6f
    bl CheckBattlerAbilityIfNotIgnored
    cmp r0, #1
    beq _02251FD8
    add r0, r5, #0
    add r1, r7, #0
    add r2, r6, #0
    mov r3, #0x74
    bl CheckBattlerAbilityIfNotIgnored
    cmp r0, #1
    bne _02251FE6
_02251FD8:
    ldr r0, [sp, #0x50]
    lsl r1, r0, #1
    add r0, r0, r1
    mov r1, #4
    bl DamageDivide
    str r0, [sp, #0x50]
_02251FE6:
    ldr r0, [sp, #0x24]
    cmp r0, #0x60
    bne _02251FFE
    ldr r0, [sp, #0x1c]
    ldr r1, [sp, #0x50]
    add r0, #0x64
    str r0, [sp, #0x1c]
    mul r0, r1
    mov r1, #0x64
    bl _s32_div_f
    str r0, [sp, #0x50]
_02251FFE:
    ldr r0, [sp, #0x54]
    ldr r1, [r0, #0]
    mov r0, #4
    tst r0, r1
    beq _02252036
    ldr r0, [sp, #0x14]
    cmp r0, #0
    beq _02252036
    add r0, r5, #0
    add r1, r7, #0
    bl GetBattlerAbility
    cmp r0, #0x6e
    bne _02252036
    ldr r0, [sp, #0x50]
    lsl r0, r0, #1
    str r0, [sp, #0x50]
    b _02252036
_02252022:
    ldr r0, [sp, #0x54]
    ldr r1, [r0, #0]
    mov r0, #2
    bic r1, r0
    ldr r0, [sp, #0x54]
    str r1, [r0]
    mov r0, #4
    bic r1, r0
    ldr r0, [sp, #0x54]
    str r1, [r0]
_02252036:
    ldr r0, [sp, #0x50]
    add sp, #0x30
    pop {r3, r4, r5, r6, r7, pc}
}
#endif

void ov12_02252054(BATTLECONTEXT *ctx, int moveNo, int moveTypeDefault, int abilityAttacker, int abilityTarget, int item, int type1, int type2, u32 *moveStatusFlag) {
    int i;
    u8 moveType;
    
    if (moveNo == MOVE_STRUGGLE) {
        return;
    }
    
    if (abilityAttacker == ABILITY_NORMALIZE) {
        moveType = TYPE_NORMAL;
    } else if (moveTypeDefault) {
        moveType = moveTypeDefault;
    } else {
        moveType = ctx->unk_334.moveData[moveNo].type;
    }
    
    if (abilityAttacker != ABILITY_MOLD_BREAKER && abilityTarget == ABILITY_LEVITATE && moveType == TYPE_GROUND && !(ctx->fieldCondition & FIELD_CONDITION_GRAVITY) && item != HOLD_EFFECT_SPEED_DOWN_GROUNDED) {
        *moveStatusFlag |= MOVE_STATUS_NO_EFFECT;
    } else {
        i = 0;
        do {
            if (sTypeEffectiveness[i][0] == TYPE_FORESIGHT) {
                if (abilityAttacker == ABILITY_SCRAPPY) {
                    break;
                } else {
                    i++;
                    continue;
                }
            }
            if (sTypeEffectiveness[i][0] == moveType) {
                u8 monType = sTypeEffectiveness[i][1]; 
                if (type1 == monType && CheckFlyingImmunity(ctx, item, i) == TRUE) {
                    ApplyEffectivenessFlags(sTypeEffectiveness[i][2], moveStatusFlag);
                }
                if ((type2 == monType) && (type1 != type2) && CheckFlyingImmunity(ctx, item, i) == TRUE) {
                    ApplyEffectivenessFlags(sTypeEffectiveness[i][2], moveStatusFlag);
                }
            }
            i++;
        } while (sTypeEffectiveness[i][0] != TYPE_ENDTABLE);
    }
    
    if (abilityAttacker != ABILITY_MOLD_BREAKER && abilityTarget == ABILITY_WONDER_GUARD && ov12_02258440(ctx, moveNo) &&
        (!(*moveStatusFlag & MOVE_STATUS_SUPER_EFFECTIVE) || (*moveStatusFlag & MOVE_STATUS_ANY_EFFECTIVE) == MOVE_STATUS_ANY_EFFECTIVE)) {
        *moveStatusFlag |= MOVE_STATUS_NO_EFFECT;
    }
}

static BOOL CheckFlyingImmunity(BATTLECONTEXT *ctx, int item, int index) {
    BOOL ret = TRUE;
    
    if (item == HOLD_EFFECT_SPEED_DOWN_GROUNDED && sTypeEffectiveness[index][1] == TYPE_FLYING && sTypeEffectiveness[index][2] == TYPE_MUL_NO_EFFECT) {
        ret = FALSE;
    }
    
    if (ctx->fieldCondition & FIELD_CONDITION_GRAVITY && sTypeEffectiveness[index][1] == TYPE_FLYING && sTypeEffectiveness[index][2] == TYPE_MUL_NO_EFFECT) {
        ret = FALSE;
    }
    
    return ret;
}

static void ApplyEffectivenessFlags(int effectiveness, u32 *moveStatusFlag) {
    switch (effectiveness) {
    case TYPE_MUL_NO_EFFECT:
        *moveStatusFlag |= MOVE_STATUS_NO_EFFECT;
        *moveStatusFlag &= ~MOVE_STATUS_NOT_VERY_EFFECTIVE;
        *moveStatusFlag &= ~MOVE_STATUS_SUPER_EFFECTIVE;
        break;
    case TYPE_MUL_NOT_EFFECTIVE:
        if (*moveStatusFlag & MOVE_STATUS_SUPER_EFFECTIVE) {
            *moveStatusFlag &= ~MOVE_STATUS_SUPER_EFFECTIVE;
        } else {
            *moveStatusFlag |= MOVE_STATUS_NOT_VERY_EFFECTIVE;
        }
        break;
    case TYPE_MUL_SUPER_EFFECTIVE:
        if (*moveStatusFlag & MOVE_STATUS_NOT_VERY_EFFECTIVE) {
            *moveStatusFlag &= ~MOVE_STATUS_NOT_VERY_EFFECTIVE;
        } else {
            *moveStatusFlag |= MOVE_STATUS_SUPER_EFFECTIVE;
        }
        break;
    }
}

BOOL ov12_02252218(BATTLECONTEXT *ctx, int battlerId) {
    if (ctx->moveFail[battlerId].paralysis ||
        ctx->moveFail[battlerId].noEffect ||
        ctx->moveFail[battlerId].imprison ||
        ctx->moveFail[battlerId].infatuation ||
        ctx->moveFail[battlerId].asleep ||
        ctx->moveFail[battlerId].unk0_5 ||
        ctx->moveFail[battlerId].flinch ||
        ctx->moveFail[battlerId].unk0_8 ||
        ctx->moveFail[battlerId].confusion) {
        return TRUE;
    }
    return FALSE;
}

u8 GetMonsHitCount(BattleSystem *bsys, BATTLECONTEXT *ctx, u32 flag, int battlerId) {
    int i;
    u8 cnt = 0;
    int maxBattlers = BattleSystem_GetMaxBattlers(bsys);
    
    switch (flag) {
    case 0:
        for (i = 0; i < maxBattlers; i++) {
            if (i != battlerId && ctx->battleMons[i].hp) {
                cnt++;
            }
        }
        break;
    case 1:
        for (i = 0; i < maxBattlers; i++) {
            if (BattleSystem_GetFieldSide(bsys, i) == BattleSystem_GetFieldSide(bsys, battlerId) && ctx->battleMons[i].hp) {
                cnt++;
            }
        }
        break;
    }
    return cnt;
}

int CreateNicknameTag(BATTLECONTEXT *ctx, int battlerId) {
    return (battlerId | (ctx->selectedMonIndex[battlerId] << 8));
}

u16 GetBattlerSelectedMove(BATTLECONTEXT *ctx, int battlerId) {
    u16 moveNo = 0;
    
    if (ctx->unk_21A8[battlerId][3] == 1 && ctx->unk_21A8[battlerId][2]) {
        moveNo = ctx->battleMons[battlerId].moves[ctx->unk_21A8[battlerId][2] - 1];
    }
    
    return moveNo;
}

int CheckAbilityActive(BattleSystem *bsys, BATTLECONTEXT *ctx, int flag, int battlerId, int ability) {
    int cnt = 0;
    int i;
    int maxBattlers = BattleSystem_GetMaxBattlers(bsys);
    
    switch (flag) {
    case CHECK_ABILITY_SAME_SIDE: 
        for (i = 0; i < maxBattlers; i++) {
            if (BattleSystem_GetFieldSide(bsys, i) == BattleSystem_GetFieldSide(bsys, battlerId) && GetBattlerAbility(ctx, i) == ability) {
                cnt++;
            }
        }
        break;
    case CHECK_ABILITY_SAME_SIDE_HP:
        for (i = 0; i < maxBattlers; i++) {
            if (BattleSystem_GetFieldSide(bsys, i) == BattleSystem_GetFieldSide(bsys, battlerId) && ctx->battleMons[i].hp && GetBattlerAbility(ctx, i) == ability) {
                cnt++;
            }
        }
        break;
    case CHECK_ABILITY_OPPOSING_SIDE: 
        for (i = 0; i < maxBattlers; i++) {
            if (BattleSystem_GetFieldSide(bsys, i) != BattleSystem_GetFieldSide(bsys, battlerId) && GetBattlerAbility(ctx, i) == ability) {
                cnt++;
            }
        }
        break;
    case CHECK_ABILITY_OPPOSING_SIDE_HP:
        for (i = 0; i < maxBattlers; i++) {
            if (BattleSystem_GetFieldSide(bsys, i) != BattleSystem_GetFieldSide(bsys, battlerId) && ctx->battleMons[i].hp && GetBattlerAbility(ctx, i) == ability) {
                cnt++;
            }
        }
        break;
    case CHECK_ABILITY_OPPOSING_SIDE_HP_RET:
        for (i = 0; i < maxBattlers; i++) {
            if (BattleSystem_GetFieldSide(bsys, i) != BattleSystem_GetFieldSide(bsys, battlerId) && ctx->battleMons[i].hp && GetBattlerAbility(ctx, i) == ability) {
                cnt |= MaskOfFlagNo(i);
            }
        }
        break;
    case CHECK_ABILITY_ALL:
        for (i = 0; i < maxBattlers; i++) {
            if (GetBattlerAbility(ctx, i) == ability) {
                cnt++;
            }
        }
        break;
    case CHECK_ABILITY_ALL_NOT_USER: 
        for (i = 0; i < maxBattlers; i++) {
            if (i != battlerId && GetBattlerAbility(ctx, i) == ability) {
                cnt++;
            }
        }
        break;
    case CHECK_ABILITY_ALL_NOT_USER_RET:
        for (i = 0; i < maxBattlers; i++) {
            if (i != battlerId && GetBattlerAbility(ctx, i) == ability) {
                cnt = i + 1;
                break;
            }
        }
        break;
    case CHECK_ABILITY_ALL_HP:
        for (i = 0; i < maxBattlers; i++) {
            if (GetBattlerAbility(ctx, i) == ability && ctx->battleMons[i].hp) {
                cnt++;
            }
        }
        break;
    case CHECK_ABILITY_ALL_HP_NOT_USER:
        for (i = 0; i < maxBattlers; i++) {
            if (i != battlerId && GetBattlerAbility(ctx, i) == ability && ctx->battleMons[i].hp) {
                cnt++;
            }
        }
        break;
    }
    
    return cnt;
}

//FIXME: Function name is wrong
BOOL BattleCtx_IsIdenticalToCurrentMove(BATTLECONTEXT *ctx, int moveNo) {
    switch (ctx->unk_334.moveData[moveNo].effect) {
    case 26:
    case 39:
    case 75:
    case 145:
    case 151:
    case 155:
    case 255:
    case 256:
    case 263:
    case 272:
        return TRUE;
    }
    return FALSE;
}

BOOL GetTypeEffectivnessData(BattleSystem *bsys, int index, u8 *typeMove, u8 *typeMon, u8 *eff) {
    BOOL ret = TRUE;
    
    if (index >= NELEMS(sTypeEffectiveness)) {
        index = BattleSystem_Random(bsys) % NELEMS(sTypeEffectiveness);
        ret = FALSE;
    }
    
    *typeMove = sTypeEffectiveness[index][0];
    *typeMon = sTypeEffectiveness[index][1];
    *eff = sTypeEffectiveness[index][2];
    
    return ret;
}

int CalculateTypeEffectiveness(u8 typeMove, u8 typeMon1, u8 typeMon2) {
    int i = 0;
    int damage = 40;
    
    do {
        if (sTypeEffectiveness[i][0] == typeMove) {
            if (sTypeEffectiveness[i][1] == typeMon1) {
                damage = damage * sTypeEffectiveness[i][2] / 10;
            }
            if (sTypeEffectiveness[i][1] == typeMon2 && typeMon1 != typeMon2) {
                damage = damage * sTypeEffectiveness[i][2] / 10;
            }
        }
        i++;
    } while (sTypeEffectiveness[i][0] != TYPE_ENDTABLE);
    
    return damage;
}

BOOL CheckMoveCallsOtherMove(u16 moveNo) {
    if (moveNo == MOVE_NONE ||
        moveNo == MOVE_SLEEP_TALK ||
        moveNo == MOVE_COPYCAT ||
        moveNo == MOVE_ASSIST ||
        moveNo == MOVE_ME_FIRST ||
        moveNo == MOVE_MIRROR_MOVE ||
        moveNo == MOVE_METRONOME) {
        return TRUE;
    }
    return FALSE;
}

BOOL CurseUserIsGhost(BATTLECONTEXT *ctx, u16 moveNo, int battlerId) {
    return (moveNo == MOVE_CURSE && (GetBattlerVar(ctx, battlerId, BMON_DATA_TYPE_1, NULL) == TYPE_GHOST || GetBattlerVar(ctx, battlerId, BMON_DATA_TYPE_2, NULL) == TYPE_GHOST));
}

BOOL CanStealHeldItem(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId) {
    BOOL ret = FALSE;
    int side = BattleSystem_GetFieldSide(bsys, battlerId);
    
    if (ctx->battleMons[battlerId].item && !(ctx->fieldSideConditionData[side].battlerBitKnockedOffItem & MaskOfFlagNo(ctx->selectedMonIndex[battlerId])) && !ItemIdIsMail(ctx->battleMons[battlerId].item)) {
        ret = TRUE;
    }
    
    return ret;
}

BOOL CanTrickHeldItem(BATTLECONTEXT *ctx, int battlerId) {
    return !ItemIdIsMail(ctx->battleMons[battlerId].item);
}

BOOL WhirlwindCheck(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BOOL ret = FALSE;
    
    if (ctx->battleMons[ctx->battlerIdAttacker].level >= ctx->battleMons[ctx->battlerIdTarget].level) {
        ret = TRUE;
    } else {
        int level = ((BattleSystem_Random(bsys) & 0xFF) * (ctx->battleMons[ctx->battlerIdAttacker].level + ctx->battleMons[ctx->battlerIdTarget].level) >> 8) + 1;
        
        if (level > ctx->battleMons[ctx->battlerIdTarget].level / 4) {
            ret = TRUE;
        }
    }
    
    return ret;
}

u8 GetBattlerAbility(BATTLECONTEXT *ctx, int battlerId) {
    if ((ctx->battleMons[battlerId].moveEffectFlags & MOVE_EFFECT_GASTRO_ACID) && ctx->battleMons[battlerId].ability != ABILITY_MULTITYPE) {
        return ABILITY_NONE;
    } else if ((ctx->fieldCondition & FIELD_CONDITION_GRAVITY) && ctx->battleMons[battlerId].ability == ABILITY_LEVITATE) {
        return ABILITY_NONE;
    } else if ((ctx->battleMons[battlerId].moveEffectFlags & MOVE_EFFECT_INGRAIN) && ctx->battleMons[battlerId].ability == ABILITY_LEVITATE) {
        return ABILITY_NONE;
    } else {
        return ctx->battleMons[battlerId].ability;
    }
}

BOOL CheckBattlerAbilityIfNotIgnored(BATTLECONTEXT *ctx, int battlerIdAttacker, int battlerIdTarget, int ability) {
    BOOL ret = FALSE;
    
    if (GetBattlerAbility(ctx, battlerIdAttacker) != ABILITY_MOLD_BREAKER) {
        if (GetBattlerAbility(ctx, battlerIdTarget) == ability) {
            ret = TRUE;
        }
    } else if (GetBattlerAbility(ctx, battlerIdTarget) == ability && !ctx->selfTurnData[battlerIdAttacker].moldBreakerFlag) {
        ctx->selfTurnData[battlerIdAttacker].moldBreakerFlag = TRUE;
        ctx->linkStatus |= (1 << 23);
    }
    
    return ret;
}

BOOL CanSwitchMon(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId) {
    BOOL ret;
    PARTY *party;
    Pokemon *mon;
    int partySize;
    int cnt;
    int cntMax;
    int i;
    int start;
    int monIndex1;
    int monIndex2;
    u32 battleType;

    cnt = 0;
    ret = FALSE;
    battleType = BattleSystem_GetBattleType(bsys);
    party = BattleSystem_GetParty(bsys, battlerId);
    partySize = BattleSystem_GetPartySize(bsys, battlerId);
    
    if ((battleType & BATTLE_TYPE_MULTI) || ((battleType & BATTLE_TYPE_INGAME_PARTNER) && (ov12_0223AB0C(bsys, battlerId) & 1))) {
        start = 0;
        cntMax = 1;
        monIndex1 = ctx->selectedMonIndex[battlerId];
        monIndex2 = ctx->selectedMonIndex[battlerId];
    } else if (battleType & BATTLE_TYPE_DOUBLES) {
        start = 0;
        cntMax = 1;
        monIndex1 = ctx->selectedMonIndex[battlerId];
        monIndex2 = ctx->selectedMonIndex[BattleSystem_GetBattlerIdPartner(bsys, battlerId)];
    } else {
        start = 0;
        cntMax = 1;
        monIndex1 = ctx->selectedMonIndex[battlerId];
        monIndex2 = ctx->selectedMonIndex[battlerId];
    }
    
    for (i = start; i < partySize; i++) {
        mon = GetPartyMonByIndex(party, i);
        if (GetMonData(mon, MON_DATA_SPECIES, NULL) && !GetMonData(mon, MON_DATA_IS_EGG, NULL) && GetMonData(mon, MON_DATA_HP, NULL) && monIndex1 != i && monIndex2 != i) {
            cnt++;
        }
    }
    if (cnt >= cntMax) {
        ret = TRUE;
    }
    return ret;
}

BOOL CantEscape(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId, BATTLEMSG *msg) {
    int battlerIdAbility;
    int maxBattlers;
    u8 side;
    int item;
    u32 battleType;
    
    battleType = BattleSystem_GetBattleType(bsys);
    item = GetBattlerHeldItemEffect(ctx, battlerId);
    
    if (item == HOLD_EFFECT_FLEE || (battleType & BATTLE_TYPE_CAN_ALWAYS_FLEE) || GetBattlerAbility(ctx, battlerId) == ABILITY_RUN_AWAY) {
        return FALSE;
    }
    
    side = BattleSystem_GetFieldSide(bsys, battlerId);
    maxBattlers = BattleSystem_GetMaxBattlers(bsys);

    battlerIdAbility = CheckAbilityActive(bsys, ctx, CHECK_ABILITY_ALL_HP_NOT_USER, battlerId, ABILITY_SHADOW_TAG);
    if (battlerIdAbility && GetBattlerAbility(ctx, battlerId) != ABILITY_SHADOW_TAG) {
        if (msg == NULL) {
            return TRUE;
        }
        msg->tag = 11;
        msg->id = msg_0197_00039;
        msg->param[0] = CreateNicknameTag(ctx, battlerIdAbility);
        msg->param[1] = ABILITY_SHADOW_TAG;
        return TRUE;
    }

    battlerIdAbility = CheckAbilityActive(bsys, ctx, CHECK_ABILITY_OPPOSING_SIDE_HP, battlerId, ABILITY_ARENA_TRAP);
    if (battlerIdAbility) {
        if (!(ctx->fieldCondition & FIELD_CONDITION_GRAVITY) && item != HOLD_EFFECT_SPEED_DOWN_GROUNDED) {
            if (GetBattlerAbility(ctx, battlerId) != ABILITY_LEVITATE && !ctx->battleMons[battlerId].unk88.magnetRiseTurns &&
                GetBattlerVar(ctx, battlerId, BMON_DATA_TYPE_1, NULL) != TYPE_FLYING && GetBattlerVar(ctx, battlerId, BMON_DATA_TYPE_2, NULL) != TYPE_FLYING) {
               if (msg == NULL) {
                    return TRUE;
                }
                msg->tag = 11;
                msg->id = msg_0197_00039;
                msg->param[0] = CreateNicknameTag(ctx, battlerIdAbility);
                msg->param[1] = ABILITY_ARENA_TRAP;
                return TRUE;     
            }
        } else {
            if (msg == NULL) {
                return TRUE;
            }
            msg->tag = 11;
            msg->id = msg_0197_00039;
            msg->param[0] = CreateNicknameTag(ctx, battlerIdAbility);
            msg->param[1] = ABILITY_ARENA_TRAP;
            return TRUE;
        }
    }
    
    battlerIdAbility = CheckAbilityActive(bsys, ctx, CHECK_ABILITY_OPPOSING_SIDE_HP, battlerId, ABILITY_MAGNET_PULL);
    if (battlerIdAbility && (GetBattlerVar(ctx, battlerId, BMON_DATA_TYPE_1, NULL) == TYPE_STEEL || GetBattlerVar(ctx, battlerId, BMON_DATA_TYPE_2, NULL) == TYPE_STEEL)) {
        if (msg == NULL) {
            return TRUE;
        }
        msg->tag = 11;
        msg->id = msg_0197_00039;
        msg->param[0] = CreateNicknameTag(ctx, battlerIdAbility);
        msg->param[1] = ABILITY_MAGNET_PULL;
        return TRUE;
    }
    
    if ((ctx->battleMons[battlerId].status2 & (STATUS2_BINDING_ALL | STATUS2_MEAN_LOOK)) || (ctx->battleMons[battlerId].moveEffectFlags & MOVE_EFFECT_INGRAIN)){
        if (msg == NULL) {
            return TRUE;
        }
        msg->tag = 0;
        msg->id = msg_0197_00794;
        return TRUE;
    }
    
    return FALSE;
}

BOOL BattleTryRun(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId) {
    BOOL ret;
    u8 run;
    int item;
    u32 battleType;
    
    battleType = BattleSystem_GetBattleType(bsys);
    item = GetBattlerHeldItemEffect(ctx, battlerId);
    ret = FALSE;
    
    if (item == HOLD_EFFECT_FLEE) {
        ctx->turnData[battlerId].runFlag = 1;
        ret = TRUE;
    } else if (battleType & BATTLE_TYPE_CAN_ALWAYS_FLEE) {
        ret = TRUE;
    } else if (GetBattlerAbility(ctx, battlerId) == ABILITY_RUN_AWAY) {
        ctx->turnData[battlerId].runFlag = 2;
        ret = TRUE;
    } else {
        if (ctx->battleMons[battlerId].speed < ctx->battleMons[battlerId ^ 1].speed) {
            run = ctx->battleMons[battlerId].speed * 128 / ctx->battleMons[battlerId ^ 1].speed + ctx->runAttempts * 30;
            if (run > (BattleSystem_Random(bsys) % 256)) {
                ret = TRUE;
            }
        } else {
            ret = TRUE;
        }
        if (!ret) {
            BattleController_EmitIncrementGameStat(bsys, battlerId, 0, 99);
        }
        ctx->runAttempts++;
    }
    return ret;
}

BOOL CheckTruant(BATTLECONTEXT *ctx, int battlerId) {
    BOOL ret = FALSE;
    
    if (GetBattlerAbility(ctx, battlerId) == ABILITY_TRUANT) {
        if (ctx->battleMons[battlerId].unk88.truantFlag != (ctx->totalTurns & 1)) {
            ret = TRUE;
        }
    }
    
    return ret;
}

//FIXME: Matches up to regswap, ret <-> side, https://decomp.me/scratch/FiPFk -adrienn
#ifdef NONMATCHING
BOOL BattleContext_CheckMoveImprisoned(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId, int moveNo) {
    int maxBattlers;
    BOOL ret;
    int battlerIdCur;
    int side;
    int i;
    
    ret = FALSE;
    maxBattlers = BattleSystem_GetMaxBattlers(bsys);
    side = BattleSystem_GetFieldSide(bsys, battlerId);
    
    for (battlerIdCur = 0; battlerIdCur < maxBattlers; battlerIdCur++) {
        if ((side != BattleSystem_GetFieldSide(bsys, battlerIdCur)) && (ctx->battleMons[battlerIdCur].moveEffectFlags & MOVE_EFFECT_IMPRISON_USER)) {
            for (i = 0; i < LEARNED_MOVES_MAX; i++) {
                if (moveNo == ctx->battleMons[battlerIdCur].moves[i]) {
                    break;
                }
            }
            if (i != LEARNED_MOVES_MAX) {
                ret = TRUE;
            }
        }
    }
    
    return ret;
}
#else
asm BOOL BattleContext_CheckMoveImprisoned(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId, int moveNo) {
      push {r3, r4, r5, r6, r7, lr}
    sub sp, #0x10
    add r6, r1, #0
    mov r1, #0
    str r0, [sp, #0]
    add r4, r2, #0
    add r5, r3, #0
    str r1, [sp, #4]
    bl BattleSystem_GetMaxBattlers
    str r0, [sp, #0xc]
    ldr r0, [sp, #0]
    add r1, r4, #0
    bl BattleSystem_GetFieldSide
    str r0, [sp, #8]
    ldr r0, [sp, #0xc]
    mov r7, #0
    cmp r0, #0
    ble _02252CDE
    ldr r4, =0x00002D4C
_02252C9E:
    ldr r0, [sp, #0]
    add r1, r7, #0
    bl BattleSystem_GetFieldSide
    ldr r1, [sp, #8]
    cmp r1, r0
    beq _02252CD4
    mov r0, #0xb7
    lsl r0, r0, #6
    ldr r1, [r6, r0]
    mov r0, #2
    lsl r0, r0, #0xc
    tst r0, r1
    beq _02252CD4
    mov r1, #0
    add r2, r6, #0
_02252CBE:
    ldrh r0, [r2, r4]
    cmp r5, r0
    beq _02252CCC
    add r1, r1, #1
    add r2, r2, #2
    cmp r1, #4
    blt _02252CBE
_02252CCC:
    cmp r1, #4
    beq _02252CD4
    mov r0, #1
    str r0, [sp, #4]
_02252CD4:
    ldr r0, [sp, #0xc]
    add r7, r7, #1
    add r6, #0xc0
    cmp r7, r0
    blt _02252C9E
_02252CDE:
    ldr r0, [sp, #4]
    add sp, #0x10
    pop {r3, r4, r5, r6, r7, pc}
}  
#endif

BOOL CheckMoveEffectOnField(BattleSystem *bsys, BATTLECONTEXT *ctx, int moveEffect) {
    int battlerId;
    int maxBattlers;
    BOOL ret = FALSE;
    
    maxBattlers = BattleSystem_GetMaxBattlers(bsys);
    
    for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
        if (ctx->battleMons[battlerId].moveEffectFlags & moveEffect) {
            ret = TRUE;
            break;
        }
    }
    
    return ret;
}

void ov12_02252D14(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    ctx->moveStatusFlag = 0;
    ctx->criticalMultiplier = 1;
    ctx->linkStatus &= (0x100000 ^ 0xFFFFFFFF);
}

void SortMonsBySpeed(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int battlerId;
    int maxBattlers;
    int i, j;
    int temp1, temp2;
    
    maxBattlers = BattleSystem_GetMaxBattlers(bsys);
    
    for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
        ctx->turnOrder[battlerId] = battlerId;
    }
    for (i = 0; i < maxBattlers - 1; i++) {
        for (j = i + 1; j < maxBattlers; j++) {
            temp1 = ctx->turnOrder[i];
            temp2 = ctx->turnOrder[j];
            if (CheckSortSpeed(bsys, ctx, temp1, temp2, 1)) {
                ctx->turnOrder[i] = temp2;
                ctx->turnOrder[j] = temp1;
            }
        }
    }
}

extern u16 sGravityUnusableMoves[6];

BOOL BattleContext_CheckMoveUnuseableInGravity(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId, int moveNo) {
    int i;
    BOOL ret = FALSE;
    
    if (ctx->fieldCondition & FIELD_CONDITION_GRAVITY) {
        for (i = 0; i < NELEMS(sGravityUnusableMoves); i++) {
            if (sGravityUnusableMoves[i] == moveNo) {
                ret = TRUE;
                break;
            }
        }
    }
    
    return ret;
}

extern u16 sHealBlockUnusableMoves[14];

BOOL BattleContext_CheckMoveHealBlocked(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId, int moveNo) {
    int i;
    BOOL ret = FALSE;
    
    if (ctx->battleMons[battlerId].unk88.healBlockTurns) {
        for (i = 0; i < NELEMS(sHealBlockUnusableMoves); i++) {
            if (sHealBlockUnusableMoves[i] == moveNo) {
                ret = TRUE;
                break;
            }
        }
    }
    
    return ret;
}

void ov12_02252E30(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int i;
    
    if (ctx->moveNoTemp == MOVE_LAST_RESORT || ctx->battleMons[ctx->battlerIdAttacker].unk88.lastResortCount == LEARNED_MOVES_MAX) {
        return;
    }
    
    for (i = 0; i < ctx->battleMons[ctx->battlerIdAttacker].unk88.lastResortCount; i++) {
        if (ctx->battleMons[ctx->battlerIdAttacker].unk88.lastResortMoves[i] == ctx->moveNoTemp) {
            return;
        }
    }
    
    ctx->battleMons[ctx->battlerIdAttacker].unk88.lastResortMoves[i] = ctx->moveNoTemp;
    ctx->battleMons[ctx->battlerIdAttacker].unk88.lastResortCount++;
}

int GetBattlerLearnedMoveCount(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId) {
    int cnt;
    
    for (cnt = 0; cnt < LEARNED_MOVES_MAX; cnt++) {
        if (ctx->battleMons[battlerId].moves[cnt] == MOVE_NONE) {
            break;
        }
    }
    
    return cnt;
}

extern u16 sSoundMoves[12];

int ov12_02252EC8(BATTLECONTEXT *ctx, int battlerIdAttacker, int battlerIdTarget) {
    int state;
    int moveType;

    state = 0;
    
    if (GetBattlerAbility(ctx, battlerIdAttacker) == ABILITY_NORMALIZE) {
        moveType = TYPE_NORMAL;
    } else if (ctx->moveType) {
        moveType = ctx->moveType;
    } else {
        moveType = ctx->unk_334.moveData[ctx->moveNoCur].type;
    }
    
    if (CheckBattlerAbilityIfNotIgnored(ctx, battlerIdAttacker, battlerIdTarget, ABILITY_VOLT_ABSORB) == TRUE && moveType == TYPE_ELECTRIC && battlerIdAttacker != battlerIdTarget) {
        ctx->hpCalcWork = DamageDivide(ctx->battleMons[battlerIdTarget].maxHp, 4);
        state = 178;
    }    
    if (CheckBattlerAbilityIfNotIgnored(ctx, battlerIdAttacker, battlerIdTarget, ABILITY_WATER_ABSORB) == TRUE && moveType == TYPE_WATER && !(ctx->linkStatus & (1 << 5)) && ctx->unk_334.moveData[ctx->moveNoCur].power) {
        ctx->hpCalcWork = DamageDivide(ctx->battleMons[battlerIdTarget].maxHp, 4);
        state = 178;
    }
    int moveNoCur = ctx->moveNoCur;
    if (CheckBattlerAbilityIfNotIgnored(ctx, battlerIdAttacker, battlerIdTarget, ABILITY_FLASH_FIRE) == TRUE && moveType == TYPE_FIRE && !(ctx->battleMons[battlerIdTarget].status & STATUS_FREEZE) && !(ctx->linkStatus & (1 << 5))) {
        if (ctx->unk_334.moveData[ctx->moveNoCur].power || ctx->moveNoCur == MOVE_WILL_O_WISP) {
            state = 179;
        }
    }
    if (CheckBattlerAbilityIfNotIgnored(ctx, battlerIdAttacker, battlerIdTarget, ABILITY_SOUNDPROOF) == TRUE) {
        for (int i = 0; i < NELEMS(sSoundMoves); i++) {
            if (sSoundMoves[i] == ctx->moveNoCur) {
                state = 181;
                break;
            }
        }
    }
    if (CheckBattlerAbilityIfNotIgnored(ctx, battlerIdAttacker, battlerIdTarget, ABILITY_MOTOR_DRIVE) == TRUE && moveType == TYPE_ELECTRIC && battlerIdAttacker != battlerIdTarget) {
        state = 182;
    }
    if (CheckBattlerAbilityIfNotIgnored(ctx, battlerIdAttacker, battlerIdTarget, ABILITY_DRY_SKIN) == TRUE && moveType == TYPE_WATER && !(ctx->linkStatus & (1 << 5)) && ctx->unk_334.moveData[ctx->moveNoCur].power) {
        ctx->hpCalcWork = DamageDivide(ctx->battleMons[battlerIdTarget].maxHp, 4);
        state = 178;
    }
    
    return state;
}

BOOL ov12_02253068(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId) {
    BOOL ret = FALSE;
    int state;
    
    switch (GetBattlerAbility(ctx, battlerId)) {
    case ABILITY_SPEED_BOOST:
        if (ctx->battleMons[battlerId].hp && ctx->battleMons[battlerId].statChanges[3] < 12 && ctx->battleMons[battlerId].unk88.fakeOutCount != ctx->totalTurns + 1) {
            ctx->statChangeParam = 17;
            ctx->statChangeType = 3;
            ctx->battlerIdStatChange = battlerId;
            state = 12;
            ret = TRUE;
        } 
        break;
    case ABILITY_SHED_SKIN:
        if ((ctx->battleMons[battlerId].status & STATUS_ALL) && ctx->battleMons[battlerId].hp && ((BattleSystem_Random(bsys) % 10) < 3)) {
            if (ctx->battleMons[battlerId].status & STATUS_SLEEP) {
                ctx->msgWork = 0;
            } else if (ctx->battleMons[battlerId].status & STATUS_POISON_ALL) {
                ctx->msgWork = 1;
            } else if (ctx->battleMons[battlerId].status & STATUS_BURN) {
                ctx->msgWork = 2;
            } else if (ctx->battleMons[battlerId].status & STATUS_PARALYSIS) {
                ctx->msgWork = 3;
            } else {
                ctx->msgWork = 4;
            }
            ctx->battlerIdWork = battlerId;
            state = 190;
            ret = TRUE;
        }
        break;
    default:
        break;
    }

    if (ret == TRUE) {
        ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, state);
        ctx->unk_C = ctx->unk_8;
        ctx->unk_8 = 22;
    }
    
    return ret;
}

int DamageDivide(int num, int denom) {
    int sign;
    
    if (num == 0) {
        return num;
    }
    
    if (num < 0) {
        sign = -1;
    } else {
        sign = 1;
    }
    
    num /= denom;
    
    if (num == 0) {
        num = sign;
    }
    
    return num;
}
