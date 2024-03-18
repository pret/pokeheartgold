    .include "macros/btlcmd.inc"

    .data

_000:
    PlayBattleAnimation BATTLER_CATEGORY_MSG_TEMP, BATTLE_ANIMATION_HELD_ITEM
    Wait 
    // {0}’s {1} snapped it out of confusion!
    PrintMessage msg_0197_00890, TAG_NICKNAME_ITEM, BATTLER_CATEGORY_MSG_TEMP, BATTLER_CATEGORY_MSG_TEMP
    Wait 
    WaitButtonABTime 30
    UpdateMonData OPCODE_FLAG_OFF, BATTLER_CATEGORY_MSG_TEMP, BMON_DATA_STATUS2, STATUS2_CONFUSION
    Call BATTLE_SUBSCRIPT_PLUCK_CHECK
    End 
