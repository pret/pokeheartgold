    .include "macros/btlcmd.inc"

    .data

_000:
    PrintAttackMessage 
    Wait 
    WaitButtonABTime 15
    CompareMonDataToValue OPCODE_NEQ, BATTLER_CATEGORY_DEFENDER, BMON_DATA_FLASH_FIRE, 0, _023
    // {0}’s {1} raised the power of its Fire-type moves!
    PrintMessage msg_0197_00656, TAG_NICKNAME_ABILITY, BATTLER_CATEGORY_DEFENDER, BATTLER_CATEGORY_DEFENDER
    Wait 
    WaitButtonABTime 30
    UpdateMonData OPCODE_FLAG_ON, BATTLER_CATEGORY_DEFENDER, BMON_DATA_FLASH_FIRE, 1
    End 

_023:
    // {0}’s {1} made {2} ineffective!
    PrintMessage msg_0197_00714, TAG_NICKNAME_ABILITY_MOVE, BATTLER_CATEGORY_DEFENDER, BATTLER_CATEGORY_DEFENDER, BATTLER_CATEGORY_ATTACKER
    Wait 
    WaitButtonABTime 30
    End 
