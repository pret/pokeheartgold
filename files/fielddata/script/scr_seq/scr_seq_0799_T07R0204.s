#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T07R0204.h"
#include "msgdata/msg/msg_0504_T07R0204.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T07R0204_000
	scrdef scr_seq_T07R0204_001
	scrdef_end

scr_seq_T07R0204_001:
	setvar VAR_UNK_4125, 0
	end

scr_seq_T07R0204_000:
	simple_npc_msg msg_0504_T07R0204_00000
	end
	.balign 4, 0
