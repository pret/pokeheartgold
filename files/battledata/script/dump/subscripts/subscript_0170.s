    .include "macros/btlcmd.inc"

    .data

_000:
    Call BATTLE_SUBSCRIPT_RECOIL_1_3
    CompareVarToValue OPCODE_FLAG_NOT, BTLVAR_BATTLE_CTX_STATUS, SYSCTL_APPLY_SECONDARY_EFFECT, _008
    Call BATTLE_SUBSCRIPT_BURN

_008:
    End 
