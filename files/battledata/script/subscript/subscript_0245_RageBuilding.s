    .include "macros/btlcmd.inc"

    .data

_000:
    // {0}’s rage is building!
    PrintMessage msg_0197_00363, TAG_NICKNAME, BATTLER_CATEGORY_DEFENDER
    Wait 
    WaitButtonABTime 30
    End 
