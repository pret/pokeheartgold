    .include "macros/btlcmd.inc"

    .data

_000:
    UpdateVar OPCODE_SET, BSCRIPT_VAR_MSG_MOVE_TEMP, MOVE_HEAL_BLOCK
    // {0} can’t use {2} because of {1}!
    PrintMessage msg_0197_01057, TAG_NICKNAME_MOVE_MOVE, BATTLER_CATEGORY_ATTACKER, BATTLER_CATEGORY_MSG_TEMP, BATTLER_CATEGORY_ATTACKER
    Wait 
    WaitButtonABTime 30
    End 
