    .include "macros/btlcmd.inc"

    .data

_000:
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_FLING_SCRIPT, 0, _019
    CompareMonDataToValue OPCODE_EQU, BATTLER_CATEGORY_DEFENDER, BMON_DATA_HP, 0, _019
    CheckSubstitute BATTLER_CATEGORY_DEFENDER, _019
    UpdateVarFromVar OPCODE_SET, BSCRIPT_VAR_HP_CALC, BSCRIPT_VAR_FLING_DATA
    CallFromVar BSCRIPT_VAR_FLING_SCRIPT

_019:
    End 
