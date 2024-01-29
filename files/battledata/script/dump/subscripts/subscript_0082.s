    .include "macros/btlcmd.inc"

    .data

_000:
    // {0} is trying to take its foe with it!
    PrintMessage msg_00000197_00388, TAG_NICKNAME, BTLSCR_ATTACKER
    Wait 
    WaitButtonABTime 30
    UpdateMonData OPCODE_FLAG_ON, BTLSCR_ATTACKER, BATTLEMON_VOLATILE_STATUS, VOLATILE_CONDITION_DESTINY_BOND
    End 
