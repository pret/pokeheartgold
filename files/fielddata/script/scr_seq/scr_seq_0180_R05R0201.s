#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R05R0201.h"
#include "msgdata/msg/msg_0330_R05R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R05R0201_000
	scrdef_end

scr_seq_R05R0201_000:
	simple_npc_msg msg_0330_R05R0201_00000
	end
	.balign 4, 0
