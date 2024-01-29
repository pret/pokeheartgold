    .include "macros/btlcmd.inc"

    .data

_000:
    // {0} flew up high!
    BufferMessage msg_00000197_00223, TAG_NICKNAME, BTLSCR_ATTACKER
    GoToEffectScript 
