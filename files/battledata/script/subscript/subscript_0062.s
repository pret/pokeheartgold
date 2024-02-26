    .include "macros/btlcmd.inc"

    .data

_000:
    Call BATTLE_SUBSCRIPT_ATTACK_MESSAGE_AND_ANIMATION
    UpdateMonData OPCODE_FLAG_ON, BATTLER_CATEGORY_SIDE_EFFECT_MON, BMON_DATA_STATUS2, STATUS2_FOCUS_ENERGY
    // {0} is getting pumped!
    PrintMessage msg_0197_00276, TAG_NICKNAME, BATTLER_CATEGORY_SIDE_EFFECT_MON
    Wait 
    WaitButtonABTime 30
    End 
