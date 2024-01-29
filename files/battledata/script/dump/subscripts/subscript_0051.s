    .include "macros/btlcmd.inc"

    .data

_000:
    UpdateVar OPCODE_SET, BTLVAR_SIDE_EFFECT_TYPE, SIDE_EFFECT_TYPE_MOVE_EFFECT
    Call BATTLE_SUBSCRIPT_CONFUSE
    CompareMonDataToValue OPCODE_FLAG_NOT, BTLSCR_SIDE_EFFECT_MON, BATTLEMON_VOLATILE_STATUS, VOLATILE_CONDITION_CONFUSION, _018
    // {0} became confused due to fatigue!
    PrintMessage msg_00000197_00338, TAG_NICKNAME, BTLSCR_SIDE_EFFECT_MON
    Wait 
    WaitButtonABTime 30

_018:
    End 
