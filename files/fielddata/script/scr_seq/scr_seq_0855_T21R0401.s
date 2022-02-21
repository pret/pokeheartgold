#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T21R0401.h"
#include "msgdata/msg/msg_0554_T21R0401.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T21R0401_000
	scrdef scr_seq_T21R0401_001
	scrdef_end

scr_seq_T21R0401_000:
	end

scr_seq_T21R0401_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0554_T21R0401_00000
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
