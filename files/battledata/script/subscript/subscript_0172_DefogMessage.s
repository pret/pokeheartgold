    .include "macros/btlcmd.inc"

    .data

_000:
    // {0} blew away {1}!
    PrintMessage msg_0197_01042, TAG_NICKNAME_MOVE, BATTLER_CATEGORY_ATTACKER, BATTLER_CATEGORY_MSG_TEMP
    Wait 
    WaitButtonABTime 30
    End 
