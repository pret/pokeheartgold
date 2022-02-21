#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R05R0301.h"
#include "msgdata/msg/msg_0332_R05R0301.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R05R0301_000
	scrdef_end

scr_seq_R05R0301_000:
	simple_npc_msg msg_0332_R05R0301_00000
	end
	.balign 4, 0
