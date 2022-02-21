#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T25R0801.h"
#include "msgdata/msg/msg_0590_T25R0801.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T25R0801_000
	scrdef scr_seq_T25R0801_001
	scrdef_end

scr_seq_T25R0801_000:
	simple_npc_msg msg_0590_T25R0801_00000
	end

scr_seq_T25R0801_001:
	simple_npc_msg msg_0590_T25R0801_00001
	end
	.balign 4, 0
