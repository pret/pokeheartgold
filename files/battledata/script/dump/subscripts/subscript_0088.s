    .include "macros/btlcmd.inc"

    .data

_000:
    TryPartyStatusRefresh 
    CompareVarToValue OPCODE_EQU, BTLVAR_CURRENT_MOVE, MOVE_AROMATHERAPY, _010
    // A bell chimed!
    PrintMessage msg_00000197_00821, TAG_NONE
    GoTo _013

_010:
    // A soothing aroma wafted through the area!
    PrintMessage msg_00000197_00592, TAG_NONE

_013:
    Wait 
    WaitButtonABTime 30
    CompareVarToValue OPCODE_EQU, BTLVAR_CURRENT_MOVE, MOVE_AROMATHERAPY, _049
    CompareVarToValue OPCODE_FLAG_NOT, BTLVAR_CALC_TEMP, 0x00000001, _035
    // {0}’s {1} blocks {2}!
    PrintMessage msg_00000197_00689, TAG_NICKNAME_ABILITY_MOVE, BTLSCR_ATTACKER, BTLSCR_ATTACKER, BTLSCR_MSG_TEMP
    Wait 
    WaitButtonABTime 30

_035:
    CompareVarToValue OPCODE_FLAG_NOT, BTLVAR_CALC_TEMP, 0x00000002, _049
    // {0}’s {1} blocks {2}!
    PrintMessage msg_00000197_00689, TAG_NICKNAME_ABILITY_MOVE, BTLSCR_ATTACKER_PARTNER, BTLSCR_ATTACKER_PARTNER, BTLSCR_MSG_TEMP
    Wait 
    WaitButtonABTime 30

_049:
    CompareVarToValue OPCODE_FLAG_SET, BTLVAR_CALC_TEMP, 0x00000004, _057
    SetHealthbarStatus BTLSCR_ATTACKER, BATTLE_ANIMATION_NONE

_057:
    CompareVarToValue OPCODE_FLAG_SET, BTLVAR_CALC_TEMP, 0x00000008, _065
    SetHealthbarStatus BTLSCR_ATTACKER_PARTNER, BATTLE_ANIMATION_NONE

_065:
    End 
