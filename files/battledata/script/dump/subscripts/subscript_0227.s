    .include "macros/btlcmd.inc"

    .data

_000:
    // {0} threw some Bait at the {1}!
    PrintGlobalMessage msg_00000197_00851, TAG_TRNAME_NICKNAME, BTLSCR_ATTACKER, BTLSCR_DEFENDER
    Wait 
    WaitButtonABTime 30
    ThrowPokeball BTLSCR_PLAYER, BTLSCR_THROW_SAFARI_BAIT
    Wait 
    PlayBattleAnimation BTLSCR_ENEMY, BATTLE_ANIMATION_HAPPY
    Wait 
    PlayBattleAnimation BTLSCR_ENEMY, BATTLE_ANIMATION_EATING
    Wait 
    CompareVarToValue OPCODE_EQU, BTLVAR_SCRIPT_TEMP, 0, _030
    // {0} is eating!
    PrintGlobalMessage msg_00000197_00852, TAG_NICKNAME, BTLSCR_DEFENDER
    GoTo _034

_030:
    // {0} is busy eating!
    PrintGlobalMessage msg_00000197_00853, TAG_NICKNAME, BTLSCR_DEFENDER

_034:
    Wait 
    WaitButtonABTime 30
    End 
