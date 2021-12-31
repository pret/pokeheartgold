#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T05R0601.h"
#include "msgdata/msg/msg_0481_T05R0601.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T05R0601_000
	scrdef scr_seq_T05R0601_001
	scrdef scr_seq_T05R0601_002
	scrdef scr_seq_T05R0601_003
	scrdef_end

scr_seq_T05R0601_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0481_T05R0601_00000
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T05R0601_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0481_T05R0601_00001
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T05R0601_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0481_T05R0601_00002
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T05R0601_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0481_T05R0601_00003
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
