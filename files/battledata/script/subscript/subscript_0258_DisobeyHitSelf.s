    .include "macros/btlcmd.inc"

    .data

_000:
    // {0} won’t obey!
    PrintMessage msg_0197_00829, TAG_NICKNAME, BATTLER_CATEGORY_ATTACKER
    Wait 
    WaitButtonABTime 30
    // It hurt itself in its confusion!
    PrintMessage msg_0197_00797, TAG_NONE
    Wait 
    WaitButtonABTime 30
    UnlockMoveChoice BATTLER_CATEGORY_ATTACKER
    GoToSubscript BATTLE_SUBSCRIPT_UPDATE_HP
