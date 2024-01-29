    .include "macros/btlcmd.inc"

    .data

_000:
    CompareVarToValue OPCODE_EQU, BTLVAR_CURRENT_MOVE, MOVE_FEINT, _015
    IfTurnFlag BTLSCR_DEFENDER, TURN_FLAG_PROTECTING, 0, _022
    // It broke through {0}’s protection!
    PrintMessage msg_00000197_01243, TAG_NICKNAME, BTLSCR_DEFENDER
    GoTo _019

_015:
    // {0} fell for the feint!
    PrintMessage msg_00000197_01048, TAG_NICKNAME, BTLSCR_DEFENDER

_019:
    Wait 
    WaitButtonABTime 30

_022:
    SetTurnFlag BTLSCR_DEFENDER, TURN_FLAG_PROTECTING, 0
    End 
