    .include "macros/btlcmd.inc"

    .data

_000:
    // {0} is making an uproar!
    PrintMessage msg_00000197_00311, TAG_NICKNAME, BTLSCR_MSG_TEMP
    Wait 
    WaitButtonABTime 30
    End 
