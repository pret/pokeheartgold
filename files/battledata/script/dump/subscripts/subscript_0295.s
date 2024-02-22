    .include "macros/btlcmd.inc"

    .data

_000:
    UpdateVar OPCODE_SET, BSCRIPT_VAR_MSG_MOVE_TEMP, MOVE_TRICK_ROOM
    PlayMoveAnimation BATTLER_CATEGORY_MSG_TEMP
    Wait 
    UpdateVar OPCODE_SET, BSCRIPT_VAR_MOVE_EFFECT_CHANCE, 0
    UpdateVar OPCODE_FLAG_OFF, BSCRIPT_VAR_BATTLE_STATUS, BATTLE_STATUS_MOVE_ANIMATIONS_OFF
    // The dimensions became distorted!
    PrintMessage msg_0197_01267, TAG_NONE
    Wait 
    WaitButtonABTime 30
    UpdateVar OPCODE_FLAG_ON, BSCRIPT_VAR_FIELD_CONDITION, FIELD_CONDITION_TRICK_ROOM_INIT
    End 
