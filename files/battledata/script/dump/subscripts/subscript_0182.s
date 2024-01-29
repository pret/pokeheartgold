    .include "macros/btlcmd.inc"

    .data

_000:
    PrintAttackMessage 
    Wait 
    WaitButtonABTime 15
    CompareMonDataToValue OPCODE_EQU, BTLSCR_DEFENDER, BATTLEMON_SPEED_STAGE, 12, _032
    PlayBattleAnimation BTLSCR_DEFENDER, BATTLE_ANIMATION_STAT_BOOST
    Wait 
    UpdateMonData OPCODE_ADD, BTLSCR_DEFENDER, BATTLEMON_SPEED_STAGE, 1
    UpdateVar OPCODE_SET, BTLVAR_MSG_TEMP, 3
    // {0}’s {1} raised its {2}!
    PrintMessage msg_00000197_00622, TAG_NICKNAME_ABILITY_STAT, BTLSCR_DEFENDER, BTLSCR_DEFENDER, BTLSCR_MSG_TEMP
    Wait 
    WaitButtonABTime 30
    End 

_032:
    // {0}’s {1} made {2} useless!
    PrintMessage msg_00000197_00638, TAG_NICKNAME_ABILITY_MOVE, BTLSCR_DEFENDER, BTLSCR_DEFENDER, BTLSCR_ATTACKER
    Wait 
    WaitButtonABTime 30
    End 
