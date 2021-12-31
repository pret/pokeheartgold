#include "constants/scrcmd.h"
#include "../.h"
#include "msgdata/msg/msg_0733.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0954_000
	scrdef_end

scr_seq_0954_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0733_00033
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
