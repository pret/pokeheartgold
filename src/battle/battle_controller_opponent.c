#include "battle/battle_controller_opponent.h"

#include "battle/battle.h"
#include "battle/battle_system.h"
#include "battle/overlay_12_0224E4FC.h"
#include "battle/trainer_ai.h"

#include "constants/abilities.h"

int BattleAI_PostKOSwitchIn(BattleSystem *battleSystem, int battler) {
    // Must keep C89-style declaration to match
    int i, j;
    u8 opponentType1, opponentType2;
    u8 monType1, monType2;
    u16 monSpecies;
    u16 move;
    int moveType;
    u8 battlersDisregarded;
    u8 score, maxScore; // BUG: Post-KO Switch-In AI Scoring Overflow (see docs/bugs_and_glitches.md)
    u8 picked = 6;
    u32 moveStatusFlags;
    Pokemon *mon;
    BattleContext *ctx = BattleSystem_GetBattleContext(battleSystem);

    u8 slot1, slot2;
    slot1 = battler;
    if ((BattleSystem_GetBattleType(battleSystem) & BATTLE_TYPE_TAG)
    || (BattleSystem_GetBattleType(battleSystem) & BATTLE_TYPE_MULTI)) {
        slot2 = slot1;
    } else {
        slot2 = BattleSystem_GetBattlerIdPartner(battleSystem, battler);
    }

    u8 opponent = Battler_GetRandomOpposingBattlerId(battleSystem, ctx, battler);
    int partySize = BattleSystem_GetPartySize(battleSystem, battler);
    battlersDisregarded = 0;

    // Stage 1: Loop through all the party slots and find the one with the most favorable
    // offensive type-matchup against the chosen opponent which also has a super-effective
    // move against that opponent. Choose the Pokemon with the highest such score, breaking
    // ties by party-order. If no such Pokemon exists, proceed to Stage 2.
    //
    // Mono-type Pokemon are regarded as being dual-type of the same type.
    while (battlersDisregarded != 0x3F) {
        maxScore = 0;
        picked = 6;

        for (i = 0; i < partySize; i++) {
            mon = BattleSystem_GetPartyMon(battleSystem, battler, i);
            monSpecies = GetMonData(mon, MON_DATA_SPECIES_OR_EGG, NULL);

            if (monSpecies != SPECIES_NONE
                && monSpecies != SPECIES_EGG
                && GetMonData(mon, MON_DATA_HP, NULL)
                && (battlersDisregarded & MaskOfFlagNo(i)) == FALSE
                && ctx->selectedMonIndex[slot1] != i
                && ctx->selectedMonIndex[slot2] != i
                && i != ctx->aiSwitchedPartySlot[slot1]
                && i != ctx->aiSwitchedPartySlot[slot2]) {
                opponentType1 = GetBattlerVar(ctx, opponent, BMON_DATA_TYPE_1, NULL);
                opponentType2 = GetBattlerVar(ctx, opponent, BMON_DATA_TYPE_2, NULL);
                monType1 = GetMonData(mon, MON_DATA_TYPE_1, NULL);
                monType2 = GetMonData(mon, MON_DATA_TYPE_2, NULL);

                score = CalculateTypeEffectiveness(monType1, opponentType1, opponentType2);
                score += CalculateTypeEffectiveness(monType2, opponentType1, opponentType2);

                if (maxScore < score) {
                    maxScore = score;
                    picked = i;
                }
            } else {
                battlersDisregarded |= MaskOfFlagNo(i);
            }
        }

        if (picked != 6) {
            // Determine if this mon has any super-effective moves against the opponent
            mon = BattleSystem_GetPartyMon(battleSystem, battler, picked);

            for (i = 0; i < MAX_MON_MOVES; i++) {
                move = GetMonData(mon, MON_DATA_MOVE1 + i, NULL);
                moveType = Move_CalcVariableDamageType(battleSystem, ctx, mon, move);

                if (move) {
                    moveStatusFlags = 0;
                    BattleSystem_CalcEffectiveness(ctx,
                        move,
                        moveType,
                        GetMonData(mon, MON_DATA_ABILITY, NULL),
                        GetBattlerAbility(ctx, opponent),
                        GetBattlerHeldItemEffect(ctx, opponent),
                        GetBattlerVar(ctx, opponent, BMON_DATA_TYPE_1, NULL),
                        GetBattlerVar(ctx, opponent, BMON_DATA_TYPE_2, NULL),
                        &moveStatusFlags);

                    if (moveStatusFlags & MOVE_STATUS_SUPER_EFFECTIVE) {
                        break;
                    }
                }
            }

            // If this mon has no moves which would be super-effective against the
            // opponent, mark it as disregarded and move to the next in priority.
            if (i == MAX_MON_MOVES) {
                battlersDisregarded |= MaskOfFlagNo(picked);
            } else {
                return picked;
            }
        } else {
            // No valid battlers to further-evaluate, break out
            battlersDisregarded = 0x3F;
        }
    }

    maxScore = 0;
    picked = 6;

    // Stage 2: Loop through all the party slots and score them by how much damage would be done
    // by the maximum non-critical roll of each of their moves if it were used by the battler
    // which just fainted. Choose the Pokemon with the highest such score, breaking ties by
    // party-order.
    for (i = 0; i < partySize; i++) {
        mon = BattleSystem_GetPartyMon(battleSystem, battler, i);
        monSpecies = GetMonData(mon, MON_DATA_SPECIES_OR_EGG, NULL);

        if (monSpecies != SPECIES_NONE
            && monSpecies != SPECIES_EGG
            && GetMonData(mon, MON_DATA_HP, NULL)
            && ctx->selectedMonIndex[slot1] != i
            && ctx->selectedMonIndex[slot2] != i
            && i != ctx->aiSwitchedPartySlot[slot1]
            && i != ctx->aiSwitchedPartySlot[slot2]) {
            for (j = 0; j < MAX_MON_MOVES; j++) {
                move = GetMonData(mon, MON_DATA_MOVE1 + j, NULL);
                moveType = Move_CalcVariableDamageType(battleSystem, ctx, mon, move);

                if (move && ctx->trainerAIData.moveData[move].power != 1) {
                    score = CalcMoveDamage(battleSystem,
                        ctx,
                        move,
                        ctx->fieldSideConditionFlags[BattleSystem_GetBattlerSide(battleSystem, opponent)],
                        ctx->fieldCondition,
                        0,
                        0,
                        battler,
                        opponent,
                        1);

                    moveStatusFlags = 0;
                    score = BattleSystem_ApplyTypeChart(battleSystem,
                        ctx,
                        move,
                        moveType,
                        battler,
                        opponent,
                        score,
                        &moveStatusFlags);

                    if (moveStatusFlags & MOVE_STATUS_IMMUNE) {
                        score = 0;
                    }
                }

                if (maxScore < score) {
                    maxScore = score;
                    picked = i;
                }
            }
        }
    }

    return picked;
}

