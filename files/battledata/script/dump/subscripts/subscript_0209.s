    .include "macros/btlcmd.inc"

    .data

_000:
    PlayBattleAnimation BTLSCR_MSG_TEMP, BATTLE_ANIMATION_HELD_ITEM
    Wait 
    // {0} used the {1} to get pumped!
    PrintMessage msg_00000197_00597, TAG_NICKNAME_ITEM, BTLSCR_MSG_TEMP, BTLSCR_MSG_TEMP
    Wait 
    WaitButtonABTime 30
    UpdateMonData OPCODE_FLAG_ON, BTLSCR_MSG_TEMP, BATTLEMON_VOLATILE_STATUS, VOLATILE_CONDITION_FOCUS_ENERGY
    Call BATTLE_SUBSCRIPT_PLUCK_CHECK
    End 
