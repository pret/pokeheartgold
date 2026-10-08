#include "macros/btlcmd.inc"

    .data

_000:
    CheckEffectActivation _003
    Call BATTLE_SUBSCRIPT_FREEZE

_003:
    CheckEffectActivation _007
    Call BATTLE_SUBSCRIPT_FLINCH_MON

_007:
    End 
