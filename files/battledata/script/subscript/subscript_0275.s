    .include "macros/btlcmd.inc"

    .data

_000:
    CompareVarToValue OPCODE_FLAG_SET, BSCRIPT_VAR_BATTLE_TYPE, BATTLE_TYPE_PAL_PARK, _017
    CheckSafariGameDone _046
    // {0} used one {1}!
    PrintMessage msg_0197_00857, TAG_TRNAME_ITEM, BATTLER_CATEGORY_ATTACKER, BATTLER_CATEGORY_MSG_TEMP
    Wait 
    ThrowPokeball BATTLER_CATEGORY_PLAYER, BTLSCR_THROW_SAFARI_BALL
    GoTo _025

_017:
    // {0}, come back!
    PrintGlobalMessage msg_0197_01225, TAG_NICKNAME, BATTLER_CATEGORY_ENEMY
    Wait 
    ThrowPokeball BATTLER_CATEGORY_PLAYER, BTLSCR_THROW_PARK_BALL

_025:
    StartCatchMonTask CAPTURE_SAFARI
    WaitCatchMonTask 
    CompareVarToValue OPCODE_FLAG_SET, BSCRIPT_VAR_BATTLE_OUTCOME, BATTLE_RESULT_CAPTURED_MON, _058
    CompareVarToValue OPCODE_NEQ, BSCRIPT_VAR_SAFARI_BALL_CNT, 0, _058
    PlaySound BATTLER_CATEGORY_ATTACKER, 1521
    // Announcer: You’re out of Safari Balls! Game over!
    PrintMessage msg_0197_00850, TAG_NONE
    GoTo _049

_046:
    // There is no room left in the PC!
    PrintMessage msg_0197_00874, TAG_NONE

_049:
    Wait 
    WaitButtonABTime 30
    FadeOutBattle 
    Wait 
    UpdateVar OPCODE_FLAG_ON, BSCRIPT_VAR_BATTLE_OUTCOME, BATTLE_RESULT_PLAYER_FLED

_058:
    End 
