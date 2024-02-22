    .include "macros/btlcmd.inc"

    .data

_000:
    PlaySound BATTLER_CATEGORY_ATTACKER, 1791
    // The wild {0} fled!
    PrintGlobalMessage msg_0197_00784, TAG_NICKNAME, BATTLER_CATEGORY_ATTACKER
    Wait 
    WaitButtonABTime 30
    FadeOutBattle 
    Wait 
    UpdateVar OPCODE_FLAG_ON, BSCRIPT_VAR_BATTLE_OUTCOME, BATTLE_RESULT_PLAYER_FLED
    IncrementGameStat BATTLER_CATEGORY_ATTACKER, BATTLER_TYPE_SOLO_ENEMY, 100
    End 
