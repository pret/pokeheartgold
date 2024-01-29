    .include "macros/btlcmd.inc"

    .data

_000:
    IncrementGameStat BTLSCR_FAINTED_MON, BATTLER_TYPE_SOLO_ENEMY, 42
    IncrementGameStat BTLSCR_FAINTED_MON, BATTLER_TYPE_SOLO_PLAYER, 97
    PlayFaintAnimation 
    Wait 
    HealthbarSlideOut BTLSCR_FAINTED_MON
    // {0} fainted!
    PrintMessage msg_00000197_00030, TAG_NICKNAME, BTLSCR_FAINTED_MON
    Wait 
    WaitButtonABTime 30
    CompareVarToValue OPCODE_FLAG_SET, BTLVAR_BATTLE_CTX_STATUS_2, SYSCTL_NO_EXPERIENCE_GIVEN, _023

_023:
    End 
