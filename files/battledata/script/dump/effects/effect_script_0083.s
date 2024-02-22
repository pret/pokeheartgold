    .include "macros/btlcmd.inc"

    .data

_000:
    PrintAttackMessage 
    Wait 
    WaitButtonABTime 30
    PlayMoveAnimation BATTLER_CATEGORY_ATTACKER
    Wait 
    Metronome 
    GoToMoveScript FALSE
