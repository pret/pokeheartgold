    .include "macros/btlcmd.inc"

    .data

_000:
    TryPerishSong _045
    Call BATTLE_SUBSCRIPT_ATTACK_MESSAGE_AND_ANIMATION
    // All Pokémon hearing the song will faint in three turns!
    PrintMessage msg_00000197_00822, TAG_NONE
    Wait 
    WaitButtonABTime 30
    UpdateVar OPCODE_SET, BTLVAR_MSG_MOVE_TEMP, MOVE_PERISH_SONG
    UpdateVar OPCODE_SET, BTLVAR_MSG_ABILITY_TEMP, ABILITY_SOUNDPROOF
    UpdateVar OPCODE_SET, BTLVAR_BATTLER_SPEED_TEMP, 0

_021:
    GetMonBySpeedOrder BTLVAR_MSG_BATTLER_TEMP
    CheckIgnorableAbility CHECK_NOT_HAVE, BTLSCR_MSG_TEMP, ABILITY_SOUNDPROOF, _037
    // {0}’s {1} blocks {2}!
    PrintMessage msg_00000197_00689, TAG_NICKNAME_ABILITY_MOVE, BTLSCR_MSG_TEMP, BTLSCR_MSG_TEMP, BTLSCR_MSG_TEMP
    Wait 
    WaitButtonABTime 30

_037:
    UpdateVar OPCODE_ADD, BTLVAR_BATTLER_SPEED_TEMP, 1
    GoToIfValidMon BTLVAR_BATTLER_SPEED_TEMP, _021
    End 

_045:
    UpdateVar OPCODE_FLAG_ON, BTLVAR_MOVE_STATUS_FLAGS, MOVE_STATUS_FAILED
    End 
