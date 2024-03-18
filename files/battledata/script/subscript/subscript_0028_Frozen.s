    .include "macros/btlcmd.inc"

    .data

_000:
    // {0} is frozen solid!
    PrintMessage msg_0197_00111, TAG_NICKNAME, BATTLER_CATEGORY_ATTACKER
    Wait 
    WaitButtonABTime 30
    PlayBattleAnimation BATTLER_CATEGORY_ATTACKER, BATTLE_ANIMATION_FROZEN
    Wait 
    End 
