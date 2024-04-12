    .include "macros/btlcmd.inc"

    .data

_000:
    GetCurrentMoveData MOVE_ATTRIBUTE_POWER
    UpdateVarFromVar OPCODE_SET, BSCRIPT_VAR_MOVE_POWER, BSCRIPT_VAR_CALC_TEMP
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_DEFENDER_ASSURANCE_DAMAGE_MASK, 0, _018
    UpdateVarFromVar OPCODE_SET, BSCRIPT_VAR_MOVE_POWER, BSCRIPT_VAR_CALC_TEMP
    UpdateVar OPCODE_MUL, BSCRIPT_VAR_MOVE_POWER, 2

_018:
    CalcCrit 
    CalcDamage 
    End 
