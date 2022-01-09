#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T02R0401.h"
#include "msgdata/msg/msg_0459_T02R0401.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T02R0401_000
	scrdef_end

scr_seq_T02R0401_000:
	simple_npc_msg msg_0459_T02R0401_00000
	end
	.balign 4, 0
