    .include "macros/btlcmd.inc"

    .data

_000:
    UpdateVarFromVar OPCODE_GET, BTLVAR_ATTACKER_TEMP, BTLVAR_ATTACKER
    UpdateVarFromVar OPCODE_GET, BTLVAR_DEFENDER_TEMP, BTLVAR_DEFENDER
    End 
