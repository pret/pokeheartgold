    .include "macros/btlcmd.inc"

    .data

_000:
    PlayBattleAnimation BTLSCR_MSG_TEMP, BATTLE_ANIMATION_HELD_ITEM
    Wait 
    WaitButtonABTime 15
    PlayBattleAnimation BTLSCR_MSG_TEMP, BATTLE_ANIMATION_STAT_BOOST
    Wait 
    // The {1} sharply raised {0}’s {2}!
    PrintMessage msg_00000197_00759, TAG_NICKNAME_ITEM_STAT, BTLSCR_MSG_TEMP, BTLSCR_MSG_TEMP, BTLSCR_MSG_TEMP
    Wait 
    WaitButtonABTime 30
    UpdateVar OPCODE_SET, BTLVAR_SCRIPT_TEMP, 18
    UpdateVarFromVar OPCODE_ADD, BTLVAR_SCRIPT_TEMP, BTLVAR_MSG_TEMP
    UpdateMonData OPCODE_ADD, BTLSCR_MSG_TEMP, BATTLEMON_TEMP, 2
    CompareMonDataToValue OPCODE_LTE, BTLSCR_MSG_TEMP, BATTLEMON_TEMP, 12, _042
    UpdateMonData OPCODE_SET, BTLSCR_MSG_TEMP, BATTLEMON_TEMP, 12

_042:
    Call BATTLE_SUBSCRIPT_PLUCK_CHECK
    End 
