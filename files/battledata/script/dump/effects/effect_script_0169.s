    .include "macros/btlcmd.inc"

    .data

_000:
    CompareMonDataToValue OPCODE_FLAG_NOT, BTLSCR_ATTACKER, BATTLEMON_STATUS, MON_CONDITION_FACADE_BOOST, _009
    UpdateVar OPCODE_SET, BTLVAR_POWER_MULTI, 20

_009:
    CalcCrit 
    CalcDamage 
    End 
