#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D27R0103.h"
#include "msgdata/msg/msg_0003_EVERYWHERE.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D27R0103_000
	scrdef scr_seq_D27R0103_001
	scrdef_end

scr_seq_D27R0103_000:
	play_se SEQ_SE_GS_RAKKA01
	apply_movement obj_player, _0038
	wait 1, VAR_SPECIAL_RESULT
	scrcmd_374 obj_player
	wait_movement
	screen_shake 0, 1, 1, 8
	play_se SEQ_SE_DP_SUTYA2
	setvar VAR_UNK_40A7, 0
	end

	.balign 4, 0
_0038:
	WarpIn
	EndMovement

scr_seq_D27R0103_001:
	compare VAR_UNK_40A7, 1
	goto_if_ne _0051
	make_object_visible obj_player
_0051:
	end
	.balign 4, 0
