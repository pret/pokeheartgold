    .include "macros/btlcmd.inc"

    .data

_000:
    // {0} can’t get it going because of its {1}!
    PrintMessage msg_00000197_01112, TAG_NICKNAME_ABILITY, BTLSCR_MSG_TEMP, BTLSCR_MSG_BATTLER_TEMP
    Wait 
    WaitButtonABTime 30
    End 
