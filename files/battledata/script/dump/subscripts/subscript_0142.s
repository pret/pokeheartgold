    .include "macros/btlcmd.inc"

    .data

_000:
    CheckSubstitute BTLSCR_DEFENDER, _032
    CompareMonDataToValue OPCODE_EQU, BTLSCR_DEFENDER, BATTLEMON_ABILITY, ABILITY_MULTITYPE, _032
    CompareMonDataToValue OPCODE_EQU, BTLSCR_DEFENDER, BATTLEMON_HELD_ITEM, ITEM_GRISEOUS_ORB, _032
    CompareMonDataToValue OPCODE_NEQ, BTLSCR_DEFENDER, BATTLEMON_QUICK_CLAW, 0, _032
    CompareMonDataToValue OPCODE_NEQ, BTLSCR_DEFENDER, BATTLEMON_CUSTAP_BERRY, 0, _032
    TryKnockOff _032
    PrintBufferedMessage 
    Wait 
    WaitButtonABTime 30

_032:
    End 
