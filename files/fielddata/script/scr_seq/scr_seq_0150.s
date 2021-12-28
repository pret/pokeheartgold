#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0150_0006 ; 000
	scrdef_end

scr_seq_0150_0006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	closemsg
	hasitem ITEM_APRICORN_BOX, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0150_0099
	scrcmd_623 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0150_0088
	scrcmd_624 32768
	setvar VAR_SPECIAL_x8005, 1
	buffer_players_name 0
	scrcmd_626 1, 32768
	npc_msg 1
	closemsg
	play_fanfare SEQ_ME_ITEM
	npc_msg 3
	wait_fanfare
	scrcmd_625 32768, 1, 32780
	add_special_game_stat 1
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0150_007D
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0150_007D:
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0150_0088:
	wait 15, VAR_SPECIAL_x800C
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0150_0099:
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
