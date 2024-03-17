    .include "macros/btlcmd.inc"

    .data

_000:
    CompareVarToValue OPCODE_FLAG_SET, BSCRIPT_VAR_BATTLE_STATUS, BATTLE_STATUS_MOVE_ANIMATIONS_OFF, _015
    PrintAttackMessage 
    Wait 
    WaitButtonABTime 30
    // Magnitude {0}!
    PrintMessage msg_0197_00448, TAG_NUMBER, BATTLER_CATEGORY_MSG_TEMP
    Wait 
    WaitButtonABTime 30

_015:
    CompareVarToValue OPCODE_FLAG_SET, BSCRIPT_VAR_MOVE_STATUS_FLAGS, MOVE_STATUS_DID_NOT_HIT, _023
    PlayMoveAnimation BATTLER_CATEGORY_ATTACKER
    Wait 

_023:
    End 
