    .include "macros/btlcmd.inc"

    .data

_000:
    CheckSubstitute BATTLER_CATEGORY_DEFENDER, _015
    TrySketch _015
    Call BATTLE_SUBSCRIPT_ATTACK_MESSAGE_AND_ANIMATION
    // {0} sketched {1}!
    PrintMessage msg_0197_00385, TAG_NICKNAME_MOVE, BATTLER_CATEGORY_ATTACKER, BATTLER_CATEGORY_MSG_TEMP
    Wait 
    WaitButtonABTime 30
    End 

_015:
    UpdateVar OPCODE_FLAG_ON, BSCRIPT_VAR_MOVE_STATUS_FLAGS, MOVE_STATUS_FAILED
    End 
