    .include "macros/btlcmd.inc"

    .data

_000:
    // Your team’s {0} wore off!
    BufferLocalMessage BTLSCR_MSG_TEMP, msg_00000197_00288, TAG_MOVE, BTLSCR_MSG_TEMP
    Wait 
    WaitButtonABTime 30
    End 
