    .include "macros/btlcmd.inc"

    .data

_000:
    // {0} foresaw an attack!
    BufferMessage msg_00000197_00472, TAG_NICKNAME, BTLSCR_ATTACKER
    GoToEffectScript 
