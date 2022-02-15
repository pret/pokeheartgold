#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D27R0101.h"
#include "msgdata/msg/msg_0093_D27R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D27R0101_000
	scrdef scr_seq_D27R0101_001
	scrdef scr_seq_D27R0101_002
	scrdef_end

scr_seq_D27R0101_002:
	setvar VAR_UNK_4125, 0
	end

scr_seq_D27R0101_000:
	simple_npc_msg msg_0093_D27R0101_00000
	end

scr_seq_D27R0101_001:
	simple_npc_msg msg_0093_D27R0101_00001
	end
	.balign 4, 0
