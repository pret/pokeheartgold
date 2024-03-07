    .include "macros/btlcmd.inc"

    .data

_000:
    UpdateMonData OPCODE_FLAG_OFF, BATTLER_CATEGORY_ATTACKER, BMON_DATA_STATUS, STATUS_FREEZE
    // {0} was defrosted by {1}!
    PrintMessage msg_0197_00117, TAG_NICKNAME_MOVE, BATTLER_CATEGORY_ATTACKER, BATTLER_CATEGORY_ATTACKER
    Wait 
    SetHealthbarStatus BATTLER_CATEGORY_ATTACKER, BATTLE_ANIMATION_NONE
    WaitButtonABTime 30
    End 
