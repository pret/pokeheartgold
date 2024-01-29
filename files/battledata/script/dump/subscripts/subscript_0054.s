    .include "macros/btlcmd.inc"

    .data

_000:
    TryMist _007
    // Your team became shrouded in mist!
    BufferMessage msg_00000197_00271, TAG_NONE_SIDE_CONSCIOUS, BTLSCR_ATTACKER
    Call BATTLE_SUBSCRIPT_ANIMATION_PREPARED_MESSAGE

_007:
    End 
