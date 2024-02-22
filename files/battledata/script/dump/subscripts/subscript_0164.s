    .include "macros/btlcmd.inc"

    .data

_000:
    UpdateVar OPCODE_SET, BSCRIPT_VAR_CALC_TEMP, 0x00005000
    UpdateVarFromVar OPCODE_FLAG_ON, BSCRIPT_VAR_SIDE_CONDITION_ATTACKER, BSCRIPT_VAR_CALC_TEMP
    // The Lucky Chant shielded your team from critical hits!
    PrintMessage msg_0197_01241, TAG_NONE_SIDE, BATTLER_CATEGORY_ATTACKER
    Wait 
    WaitButtonABTime 30
    End 
