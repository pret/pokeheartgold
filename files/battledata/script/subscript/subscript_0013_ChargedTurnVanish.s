    .include "macros/btlcmd.inc"

    .data

_000:
    PlayMoveAnimation BATTLER_CATEGORY_ATTACKER
    Wait 
    PrintBufferedMessage 
    Wait 
    WaitButtonABTime 30
    LockMoveChoice BATTLER_CATEGORY_SIDE_EFFECT_MON
    CompareMonDataToValue OPCODE_FLAG_NOT, BATTLER_CATEGORY_SIDE_EFFECT_MON, BMON_DATA_MOVE_EFFECT, MOVE_EFFECT_FLAG_SEMI_INVULNERABLE, _017
    ToggleVanish BATTLER_CATEGORY_SIDE_EFFECT_MON, TRUE

_017:
    End 
