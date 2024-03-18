    .include "macros/btlcmd.inc"

    .data

_000:
    CompareVarToValue OPCODE_FLAG_SET, BSCRIPT_VAR_BATTLE_TYPE, BATTLE_TYPE_TRAINER, _118
    CompareVarToValue OPCODE_FLAG_SET, BSCRIPT_VAR_BATTLE_TYPE, BATTLE_TYPE_SAFARI, _215
    CompareVarToValue OPCODE_FLAG_SET, BSCRIPT_VAR_BATTLE_TYPE, BATTLE_TYPE_PAL_PARK, _237
    SetPokemonEncounter BATTLER_CATEGORY_ENEMY
    SetTrainerEncounter BATTLER_CATEGORY_PLAYER
    PlayEncounterAnimation 
    WaitTime 122
    HealthbarSlideInDelay BATTLER_CATEGORY_ENEMY
    Wait 
    CompareVarToValue OPCODE_FLAG_SET, BSCRIPT_VAR_BATTLE_SYS_STATUS, BATTLE_SPECIAL_DISTORTION_WORLD, _073
    CompareVarToValue OPCODE_FLAG_SET, BSCRIPT_VAR_BATTLE_SYS_STATUS, BATTLE_SPECIAL_LEGENDARY, _067
    CompareVarToValue OPCODE_FLAG_SET, BSCRIPT_VAR_BATTLE_SYS_STATUS, BATTLE_SPECIAL_FIRST_RIVAL, _055
    CompareVarToValue OPCODE_FLAG_SET, BSCRIPT_VAR_BATTLE_SYS_STATUS, BATTLE_SPECIAL_HONEY_TREE, _061
    CompareVarToValue OPCODE_FLAG_SET, BSCRIPT_VAR_BATTLE_TYPE, BATTLE_TYPE_DOUBLES, _079
    // A wild {0} appeared!
    PrintGlobalMessage msg_0197_00965, TAG_NICKNAME, BATTLER_CATEGORY_ENEMY
    GoTo _084

_055:
    // Whoa! A wild {0} came charging!
    PrintGlobalMessage msg_0197_01167, TAG_NICKNAME, BATTLER_CATEGORY_ENEMY
    GoTo _084

_061:
    // A wild {0} appeared from the tree you slathered with Honey!
    PrintGlobalMessage msg_0197_00968, TAG_NICKNAME, BATTLER_CATEGORY_ENEMY
    GoTo _084

_067:
    // A wild {0} appeared!
    PrintGlobalMessage msg_0197_01246, TAG_NICKNAME, BATTLER_CATEGORY_ENEMY
    GoTo _084

_073:
    // The Distortion World’s {0} appeared!
    PrintGlobalMessage msg_0197_01268, TAG_NICKNAME, BATTLER_CATEGORY_ENEMY
    GoTo _084

_079:
    // A wild {0} and {1} appeared!
    PrintGlobalMessage msg_0197_00967, TAG_NICKNAME_NICKNAME, BATTLER_CATEGORY_ENEMY_SLOT_1, BATTLER_CATEGORY_ENEMY_SLOT_2

_084:
    Wait 
    WaitButtonABTime 30
    CompareVarToValue OPCODE_FLAG_SET, BSCRIPT_VAR_BATTLE_TYPE, BATTLE_TYPE_MULTI, _098
    // Go! {0}!
    PrintMessage msg_0197_00979, TAG_NICKNAME, BATTLER_CATEGORY_PLAYER
    GoTo _100

_098:
    PrintFirstSendOutMessage BATTLER_CATEGORY_PLAYER

_100:
    SpriteToOAM BATTLER_CATEGORY_ENEMY
    Wait 
    ThrowPokeball BATTLER_CATEGORY_PLAYER, GAME_THROW_POKE_BALL
    PokemonSlideIn BATTLER_CATEGORY_PLAYER
    WaitTime 96
    HealthbarSlideInDelay BATTLER_CATEGORY_PLAYER
    Wait 
    OAMToSprite BATTLER_CATEGORY_ENEMY
    Wait 
    GoTo _258

