#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_0150.h"
#include "msgdata/msg/msg_0023.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0150_000
	scrdef_end

scr_seq_0150_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0023_00000
	closemsg
	hasitem ITEM_APRICORN_BOX, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0099
	check_apricorn_tree VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0088
	apricorn_tree_get_apricorn VAR_SPECIAL_x8000
	setvar VAR_SPECIAL_x8005, 1
	buffer_players_name 0
	buffer_apricorn_name 1, VAR_SPECIAL_x8000
	npc_msg msg_0023_00001
	closemsg
	play_fanfare SEQ_ME_ITEM
	npc_msg msg_0023_00003
	wait_fanfare
	give_apricorn_from_tree VAR_SPECIAL_x8000, 1, VAR_SPECIAL_x800C
	add_special_game_stat 1
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _007D
	npc_msg msg_0023_00004
	waitbutton
	closemsg
	releaseall
	end

_007D:
	npc_msg msg_0023_00006
	waitbutton
	closemsg
	releaseall
	end

_0088:
	wait 15, VAR_SPECIAL_x800C
	npc_msg msg_0023_00002
	waitbutton
	closemsg
	releaseall
	end

_0099:
	npc_msg msg_0023_00007
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
