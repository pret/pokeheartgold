    .include "macros/btlcmd.inc"

    .data

_000:
    // {0} must recharge!
    PrintMessage msg_0197_00360, TAG_NICKNAME, BATTLER_CATEGORY_ATTACKER
    Wait 
    WaitButtonABTime 30
    UnlockMoveChoice BATTLER_CATEGORY_ATTACKER
    End 
