    .include "macros/btlcmd.inc"

    .data

_000:
    // {0} unleashed energy!
    PrintMessage msg_00000197_00335, TAG_NICKNAME, BTLSCR_ATTACKER
    Wait 
    WaitButtonABTime 30
    UpdateMonData OPCODE_FLAG_OFF, BTLSCR_ATTACKER, BATTLEMON_VOLATILE_STATUS, VOLATILE_CONDITION_MOVE_LOCKED
    // But there was no target...
    PrintMessage msg_00000197_01234, TAG_NONE
    Wait 
    WaitButtonABTime 30
    End 
