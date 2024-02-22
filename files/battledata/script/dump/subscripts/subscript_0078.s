    .include "macros/btlcmd.inc"

    .data

_000:
    TryConversion2 _012
    Call BATTLE_SUBSCRIPT_ATTACK_MESSAGE_AND_ANIMATION
    // {0} transformed into the {1} type!
    PrintMessage msg_0197_00178, TAG_NICKNAME_TYPE, BATTLER_CATEGORY_ATTACKER, BATTLER_CATEGORY_MSG_TEMP
    Wait 
    WaitButtonABTime 30
    End 

_012:
    UpdateVar OPCODE_FLAG_ON, BSCRIPT_VAR_MOVE_STATUS_FLAGS, MOVE_STATUS_FAILED
    End 
