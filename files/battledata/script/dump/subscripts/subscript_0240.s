    .include "macros/btlcmd.inc"

    .data

_000:
    // {0} is making an uproar!
    PrintMessage msg_0197_00311, TAG_NICKNAME, BATTLER_CATEGORY_MSG_TEMP
    Wait 
    WaitButtonABTime 30
    End 
