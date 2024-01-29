    .include "macros/btlcmd.inc"

    .data

_000:
    // {0} threw Mud at the {1}!
    PrintGlobalMessage msg_00000197_00854, TAG_TRNAME_NICKNAME, BTLSCR_ATTACKER, BTLSCR_DEFENDER
    Wait 
    WaitButtonABTime 30
    ThrowPokeball BTLSCR_PLAYER, BTLSCR_THROW_SAFARI_ROCK
    Wait 
    PlayBattleAnimation BTLSCR_ENEMY, BATTLE_ANIMATION_ANGRY
    Wait 
    CompareVarToValue OPCODE_EQU, BTLVAR_SCRIPT_TEMP, 0, _026
    // {0} is angry!
    PrintGlobalMessage msg_00000197_00855, TAG_NICKNAME, BTLSCR_DEFENDER
    GoTo _030

_026:
    // {0} is beside itself with anger!
    PrintGlobalMessage msg_00000197_00856, TAG_NICKNAME, BTLSCR_DEFENDER

_030:
    Wait 
    WaitButtonABTime 30
    End 
