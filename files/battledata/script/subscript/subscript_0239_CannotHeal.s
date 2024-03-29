    .include "macros/btlcmd.inc"

    .data

_000:
    UpdateVar OPCODE_SET, BSCRIPT_VAR_MSG_MOVE_TEMP, MOVE_HEAL_BLOCK
    // {0} was prevented from healing due to {1}!
    PrintMessage msg_0197_01054, TAG_NICKNAME_MOVE, BATTLER_CATEGORY_MSG_TEMP, BATTLER_CATEGORY_MSG_TEMP
    Wait 
    WaitButtonABTime 30
    End 
