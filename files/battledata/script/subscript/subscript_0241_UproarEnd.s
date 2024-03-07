    .include "macros/btlcmd.inc"

    .data

_000:
    // {0} calmed down.
    PrintMessage msg_0197_00314, TAG_NICKNAME, BATTLER_CATEGORY_MSG_TEMP
    Wait 
    WaitButtonABTime 30
    End 
