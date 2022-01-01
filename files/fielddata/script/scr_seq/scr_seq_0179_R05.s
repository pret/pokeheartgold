#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R05.h"
#include "msgdata/msg/msg_0329_R05.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R05_000
	scrdef scr_seq_R05_001
	scrdef_end

scr_seq_R05_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0329_R05_00000
	waitbutton
	closemsg
	releaseall
	end

scr_seq_R05_001:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0329_R05_00001, VAR_SPECIAL_x800C
	callstd std_signpost
	end
	.balign 4, 0
