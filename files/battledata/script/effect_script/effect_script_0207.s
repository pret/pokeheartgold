    .include "macros/btlcmd.inc"

    .data

_000:
    UpdateVar OPCODE_FLAG_ON, BSCRIPT_VAR_BATTLE_STATUS, BATTLE_STATUS_HIT_FLY
    CalcCrit 
    CalcDamage 
    End 
