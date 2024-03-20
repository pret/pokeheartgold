    .include "macros/btlcmd.inc"

    .data

_000:
    TryBreakScreens _015
    UpdateVar OPCODE_SET, BSCRIPT_VAR_MOVE_EFFECT_CHANCE, 1
    Call BATTLE_SUBSCRIPT_ATTACK_MESSAGE_AND_ANIMATION
    // It shattered the barrier!
    PrintMessage msg_0197_00606, TAG_NONE
    Wait 
    WaitButtonABTime 30
    GoTo _022

_015:
    CompareVarToValue OPCODE_FLAG_SET, BSCRIPT_VAR_MOVE_STATUS_FLAGS, MOVE_STATUS_DID_NOT_HIT, _022
    Call BATTLE_SUBSCRIPT_ATTACK_MESSAGE_AND_ANIMATION

_022:
    End 
