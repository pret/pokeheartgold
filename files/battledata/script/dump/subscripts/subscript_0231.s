    .include "macros/btlcmd.inc"

    .data

_000:
    CompareVarToValue OPCODE_EQU, BTLVAR_SCRIPT_TEMP, 1, _038
    CompareVarToValue OPCODE_FLAG_SET, BTLVAR_BATTLE_TYPE, BATTLE_TYPE_TRAINER, _022
    UpdateVar OPCODE_SET, BTLVAR_ATTACKER, BATTLER_PLAYER
    // Use next Pokémon?{YESNO 0}
    PrintMessage msg_00000197_00011, TAG_NONE
    Wait 
    YesNoMenu YES_NO_NEXT_MON
    WaitYesNoResult _022, _028

_022:
    ShowParty 
    WaitMonSelection 
    SwitchAndUpdateMon BTLSCR_SWITCHED_MON
    GoTo _068

_028:
    TryEscape BTLSCR_PLAYER, _035
    Call BATTLE_SUBSCRIPT_ESCAPE_FAILED
    GoTo _022

_035:
    Call BATTLE_SUBSCRIPT_ESCAPE
    End 

_038:
    ShowParty 
    WaitMonSelection 

_040:
    SwitchAndUpdateMon BTLSCR_SWITCHED_MON
    // {0} {1} is about to send in {2}. Will you switch your Pokémon?{YESNO 0}
    PrintMessage msg_00000197_00835, TAG_TRCLASS_TRNAME_NICKNAME_TRNAME, BTLSCR_SWITCHED_MON, BTLSCR_SWITCHED_MON, BTLSCR_SWITCHED_MON, BTLSCR_PLAYER
    Wait 
    YesNoMenu YES_NO_CHANGE_MON
    WaitYesNoResult _055, _068

_055:
    UpdateVarFromVar OPCODE_SET, BTLVAR_SWITCHED_MON_TEMP, BTLVAR_SWITCHED_MON
    ChoosePokemonMenu 
    WaitPokemonMenuResult _064
    Call BATTLE_SUBSCRIPT_SWITCH_POKEMON

_064:
    UpdateVarFromVar OPCODE_SET, BTLVAR_SWITCHED_MON, BTLVAR_SWITCHED_MON_TEMP

_068:
    LoadPartyGaugeGraphics 
    ShowPartyGauge BTLSCR_SWITCHED_MON
    Wait 
    PrintSendOutMessage BTLSCR_SWITCHED_MON
    Wait 
    HidePartyGauge BTLSCR_SWITCHED_MON
    Wait 
    FreePartyGaugeGraphics 
    PokemonSendOut BTLSCR_SWITCHED_MON
    WaitTime 72
    HealthbarSlideIn BTLSCR_SWITCHED_MON
    Wait 
    Call BATTLE_SUBSCRIPT_HAZARDS_CHECK
    CompareVarToValue OPCODE_FLAG_NOT, BTLVAR_BATTLE_CTX_STATUS, SYSCTL_MON_FAINTED, _095
    Call BATTLE_SUBSCRIPT_FAINT_MON

_095:
    GoToIfAnySwitches _040
    End 
