    .include "macros/btlcmd.inc"

    .data

_000:
    TryAssist _008
    PrintAttackMessage 
    Wait 
    PlayMoveAnimation BTLSCR_ATTACKER
    Wait 
    GoToMoveScript FALSE

_008:
    UpdateVar OPCODE_FLAG_ON, BTLVAR_MOVE_STATUS_FLAGS, MOVE_STATUS_FAILED
    End 
