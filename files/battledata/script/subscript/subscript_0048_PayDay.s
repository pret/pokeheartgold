    .include "macros/btlcmd.inc"

    .data

_000:
    UpdateMonDataFromVar OPCODE_GET, BATTLER_CATEGORY_ATTACKER, BMON_DATA_LEVEL, BSCRIPT_VAR_CALC_TEMP
    UpdateVar OPCODE_MUL, BSCRIPT_VAR_CALC_TEMP, 0x00000005
    IfSameSide BATTLER_CATEGORY_ATTACKER, BATTLER_CATEGORY_ENEMY, _016
    UpdateVarFromVar OPCODE_ADD, BSCRIPT_VAR_PAY_DAY_COUNT, BSCRIPT_VAR_CALC_TEMP

_016:
    // Coins were scattered everywhere!
    PrintMessage msg_0197_00818, TAG_NONE
    Wait 
    WaitButtonABTime 30
    End 
