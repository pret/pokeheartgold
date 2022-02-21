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
	simple_npc_msg msg_0481_T05R0601_00000
	end

scr_seq_T05R0601_001:
	simple_npc_msg msg_0481_T05R0601_00001
	end

scr_seq_T05R0601_002:
	simple_npc_msg msg_0481_T05R0601_00002
	end

scr_seq_T05R0601_003:
	simple_npc_msg msg_0481_T05R0601_00003
	end
	.balign 4, 0
