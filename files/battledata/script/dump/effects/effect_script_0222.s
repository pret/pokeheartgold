    .include "macros/btlcmd.inc"

    .data

_000:
    CalcNaturalGiftParams _006
    CalcCrit 
    CalcDamage 
    RemoveItem BTLSCR_ATTACKER
    End 

_006:
    UpdateVar OPCODE_FLAG_ON, BTLVAR_MOVE_STATUS_FLAGS, MOVE_STATUS_FAILED
    End 
