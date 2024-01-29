    .include "macros/btlcmd.inc"

    .data

_000:
    WaitButtonABTime 15
    UpdateMonDataFromVar OPCODE_GET, BTLSCR_MSG_DEFENDER, BATTLEMON_ABILITY, BTLVAR_CALC_TEMP
    UpdateMonDataFromVar OPCODE_SET, BTLSCR_MSG_TEMP, BATTLEMON_ABILITY, BTLVAR_CALC_TEMP
    // {0} traced {1}’s {2}!
    PrintMessage msg_00000197_00679, TAG_NICKNAME_NICKNAME_ABILITY, BTLSCR_MSG_TEMP, BTLSCR_MSG_DEFENDER, BTLSCR_MSG_DEFENDER
    Wait 
    WaitButtonABTime 30
    End 
