    .include "macros/btlcmd.inc"

    .data

_000:
    // Used the {0}!
    PrintMessage msg_00000197_01206, TAG_ITEM, BTLSCR_MSG_TEMP
    Wait 
    PlayBattleAnimation BTLSCR_PLAYER, BATTLE_ANIMATION_ITEM_ESCAPE
    Wait 
    PlaySound BTLSCR_ATTACKER, 1791
    // Got away safely!
    PrintMessage msg_00000197_00781, TAG_NONE
    Wait 
    WaitButtonABTime 30
    FadeOutBattle 
    Wait 
    UpdateVar OPCODE_FLAG_ON, BTLVAR_RESULT_MASK, BATTLE_RESULT_PLAYER_FLED
    End 
