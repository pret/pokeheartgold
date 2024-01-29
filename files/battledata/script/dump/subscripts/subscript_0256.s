    .include "macros/btlcmd.inc"

    .data

_000:
    WaitButtonABTime 15
    // {0} ignored orders!
    PrintMessage msg_00000197_00826, TAG_NICKNAME, BTLSCR_ATTACKER
    Wait 
    WaitButtonABTime 30
    End 
