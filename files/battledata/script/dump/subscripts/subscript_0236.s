    .include "macros/btlcmd.inc"

    .data

_000:
    UpdateVar OPCODE_FLAG_OFF, BTLVAR_FIELD_CONDITIONS, FIELD_CONDITION_SUNNY_TEMP
    // The sunlight faded.
    PrintMessage msg_00000197_00809, TAG_NONE
    Wait 
    WaitButtonABTime 30
    End 
