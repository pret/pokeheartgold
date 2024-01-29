    .include "macros/btlcmd.inc"

    .data

_000:
    // {0}’s rage is building!
    PrintMessage msg_00000197_00363, TAG_NICKNAME, BTLSCR_DEFENDER
    Wait 
    WaitButtonABTime 30
    End 
