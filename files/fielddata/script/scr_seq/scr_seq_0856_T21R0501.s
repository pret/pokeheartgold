#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T21R0501.h"
#include "msgdata/msg/msg_0555_T21R0501.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T21R0501_000
	scrdef scr_seq_T21R0501_001
	scrdef scr_seq_T21R0501_002
	scrdef_end

scr_seq_T21R0501_000:
	end

scr_seq_T21R0501_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0555_T21R0501_00000
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T21R0501_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0555_T21R0501_00001
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
