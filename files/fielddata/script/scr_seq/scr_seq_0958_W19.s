#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_W19.h"
#include "msgdata/msg/msg_0740_W19.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_W19_000
	scrdef scr_seq_W19_001
	scrdef scr_seq_W19_002
	scrdef scr_seq_W19_003
	scrdef scr_seq_W19_004
	scrdef scr_seq_W19_005
	scrdef_end

scr_seq_W19_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0740_W19_00000
	waitbutton
	closemsg
	releaseall
	end

scr_seq_W19_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0740_W19_00002
	waitbutton
	closemsg
	releaseall
	end

scr_seq_W19_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0740_W19_00001
	waitbutton
	closemsg
	releaseall
	end

scr_seq_W19_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0740_W19_00003
	waitbutton
	closemsg
	releaseall
	end

scr_seq_W19_004:
	direction_signpost msg_0740_W19_00004, 1, 4, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd std_signpost
	end

scr_seq_W19_005:
	scrcmd_055 3, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0740_W19_00005, VAR_SPECIAL_x800C
	callstd std_signpost
	end
	.balign 4, 0
