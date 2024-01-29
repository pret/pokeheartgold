    .include "macros/btlcmd.inc"

    .data

_000:
    UpdateMonDataFromVar OPCODE_GET, BTLSCR_ATTACKER, BATTLEMON_LEVEL, BTLVAR_CALC_TEMP
    UpdateVar OPCODE_MUL, BTLVAR_CALC_TEMP, 0x00000005
    IfSameSide BTLSCR_ATTACKER, BTLSCR_ENEMY, _016
    UpdateVarFromVar OPCODE_ADD, BTLVAR_PAY_DAY_COUNT, BTLVAR_CALC_TEMP

_016:
    // Coins were scattered everywhere!
    PrintMessage msg_00000197_00818, TAG_NONE
    Wait 
    WaitButtonABTime 30
    End 
