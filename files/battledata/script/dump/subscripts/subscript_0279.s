    .include "macros/btlcmd.inc"

    .data

_000:
    UpdateVarFromVar OPCODE_GET, BTLVAR_ATTACKER, BTLVAR_ATTACKER_TEMP
    UpdateVarFromVar OPCODE_GET, BTLVAR_DEFENDER, BTLVAR_DEFENDER_TEMP
    End 
