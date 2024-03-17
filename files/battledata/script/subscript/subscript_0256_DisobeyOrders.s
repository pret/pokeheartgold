    .include "macros/btlcmd.inc"

    .data

_000:
    WaitButtonABTime 15
    // {0} ignored orders!
    PrintMessage msg_0197_00826, TAG_NICKNAME, BATTLER_CATEGORY_ATTACKER
    Wait 
    WaitButtonABTime 30
    End 
