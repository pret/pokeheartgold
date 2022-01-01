#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D50R0101.h"
#include "msgdata/msg/msg_0144_D50R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D50R0101_000
	scrdef scr_seq_D50R0101_001
	scrdef_end

scr_seq_D50R0101_001:
	nat_dex_flag_action 2, VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, _0064
	move_person obj_D50R0101_breakrock, 30, 1, 30, 0
	move_person obj_D50R0101_breakrock_2, 30, 1, 30, 0
	move_person obj_D50R0101_breakrock_3, 30, 1, 30, 0
	move_person obj_D50R0101_breakrock_4, 30, 1, 30, 0
	move_person obj_D50R0101_breakrock_5, 30, 1, 30, 0
	move_person obj_D50R0101_breakrock_6, 30, 1, 30, 0
_0064:
	end

scr_seq_D50R0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0144_D50R0101_00000
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
