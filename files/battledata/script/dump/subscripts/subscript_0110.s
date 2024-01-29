    .include "macros/btlcmd.inc"

    .data

_000:
    // Your team is no longer protected by Safeguard!
    PrintMessage msg_00000197_00203, TAG_NONE_SIDE_CONSCIOUS, BTLSCR_MSG_TEMP
    Wait 
    WaitButtonABTime 30
    End 
