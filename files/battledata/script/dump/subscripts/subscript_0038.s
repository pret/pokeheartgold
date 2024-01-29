    .include "macros/btlcmd.inc"

    .data

_000:
    // {0} is confused!
    PrintMessage msg_00000197_00150, TAG_NICKNAME, BTLSCR_ATTACKER
    Wait 
    WaitButtonABTime 30
    PlayBattleAnimation BTLSCR_ATTACKER, BATTLE_ANIMATION_CONFUSED
    Wait 
    End 
