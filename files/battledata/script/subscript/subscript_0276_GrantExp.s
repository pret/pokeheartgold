    .include "macros/btlcmd.inc"

    .data

_000:
    CalcExpGain _005
    StartGetExpTask 
    WaitGetExpTask 
    WaitGetExpTaskLoop U32_MAX

_005:
    End 
