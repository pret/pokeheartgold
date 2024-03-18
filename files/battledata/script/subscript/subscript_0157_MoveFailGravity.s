    .include "macros/btlcmd.inc"

    .data

_000:
    // {0} can’t use {1} because of gravity!
    PrintMessage msg_0197_01001, TAG_NICKNAME_MOVE, BATTLER_CATEGORY_ATTACKER, BATTLER_CATEGORY_ATTACKER
    Wait 
    WaitButtonABTime 30
    End 
