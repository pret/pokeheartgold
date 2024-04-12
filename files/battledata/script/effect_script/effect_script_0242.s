    .include "macros/btlcmd.inc"

    .data

_000:
    TryCopycat _008
    PrintAttackMessage 
    Wait 
    PlayMoveAnimation BATTLER_CATEGORY_ATTACKER
    Wait 
    GoToMoveScript FALSE

_008:
    UpdateVar OPCODE_FLAG_ON, BSCRIPT_VAR_MOVE_STATUS_FLAGS, MOVE_STATUS_FAILED
    End 
