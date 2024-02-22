    .include "macros/btlcmd.inc"

    .data

_000:
    WaitButtonABTime 15
    // {0} began to nap!
    PrintMessage msg_0197_00827, TAG_NICKNAME, BATTLER_CATEGORY_ATTACKER
    Wait 
    WaitButtonABTime 30
    UpdateVarFromVar OPCODE_SET, BSCRIPT_VAR_BATTLER_STAT_CHANGE, BSCRIPT_VAR_BATTLER_ATTACKER
    UpdateVar OPCODE_SET, BSCRIPT_VAR_SIDE_EFFECT_TYPE, SIDE_EFFECT_TYPE_DISOBEDIENCE
    Call BATTLE_SUBSCRIPT_FALL_ASLEEP
    End 
