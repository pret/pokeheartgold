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
    CompareVarToValue OPCODE_EQU, BTLVAR_MSG_TEMP, 0, _052
    CompareVarToValue OPCODE_EQU, BTLVAR_MSG_TEMP, 1, _064
    CompareVarToValue OPCODE_EQU, BTLVAR_MSG_TEMP, 2, _071
    CompareVarToValue OPCODE_EQU, BTLVAR_MSG_TEMP, 3, _078
    CompareVarToValue OPCODE_EQU, BTLVAR_MSG_TEMP, 4, _085
    CompareVarToValue OPCODE_EQU, BTLVAR_MSG_TEMP, 5, _092
    // {0} normalized its status using its {1}!
    PrintMessage msg_00000197_00896, TAG_NICKNAME_ITEM, BTLSCR_ATTACKER, BTLSCR_MSG_TEMP
    GoTo _099

_052:
    UpdateMonData OPCODE_FLAG_OFF, BTLSCR_ATTACKER, BATTLEMON_VOLATILE_STATUS, VOLATILE_CONDITION_CONFUSION
    // {0}’s {1} snapped it out of confusion!
    PrintMessage msg_00000197_00890, TAG_NICKNAME_ITEM, BTLSCR_ATTACKER, BTLSCR_MSG_TEMP
    GoTo _104

_064:
    // {0}’s {1} cured its paralysis!
    PrintMessage msg_00000197_00875, TAG_NICKNAME_ITEM, BTLSCR_ATTACKER, BTLSCR_MSG_TEMP
    GoTo _099

_071:
    // {0}’s {1} defrosted it!
    PrintMessage msg_00000197_00884, TAG_NICKNAME_ITEM, BTLSCR_ATTACKER, BTLSCR_MSG_TEMP
    GoTo _099

_078:
    // {0}’s {1} healed its burn!
    PrintMessage msg_00000197_00881, TAG_NICKNAME_ITEM, BTLSCR_ATTACKER, BTLSCR_MSG_TEMP
    GoTo _099

_085:
    // {0}’s {1} cured its poison!
    PrintMessage msg_00000197_00878, TAG_NICKNAME_ITEM, BTLSCR_ATTACKER, BTLSCR_MSG_TEMP
    GoTo _099

_092:
    // {0}’s {1} woke it up!
    PrintMessage msg_00000197_00887, TAG_NICKNAME_ITEM, BTLSCR_ATTACKER, BTLSCR_MSG_TEMP
    GoTo _099

_099:
    UpdateMonData OPCODE_SET, BTLSCR_ATTACKER, BATTLEMON_STATUS, MON_CONDITION_NONE

_104:
    Wait 
    SetHealthbarStatus BTLSCR_ATTACKER, BATTLE_ANIMATION_NONE
    WaitButtonABTime 30
    End 
