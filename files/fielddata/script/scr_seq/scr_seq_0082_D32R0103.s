#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D32R0103.h"
#include "msgdata/msg/msg_0105_D32R0103.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D32R0103_000
	scrdef scr_seq_D32R0103_001
	scrdef scr_seq_D32R0103_002
	scrdef scr_seq_D32R0103_003
	scrdef_end

scr_seq_D32R0103_003:
	setvar VAR_UNK_40E5, 2
	end

scr_seq_D32R0103_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd std_frontier_move_tutor_1
	releaseall
	end

scr_seq_D32R0103_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd std_frontier_move_tutor_2
	releaseall
	end

scr_seq_D32R0103_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd std_frontier_move_tutor_3
	releaseall
	end
	.balign 4, 0
