    .include "macros/btlcmd.inc"

    .data

_000:
    TrainerSlideIn BATTLER_CATEGORY_ENEMY, BATTLER_TYPE_SOLO_ENEMY
    Wait 
    PrintBufferedTrainerMessage BATTLER_CATEGORY_ENEMY
    Wait 
    WaitButtonABTime 60
    TrainerSlideOut BATTLER_CATEGORY_ENEMY
    Wait 
    End 
