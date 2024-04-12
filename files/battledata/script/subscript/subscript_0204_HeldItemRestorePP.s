    .include "macros/btlcmd.inc"

    .data

_000:
    PlayBattleAnimation BATTLER_CATEGORY_MSG_TEMP, BATTLE_ANIMATION_HELD_ITEM
    Wait 
    // {0} restored {2}’s PP using its {1}!
    PrintMessage msg_0197_00902, TAG_NICKNAME_ITEM_MOVE, BATTLER_CATEGORY_MSG_TEMP, BATTLER_CATEGORY_MSG_TEMP, BATTLER_CATEGORY_MSG_TEMP
    Wait 
    WaitButtonABTime 30
    Call BATTLE_SUBSCRIPT_PLUCK_CHECK
    End 
