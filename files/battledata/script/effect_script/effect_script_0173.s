    .include "macros/btlcmd.inc"

    .data

_000:
    PrintAttackMessage 
    Wait 
    PlayMoveAnimation BATTLER_CATEGORY_ATTACKER
    Wait 
    GetTerrainMove 
    // {0} turned into {1}!
    PrintMessage msg_0197_00490, TAG_MOVE_MOVE, BATTLER_CATEGORY_ATTACKER, BATTLER_CATEGORY_MSG_TEMP
    Wait 
    WaitButtonABTime 30
    GoToMoveScript FALSE
