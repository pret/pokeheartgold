    .include "macros/btlcmd.inc"

    .data

_000:
    // {0} snapped out of confusion!
    PrintMessage msg_0197_00153, TAG_NICKNAME, BATTLER_CATEGORY_ATTACKER
    Wait 
    WaitButtonABTime 30
    End 
