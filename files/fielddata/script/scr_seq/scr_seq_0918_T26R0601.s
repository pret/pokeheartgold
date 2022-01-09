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
	goto_if_set FLAG_UNK_0BD, _008E
	npc_msg msg_0610_T26R0601_00000
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	compare VAR_SPECIAL_x800C, 0
	goto_if_eq _0040
	compare VAR_SPECIAL_x800C, 1
	goto_if_eq _0079
	end

_0040:
	goto_if_no_item_space ITEM_GOOD_ROD, 1, _0084
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
