    .include "macros/btlcmd.inc"

    .data

_000:
    ShowParty 
    WaitMonSelection 

_001:
    SwitchAndUpdateMon BATTLER_CATEGORY_SWITCHED_MON
    LoadPartyGaugeGraphics 
    ShowPartyGauge BATTLER_CATEGORY_SWITCHED_MON
    Wait 
    PrintSendOutMessage BATTLER_CATEGORY_SWITCHED_MON
    Wait 
    HidePartyGauge BATTLER_CATEGORY_SWITCHED_MON
    Wait 
    FreePartyGaugeGraphics 
    PokemonSendOut BATTLER_CATEGORY_SWITCHED_MON
    WaitTime 72
    HealthbarSlideIn BATTLER_CATEGORY_SWITCHED_MON
    Wait 
    Call BATTLE_SUBSCRIPT_HAZARDS_CHECK
    CompareVarToValue OPCODE_FLAG_NOT, BSCRIPT_VAR_BATTLE_STATUS, BATTLE_STATUS_FAINTED, _030
    Call BATTLE_SUBSCRIPT_FAINT_MON

_030:
    GoToIfAnySwitches _001
    End 
