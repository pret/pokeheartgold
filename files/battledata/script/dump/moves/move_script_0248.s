    .include "macros/btlcmd.inc"

    .data

_000:
    // {0} foresaw an attack!
    BufferMessage msg_0197_00472, TAG_NICKNAME, BATTLER_CATEGORY_ATTACKER
    GoToEffectScript 
