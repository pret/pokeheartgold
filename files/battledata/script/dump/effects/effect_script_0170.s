    .include "macros/btlcmd.inc"

    .data

_000:
    CompareVarToValue OPCODE_NEQ, BTLVAR_ATTACKER_PHYSICAL_DAMAGE_MASK, 0, _016
    CompareVarToValue OPCODE_NEQ, BTLVAR_ATTACKER_SPECIAL_DAMAGE_MASK, 0, _016
    UpdateVar OPCODE_SET, BTLVAR_MOVE_EFFECT_CHANCE, 1
    CalcCrit 
    CalcDamage 
    End 

_016:
    UpdateVar OPCODE_FLAG_ON, BTLVAR_MOVE_STATUS_FLAGS, MOVE_STATUS_LOST_FOCUS
    // {0} lost its focus and couldn’t move!
    BufferMessage msg_00000197_00600, TAG_NICKNAME, BTLSCR_ATTACKER
    End 
