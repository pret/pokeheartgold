    .include "macros/btlcmd.inc"

    .data

_000:
    GetCurrentMoveData MOVEATTRIBUTE_POWER
    UpdateVarFromVar OPCODE_SET, BTLVAR_MOVE_POWER, BTLVAR_CALC_TEMP
    CompareVarToValue OPCODE_EQU, BTLVAR_DEFENDER_ASSURANCE_DAMAGE_MASK, 0, _018
    UpdateVarFromVar OPCODE_SET, BTLVAR_MOVE_POWER, BTLVAR_CALC_TEMP
    UpdateVar OPCODE_MUL, BTLVAR_MOVE_POWER, 2

_018:
    CalcCrit 
    CalcDamage 
    End 
