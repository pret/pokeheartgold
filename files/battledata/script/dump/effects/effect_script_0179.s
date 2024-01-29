    .include "macros/btlcmd.inc"

    .data

_000:
    TryWish _002
    End 

_002:
    UpdateVar OPCODE_SET, BTLVAR_MOVE_STATUS_FLAGS, MOVE_STATUS_FAILED
    End 
