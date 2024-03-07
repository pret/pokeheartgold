    .include "macros/btlcmd.inc"

    .data

_000:
    // {0} was freed from {1}!
    PrintMessage msg_0197_00265, TAG_NICKNAME_MOVE, BATTLER_CATEGORY_MSG_TEMP, BATTLER_CATEGORY_MSG_TEMP
    Wait 
    WaitButtonABTime 30
    End 
