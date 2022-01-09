#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D15R0101.h"
#include "msgdata/msg/msg_0054_D15R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D15R0101_000
	scrdef scr_seq_D15R0101_001
	scrdef scr_seq_D15R0101_002
	scrdef scr_seq_D15R0101_003
	scrdef scr_seq_D15R0101_004
	scrdef_end

scr_seq_D15R0101_000:
	end

scr_seq_D15R0101_001:
	simple_npc_msg msg_0054_D15R0101_00002
	end

scr_seq_D15R0101_002:
	simple_npc_msg msg_0054_D15R0101_00003
	end

scr_seq_D15R0101_003:
	simple_npc_msg msg_0054_D15R0101_00001
	end

scr_seq_D15R0101_004:
	simple_npc_msg msg_0054_D15R0101_00000
	end
	.balign 4, 0
