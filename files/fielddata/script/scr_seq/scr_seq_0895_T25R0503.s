#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T25R0503.h"
#include "msgdata/msg/msg_0003_EVERYWHERE.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T25R0503_000
	scrdef_end

scr_seq_T25R0503_000:
	scrcmd_609
	lockall
	apply_movement obj_player, _0038
	wait_movement
	play_se SEQ_SE_GS_N_LINEAR
	wait 40, VAR_SPECIAL_x8004
	stop_se SEQ_SE_GS_N_LINEAR
	scrcmd_722 0, 1, 401, 14, 11
	setvar VAR_UNK_411F, 0
	releaseall
	end

	.balign 4, 0
_0038:
	WalkNormalEast 7
	WalkNormalNorth 2
	EndMovement

_0044:
	end

	.balign 4, 0
