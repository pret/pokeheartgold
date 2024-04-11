    .include "macros/btlcmd.inc"

    .data

_000:
    // {0} avoided the attack!
    PrintMessage msg_0197_00024, TAG_NICKNAME, BATTLER_CATEGORY_DEFENDER
    Wait 
    WaitButtonABTime 30
    UpdateVar OPCODE_FLAG_ON, BSCRIPT_VAR_MOVE_STATUS_FLAGS, MOVE_STATUS_NO_MORE_WORK
    End 
