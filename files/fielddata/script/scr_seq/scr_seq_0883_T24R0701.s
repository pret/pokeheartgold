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
	simple_npc_msg msg_0579_T24R0701_00000
	end

scr_seq_T24R0701_001:
	simple_npc_msg msg_0579_T24R0701_00001
	end

scr_seq_T24R0701_002:
	simple_npc_msg msg_0579_T24R0701_00002
	end
	.balign 4, 0
