    .include "macros/btlcmd.inc"

    .data

_000:
    CheckSubstitute BTLSCR_DEFENDER, _028
    CompareMonDataToValue OPCODE_NEQ, BTLSCR_DEFENDER, BATTLEMON_HEAL_BLOCK_TURNS, 0, _028
    Call BATTLE_SUBSCRIPT_ATTACK_MESSAGE_AND_ANIMATION
    UpdateMonData OPCODE_FLAG_ON, BTLSCR_DEFENDER, BATTLEMON_MOVE_EFFECTS_MASK, MOVE_EFFECT_HEAL_BLOCK
    UpdateMonData OPCODE_SET, BTLSCR_DEFENDER, BATTLEMON_HEAL_BLOCK_TURNS, 5
    // {0} was prevented from healing!
    PrintMessage msg_00000197_01051, TAG_NICKNAME, BTLSCR_DEFENDER
    Wait 
    WaitButtonABTime 30
    End 

_028:
    PrintAttackMessage 
    Wait 
    WaitButtonABTime 15
    // It failed to affect {0}!
    PrintMessage msg_00000197_01235, TAG_NICKNAME, BTLSCR_DEFENDER
    Wait 
    WaitButtonABTime 30
    UpdateVar OPCODE_FLAG_ON, BTLVAR_MOVE_STATUS_FLAGS, MOVE_STATUS_NO_MORE_WORK
    End 
