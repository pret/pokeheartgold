    .include "macros/btlcmd.inc"

    .data

_000:
    PrintAttackMessage 
    Wait 
    WaitButtonABTime 15
    PrintBufferedMessage 
    Wait 
    PlayMoveAnimation BATTLER_CATEGORY_ATTACKER
    Wait 
    End 
