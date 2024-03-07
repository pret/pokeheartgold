    .include "macros/btlcmd.inc"

    .data

_000:
    // {0} is paralyzed! It can’t move!
    PrintMessage msg_0197_00130, TAG_NICKNAME, BATTLER_CATEGORY_ATTACKER
    Wait 
    WaitButtonABTime 30
    PlayBattleAnimation BATTLER_CATEGORY_ATTACKER, BATTLE_ANIMATION_PARALYZED
    Wait 
    UnlockMoveChoice BATTLER_CATEGORY_ATTACKER
    End 
