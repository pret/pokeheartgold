    .include "macros/btlcmd.inc"

    .data

_000:
    CompareVarToValue OPCODE_FLAG_SET, BTLVAR_MOVE_STATUS_FLAGS, MOVE_STATUS_DID_NOT_HIT, _014
    PrintAttackMessage 
    Wait 
    CompareMonDataToValue OPCODE_NEQ, BTLSCR_DEFENDER, BATTLEMON_HEAL_BLOCK_TURNS, 0, _015
    Call BATTLE_SUBSCRIPT_RECOVER_HP

_014:
    End 

_015:
    UpdateVar OPCODE_SET, BTLVAR_MSG_MOVE_TEMP, MOVE_HEAL_BLOCK
    // {0} was prevented from healing due to {1}!
    PrintMessage msg_00000197_01054, TAG_NICKNAME_MOVE, BTLSCR_DEFENDER, BTLSCR_MSG_TEMP
    Wait 
    WaitButtonABTime 30
    End 
