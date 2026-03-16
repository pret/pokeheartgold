#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T11R0603.h"
#include "msgdata/msg/msg_0003_EVERYWHERE.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T11R0603_000
	scrdef_end

scr_seq_T11R0603_000:
	scrcmd_609
	lockall
	apply_movement obj_player, _0038
	wait_movement
	play_se SEQ_SE_GS_N_LINEAR
	wait 40, VAR_SPECIAL_x8004
	stop_se SEQ_SE_GS_N_LINEAR
	scrcmd_722 1, 1, 198, 17, 11
	setvar VAR_UNK_411E, 0
	releaseall
	end

	.balign 4, 0
_0038:
	WalkNormalWest 7
	WalkNormalNorth 2
	EndMovement

_0044:
	end

	.balign 4, 0
