    .include "macros/btlcmd.inc"

    .data

_000:
    IncrementGameStat BATTLER_CATEGORY_FAINTED_MON, BATTLER_TYPE_SOLO_ENEMY, GAME_STAT_UNK42
    IncrementGameStat BATTLER_CATEGORY_FAINTED_MON, BATTLER_TYPE_SOLO_PLAYER, GAME_STAT_UNK97
    PlayFaintAnimation 
    Wait 
    HealthbarSlideOut BATTLER_CATEGORY_FAINTED_MON
    // {0} fainted!
    PrintMessage msg_0197_00030, TAG_NICKNAME, BATTLER_CATEGORY_FAINTED_MON
    Wait 
    WaitButtonABTime 30
    CompareVarToValue OPCODE_FLAG_SET, BSCRIPT_VAR_BATTLE_STATUS_2, BATTLE_STATUS2_NO_EXP_GAINED, _END

_END:
    End 
