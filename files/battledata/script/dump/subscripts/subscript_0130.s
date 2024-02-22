    .include "macros/btlcmd.inc"

    .data

_000:
    CompareMonDataToValue OPCODE_EQU, BATTLER_CATEGORY_DEFENDER, BMON_DATA_HP, 0, _020
    UpdateMonData OPCODE_FLAG_OFF, BATTLER_CATEGORY_DEFENDER, BMON_DATA_STATUS, STATUS_PARALYSIS
    // {0} was healed of paralysis!
    PrintMessage msg_0197_00136, TAG_NICKNAME, BATTLER_CATEGORY_DEFENDER
    Wait 
    SetHealthbarStatus BATTLER_CATEGORY_DEFENDER, BATTLE_ANIMATION_NONE
    WaitButtonABTime 30

_020:
    End 
