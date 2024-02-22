    .include "macros/btlcmd.inc"

    .data

_000:
    UpdateVar OPCODE_SET, BSCRIPT_VAR_MSG_MOVE_TEMP, MOVE_TAUNT
    // {0}’s {1} wore off!
    PrintMessage msg_0197_01257, TAG_NICKNAME_MOVE, BATTLER_CATEGORY_MSG_TEMP, BATTLER_CATEGORY_MSG_TEMP
    Wait 
    WaitButtonABTime 30
    End 
