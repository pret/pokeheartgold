    .include "macros/btlcmd.inc"

    .data

_000:
    PrintAttackMessage 
    Wait 
    WaitButtonABTime 30
    CompareVarToValue OPCODE_FLAG_NOT, BSCRIPT_VAR_MOVE_STATUS_FLAGS, MOVE_STATUS_LOST_FOCUS, _CHECK_SEMI_INVULNERABLE
    PrintBufferedMessage 
    GoTo _PRINT_MSG

_CHECK_SEMI_INVULNERABLE:
    CompareVarToValue OPCODE_FLAG_NOT, BSCRIPT_VAR_MOVE_STATUS_FLAGS, MOVE_STATUS_SEMI_INVULNERABLE, _CHECK_SPECIFIC_SEMI_INVULNERABLE
    GoTo _CHECK_RANGE

_CHECK_SPECIFIC_SEMI_INVULNERABLE:
    CompareVarToValue OPCODE_FLAG_NOT, BSCRIPT_VAR_MOVE_STATUS_FLAGS, MOVE_STATUS_PROTECTED, _CHECK_LEVITATE
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_MOVE_NO_CUR, MOVE_SNORE, _CHECK_FAILED
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_MOVE_NO_CUR, MOVE_NIGHTMARE, _CHECK_FAILED
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_MOVE_NO_CUR, MOVE_FLING, _CHECK_FAILED
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_MOVE_NO_CUR, MOVE_LAST_RESORT, _CHECK_FAILED
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_MOVE_NO_CUR, MOVE_PSYCHO_SHIFT, _CHECK_FAILED
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_MOVE_NO_CUR, MOVE_FAKE_OUT, _CHECK_FAILED
    CompareVarToValue OPCODE_NEQ, BSCRIPT_VAR_MOVE_NO_CUR, MOVE_NATURAL_GIFT, _PROTECTED_MSG

_CHECK_FAILED:
    CompareVarToValue OPCODE_FLAG_SET, BSCRIPT_VAR_MOVE_STATUS_FLAGS, MOVE_STATUS_FAILED, _CHECK_FAILED2

_PROTECTED_MSG:
    // {0} protected itself!
    PrintMessage msg_0197_00015, TAG_NICKNAME, BATTLER_CATEGORY_DEFENDER
    GoTo _PRINT_MSG

_CHECK_LEVITATE:
    CompareVarToValue OPCODE_FLAG_NOT, BSCRIPT_VAR_MOVE_STATUS_FLAGS, MOVE_STATUS_LEVITATE_IMMUNE, _CHECK_MAGNET_RISE
    // {0} makes Ground moves miss by using {1}!
    PrintMessage msg_0197_00021, TAG_NICKNAME_ABILITY, BATTLER_CATEGORY_DEFENDER, BATTLER_CATEGORY_DEFENDER
    GoTo _PRINT_MSG

_CHECK_MAGNET_RISE:
    CompareVarToValue OPCODE_FLAG_NOT, BSCRIPT_VAR_MOVE_STATUS_FLAGS, MOVE_STATUS_MAGNET_RISE_IMMUNE, _CHECK_FAILED2
    UpdateVar OPCODE_SET, BSCRIPT_VAR_MSG_MOVE_TEMP, MOVE_MAGNET_RISE
    // {0} evades Ground moves with {1}!
    PrintMessage msg_0197_01036, TAG_NICKNAME_MOVE, BATTLER_CATEGORY_DEFENDER, BATTLER_CATEGORY_MSG_TEMP
    GoTo _PRINT_MSG

_CHECK_FAILED2:
    CompareVarToValue OPCODE_FLAG_NOT, BSCRIPT_VAR_MOVE_STATUS_FLAGS, MOVE_STATUS_FAILED, _CHECK_WONDER_GUARD
    // But it failed!
    PrintMessage msg_0197_00796, TAG_NONE
    GoTo _PRINT_MSG

_CHECK_WONDER_GUARD:
    CompareVarToValue OPCODE_FLAG_NOT, BSCRIPT_VAR_MOVE_STATUS_FLAGS, MOVE_STATUS_WONDER_GUARD_IMMUNE, _CHECK_INEFFECTIVE
    // {0} avoided damage by using {1}!
    PrintMessage msg_0197_00018, TAG_NICKNAME_ABILITY, BATTLER_CATEGORY_DEFENDER, BATTLER_CATEGORY_DEFENDER
    GoTo _PRINT_MSG

_CHECK_INEFFECTIVE:
    CompareVarToValue OPCODE_FLAG_NOT, BSCRIPT_VAR_MOVE_STATUS_FLAGS, MOVE_STATUS_NO_EFFECT, _CHECK_STURDY
    IncrementGameStat BATTLER_CATEGORY_ATTACKER, BATTLER_TYPE_SOLO_PLAYER, GAME_STAT_UNK96
    // It doesn’t affect {0}...
    PrintMessage msg_0197_00027, TAG_NICKNAME, BATTLER_CATEGORY_DEFENDER
    GoTo _PRINT_MSG

_CHECK_STURDY:
    CompareVarToValue OPCODE_FLAG_NOT, BSCRIPT_VAR_MOVE_STATUS_FLAGS, MOVE_STATUS_STURDY, _CHECK_OHKO_FAIL
    // {0} was protected by {1}!
    PrintMessage msg_0197_00625, TAG_NICKNAME_ABILITY, BATTLER_CATEGORY_DEFENDER, BATTLER_CATEGORY_DEFENDER
    GoTo _PRINT_MSG

_CHECK_OHKO_FAIL:
    CompareVarToValue OPCODE_FLAG_NOT, BSCRIPT_VAR_MOVE_STATUS_FLAGS, MOVE_STATUS_ONE_HIT_KO_FAILED, _CHECK_RANGE
    // {0} is unaffected!
    PrintMessage msg_0197_00342, TAG_NICKNAME, BATTLER_CATEGORY_DEFENDER
    GoTo _PRINT_MSG

_CHECK_RANGE:
    GetCurrentMoveData MOVEATTRIBUTE_RANGE
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_CALC_TEMP, 0x00000004, _MON_AVOIDED
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_CALC_TEMP, 0x00000008, _MON_AVOIDED
    // {0}’s attack missed!
    PrintMessage msg_0197_00012, TAG_NICKNAME, BATTLER_CATEGORY_ATTACKER
    GoTo _PRINT_MSG

_MON_AVOIDED:
    // {0} avoided the attack!
    PrintMessage msg_0197_00024, TAG_NICKNAME, BATTLER_CATEGORY_DEFENDER

_PRINT_MSG:
    Wait 
    WaitButtonABTime 30
    CompareVarToValue OPCODE_FLAG_NOT, BSCRIPT_VAR_BATTLE_STATUS, BATTLE_STATUS_MISS_MESSAGE, _END
    Call BATTLE_SUBSCRIPT_SHOW_PREPARED_MESSAGE

_END:
    UnlockMoveChoice BATTLER_CATEGORY_ATTACKER
    Call BATTLE_SUBSCRIPT_CRASH_ON_MISS
    End 