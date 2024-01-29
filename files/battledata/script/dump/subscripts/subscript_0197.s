    .include "macros/btlcmd.inc"

    .data

_000:
    // {0} finally got its act together!
    PrintMessage msg_00000197_01115, TAG_NICKNAME_ABILITY, BTLSCR_MSG_TEMP, BTLSCR_MSG_BATTLER_TEMP
    Wait 
    WaitButtonABTime 30
    End 
