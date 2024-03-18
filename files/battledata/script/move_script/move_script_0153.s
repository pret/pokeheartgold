    .include "macros/btlcmd.inc"

    .data

_000:
    IncrementGameStat BATTLER_CATEGORY_ATTACKER, BATTLER_TYPE_SOLO_PLAYER, GAME_STAT_UNK80
    GoToEffectScript 
