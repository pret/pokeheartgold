    .include "macros/btlcmd.inc"

    .data

_000:
    CompareVarToValue OPCODE_NEQ, BTLVAR_SIDE_EFFECT_TYPE, SIDE_EFFECT_TYPE_DIRECT, _009
    PrintAttackMessage 
    Wait 
    PlayMoveAnimation BTLSCR_ATTACKER
    Wait 

_009:
    PrintBufferedMessage 
    Wait 
    WaitButtonABTime 30
    End 
