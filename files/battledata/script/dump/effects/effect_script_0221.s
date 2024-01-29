    .include "macros/btlcmd.inc"

    .data

_000:
    UpdateMonDataFromVar OPCODE_GET, BTLSCR_DEFENDER, BATTLEMON_MAX_HP, BTLVAR_CALC_TEMP
    UpdateVar OPCODE_DIV, BTLVAR_CALC_TEMP, 0x00000002
    CompareMonDataToVar OPCODE_GT, BTLSCR_DEFENDER, BATTLEMON_CUR_HP, BTLVAR_CALC_TEMP, _020
    UpdateVar OPCODE_SET, BTLVAR_POWER_MULTI, 20
    GoTo _024

_020:
    UpdateVar OPCODE_SET, BTLVAR_POWER_MULTI, 10

_024:
    CalcCrit 
    CalcDamage 
    End 
