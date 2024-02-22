    .include "macros/btlcmd.inc"

    .data

_000:
    FollowMe 
    // {0} became the center of attention!
    BufferMessage msg_0197_00484, TAG_NICKNAME, BATTLER_CATEGORY_ATTACKER
    UpdateVar OPCODE_SET, BSCRIPT_VAR_SIDE_EFFECT_FLAGS_INDIRECT, MOVE_SIDE_EFFECT_ON_HIT|MOVE_SUBSCRIPT_PTR_PRINT_MESSAGE_AND_PLAY_ANIMATION
    End 
