    .include "macros/btlcmd.inc"

    .data

_000:
    UpdateVar OPCODE_FLAG_ON, BSCRIPT_VAR_BATTLE_STATUS, BATTLE_STATUS_IGNORE_TYPE_EFFECTIVENESS
    Random 10, 5
    UpdateMonDataFromVar OPCODE_GET, BATTLER_CATEGORY_ATTACKER, BMON_DATA_LEVEL, BSCRIPT_VAR_DAMAGE
    UpdateVarFromVar OPCODE_MUL, BSCRIPT_VAR_DAMAGE, BSCRIPT_VAR_CALC_TEMP
    UpdateVar OPCODE_DIV, BSCRIPT_VAR_DAMAGE, 10
    CompareVarToValue OPCODE_NEQ, BSCRIPT_VAR_DAMAGE, 0, _028
    UpdateVar OPCODE_SET, BSCRIPT_VAR_DAMAGE, 1

_028:
    UpdateVar OPCODE_MUL, BSCRIPT_VAR_DAMAGE, -1
    End 