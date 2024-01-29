    .include "macros/btlcmd.inc"

    .data

_000:
    TryPluck _024, _023
    // {0} stole and ate its foe’s {1}!
    PrintMessage msg_00000197_01141, TAG_NICKNAME_ITEM, BTLSCR_ATTACKER, BTLSCR_DEFENDER
    Wait 
    WaitButtonABTime 30
    RemoveItem BTLSCR_DEFENDER
    UpdateVarFromVar OPCODE_SET, BTLVAR_MSG_BATTLER_TEMP, BTLVAR_ATTACKER
    CompareVarToValue OPCODE_EQU, BTLVAR_SCRIPT_TEMP, 0, _023
    CallFromVar BTLVAR_SCRIPT_TEMP

_023:
    End 

_024:
    // {0}’s {1} made {2} ineffective!
    PrintMessage msg_00000197_00714, TAG_NICKNAME_ABILITY_MOVE, BTLSCR_DEFENDER, BTLSCR_DEFENDER, BTLSCR_ATTACKER
    Wait 
    WaitButtonABTime 30
    End 
