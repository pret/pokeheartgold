    .include "macros/btlcmd.inc"

    .data

_000:
    Call BATTLE_SUBSCRIPT_INFATUATED
    // {0} is immobilized by love!
    PrintMessage msg_0197_00172, TAG_NICKNAME, BATTLER_CATEGORY_ATTACKER
    Wait 
    WaitButtonABTime 30
    UnlockMoveChoice BATTLER_CATEGORY_ATTACKER
    End 
