    .include "macros/btlcmd.inc"

    .data

_000:
    TryRestoreStatusOnSwitch BTLSCR_PLAYER_SLOT_1, _007
    UpdateMonData OPCODE_SET, BTLSCR_PLAYER_SLOT_1, BATTLEMON_STATUS, MON_CONDITION_NONE

_007:
    TryRestoreStatusOnSwitch BTLSCR_PLAYER_SLOT_2, _015
    UpdateMonData OPCODE_SET, BTLSCR_PLAYER_SLOT_2, BATTLEMON_STATUS, MON_CONDITION_NONE

_015:
    PlaySound BTLSCR_ATTACKER, 1791
    CompareVarToValue OPCODE_FLAG_SET, BTLVAR_BATTLE_TYPE, BATTLE_TYPE_FRONTIER, _065
    CompareVarToValue OPCODE_FLAG_SET, BTLVAR_BATTLE_TYPE, BATTLE_TYPE_LINK, _076
    CheckAbility CHECK_HAVE, BTLSCR_ATTACKER, ABILITY_RUN_AWAY, _043
    CheckItemHoldEffect CHECK_HAVE, BTLSCR_ATTACKER, HOLD_EFFECT_FLEE, _050
    // Got away safely!
    PrintMessage msg_00000197_00781, TAG_NONE
    GoTo _055

_043:
    // {0} fled using {1}!
    PrintMessage msg_00000197_00783, TAG_NICKNAME_ABILITY, BTLSCR_ATTACKER, BTLSCR_ATTACKER
    GoTo _055

_050:
    // {0} fled using its {1}!
    PrintMessage msg_00000197_00782, TAG_NICKNAME_ITEM, BTLSCR_ATTACKER, BTLSCR_ATTACKER

_055:
    Wait 
    WaitButtonABTime 30
    FadeOutBattle 
    Wait 
    UpdateVar OPCODE_FLAG_ON, BTLVAR_RESULT_MASK, BATTLE_RESULT_PLAYER_FLED
    End 

_065:
    PrintForfeitMessage 
    Wait 
    WaitButtonABTime 30
    FadeOutBattle 
    Wait 
    UpdateVar OPCODE_FLAG_OFF, BTLVAR_RESULT_MASK, BATTLE_RESULT_TRY_FLEE_WAIT
    End 

_076:
    PrintEscapeMessage 
    Wait 
    WaitButtonABTime 30
    FadeOutBattle 
    Wait 
    UpdateVar OPCODE_FLAG_OFF, BTLVAR_RESULT_MASK, BATTLE_RESULT_TRY_FLEE_WAIT
    End 
