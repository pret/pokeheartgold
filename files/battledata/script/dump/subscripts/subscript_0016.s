    .include "macros/btlcmd.inc"

    .data

_000:
    CompareVarToValue OPCODE_EQU, BTLVAR_CRITICAL_MUL, 1, _049
    // A critical hit!
    PrintMessage msg_00000197_00774, TAG_NONE
    Wait 
    WaitButtonABTime 30
    CheckAbility CHECK_NOT_HAVE, BTLSCR_DEFENDER, ABILITY_ANGER_POINT, _049
    CompareMonDataToValue OPCODE_EQU, BTLSCR_DEFENDER, BATTLEMON_CUR_HP, 0, _049
    CompareMonDataToValue OPCODE_EQU, BTLSCR_DEFENDER, BATTLEMON_ATTACK_STAGE, 12, _049
    PlayBattleAnimation BTLSCR_DEFENDER, BATTLE_ANIMATION_STAT_BOOST
    Wait 
    UpdateMonData OPCODE_SET, BTLSCR_DEFENDER, BATTLEMON_ATTACK_STAGE, 12
    UpdateVar OPCODE_SET, BTLVAR_MSG_TEMP, 1
    // {0} maxed its {2} with {1}!
    PrintMessage msg_00000197_01093, TAG_NICKNAME_ABILITY_STAT, BTLSCR_DEFENDER, BTLSCR_DEFENDER, BTLSCR_MSG_TEMP
    Wait 
    WaitButtonABTime 30

_049:
    End 
