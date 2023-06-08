#include "battle.h"
#include "battle_system.h"
#include "dex_mon_measures.h"
#include "pokemon.h"
#include "overlay_12_0224E4FC.h"

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
    GetMonData(mon, MON_DATA_OT_NAME, &ctx->battleMons[battlerId].unk);

    ctx->battleMons[battlerId].unk78 = 0;
    ctx->battleMons[battlerId].unk79 = 0;
    
    side = BattleSys_GetFieldSide(bsys, battlerId);
    
    if (ctx->fieldSideConditionData[side].battlerBitKnockedOffItem & MaskOfFlagNo(ctx->selectedMonIndex[battlerId])) {
        ctx->battleMons[battlerId].item = 0;
        ctx->battleMons[battlerId].unk88.itemNotKnockedOff = FALSE;
    } else if (ctx->battleMons[battlerId].item) {
        ctx->battleMons[battlerId].unk88.itemNotKnockedOff = TRUE;
    }
}


