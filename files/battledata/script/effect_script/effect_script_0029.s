    .include "macros/btlcmd.inc"

    .data

_000:
    SetMultiHit 0, MULTIHIT_MULTI_HIT_MOVE
    UpdateVar OPCODE_SET, BSCRIPT_VAR_AFTER_MOVE_MESSAGE_TYPE, AFTER_MOVE_MESSAGE_MULTI_HIT
    CalcCrit 
    CalcDamage 
    End 
