    .include "macros/btlcmd.inc"

    .data

_000:
    PrintBufferedMessage 
    Wait 
    WaitButtonABTime 30
    CompareMonDataToValue OPCODE_NEQ, BTLSCR_MSG_TEMP, BATTLEMON_HEAL_BLOCK_TURNS, 0, _048
    UpdateMonDataFromVar OPCODE_GET, BTLSCR_MSG_TEMP, BATTLEMON_MAX_HP, BTLVAR_CALC_TEMP
    CompareMonDataToVar OPCODE_EQU, BTLSCR_MSG_TEMP, BATTLEMON_CUR_HP, BTLVAR_CALC_TEMP, _038
    UpdateVar OPCODE_FLAG_ON, BTLVAR_BATTLE_CTX_STATUS, SYSCTL_SKIP_SPRITE_BLINK
    PlayBattleAnimation BTLSCR_MSG_TEMP, BATTLE_ANIMATION_RESTORE_HP
    Wait 
    Call BATTLE_SUBSCRIPT_UPDATE_HP
    // {0} regained health!
    PrintMessage msg_00000197_00184, TAG_NICKNAME, BTLSCR_MSG_TEMP
    Wait 
    WaitButtonABTime 30
    End 

_038:
    WaitButtonABTime 30
    // {0}’s HP is full!
    PrintMessage msg_00000197_00187, TAG_NICKNAME, BTLSCR_MSG_TEMP
    Wait 
    WaitButtonABTime 30
    End 

_048:
    UpdateVar OPCODE_SET, BTLVAR_MSG_MOVE_TEMP, MOVE_HEAL_BLOCK
    // {0} was prevented from healing due to {1}!
    PrintMessage msg_00000197_01054, TAG_NICKNAME_MOVE, BTLSCR_MSG_TEMP, BTLSCR_MSG_TEMP
    Wait 
    WaitButtonABTime 30
    End 
