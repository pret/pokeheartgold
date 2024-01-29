    .include "macros/btlcmd.inc"

    .data

_000:
    PrintAttackMessage 
    Wait 
    Call BATTLE_SUBSCRIPT_RECOVER_HP
    // {0}’s stockpiled effect wore off!
    PrintMessage msg_00000197_00994, TAG_NICKNAME, BTLSCR_ATTACKER
    Wait 
    WaitButtonABTime 30
    End 
