#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T24R0601.h"
#include "msgdata/msg/msg_0578_T24R0601.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T24R0601_000
	scrdef_end

scr_seq_T24R0601_000:
	simple_npc_msg msg_0578_T24R0601_00000
	end
	.balign 4, 0
