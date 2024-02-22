    .include "macros/btlcmd.inc"

    .data

_000:
    // {0} is trying to take its foe with it!
    PrintMessage msg_0197_00388, TAG_NICKNAME, BATTLER_CATEGORY_ATTACKER
    Wait 
    WaitButtonABTime 30
    UpdateMonData OPCODE_FLAG_ON, BATTLER_CATEGORY_ATTACKER, BMON_DATA_STATUS2, STATUS2_DESTINY_BOND
    End 
