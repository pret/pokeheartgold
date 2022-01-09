#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D15R0102.h"
#include "msgdata/msg/msg_0055_D15R0102.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D15R0102_000
	scrdef scr_seq_D15R0102_001
	scrdef scr_seq_D15R0102_002
	scrdef_end

scr_seq_D15R0102_000:
	end

scr_seq_D15R0102_001:
	simple_npc_msg msg_0055_D15R0102_00000
	end

scr_seq_D15R0102_002:
	simple_npc_msg msg_0055_D15R0102_00001
	end
	.balign 4, 0
