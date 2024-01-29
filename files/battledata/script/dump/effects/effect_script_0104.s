    .include "macros/btlcmd.inc"

    .data

_000:
    SetMultiHit 3, SYSCTL_TRIPLE_KICK
    UpdateVar OPCODE_SET, BTLVAR_AFTER_MOVE_MESSAGE_TYPE, AFTER_MOVE_MESSAGE_MULTI_HIT
    UpdateVar OPCODE_ADD, BTLVAR_MOVE_POWER, 10
    CalcCrit 
    CalcDamage 
    End 
