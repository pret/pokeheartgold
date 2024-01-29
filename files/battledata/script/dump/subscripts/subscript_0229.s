    .include "macros/btlcmd.inc"

    .data

_000:
    // {0} is watching carefully!
    PrintGlobalMessage msg_00000197_00849, TAG_NICKNAME, BTLSCR_DEFENDER
    Wait 
    WaitButtonABTime 30
    End 
