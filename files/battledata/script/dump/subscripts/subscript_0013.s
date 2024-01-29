    .include "macros/btlcmd.inc"

    .data

_000:
    PlayMoveAnimation BTLSCR_ATTACKER
    Wait 
    PrintBufferedMessage 
    Wait 
    WaitButtonABTime 30
    LockMoveChoice BTLSCR_SIDE_EFFECT_MON
    CompareMonDataToValue OPCODE_FLAG_NOT, BTLSCR_SIDE_EFFECT_MON, BATTLEMON_MOVE_EFFECTS_MASK, MOVE_EFFECT_SEMI_INVULNERABLE, _017
    ToggleVanish BTLSCR_SIDE_EFFECT_MON, TRUE

_017:
    End 
