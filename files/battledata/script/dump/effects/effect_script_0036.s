    .include "macros/btlcmd.inc"

    .data

_000:
    Random 2, 3
    UpdateVar OPCODE_ADD, BTLVAR_CALC_TEMP, 0x80000000
    UpdateVarFromVar OPCODE_SET, BTLVAR_SIDE_EFFECT_FLAGS_INDIRECT, BTLVAR_CALC_TEMP
    CalcCrit 
    CalcDamage 
    End 
