    .include "macros/btlcmd.inc"

    .data

_000:
    PrintBufferedMessage 
    Wait 
    WaitButtonABTime 30
    CompareMonDataToValue OPCODE_NEQ, BATTLER_CATEGORY_MSG_TEMP, BMON_DATA_HEAL_BLOCK_TURNS, 0, _048
    UpdateMonDataFromVar OPCODE_GET, BATTLER_CATEGORY_MSG_TEMP, BMON_DATA_MAXHP, BSCRIPT_VAR_CALC_TEMP
    CompareMonDataToVar OPCODE_EQU, BATTLER_CATEGORY_MSG_TEMP, BMON_DATA_HP, BSCRIPT_VAR_CALC_TEMP, _038
    UpdateVar OPCODE_FLAG_ON, BSCRIPT_VAR_BATTLE_STATUS, BATTLE_STATUS_NO_BLINK
    PlayBattleAnimation BATTLER_CATEGORY_MSG_TEMP, BATTLE_ANIMATION_RESTORE_HP
    Wait 
    Call BATTLE_SUBSCRIPT_UPDATE_HP
    // {0} regained health!
    PrintMessage msg_0197_00184, TAG_NICKNAME, BATTLER_CATEGORY_MSG_TEMP
    Wait 
    WaitButtonABTime 30
    End 

_038:
    WaitButtonABTime 30
    // {0}’s HP is full!
    PrintMessage msg_0197_00187, TAG_NICKNAME, BATTLER_CATEGORY_MSG_TEMP
    Wait 
    WaitButtonABTime 30
    End 

_048:
    UpdateVar OPCODE_SET, BSCRIPT_VAR_MSG_MOVE_TEMP, MOVE_HEAL_BLOCK
    // {0} was prevented from healing due to {1}!
    PrintMessage msg_0197_01054, TAG_NICKNAME_MOVE, BATTLER_CATEGORY_MSG_TEMP, BATTLER_CATEGORY_MSG_TEMP
    Wait 
    WaitButtonABTime 30
    End 
