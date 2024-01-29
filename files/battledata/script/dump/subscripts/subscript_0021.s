    .include "macros/btlcmd.inc"

    .data

_000:
    WaitButtonABTime 15
    CompareVarToValue OPCODE_FLAG_NOT, BTLVAR_MOVE_STATUS_FLAGS, MOVE_STATUS_SPLASH, _011
    // But nothing happened!
    PrintMessage msg_00000197_00795, TAG_NONE
    GoTo _095

_011:
    CompareVarToValue OPCODE_FLAG_NOT, BTLVAR_MOVE_STATUS_FLAGS, MOVE_STATUS_ENDURED_ITEM, _037
    PlayBattleAnimation BTLSCR_DEFENDER, BATTLE_ANIMATION_HELD_ITEM
    Wait 
    // {0} hung on using its {1}!
    PrintMessage msg_00000197_00912, TAG_NICKNAME_ITEM, BTLSCR_DEFENDER, BTLSCR_DEFENDER
    CheckItemHoldEffect CHECK_NOT_HAVE, BTLSCR_DEFENDER, HOLD_EFFECT_ENDURE, _032
    RemoveItem BTLSCR_DEFENDER

_032:
    Wait 
    WaitButtonABTime 30
    GoTo _067

_037:
    CompareVarToValue OPCODE_FLAG_NOT, BTLVAR_MOVE_STATUS_FLAGS, MOVE_STATUS_ENDURED, _057
    CompareMonDataToValue OPCODE_NEQ, BTLSCR_DEFENDER, BATTLEMON_CUR_HP, 1, _057
    // {0} endured the hit!
    PrintMessage msg_00000197_00445, TAG_NICKNAME, BTLSCR_DEFENDER
    Wait 
    WaitButtonABTime 30
    GoTo _067

_057:
    CompareVarToValue OPCODE_FLAG_NOT, BTLVAR_MOVE_STATUS_FLAGS, MOVE_STATUS_ONE_HIT_KO, _067
    // It’s a one-hit KO!
    PrintMessage msg_00000197_00775, TAG_NONE
    GoTo _095

_067:
    CompareVarToValue OPCODE_FLAG_SET, BTLVAR_BATTLE_CTX_STATUS, SYSCTL_IGNORE_TYPE_CHECKS, _098
    CompareVarToValue OPCODE_AND, BTLVAR_MOVE_STATUS_FLAGS, MOVE_STATUS_SUPER_EFFECTIVE|MOVE_STATUS_NOT_VERY_EFFECTIVE, _098
    CompareVarToValue OPCODE_FLAG_NOT, BTLVAR_MOVE_STATUS_FLAGS, MOVE_STATUS_SUPER_EFFECTIVE, _087
    // It’s super effective!
    PrintMessage msg_00000197_00780, TAG_NONE
    GoTo _095

_087:
    CompareVarToValue OPCODE_FLAG_NOT, BTLVAR_MOVE_STATUS_FLAGS, MOVE_STATUS_NOT_VERY_EFFECTIVE, _098
    // It’s not very effective...
    PrintMessage msg_00000197_00779, TAG_NONE

_095:
    Wait 
    WaitButtonABTime 30

_098:
    End 
