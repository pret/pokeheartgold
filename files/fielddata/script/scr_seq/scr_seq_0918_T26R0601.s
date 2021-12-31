#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T26R0601.h"
#include "msgdata/msg/msg_0610_T26R0601.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T26R0601_000
	scrdef_end

scr_seq_T26R0601_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0BD
	gotoif TRUE, _008E
	npc_msg msg_0610_T26R0601_00000
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0040
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0079
	end

_0040:
	setvar VAR_SPECIAL_x8004, 446
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0084
	npc_msg msg_0610_T26R0601_00001
	waitbutton
	callstd std_give_item_verbose
	setflag FLAG_UNK_0BD
	npc_msg msg_0610_T26R0601_00003
	waitbutton
	closemsg
	releaseall
	end

_0079:
	npc_msg msg_0610_T26R0601_00004
	waitbutton
	closemsg
	releaseall
	end

_0084:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

_008E:
	npc_msg msg_0610_T26R0601_00005
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
