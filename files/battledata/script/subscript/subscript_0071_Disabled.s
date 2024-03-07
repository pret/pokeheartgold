    .include "macros/btlcmd.inc"

    .data

_000:
    CompareMonDataToValue OPCODE_FLAG_SET, BATTLER_CATEGORY_ATTACKER, BMON_DATA_STATUS2, STATUS2_LOCKED_INTO_MOVE, _005

_005:
    // {0}’s {1} is disabled!
    PrintMessage msg_0197_00609, TAG_NICKNAME_MOVE, BATTLER_CATEGORY_ATTACKER, BATTLER_CATEGORY_ATTACKER
    Wait 
    WaitButtonABTime 30
    UnlockMoveChoice BATTLER_CATEGORY_ATTACKER
    End 
