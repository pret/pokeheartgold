    .include "macros/btlcmd.inc"

    .data

_000:
    UpdateVar OPCODE_FLAG_OFF, BTLVAR_FIELD_CONDITIONS, FIELD_CONDITION_RAINING_TEMP
    // The rain stopped.
    PrintMessage msg_00000197_00803, TAG_NONE
    Wait 
    WaitButtonABTime 30
    End 
