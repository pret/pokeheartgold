    .include "macros/btlcmd.inc"

    .data

_000:
    Random 2, 3
    UpdateVar OPCODE_ADD, BSCRIPT_VAR_CALC_TEMP, 0x80000000
    UpdateVarFromVar OPCODE_SET, BSCRIPT_VAR_SIDE_EFFECT_FLAGS_INDIRECT, BSCRIPT_VAR_CALC_TEMP
    CalcCrit 
    CalcDamage 
    End 
