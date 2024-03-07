    .include "macros/btlcmd.inc"

    .data

_000:
    // {0} is loafing around!
    PrintMessage msg_0197_00832, TAG_NICKNAME, BATTLER_CATEGORY_ATTACKER
    Wait 
    WaitButtonABTime 30
    UnlockMoveChoice BATTLER_CATEGORY_ATTACKER
    End 
