#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_W19R0101.h"
#include "msgdata/msg/msg_0741_W19R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_W19R0101_000
	scrdef_end

scr_seq_W19R0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge 14, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _002C
	npc_msg msg_0741_W19R0101_00000
	waitbutton
	closemsg
	releaseall
	end

_002C:
	npc_msg msg_0741_W19R0101_00001
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
