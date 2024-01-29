    .include "macros/btlcmd.inc"

    .data

_000:
    CalcCrit 
    CalcDamage 
    UpdateVar OPCODE_SET, BTLVAR_SIDE_EFFECT_FLAGS_INDIRECT, MOVE_SIDE_EFFECT_TO_DEFENDER|MOVE_SUBSCRIPT_PTR_ACCURACY_DOWN_1_STAGE
    End 
