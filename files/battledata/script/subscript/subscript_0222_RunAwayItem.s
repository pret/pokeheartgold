    .include "macros/btlcmd.inc"

    .data

_000:
    // Used the {0}!
    PrintMessage msg_0197_01206, TAG_ITEM, BATTLER_CATEGORY_MSG_TEMP
    Wait 
    PlayBattleAnimation BATTLER_CATEGORY_PLAYER, BATTLE_ANIMATION_ITEM_ESCAPE
    Wait 
    PlaySound BATTLER_CATEGORY_ATTACKER, SEQ_SE_DP_NIGERU2
    // Got away safely!
    PrintMessage msg_0197_00781, TAG_NONE
    Wait 
    WaitButtonABTime 30
    FadeOutBattle 
    Wait 
    UpdateVar OPCODE_FLAG_ON, BSCRIPT_VAR_BATTLE_OUTCOME, BATTLE_RESULT_PLAYER_FLED
    End 
