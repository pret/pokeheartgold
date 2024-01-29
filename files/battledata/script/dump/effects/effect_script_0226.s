    .include "macros/btlcmd.inc"

    .data

_000:
    CheckSubstitute BTLSCR_DEFENDER, _005
    BoostRandomStatBy2 _005
    End 

_005:
    UpdateVar OPCODE_FLAG_ON, BTLVAR_MOVE_STATUS_FLAGS, MOVE_STATUS_FAILED
    End 
