    .include "macros/btlcmd.inc"

    .data

_000:
    PrintAttackMessage 
    Wait 
    CompareMonDataToValue OPCODE_FLAG_SET, BATTLER_CATEGORY_ATTACKER, BMON_DATA_STATUS2, STATUS2_SUBSTITUTE, _043
    TrySubstitute _036
    PlayBattleAnimation BATTLER_CATEGORY_ATTACKER, BATTLE_ANIMATION_SUBSTITUTE_IN
    Wait 
    UpdateMonData OPCODE_FLAG_ON, BATTLER_CATEGORY_ATTACKER, BMON_DATA_STATUS2, STATUS2_SUBSTITUTE
    UpdateVar OPCODE_FLAG_ON, BSCRIPT_VAR_BATTLE_STATUS, BATTLE_STATUS_NO_BLINK
    UpdateVarFromVar OPCODE_SET, BSCRIPT_VAR_MSG_BATTLER_TEMP, BSCRIPT_VAR_BATTLER_ATTACKER
    Call BATTLE_SUBSCRIPT_UPDATE_HP
    // {0} made a substitute!
    PrintMessage msg_0197_00348, TAG_NICKNAME, BATTLER_CATEGORY_ATTACKER
    Wait 
    WaitButtonABTime 30
    End 

_036:
    WaitButtonABTime 30
    // It was too weak to make a substitute!
    PrintMessage msg_0197_00819, TAG_NONE
    GoTo _049

_043:
    WaitButtonABTime 30
    // {0} already has a substitute!
    PrintMessage msg_0197_00351, TAG_NICKNAME, BATTLER_CATEGORY_ATTACKER

_049:
    Wait 
    WaitButtonABTime 30
    UpdateVar OPCODE_FLAG_ON, BSCRIPT_VAR_MOVE_STATUS_FLAGS, MOVE_STATUS_NO_MORE_WORK
    End 