int BattleAI_SwitchedSlot(BattleSystem *battleSystem, int battler);
int BattleAI_SwitchedSlot(BattleSystem *battleSystem, int battler) {
    BattleContext *ctx = BattleSystem_GetBattleContext(battleSystem);
    return ctx->aiSwitchedPartySlot[battler];
}

int Move_CalcVariableDamageType(BattleSystem *battleSystem, BattleContext *ctx, Pokemon *mon, int move) {
    int type;

    switch (move) {
    case MOVE_NATURAL_GIFT:
        type = GetItemVar(ctx, GetMonData(mon, MON_DATA_HELD_ITEM, NULL), ITEMATTR_NATURAL_GIFT_TYPE);
        break;

    case MOVE_JUDGMENT:
        switch (GetItemVar(ctx, GetMonData(mon, MON_DATA_HELD_ITEM, NULL), ITEMATTR_HOLD_EFFECT)) {
        case HOLD_EFFECT_ARCEUS_FIGHTING:
            type = TYPE_FIGHTING;
            break;
        case HOLD_EFFECT_ARCEUS_FLYING:
            type = TYPE_FLYING;
            break;
        case HOLD_EFFECT_ARCEUS_POISON:
            type = TYPE_POISON;
            break;
        case HOLD_EFFECT_ARCEUS_GROUND:
            type = TYPE_GROUND;
            break;
        case HOLD_EFFECT_ARCEUS_ROCK:
            type = TYPE_ROCK;
            break;
        case HOLD_EFFECT_ARCEUS_BUG:
            type = TYPE_BUG;
            break;
        case HOLD_EFFECT_ARCEUS_GHOST:
            type = TYPE_GHOST;
            break;
        case HOLD_EFFECT_ARCEUS_STEEL:
            type = TYPE_STEEL;
            break;
        case HOLD_EFFECT_ARCEUS_FIRE:
            type = TYPE_FIRE;
            break;
        case HOLD_EFFECT_ARCEUS_WATER:
            type = TYPE_WATER;
            break;
        case HOLD_EFFECT_ARCEUS_GRASS:
            type = TYPE_GRASS;
            break;
        case HOLD_EFFECT_ARCEUS_ELECTRIC:
            type = TYPE_ELECTRIC;
            break;
        case HOLD_EFFECT_ARCEUS_PSYCHIC:
            type = TYPE_PSYCHIC;
            break;
        case HOLD_EFFECT_ARCEUS_ICE:
            type = TYPE_ICE;
            break;
        case HOLD_EFFECT_ARCEUS_DRAGON:
            type = TYPE_DRAGON;
            break;
        case HOLD_EFFECT_ARCEUS_DARK:
            type = TYPE_DARK;
            break;
        default:
            type = TYPE_NORMAL;
            break;
        }
        break;

    case MOVE_HIDDEN_POWER:
        type = ((GetMonData(mon, MON_DATA_HP_IV, NULL) & 1) >> 0)
            | ((GetMonData(mon, MON_DATA_ATK_IV, NULL) & 1) << 1)
            | ((GetMonData(mon, MON_DATA_DEF_IV, NULL) & 1) << 2)
            | ((GetMonData(mon, MON_DATA_SPEED_IV, NULL) & 1) << 3)
            | ((GetMonData(mon, MON_DATA_SPATK_IV, NULL) & 1) << 4)
            | ((GetMonData(mon, MON_DATA_SPDEF_IV, NULL) & 1) << 5);
        type = (type * 15 / 63) + 1;

        if (type >= TYPE_MYSTERY) {
            type++;
        }
        break;

    case MOVE_WEATHER_BALL:
        if (CheckAbilityActive(battleSystem, ctx, CHECK_ABILITY_ALL_HP, 0, ABILITY_CLOUD_NINE) == FALSE
        && CheckAbilityActive(battleSystem, ctx, CHECK_ABILITY_ALL_HP, 0, ABILITY_AIR_LOCK) == FALSE
        && (ctx->fieldCondition & FIELD_CONDITION_WEATHER)) {
            if (ctx->fieldCondition & FIELD_CONDITION_RAIN_ALL) {
                type = TYPE_WATER;
            }

            if (ctx->fieldCondition & FIELD_CONDITION_SANDSTORM_ALL) {
                type = TYPE_ROCK;
            }

            if (ctx->fieldCondition & FIELD_CONDITION_SUN_ALL) {
                type = TYPE_FIRE;
            }

            if (ctx->fieldCondition & FIELD_CONDITION_HAIL_ALL) {
                type = TYPE_ICE;
            }
        }
        break;

    default:
        type = TYPE_NORMAL;
        break;
    }

    return type;
}
