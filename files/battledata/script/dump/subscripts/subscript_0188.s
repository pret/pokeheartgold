    .include "macros/btlcmd.inc"

    .data

_000:
    // {0}’s {1} made it the {2} type!
    PrintMessage msg_00000197_00641, TAG_NICKNAME_ABILITY_TYPE, BTLSCR_DEFENDER, BTLSCR_DEFENDER, BTLSCR_MSG_TEMP
    Wait 
    WaitButtonABTime 30
    UpdateMonDataFromVar OPCODE_SET, BTLSCR_DEFENDER, BATTLEMON_TYPE_1, BTLVAR_MSG_TEMP
    UpdateMonDataFromVar OPCODE_SET, BTLSCR_DEFENDER, BATTLEMON_TYPE_2, BTLVAR_MSG_TEMP
    End 
