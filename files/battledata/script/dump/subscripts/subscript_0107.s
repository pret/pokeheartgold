    .include "macros/btlcmd.inc"

    .data

_000:
    // {0} is in love with {1}!
    PrintMessage msg_00000197_00165, TAG_NICKNAME_NICKNAME, BTLSCR_ATTACKER, BTLSCR_MSG_TEMP
    Wait 
    WaitButtonABTime 30
    PlayBattleAnimation BTLSCR_ATTACKER, BATTLE_ANIMATION_INFATUATED
    Wait 
    End 
