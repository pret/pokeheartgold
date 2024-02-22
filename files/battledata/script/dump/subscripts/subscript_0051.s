    .include "macros/btlcmd.inc"

    .data

_000:
    UpdateVar OPCODE_SET, BSCRIPT_VAR_SIDE_EFFECT_TYPE, SIDE_EFFECT_TYPE_MOVE_EFFECT
    Call BATTLE_SUBSCRIPT_CONFUSE
    CompareMonDataToValue OPCODE_FLAG_NOT, BATTLER_CATEGORY_SIDE_EFFECT_MON, BMON_DATA_STATUS2, STATUS2_CONFUSION, _018
    // {0} became confused due to fatigue!
    PrintMessage msg_0197_00338, TAG_NICKNAME, BATTLER_CATEGORY_SIDE_EFFECT_MON
    Wait 
    WaitButtonABTime 30

_018:
    End 
