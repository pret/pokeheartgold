#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T21R0401.h"
#include "msgdata/msg/msg_0554_T21R0401.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T21R0401_000
	scrdef scr_seq_T21R0401_001
	scrdef_end

scr_seq_T21R0401_000:
	end

scr_seq_T21R0401_001:
	simple_npc_msg msg_0554_T21R0401_00000
	end
	.balign 4, 0
