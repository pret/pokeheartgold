    .include "macros/btlcmd.inc"

    .data

_000:
    // {1}’s {0} made it shudder!
    PrintMessage msg_00000197_01106, TAG_ABILITY_NICKNAME, BTLSCR_MSG_BATTLER_TEMP, BTLSCR_MSG_TEMP
    Wait 
    WaitButtonABTime 30
    End 
