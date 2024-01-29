    .include "macros/btlcmd.inc"

    .data

_000:
    WaitButtonABTime 15
    PlaySound BTLSCR_ATTACKER, 1516
    // {0} {1} used one {2}!
    PrintMessage msg_00000197_00858, TAG_TRCLASS_TRNAME_ITEM, BTLSCR_ATTACKER, BTLSCR_ATTACKER, BTLSCR_MSG_TEMP
    Wait 
    WaitButtonABTime 30
    UseBagItem BTLSCR_ATTACKER
    // Your team became shrouded in mist!
    PrintMessage msg_00000197_00271, TAG_NONE_SIDE_CONSCIOUS, BTLSCR_ATTACKER
    Wait 
    WaitButtonABTime 30
    End 
