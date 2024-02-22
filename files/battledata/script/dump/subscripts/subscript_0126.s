    .include "macros/btlcmd.inc"

    .data

_000:
    CompareVarToValue OPCODE_NEQ, BSCRIPT_VAR_SIDE_EFFECT_TYPE, SIDE_EFFECT_TYPE_DIRECT, _009
    PrintAttackMessage 
    Wait 
    PlayMoveAnimation BATTLER_CATEGORY_ATTACKER
    Wait 

_009:
    PrintBufferedMessage 
    Wait 
    WaitButtonABTime 30
    End 
