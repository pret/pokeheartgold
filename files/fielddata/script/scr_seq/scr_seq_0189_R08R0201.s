#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R08R0201.h"
#include "msgdata/msg/msg_0339_R08R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R08R0201_000
	scrdef_end

scr_seq_R08R0201_000:
	simple_npc_msg msg_0339_R08R0201_00000
	end
	.balign 4, 0
