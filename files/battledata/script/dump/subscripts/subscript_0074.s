    .include "macros/btlcmd.inc"

    .data

_000:
    // {0}’s encore ended!
    PrintMessage msg_00000197_00375, TAG_NICKNAME, BTLSCR_MSG_TEMP
    Wait 
    WaitButtonABTime 30
    End 
