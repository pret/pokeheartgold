    .include "macros/btlcmd.inc"

    .data

_000:
    PrintAttackMessage 
    Wait 
    WaitButtonABTime 30
    // But there was no PP left for the move!
    PrintMessage msg_0197_00824, TAG_NONE
    Wait 
    WaitButtonABTime 30
    End 
