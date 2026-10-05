#include "macros/btlcmd.inc"

    .data

_000:
    // {0}’s encore ended!
    PrintMessage msg_0197_00375, TAG_NICKNAME, BATTLER_CATEGORY_MSG_TEMP
    Wait 
    WaitButtonABTime 30
    End 
