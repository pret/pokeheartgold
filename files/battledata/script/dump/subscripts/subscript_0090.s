    .include "macros/btlcmd.inc"

    .data

_000:
    CompareVarToValue OPCODE_FLAG_SET, BTLVAR_BATTLE_CTX_STATUS, SYSCTL_SKIP_SPRITE_BLINK, _009
    PlayMoveHitSound BTLSCR_MSG_TEMP
    FlickerMon BTLSCR_MSG_TEMP
    Wait 

_009:
    // The substitute took damage for {0}!
    PrintMessage msg_00000197_00354, TAG_NICKNAME, BTLSCR_MSG_TEMP
    Wait 
    WaitButtonABTime 30
    CompareMonDataToValue OPCODE_FLAG_SET, BTLSCR_MSG_TEMP, BATTLEMON_VOLATILE_STATUS, VOLATILE_CONDITION_SUBSTITUTE, _040
    PlayBattleAnimation BTLSCR_MSG_TEMP, BATTLE_ANIMATION_SUBSTITUTE_OUT
    Wait 
    RestoreSprite BTLSCR_MSG_TEMP
    Wait 
    PlayBattleAnimation BTLSCR_MSG_TEMP, BATTLE_ANIMATION_SUB_IN
    Wait 
    // {0}’s substitute faded!
    PrintMessage msg_00000197_00357, TAG_NICKNAME, BTLSCR_MSG_TEMP
    Wait 
    WaitButtonABTime 30

_040:
    End 
