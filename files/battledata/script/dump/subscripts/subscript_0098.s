    .include "macros/btlcmd.inc"

    .data

_000:
    CheckAbility CHECK_HAVE, BTLSCR_MSG_TEMP, ABILITY_MAGIC_GUARD, _033
    PlayBattleAnimation BTLSCR_MSG_TEMP, BATTLE_ANIMATION_DAMAGE_CURSE
    Wait 
    UpdateMonDataFromVar OPCODE_GET, BTLSCR_MSG_TEMP, BATTLEMON_MAX_HP, BTLVAR_HP_CALC_TEMP
    DivideVarByValue BTLVAR_HP_CALC_TEMP, 4
    UpdateVar OPCODE_MUL, BTLVAR_HP_CALC_TEMP, -1
    // {0} is afflicted by the curse!
    PrintMessage msg_00000197_00424, TAG_NICKNAME, BTLSCR_MSG_TEMP
    Wait 
    WaitButtonABTime 30
    UpdateVar OPCODE_FLAG_ON, BTLVAR_BATTLE_CTX_STATUS, SYSCTL_SKIP_SPRITE_BLINK
    GoToSubscript BATTLE_SUBSCRIPT_UPDATE_HP

_033:
    End 
