    .include "macros/btlcmd.inc"

    .data

_000:
    ResetAllStatChanges 
    // All stat changes were eliminated!
    PrintMessage msg_0197_00817, TAG_NONE
    Wait 
    WaitButtonABTime 30
    End 
