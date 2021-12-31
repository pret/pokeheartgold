#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T04R0101.h"
#include "msgdata/msg/msg_0471_T04R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T04R0101_000
	scrdef_end

scr_seq_T04R0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0471_T04R0101_00000
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
