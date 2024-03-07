    .include "macros/btlcmd.inc"

    .data

_000:
    // {0} is confused!
    PrintMessage msg_0197_00150, TAG_NICKNAME, BATTLER_CATEGORY_ATTACKER
    Wait 
    WaitButtonABTime 30
    PlayBattleAnimation BATTLER_CATEGORY_ATTACKER, BATTLE_ANIMATION_CONFUSED
    Wait 
    // It hurt itself in its confusion!
    PrintMessage msg_0197_00797, TAG_NONE
    Wait 
    WaitButtonABTime 30
    UnlockMoveChoice BATTLER_CATEGORY_ATTACKER
    CheckHoldOnWith1HP BATTLER_CATEGORY_ATTACKER
    Call BATTLE_SUBSCRIPT_UPDATE_HP
    Call BATTLE_SUBSCRIPT_MOVE_FOLLOWUP_MESSAGE
    End 
