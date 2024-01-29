    .include "macros/btlcmd.inc"

    .data

_000:
    PrintAttackMessage 
    Wait 
    CompareMonDataToValue OPCODE_FLAG_SET, BTLSCR_ATTACKER, BATTLEMON_VOLATILE_STATUS, VOLATILE_CONDITION_SUBSTITUTE, _043
    TrySubstitute _036
    PlayBattleAnimation BTLSCR_ATTACKER, BATTLE_ANIMATION_SUBSTITUTE_IN
    Wait 
    UpdateMonData OPCODE_FLAG_ON, BTLSCR_ATTACKER, BATTLEMON_VOLATILE_STATUS, VOLATILE_CONDITION_SUBSTITUTE
    UpdateVar OPCODE_FLAG_ON, BTLVAR_BATTLE_CTX_STATUS, SYSCTL_SKIP_SPRITE_BLINK
    UpdateVarFromVar OPCODE_SET, BTLVAR_MSG_BATTLER_TEMP, BTLVAR_ATTACKER
    Call BATTLE_SUBSCRIPT_UPDATE_HP
    // {0} made a substitute!
    PrintMessage msg_00000197_00348, TAG_NICKNAME, BTLSCR_ATTACKER
    Wait 
    WaitButtonABTime 30
    End 

_036:
    WaitButtonABTime 30
    // It was too weak to make a substitute!
    PrintMessage msg_00000197_00819, TAG_NONE
    GoTo _049

_043:
    WaitButtonABTime 30
    // {0} already has a substitute!
    PrintMessage msg_00000197_00351, TAG_NICKNAME, BTLSCR_ATTACKER

_049:
    Wait 
    WaitButtonABTime 30
    UpdateVar OPCODE_FLAG_ON, BTLVAR_MOVE_STATUS_FLAGS, MOVE_STATUS_NO_MORE_WORK
    End 
