    .include "macros/btlcmd.inc"

    .data

_000:
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_SIDE_EFFECT_TYPE, SIDE_EFFECT_TYPE_DIRECT, _006
    Call BATTLE_SUBSCRIPT_ATTACK_MESSAGE_AND_ANIMATION

_006:
    End 
