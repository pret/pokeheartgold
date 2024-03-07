    .include "macros/btlcmd.inc"

    .data

_000:
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_MOVE_NO_CUR, MOVE_FEINT, _015
    IfTurnFlag BATTLER_CATEGORY_DEFENDER, TURN_FLAG_PROTECTING, 0, _022
    // It broke through {0}’s protection!
    PrintMessage msg_0197_01243, TAG_NICKNAME, BATTLER_CATEGORY_DEFENDER
    GoTo _019

_015:
    // {0} fell for the feint!
    PrintMessage msg_0197_01048, TAG_NICKNAME, BATTLER_CATEGORY_DEFENDER

_019:
    Wait 
    WaitButtonABTime 30

_022:
    SetTurnFlag BATTLER_CATEGORY_DEFENDER, TURN_FLAG_PROTECTING, 0
    End 
