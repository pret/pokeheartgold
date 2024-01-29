    .include "macros/btlcmd.inc"

    .data

_000:
    WaitButtonABTime 15
    // {0} ignored orders while asleep!
    PrintMessage msg_00000197_00825, TAG_NICKNAME, BTLSCR_ATTACKER
    Wait 
    WaitButtonABTime 30
    End 
