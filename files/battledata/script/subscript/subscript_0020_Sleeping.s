    .include "macros/btlcmd.inc"

    .data

_000:
    // {0} is fast asleep.
    PrintMessage msg_0197_00299, TAG_NICKNAME, BATTLER_CATEGORY_ATTACKER
    Wait 
    WaitButtonABTime 30
    PlayBattleAnimation BATTLER_CATEGORY_ATTACKER, BATTLE_ANIMATION_ASLEEP
    Wait 
    End 
