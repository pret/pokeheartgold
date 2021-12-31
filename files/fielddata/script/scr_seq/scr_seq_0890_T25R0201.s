#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T25R0201.h"
#include "msgdata/msg/msg_0584_T25R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T25R0201_000
	scrdef scr_seq_T25R0201_001
	scrdef_end

scr_seq_T25R0201_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_089
	gotoif TRUE, _0081
	npc_msg msg_0584_T25R0201_00000
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0042
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _008C
	end

_0042:
	npc_msg msg_0584_T25R0201_00001
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0065
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _008C
	end

_0065:
	setvar VAR_SPECIAL_x8004, 450
	setvar VAR_SPECIAL_x8005, 1
	callstd std_give_item_verbose
	setflag FLAG_UNK_089
	closemsg
	touchscreen_menu_show
	releaseall
	end

_0081:
	npc_msg msg_0584_T25R0201_00003
	waitbutton
	closemsg
	releaseall
	end

_008C:
	npc_msg msg_0584_T25R0201_00004
	waitbutton
	closemsg
	touchscreen_menu_show
	releaseall
	end

scr_seq_T25R0201_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0584_T25R0201_00005
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
