    .include "macros/btlcmd.inc"

    .data

_000:
    // {0} can’t use the sealed {1}!
    PrintMessage msg_00000197_00616, TAG_NICKNAME_MOVE, BTLSCR_ATTACKER, BTLSCR_ATTACKER
    Wait 
    WaitButtonABTime 30
    UnlockMoveChoice BTLSCR_ATTACKER
    End 
