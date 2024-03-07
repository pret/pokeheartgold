    .include "macros/btlcmd.inc"

    .data

_000:
    PlaySound BATTLER_CATEGORY_ATTACKER, SEQ_SE_DP_NIGERU2
    // Got away safely!
    PrintMessage msg_0197_00781, TAG_NONE
    Wait 
    WaitButtonABTime 30
    FadeOutBattle 
    Wait 
    UpdateVar OPCODE_FLAG_ON, BSCRIPT_VAR_BATTLE_OUTCOME, BATTLE_RESULT_WIN|BATTLE_RESULT_TRY_FLEE
    SetLinkBattleResult 
    End 
