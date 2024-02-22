    .include "macros/btlcmd.inc"

    .data

_000:
    UpdateMonDataFromVar OPCODE_GET, BATTLER_CATEGORY_ATTACKER, BMON_DATA_FRIENDSHIP, BSCRIPT_VAR_MOVE_POWER
    UpdateVar OPCODE_MUL, BSCRIPT_VAR_MOVE_POWER, 10
    UpdateVar OPCODE_DIV, BSCRIPT_VAR_MOVE_POWER, 25
    CalcCrit 
    CalcDamage 
    End 
