    .include "macros/btlcmd.inc"

    .data

_000:
    TrainerSlideIn BTLSCR_ENEMY, BATTLER_TYPE_SOLO_ENEMY
    Wait 
    PrintBufferedTrainerMessage BTLSCR_ENEMY
    Wait 
    WaitButtonABTime 60
    TrainerSlideOut BTLSCR_ENEMY
    Wait 
    End 
