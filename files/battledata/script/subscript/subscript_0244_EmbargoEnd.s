    .include "macros/btlcmd.inc"

    .data

_000:
    // {0} can use items again!
    PrintMessage msg_0197_01138, TAG_NICKNAME, BATTLER_CATEGORY_MSG_TEMP
    Wait 
    WaitButtonABTime 30
    UpdateMonData OPCODE_FLAG_OFF, BATTLER_CATEGORY_MSG_TEMP, BMON_DATA_MOVE_EFFECT, MOVE_EFFECT_FLAG_EMBARGO
    End 
