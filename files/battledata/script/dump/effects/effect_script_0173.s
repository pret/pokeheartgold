    .include "macros/btlcmd.inc"

    .data

_000:
    PrintAttackMessage 
    Wait 
    PlayMoveAnimation BTLSCR_ATTACKER
    Wait 
    GetTerrainMove 
    // {0} turned into {1}!
    PrintMessage msg_00000197_00490, TAG_MOVE_MOVE, BTLSCR_ATTACKER, BTLSCR_MSG_TEMP
    Wait 
    WaitButtonABTime 30
    GoToMoveScript FALSE
