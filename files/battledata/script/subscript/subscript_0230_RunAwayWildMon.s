    .include "macros/btlcmd.inc"

    .data

_000:
    PlaySound BATTLER_CATEGORY_ATTACKER, SEQ_SE_DP_NIGERU2
    // The wild {0} fled!
    PrintGlobalMessage msg_0197_00784, TAG_NICKNAME, BATTLER_CATEGORY_ATTACKER
    Wait 
    WaitButtonABTime 30
    FadeOutBattle 
    Wait 
    UpdateVar OPCODE_FLAG_ON, BSCRIPT_VAR_BATTLE_OUTCOME, BATTLE_RESULT_PLAYER_FLED
    IncrementGameStat BATTLER_CATEGORY_ATTACKER, BATTLER_TYPE_SOLO_ENEMY, GAME_STAT_UNK100
    End 
