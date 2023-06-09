#include "battle.h"
#include "battle_system.h"
#include "dex_mon_measures.h"
#include "filesystem.h"
#include "pokemon.h"
#include "unk_02037C94.h"
#include "overlay_12_0224E4FC.h"
#include "constants/battle.h"

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
    
    if (BattleSys_GetBattleType(bsys) & 0x220) { //No abilities battle
        ctx->battleMons[battlerId].ability = 0;
        ctx->battleMons[battlerId].status = 0;
        ctx->battleMons[battlerId].item = 0;
    } else {
        ctx->battleMons[battlerId].ability = GetMonData(mon, MON_DATA_ABILITY, NULL);
        ctx->battleMons[battlerId].status = GetMonData(mon, MON_DATA_STATUS, NULL);
        ctx->battleMons[battlerId].item = GetMonData(mon, MON_DATA_HELD_ITEM, NULL);
    }
    
    if ((BattleSys_GetBattleType(bsys) & 0x220) && !BattleSys_GetFieldSide(bsys, battlerId)) {
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
        ctx->battleMons[battlerId].unk88.itemNotKnockedOff = FALSE;
    } else if (ctx->battleMons[battlerId].item) {
        ctx->battleMons[battlerId].unk88.itemNotKnockedOff = TRUE;
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
        return mon->unk88.trauntFlag;
    case BMON_DATA_FLASH_FIRE_ACTIVE:
        return mon->unk88.flashFire;
    case BMON_DATA_LOCKED_ON_BATTLER:
        return mon->unk88.battlerIdLockOn;
    case BMON_DATA_MIMICED_MOVE:
        return mon->unk88.mimicedMoveIndex;
    case BMON_DATA_BINDED_BATTLER:
        return mon->unk88.battlerIdBinding;
    case BMON_DATA_MEAN_LOOK_BATTLER:
        return mon->unk88.unk4_8;
    case BMON_DATA_LAST_RESORT_COUNT:
        return mon->unk88.lastResortCount;
    case BMON_DATA_MAGNET_RISE:
        return mon->unk88.magnetRiseTurns;
    case BMON_DATA_HEAL_BLOCK:
        return mon->unk88.healBlockTurns;
    case BMON_DATA_81:
        return mon->unk88.unk4_13;
    case BMON_DATA_ITEM_KNOCKED_OFF:
        return mon->unk88.itemNotKnockedOff;
    case BMON_DATA_METRONOME: //refers to the actual item, not the move
        return mon->unk88.metronomeTurns;
    case BMON_DATA_84:
        return mon->unk88.unk4_2B;
    case BMON_DATA_85:
        return mon->unk88.unk4_2C;
    case BMON_DATA_86:
        return mon->unk88.unk4_2D;
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
        mon->unk88.trauntFlag = *data8;
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
        mon->unk88.unk4_8 = *data8;
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
        mon->unk88.itemNotKnockedOff = *data8;
        break;
    case BMON_DATA_METRONOME: //refers to the actual item, not the move
        mon->unk88.metronomeTurns = *data8;
        break;
    case BMON_DATA_84:
        mon->unk88.unk4_2B = *data8;
        break;
    case BMON_DATA_85:
        mon->unk88.unk4_2C = *data8;
        break;
    case BMON_DATA_86:
        mon->unk88.unk4_2D = *data8;
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

//AddBattlerVar
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
