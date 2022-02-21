#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D15R0102.h"
#include "msgdata/msg/msg_0055_D15R0102.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D15R0102_000
	scrdef scr_seq_D15R0102_001
	scrdef scr_seq_D15R0102_002
	scrdef_end

scr_seq_D15R0102_000:
	end

scr_seq_D15R0102_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0055_D15R0102_00000
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D15R0102_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0055_D15R0102_00001
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
