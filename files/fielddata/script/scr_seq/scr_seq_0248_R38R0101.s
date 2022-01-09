#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R38R0101.h"
#include "msgdata/msg/msg_0395_R38R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R38R0101_000
	scrdef scr_seq_R38R0101_001
	scrdef_end

scr_seq_R38R0101_000:
	end

scr_seq_R38R0101_001:
	simple_npc_msg msg_0395_R38R0101_00000
	end
	.balign 4, 0
