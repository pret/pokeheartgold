    .include "macros/btlcmd.inc"

    .data

_000:
    CalcExpGain _005
    StartGetExpTask 
    WaitGetExpTask 
    Dummy2A U32_MAX

_005:
    End 
