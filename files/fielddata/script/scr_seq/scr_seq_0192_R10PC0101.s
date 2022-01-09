#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R10PC0101.h"
#include "msgdata/msg/msg_0342_R10PC0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R10PC0101_000
	scrdef scr_seq_R10PC0101_001
	scrdef scr_seq_R10PC0101_002
	scrdef scr_seq_R10PC0101_003
	scrdef_end

scr_seq_R10PC0101_000:
	setvar VAR_SPECIAL_x8007, 0
	callstd std_nurse_joy
	end

scr_seq_R10PC0101_001:
	simple_npc_msg msg_0342_R10PC0101_00000
	end

scr_seq_R10PC0101_002:
	goto_if_set FLAG_RESTORED_POWER, _004F
	simple_npc_msg msg_0342_R10PC0101_00001
	end

_004F:
	simple_npc_msg msg_0342_R10PC0101_00002
	end

scr_seq_R10PC0101_003:
	simple_npc_msg msg_0342_R10PC0101_00003
	end
	.balign 4, 0
