#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R46.h"
#include "msgdata/msg/msg_0406_R46.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R46_000
	scrdef scr_seq_R46_001
	scrdef scr_seq_R46_002
	scrdef_end

scr_seq_R46_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_GAVE_RIVAL_NAME_TO_OFFICER, _002C
	npc_msg msg_0406_R46_00002
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_002C:
	npc_msg msg_0406_R46_00003
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_R46_001:
	direction_signpost msg_0406_R46_00000, 1, 3, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_R46_002:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0406_R46_00001, VAR_SPECIAL_RESULT
	callstd std_signpost
	end
	.balign 4, 0