_118:
    CompareVarToValue OPCODE_FLAG_SET, BSCRIPT_VAR_BATTLE_SYS_STATUS, BATTLE_SPECIAL_RECORDED, _169
    PlayEncounterAnimation 
    SetTrainerEncounter BATTLER_CATEGORY_ALL
    WaitTime 96
    LoadPartyGaugeGraphics 
    ShowBattleStartPartyGauge BATTLER_CATEGORY_ENEMY
    ShowBattleStartPartyGauge BATTLER_CATEGORY_PLAYER
    PrintEncounterMessage BATTLER_CATEGORY_ENEMY
    Wait 
    WaitButtonABTime 30
    PrintFirstSendOutMessage BATTLER_CATEGORY_ENEMY
    HideBattleStartPartyGauge BATTLER_CATEGORY_ENEMY
    ThrowPokeball BATTLER_CATEGORY_ENEMY, GAME_THROW_POKE_BALL
    PokemonSlideIn BATTLER_CATEGORY_ENEMY
    WaitTime 112
    HealthbarSlideInDelay BATTLER_CATEGORY_ENEMY
    Wait 
    PrintFirstSendOutMessage BATTLER_CATEGORY_PLAYER
    HideBattleStartPartyGauge BATTLER_CATEGORY_PLAYER
    ThrowPokeball BATTLER_CATEGORY_PLAYER, GAME_THROW_POKE_BALL
    PokemonSlideIn BATTLER_CATEGORY_PLAYER
    WaitTime 96
    HealthbarSlideInDelay BATTLER_CATEGORY_PLAYER
    Wait 
    FreePartyGaugeGraphics 
    GoTo _258

_169:
    PlayEncounterAnimation 
    SetTrainerEncounter BATTLER_CATEGORY_ALL
    WaitTime 96
    LoadPartyGaugeGraphics 
    ShowBattleStartPartyGauge BATTLER_CATEGORY_ENEMY
    ShowBattleStartPartyGauge BATTLER_CATEGORY_PLAYER
    PrintEncounterMessage BATTLER_CATEGORY_ENEMY
    Wait 
    WaitButtonABTime 30
    PrintFirstSendOutMessage BATTLER_CATEGORY_PLAYER
    HideBattleStartPartyGauge BATTLER_CATEGORY_PLAYER
    ThrowPokeball BATTLER_CATEGORY_PLAYER, GAME_THROW_POKE_BALL
    PokemonSlideIn BATTLER_CATEGORY_PLAYER
    WaitTime 96
    HealthbarSlideInDelay BATTLER_CATEGORY_PLAYER
    Wait 
    PrintFirstSendOutMessage BATTLER_CATEGORY_ENEMY
    HideBattleStartPartyGauge BATTLER_CATEGORY_ENEMY
    ThrowPokeball BATTLER_CATEGORY_ENEMY, GAME_THROW_POKE_BALL
    PokemonSlideIn BATTLER_CATEGORY_ENEMY
    WaitTime 112
    HealthbarSlideInDelay BATTLER_CATEGORY_ENEMY
    Wait 
    FreePartyGaugeGraphics 
    GoTo _258

_215:
    SetPokemonEncounter BATTLER_CATEGORY_ENEMY
    SetTrainerEncounter BATTLER_CATEGORY_PLAYER
    PlayEncounterAnimation 
    WaitTime 122
    HealthbarSlideInDelay BATTLER_CATEGORY_ENEMY
    Wait 
    // A wild {0} appeared!
    PrintGlobalMessage msg_0197_00965, TAG_NICKNAME, BATTLER_CATEGORY_ENEMY
    Wait 
    HealthbarSlideIn BATTLER_CATEGORY_PLAYER
    WaitButtonABTime 7
    Wait 
    GoTo _258

_237:
    SetPokemonEncounter BATTLER_CATEGORY_ENEMY
    SetTrainerEncounter BATTLER_CATEGORY_PLAYER
    PlayEncounterAnimation 
    WaitTime 122
    HealthbarSlideInDelay BATTLER_CATEGORY_ENEMY
    Wait 
    // Wow! {0}’s {1} is drawing close!
    PrintGlobalMessage msg_0197_01219, TAG_TRNAME_NICKNAME, BATTLER_CATEGORY_ENEMY, BATTLER_CATEGORY_ENEMY
    Wait 
    HealthbarSlideIn BATTLER_CATEGORY_PLAYER
    WaitButtonABTime 7
    Wait 

_258:
    SetBattleBackground 
    End 
