    .include "macros/btlcmd.inc"

    .data

_000:
    ShowParty 
    WaitMonSelection 

_001:
    SwitchAndUpdateMon BTLSCR_SWITCHED_MON
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
    CompareVarToValue OPCODE_FLAG_NOT, BTLVAR_BATTLE_CTX_STATUS, SYSCTL_MON_FAINTED, _030
    Call BATTLE_SUBSCRIPT_FAINT_MON

_030:
    GoToIfAnySwitches _001
    End 
