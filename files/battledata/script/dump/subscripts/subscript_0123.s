    .include "macros/btlcmd.inc"

    .data

_000:
    PrintAttackMessage 
    Wait 
    WaitButtonABTime 15
    PrintBufferedMessage 
    Wait 
    PlayMoveAnimation BTLSCR_ATTACKER
    Wait 
    End 
