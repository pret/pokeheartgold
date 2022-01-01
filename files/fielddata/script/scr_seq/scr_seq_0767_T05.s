#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T05.h"
#include "msgdata/msg/msg_0475_T05.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T05_000
	scrdef scr_seq_T05_001
	scrdef scr_seq_T05_002
	scrdef scr_seq_T05_003
	scrdef scr_seq_T05_004
	scrdef scr_seq_T05_005
	scrdef scr_seq_T05_006
	scrdef scr_seq_T05_007
	scrdef_end

scr_seq_T05_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0475_T05_00000
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T05_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0475_T05_00001
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T05_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0475_T05_00002
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T05_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0475_T05_00003
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T05_004:
	direction_signpost msg_0475_T05_00004, 0, 5, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd std_signpost
	end

scr_seq_T05_005:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0475_T05_00005, VAR_SPECIAL_x800C
	callstd std_signpost
	end

scr_seq_T05_006:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0475_T05_00006, VAR_SPECIAL_x800C
	callstd std_signpost
	end

scr_seq_T05_007:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0475_T05_00007, VAR_SPECIAL_x800C
	callstd std_signpost
	end
	.balign 4, 0
