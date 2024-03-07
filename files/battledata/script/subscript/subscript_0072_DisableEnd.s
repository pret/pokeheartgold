    .include "macros/btlcmd.inc"

    .data

_000:
    // {0} is no longer disabled!
    PrintMessage msg_0197_00369, TAG_NICKNAME, BATTLER_CATEGORY_MSG_TEMP
    Wait 
    WaitButtonABTime 30
    End 
