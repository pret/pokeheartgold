    .include "macros/btlcmd.inc"

    .data

_000:
    UpdateVar OPCODE_ADD, BSCRIPT_VAR_CRITICAL_BOOSTS, 1
    UpdateVar OPCODE_SET, BSCRIPT_VAR_SIDE_EFFECT_FLAGS_INDIRECT, MOVE_SIDE_EFFECT_TO_DEFENDER|MOVE_SUBSCRIPT_PTR_BURN
    CalcCrit 
    CalcDamage 
    End 
