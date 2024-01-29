    .include "macros/btlcmd.inc"

    .data

_000:
    CheckAbility CHECK_NOT_HAVE, BTLSCR_ATTACKER, ABILITY_RECKLESS, _008
    UpdateVar OPCODE_SET, BTLVAR_POWER_MULTI, 12

_008:
    UpdateVar OPCODE_FLAG_ON, BTLVAR_BATTLE_CTX_STATUS, SYSCTL_CRASH_DAMAGE
    CalcCrit 
    CalcDamage 
    End 
