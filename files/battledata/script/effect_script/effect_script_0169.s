    .include "macros/btlcmd.inc"

    .data

_000:
    CompareMonDataToValue OPCODE_FLAG_NOT, BATTLER_CATEGORY_ATTACKER, BMON_DATA_STATUS, STATUS_FACADE_BOOST, _009
    UpdateVar OPCODE_SET, BSCRIPT_VAR_POWER_MULTI, 20

_009:
    CalcCrit 
    CalcDamage 
    End 
