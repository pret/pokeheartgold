    .include "macros/btlcmd.inc"

    .data

_000:
    // {0} used one {1}!
    PrintMessage msg_00000197_00857, TAG_TRNAME_ITEM, BTLSCR_ATTACKER, BTLSCR_MSG_TEMP
    Wait 
    StartCatchMonTask CAPTURE_NORMAL
    WaitCatchMonTask 
    UpdateVarFromVar OPCODE_GET, BTLVAR_RESULT_MASK, BTLVAR_SCRIPT_TEMP
    UpdateVar OPCODE_BITWISE_AND, BTLVAR_SCRIPT_TEMP, 255
    CompareVarToValue OPCODE_NEQ, BTLVAR_SCRIPT_TEMP, 4, _029
    TryRestoreStatusOnSwitch BTLSCR_PLAYER, _029
    UpdateMonData OPCODE_SET, BTLSCR_PLAYER, BATTLEMON_STATUS, MON_CONDITION_NONE

_029:
    CompareVarToValue OPCODE_FLAG_NOT, BTLVAR_BATTLE_TYPE, BATTLE_TYPE_BUG_CONTEST, _060
    CompareVarToValue OPCODE_FLAG_SET, BTLVAR_RESULT_MASK, BATTLE_RESULT_CAPTURED_MON, _060
    CompareVarToValue OPCODE_NEQ, BTLVAR_NUM_SAFARI_BALLS, 0, _060
    PlaySound BTLSCR_ATTACKER, 1521
    // Announcer: You’re out of {0}s! Game over!
    PrintMessage msg_00000197_01269, TAG_ITEM, BTLSCR_MSG_TEMP
    Wait 
    WaitButtonABTime 30
    FadeOutBattle 
    Wait 
    UpdateVar OPCODE_FLAG_ON, BTLVAR_RESULT_MASK, BATTLE_RESULT_PLAYER_FLED

_060:
    End 
