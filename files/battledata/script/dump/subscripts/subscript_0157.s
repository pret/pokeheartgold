    .include "macros/btlcmd.inc"

    .data

_000:
    // {0} can’t use {1} because of gravity!
    PrintMessage msg_00000197_01001, TAG_NICKNAME_MOVE, BTLSCR_ATTACKER, BTLSCR_ATTACKER
    Wait 
    WaitButtonABTime 30
    End 
