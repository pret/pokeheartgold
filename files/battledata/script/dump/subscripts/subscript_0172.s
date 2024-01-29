    .include "macros/btlcmd.inc"

    .data

_000:
    // {0} blew away {1}!
    PrintMessage msg_00000197_01042, TAG_NICKNAME_MOVE, BTLSCR_ATTACKER, BTLSCR_MSG_TEMP
    Wait 
    WaitButtonABTime 30
    End 
