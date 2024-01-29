    .include "macros/btlcmd.inc"

    .data

_000:
    // {0} must recharge!
    PrintMessage msg_00000197_00360, TAG_NICKNAME, BTLSCR_ATTACKER
    Wait 
    WaitButtonABTime 30
    UnlockMoveChoice BTLSCR_ATTACKER
    End 
