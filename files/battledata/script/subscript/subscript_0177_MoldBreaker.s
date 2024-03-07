    .include "macros/btlcmd.inc"

    .data

_000:
    // {0} has {1}!
    PrintMessage msg_0197_01087, TAG_NICKNAME_ABILITY, BATTLER_CATEGORY_MSG_TEMP, BATTLER_CATEGORY_MSG_BATTLER_TEMP
    Wait 
    WaitButtonABTime 30
    End 
