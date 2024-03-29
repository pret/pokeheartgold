    .include "macros/btlcmd.inc"

    .data

_000:
    TryRestoreStatusOnSwitch BATTLER_CATEGORY_SWITCHED_MON, _007
    UpdateMonData OPCODE_SET, BATTLER_CATEGORY_SWITCHED_MON, BMON_DATA_STATUS, STATUS_NONE

_007:
    PrintRecallMessage BATTLER_CATEGORY_SWITCHED_MON
    Wait 
    Call BATTLE_SUBSCRIPT_PURSUIT
    CompareMonDataToValue OPCODE_NEQ, BATTLER_CATEGORY_SWITCHED_MON, BMON_DATA_HP, 0, _RECALL_MON
    GoTo _SWITCH_IN_MON

_RECALL_MON:
    RecallPokemon BATTLER_CATEGORY_SWITCHED_MON
    Wait 
    HealthbarSlideOut BATTLER_CATEGORY_SWITCHED_MON
    Wait 

_SWITCH_IN_MON:
    SwitchAndUpdateMon BATTLER_CATEGORY_SWITCHED_MON
    LoadPartyGaugeGraphics 
    ShowPartyGauge BATTLER_CATEGORY_SWITCHED_MON
    Wait 
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_TEMP_DATA, 1, _PRINT_SELF_SEND_OUT_MSG
    PrintSendOutMessage BATTLER_CATEGORY_SWITCHED_MON
    GoTo _AFTER_MSG

_PRINT_SELF_SEND_OUT_MSG:
    // Go! {0}!
    PrintMessage msg_0197_00979, TAG_NICKNAME, BATTLER_CATEGORY_SWITCHED_MON

_AFTER_MSG:
    Wait 
    HidePartyGauge BATTLER_CATEGORY_SWITCHED_MON
    Wait 
    FreePartyGaugeGraphics 
    PokemonSendOut BATTLER_CATEGORY_SWITCHED_MON
    WaitTime 72
    HealthbarSlideIn BATTLER_CATEGORY_SWITCHED_MON
    Wait 
    Call BATTLE_SUBSCRIPT_HAZARDS_CHECK
    CompareVarToValue OPCODE_GT, BSCRIPT_VAR_BATTLER_FAINTED, BATTLER_ENEMY2, _END
    UpdateVarFromVar OPCODE_FLAG_INDEX, BSCRIPT_VAR_TEMP_DATA, BSCRIPT_VAR_BATTLER_FAINTED
    UpdateVar OPCODE_LEFT_SHIFT, BSCRIPT_VAR_TEMP_DATA, BATTLE_STATUS_FAINTED_SHIFT
    CompareVarToVar OPCODE_FLAG_NOT, BSCRIPT_VAR_BATTLE_STATUS, BSCRIPT_VAR_TEMP_DATA, _END
    Call BATTLE_SUBSCRIPT_FAINT_MON

_END:
    End 
