#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R02R0501.h"
#include "msgdata/msg/msg_0325_R02R0501.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R02R0501_000
	scrdef_end

scr_seq_R02R0501_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0325_R02R0501_00000
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
