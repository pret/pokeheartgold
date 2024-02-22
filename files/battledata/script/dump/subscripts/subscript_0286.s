    .include "macros/btlcmd.inc"

    .data

_000:
    // {0} can’t escape!
    PrintMessage msg_0197_00043, TAG_NICKNAME, BATTLER_CATEGORY_ATTACKER
    Wait 
    WaitButtonABTime 30
    End 
