    .include "macros/btlcmd.inc"

    .data

_000:
    // {0} is confused!
    PrintMessage msg_0197_00150, TAG_NICKNAME, BATTLER_CATEGORY_ATTACKER
    Wait 
    WaitButtonABTime 30
    PlayBattleAnimation BATTLER_CATEGORY_ATTACKER, BATTLE_ANIMATION_CONFUSED
    Wait 
    End 
