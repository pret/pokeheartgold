    .include "macros/btlcmd.inc"

    .data

_000:
    CompareVarToValue OPCODE_FLAG_SET, BSCRIPT_VAR_BATTLE_STATUS, BATTLE_STATUS_NO_BLINK, _009
    PlayMoveHitSound BATTLER_CATEGORY_MSG_TEMP
    FlickerMon BATTLER_CATEGORY_MSG_TEMP
    Wait 

_009:
    // The substitute took damage for {0}!
    PrintMessage msg_0197_00354, TAG_NICKNAME, BATTLER_CATEGORY_MSG_TEMP
    Wait 
    WaitButtonABTime 30
    CompareMonDataToValue OPCODE_FLAG_SET, BATTLER_CATEGORY_MSG_TEMP, BMON_DATA_STATUS2, STATUS2_SUBSTITUTE, _040
    PlayBattleAnimation BATTLER_CATEGORY_MSG_TEMP, BATTLE_ANIMATION_SUBSTITUTE_OUT
    Wait 
    RestoreSprite BATTLER_CATEGORY_MSG_TEMP
    Wait 
    PlayBattleAnimation BATTLER_CATEGORY_MSG_TEMP, BATTLE_ANIMATION_SUB_IN
    Wait 
    // {0}’s substitute faded!
    PrintMessage msg_0197_00357, TAG_NICKNAME, BATTLER_CATEGORY_MSG_TEMP
    Wait 
    WaitButtonABTime 30

_040:
    End 
