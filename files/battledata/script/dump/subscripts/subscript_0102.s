    .include "macros/btlcmd.inc"

    .data

_000:
    // {0}’s perish count fell to {1}!
    PrintMessage msg_00000197_00439, TAG_NICKNAME_NUM, BTLSCR_MSG_TEMP, BTLSCR_MSG_TEMP
    Wait 
    WaitButtonABTime 30
    CompareMonDataToValue OPCODE_FLAG_SET, BTLSCR_MSG_TEMP, BATTLEMON_MOVE_EFFECTS_MASK, MOVE_EFFECT_PERISH_SONG, _015
    Call BATTLE_SUBSCRIPT_UPDATE_HP

_015:
    End 
