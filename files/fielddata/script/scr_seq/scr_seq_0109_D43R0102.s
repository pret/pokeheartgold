#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D43R0102.h"
#include "msgdata/msg/msg_0003_EVERYWHERE.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D43R0102_000
	scrdef scr_seq_D43R0102_001
	scrdef_end

scr_seq_D43R0102_000:
	play_se SEQ_SE_GS_RAKKA01
	apply_movement obj_player, _0048
	scrcmd_374 obj_player
	wait_movement
	screen_shake 0, 1, 1, 8
	play_se SEQ_SE_DP_SUTYA2
	setvar VAR_UNK_40CA, 0
	end

scr_seq_D43R0102_001:
	compare VAR_UNK_40CA, 1
	goto_if_ne _0043
	make_object_visible obj_player
_0043:
	end

	.balign 4, 0
_0048:
	WarpIn
	EndMovement
	.balign 4, 0
