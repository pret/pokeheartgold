    .include "macros/btlcmd.inc"

    .data

_000:
    WaitButtonABTime 15
    PlaySound BATTLER_CATEGORY_ATTACKER, SEQ_SE_DP_KAIFUKU
    // {0} {1} used one {2}!
    PrintMessage msg_0197_00858, TAG_TRCLASS_TRNAME_ITEM, BATTLER_CATEGORY_ATTACKER, BATTLER_CATEGORY_ATTACKER, BATTLER_CATEGORY_MSG_TEMP
    Wait 
    WaitButtonABTime 30
    UseBagItem BATTLER_CATEGORY_ATTACKER
    // The {1} raised {0}’s {2}!
    PrintMessage msg_0197_00756, TAG_NICKNAME_ITEM_STAT, BATTLER_CATEGORY_ATTACKER, BATTLER_CATEGORY_MSG_TEMP, BATTLER_CATEGORY_MSG_TEMP
    Wait 
    WaitButtonABTime 30
    End 
