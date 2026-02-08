#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D39R0103.h"
#include "msgdata/msg/msg_0123_D39R0103.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D39R0103_000
	scrdef scr_seq_D39R0103_001
	scrdef scr_seq_D39R0103_002
	scrdef_end

scr_seq_D39R0103_000:
	play_se SEQ_SE_GS_RAKKA01
	apply_movement obj_player, _0050
	wait 1, VAR_SPECIAL_RESULT
	scrcmd_374 obj_player
	wait_movement
	screen_shake 0, 1, 1, 8
	play_se SEQ_SE_DP_SUTYA2
	setvar VAR_UNK_40AB, 0
	end

scr_seq_D39R0103_001:
	compare VAR_UNK_40AB, 1
	goto_if_ne _004D
	make_object_visible obj_player
_004D:
	end

	.balign 4, 0
_0050:
	WarpIn
	EndMovement

scr_seq_D39R0103_002:
	simple_npc_msg msg_0123_D39R0103_00000
	end
	.balign 4, 0
