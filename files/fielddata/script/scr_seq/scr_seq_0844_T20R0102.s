#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T20R0102.h"
#include "msgdata/msg/msg_0544_T20R0102.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T20R0102_000
	scrdef scr_seq_T20R0102_001
	scrdef_end

scr_seq_T20R0102_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	buffer_players_name 0
	gender_msgbox msg_0544_T20R0102_00000, msg_0544_T20R0102_00001
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T20R0102_001:
	simple_npc_msg msg_0544_T20R0102_00002
	end
	.balign 4, 0
