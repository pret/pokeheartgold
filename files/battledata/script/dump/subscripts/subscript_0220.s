    .include "macros/btlcmd.inc"

    .data

_000:
    CompareVarToValue OPCODE_EQU, BTLVAR_FLING_SCRIPT, 0, _019
    CompareMonDataToValue OPCODE_EQU, BTLSCR_DEFENDER, BATTLEMON_CUR_HP, 0, _019
    CheckSubstitute BTLSCR_DEFENDER, _019
    UpdateVarFromVar OPCODE_SET, BTLVAR_HP_CALC_TEMP, BTLVAR_FLING_TEMP
    CallFromVar BTLVAR_FLING_SCRIPT

_019:
    End 
