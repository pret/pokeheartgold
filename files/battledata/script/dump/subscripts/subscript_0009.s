    .include "macros/btlcmd.inc"

    .data

_000:
    TryRestoreStatusOnSwitch BTLSCR_SWITCHED_MON, _007
    UpdateMonData OPCODE_SET, BTLSCR_SWITCHED_MON, BATTLEMON_STATUS, MON_CONDITION_NONE

_007:
    PrintRecallMessage BTLSCR_SWITCHED_MON
    Wait 
    Call BATTLE_SUBSCRIPT_PURSUIT
    CompareMonDataToValue OPCODE_NEQ, BTLSCR_SWITCHED_MON, BATTLEMON_CUR_HP, 0, _020
    GoTo _026

_020:
    RecallPokemon BTLSCR_SWITCHED_MON
    Wait 
    HealthbarSlideOut BTLSCR_SWITCHED_MON
    Wait 

_026:
    SwitchAndUpdateMon BTLSCR_SWITCHED_MON
    LoadPartyGaugeGraphics 
    ShowPartyGauge BTLSCR_SWITCHED_MON
    Wait 
    CompareVarToValue OPCODE_EQU, BTLVAR_SCRIPT_TEMP, 1, _041
    PrintSendOutMessage BTLSCR_SWITCHED_MON
    GoTo _045

_041:
    // Go! {0}!
    PrintMessage msg_00000197_00979, TAG_NICKNAME, BTLSCR_SWITCHED_MON

_045:
    Wait 
    HidePartyGauge BTLSCR_SWITCHED_MON
    Wait 
    FreePartyGaugeGraphics 
    PokemonSendOut BTLSCR_SWITCHED_MON
    WaitTime 72
    HealthbarSlideIn BTLSCR_SWITCHED_MON
    Wait 
    Call BATTLE_SUBSCRIPT_HAZARDS_CHECK
    CompareVarToValue OPCODE_GT, BTLVAR_FAINTED_MON, BATTLER_ENEMY2, _079
    UpdateVarFromVar OPCODE_FLAG_INDEX, BTLVAR_SCRIPT_TEMP, BTLVAR_FAINTED_MON
    UpdateVar OPCODE_LEFT_SHIFT, BTLVAR_SCRIPT_TEMP, 24
    CompareVarToVar OPCODE_FLAG_NOT, BTLVAR_BATTLE_CTX_STATUS, BTLVAR_SCRIPT_TEMP, _079
    Call BATTLE_SUBSCRIPT_FAINT_MON

_079:
    End 
