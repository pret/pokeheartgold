    .include "macros/btlcmd.inc"

    .data

_000:
    // {0} is fast asleep.
    PrintMessage msg_00000197_00299, TAG_NICKNAME, BTLSCR_ATTACKER
    Wait 
    WaitButtonABTime 30
    PlayBattleAnimation BTLSCR_ATTACKER, BATTLE_ANIMATION_ASLEEP
    Wait 
    End 
