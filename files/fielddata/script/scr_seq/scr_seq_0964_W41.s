#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_W41.h"
#include "msgdata/msg/msg_0746_W41.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_W41_000
	scrdef scr_seq_W41_001
	scrdef scr_seq_W41_002
	scrdef scr_seq_W41_003
	scrdef scr_seq_W41_004
	scrdef scr_seq_W41_005
	scrdef scr_seq_W41_006
	scrdef scr_seq_W41_007
	scrdef scr_seq_W41_008
	scrdef scr_seq_W41_009
	scrdef scr_seq_W41_010
	scrdef_end

scr_seq_W41_000:
	end

scr_seq_W41_001:
	simple_npc_msg msg_0746_W41_00000
	end

scr_seq_W41_002:
	simple_npc_msg msg_0746_W41_00003
	end

scr_seq_W41_003:
	simple_npc_msg msg_0746_W41_00006
	end

scr_seq_W41_004:
	simple_npc_msg msg_0746_W41_00012
	end

scr_seq_W41_005:
	simple_npc_msg msg_0746_W41_00009
	end

scr_seq_W41_006:
	simple_npc_msg msg_0746_W41_00015
	end

scr_seq_W41_007:
	simple_npc_msg msg_0746_W41_00018
	end

scr_seq_W41_008:
	simple_npc_msg msg_0746_W41_00021
	end

scr_seq_W41_009:
	simple_npc_msg msg_0746_W41_00024
	end

scr_seq_W41_010:
	simple_npc_msg msg_0746_W41_00027
	end
	.balign 4, 0
