    .include "macros/btlcmd.inc"

    .data

_000:
    PlayMoveAnimation BTLSCR_ATTACKER
    Wait 
    CompareMonDataToValue OPCODE_FLAG_NOT, BTLSCR_ATTACKER, BATTLEMON_MOVE_EFFECTS_MASK, MOVE_EFFECT_SEMI_INVULNERABLE, _011
    ToggleVanish BTLSCR_ATTACKER, TRUE

_011:
    PrintBufferedMessage 
    Wait 
    WaitButtonABTime 30
    PlayBattleAnimation BTLSCR_ATTACKER, BATTLE_ANIMATION_HELD_ITEM
    Wait 
    // {0} became fully charged due to its {1}!
    PrintMessage msg_00000197_01251, TAG_NICKNAME_ITEM, BTLSCR_ATTACKER, BTLSCR_ATTACKER
    Wait 
    WaitButtonABTime 30
    RemoveItem BTLSCR_ATTACKER
    UpdateVar OPCODE_FLAG_OFF, BTLVAR_BATTLE_CTX_STATUS, SYSCTL_PLAYED_MOVE_ANIMATION
    End 
