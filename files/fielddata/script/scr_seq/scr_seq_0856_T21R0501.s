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
	simple_npc_msg msg_0555_T21R0501_00000
	end

scr_seq_T21R0501_002:
	simple_npc_msg msg_0555_T21R0501_00001
	end
	.balign 4, 0
