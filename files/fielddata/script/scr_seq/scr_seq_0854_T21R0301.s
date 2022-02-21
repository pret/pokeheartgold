#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T21R0301.h"
#include "msgdata/msg/msg_0553_T21R0301.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T21R0301_000
	scrdef scr_seq_T21R0301_001
	scrdef scr_seq_T21R0301_002
	scrdef_end

scr_seq_T21R0301_000:
	end

scr_seq_T21R0301_001:
	simple_npc_msg msg_0553_T21R0301_00000
	end

scr_seq_T21R0301_002:
	simple_npc_msg msg_0553_T21R0301_00001
	end
	.balign 4, 0
