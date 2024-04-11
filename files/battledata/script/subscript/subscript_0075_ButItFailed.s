    .include "macros/btlcmd.inc"

    .data

_000:
    // But it failed!
    PrintMessage msg_0197_00796, TAG_NONE
    Wait 
    WaitButtonABTime 30
    UpdateVar OPCODE_FLAG_ON, BSCRIPT_VAR_MOVE_STATUS_FLAGS, MOVE_STATUS_NO_MORE_WORK
    End 
