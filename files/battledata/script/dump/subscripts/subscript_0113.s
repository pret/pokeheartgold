    .include "macros/btlcmd.inc"

    .data

_000:
    CompareVarToValue OPCODE_FLAG_SET, BTLVAR_BATTLE_CTX_STATUS, SYSCTL_PLAYED_MOVE_ANIMATION, _015
    PrintAttackMessage 
    Wait 
    WaitButtonABTime 30
    // Magnitude {0}!
    PrintMessage msg_00000197_00448, TAG_NUMBER, BTLSCR_MSG_TEMP
    Wait 
    WaitButtonABTime 30

_015:
    CompareVarToValue OPCODE_FLAG_SET, BTLVAR_MOVE_STATUS_FLAGS, MOVE_STATUS_DID_NOT_HIT, _023
    PlayMoveAnimation BTLSCR_ATTACKER
    Wait 

_023:
    End 
