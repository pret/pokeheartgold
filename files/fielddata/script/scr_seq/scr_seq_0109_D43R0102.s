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
	scrcmd_374 255
	wait_movement
	scrcmd_561 0, 1, 1, 8
	play_se SEQ_SE_DP_SUTYA2
	setvar VAR_UNK_40CA, 0
	end

scr_seq_D43R0102_001:
	compare VAR_UNK_40CA, 1
	goto_if_ne _0043
	scrcmd_375 255
_0043:
	end
	.byte 0x00, 0x00, 0x00

_0048:
	step 68, 1
	step_end
	.balign 4, 0
