    .include "macros/btlcmd.inc"

    .data

_000:
    // {0} calmed down.
    PrintMessage msg_00000197_00314, TAG_NICKNAME, BTLSCR_MSG_TEMP
    Wait 
    WaitButtonABTime 30
    End 
