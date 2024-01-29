    .include "macros/btlcmd.inc"

    .data

_000:
    // {0} snapped out of confusion!
    PrintMessage msg_00000197_00153, TAG_NICKNAME, BTLSCR_ATTACKER
    Wait 
    WaitButtonABTime 30
    End 
