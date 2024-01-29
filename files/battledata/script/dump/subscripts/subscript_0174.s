    .include "macros/btlcmd.inc"

    .data

_000:
    UpdateVar OPCODE_SET, BTLVAR_MSG_MOVE_TEMP, MOVE_HEAL_BLOCK
    // {0} can’t use {2} because of {1}!
    PrintMessage msg_00000197_01057, TAG_NICKNAME_MOVE_MOVE, BTLSCR_ATTACKER, BTLSCR_MSG_TEMP, BTLSCR_ATTACKER
    Wait 
    WaitButtonABTime 30
    End 
