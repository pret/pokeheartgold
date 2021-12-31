#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T24R0701.h"
#include "msgdata/msg/msg_0579_T24R0701.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T24R0701_000
	scrdef scr_seq_T24R0701_001
	scrdef scr_seq_T24R0701_002
	scrdef_end

scr_seq_T24R0701_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0579_T24R0701_00000
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T24R0701_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0579_T24R0701_00001
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T24R0701_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0579_T24R0701_00002
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
