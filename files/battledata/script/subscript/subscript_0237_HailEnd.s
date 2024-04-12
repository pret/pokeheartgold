    .include "macros/btlcmd.inc"

    .data

_000:
    UpdateVar OPCODE_FLAG_OFF, BSCRIPT_VAR_FIELD_CONDITION, FIELD_CONDITION_HAIL
    // The hail stopped.
    PrintMessage msg_0197_00812, TAG_NONE
    Wait 
    WaitButtonABTime 30
    End 
