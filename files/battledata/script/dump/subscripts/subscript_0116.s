    .include "macros/btlcmd.inc"

    .data

_000:
    // {0} got free of {1}’s {2}!
    PrintMessage msg_00000197_00459, TAG_NICKNAME_NICKNAME_MOVE, BTLSCR_ATTACKER, BTLSCR_MSG_TEMP, BTLSCR_MSG_TEMP
    Wait 
    WaitButtonABTime 30
    End 
