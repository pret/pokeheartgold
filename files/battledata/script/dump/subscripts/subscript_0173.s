    .include "macros/btlcmd.inc"

    .data

_000:
    CheckSubstitute BATTLER_CATEGORY_DEFENDER, _028
    CompareMonDataToValue OPCODE_NEQ, BATTLER_CATEGORY_DEFENDER, BMON_DATA_HEAL_BLOCK_TURNS, 0, _028
    Call BATTLE_SUBSCRIPT_ATTACK_MESSAGE_AND_ANIMATION
    UpdateMonData OPCODE_FLAG_ON, BATTLER_CATEGORY_DEFENDER, BMON_DATA_MOVE_EFFECT, MOVE_EFFECT_FLAG_HEAL_BLOCK
    UpdateMonData OPCODE_SET, BATTLER_CATEGORY_DEFENDER, BMON_DATA_HEAL_BLOCK_TURNS, 5
    // {0} was prevented from healing!
    PrintMessage msg_0197_01051, TAG_NICKNAME, BATTLER_CATEGORY_DEFENDER
    Wait 
    WaitButtonABTime 30
    End 

_028:
    PrintAttackMessage 
    Wait 
    WaitButtonABTime 15
    // It failed to affect {0}!
    PrintMessage msg_0197_01235, TAG_NICKNAME, BATTLER_CATEGORY_DEFENDER
    Wait 
    WaitButtonABTime 30
    UpdateVar OPCODE_FLAG_ON, BSCRIPT_VAR_MOVE_STATUS_FLAGS, MOVE_STATUS_NO_MORE_WORK
    End 
