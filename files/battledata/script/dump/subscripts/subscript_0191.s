    .include "macros/btlcmd.inc"

    .data

_000:
    // {0} is loafing around!
    PrintMessage msg_00000197_00832, TAG_NICKNAME, BTLSCR_ATTACKER
    Wait 
    WaitButtonABTime 30
    UnlockMoveChoice BTLSCR_ATTACKER
    End 
