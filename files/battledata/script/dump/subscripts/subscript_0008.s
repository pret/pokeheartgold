    .include "macros/btlcmd.inc"

    .data

_000:
    // Can’t escape!
    PrintMessage msg_00000197_00042, TAG_NONE
    Wait 
    WaitButtonABTime 30
    End 
