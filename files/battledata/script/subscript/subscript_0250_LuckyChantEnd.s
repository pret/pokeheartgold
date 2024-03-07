    .include "macros/btlcmd.inc"

    .data

_000:
    // Your team’s Lucky Chant wore off!
    PrintMessage msg_0197_01085, TAG_NONE_SIDE, BATTLER_CATEGORY_MSG_TEMP
    Wait 
    WaitButtonABTime 30
    End 
