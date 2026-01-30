#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T07R0701.h"
#include "msgdata/msg/msg_0510_T07R0701.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T07R0701_000
	scrdef scr_seq_T07R0701_001
	scrdef scr_seq_T07R0701_002
	scrdef scr_seq_T07R0701_003
	scrdef scr_seq_T07R0701_004
	scrdef scr_seq_T07R0701_005
	scrdef scr_seq_T07R0701_006
	scrdef_end

scr_seq_T07R0701_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0510_T07R0701_00006
	closemsg
	apply_movement obj_T07R0701_leader4, _003C
	wait_movement
	releaseall
	end

	.balign 4, 0
_003C:
	WalkOnSpotNormalEast
	EndMovement

scr_seq_T07R0701_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	hasitem ITEM_COIN_CASE, 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0074
	npc_msg msg_0510_T07R0701_00004
	closemsg
	apply_movement obj_T07R0701_gswoman1, _00D8
	wait_movement
	releaseall
	end

_0074:
	npc_msg msg_0510_T07R0701_00005
	closemsg
	apply_movement obj_T07R0701_gswoman1, _00D8
	wait_movement
	releaseall
	end

scr_seq_T07R0701_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0510_T07R0701_00001
	closemsg
	apply_movement obj_T07R0701_gsbigman_3, _00E0
	wait_movement
	releaseall
	end

scr_seq_T07R0701_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0510_T07R0701_00002
	closemsg
	apply_movement obj_T07R0701_gsbigman_2, _00E0
	wait_movement
	releaseall
	end

scr_seq_T07R0701_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0510_T07R0701_00003
	closemsg
	apply_movement obj_T07R0701_gsbigman, _00D8
	wait_movement
	releaseall
	end

	.balign 4, 0
_00D8:
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_00E0:
	WalkOnSpotNormalNorth
	EndMovement

scr_seq_T07R0701_000:
	simple_npc_msg msg_0510_T07R0701_00000
	end

scr_seq_T07R0701_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0510_T07R0701_00007
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
