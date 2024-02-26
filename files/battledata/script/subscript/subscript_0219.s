    .include "macros/btlcmd.inc"

    .data

_000:
    TryPluck _024, _023
    // {0} stole and ate its foe’s {1}!
    PrintMessage msg_0197_01141, TAG_NICKNAME_ITEM, BATTLER_CATEGORY_ATTACKER, BATTLER_CATEGORY_DEFENDER
    Wait 
    WaitButtonABTime 30
    RemoveItem BATTLER_CATEGORY_DEFENDER
    UpdateVarFromVar OPCODE_SET, BSCRIPT_VAR_MSG_BATTLER_TEMP, BSCRIPT_VAR_BATTLER_ATTACKER
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_TEMP_DATA, 0, _023
    CallFromVar BSCRIPT_VAR_TEMP_DATA

_023:
    End 

_024:
    // {0}’s {1} made {2} ineffective!
    PrintMessage msg_0197_00714, TAG_NICKNAME_ABILITY_MOVE, BATTLER_CATEGORY_DEFENDER, BATTLER_CATEGORY_DEFENDER, BATTLER_CATEGORY_ATTACKER
    Wait 
    WaitButtonABTime 30
    End 
