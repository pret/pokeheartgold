    .include "macros/btlcmd.inc"

    .data

_000:
    // {0} was freed from {1}!
    PrintMessage msg_00000197_00265, TAG_NICKNAME_MOVE, BTLSCR_MSG_TEMP, BTLSCR_MSG_TEMP
    Wait 
    WaitButtonABTime 30
    End 
