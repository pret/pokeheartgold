    .include "macros/btlcmd.inc"

    .data

_000:
    WaitButtonABTime 15
    // {0} frisked its foe and found one {1}!
    PrintMessage msg_0197_01118, TAG_NICKNAME_ITEM, BATTLER_CATEGORY_MSG_TEMP, BATTLER_CATEGORY_MSG_TEMP
    Wait 
    WaitButtonABTime 30
    End 
