#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R08.h"
#include "msgdata/msg/msg_0338_R08.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R08_000
	scrdef scr_seq_R08_001
	scrdef_end

scr_seq_R08_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0338_R08_00000
	waitbutton
	closemsg
	releaseall
	end

scr_seq_R08_001:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 1, VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
