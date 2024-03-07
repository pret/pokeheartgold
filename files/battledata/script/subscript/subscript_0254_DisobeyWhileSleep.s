    .include "macros/btlcmd.inc"

    .data

_000:
    WaitButtonABTime 15
    // {0} ignored orders while asleep!
    PrintMessage msg_0197_00825, TAG_NICKNAME, BATTLER_CATEGORY_ATTACKER
    Wait 
    WaitButtonABTime 30
    End 
