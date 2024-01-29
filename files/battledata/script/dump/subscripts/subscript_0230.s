    .include "macros/btlcmd.inc"

    .data

_000:
    PlaySound BTLSCR_ATTACKER, 1791
    // The wild {0} fled!
    PrintGlobalMessage msg_00000197_00784, TAG_NICKNAME, BTLSCR_ATTACKER
    Wait 
    WaitButtonABTime 30
    FadeOutBattle 
    Wait 
    UpdateVar OPCODE_FLAG_ON, BTLVAR_RESULT_MASK, BATTLE_RESULT_PLAYER_FLED
    IncrementGameStat BTLSCR_ATTACKER, BATTLER_TYPE_SOLO_ENEMY, 100
    End 
