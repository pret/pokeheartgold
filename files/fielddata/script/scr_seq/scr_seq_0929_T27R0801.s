#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T27R0801.h"
#include "msgdata/msg/msg_0619_T27R0801.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T27R0801_000
	scrdef scr_seq_T27R0801_001
	scrdef_end

scr_seq_T27R0801_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0A3
	gotoif TRUE, _0078
	npc_msg msg_0619_T27R0801_00000
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0044
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _008D
	end

_0044:
	npc_msg msg_0619_T27R0801_00001
	scrcmd_049
	setvar VAR_SPECIAL_x8004, 471
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0083
	callstd std_give_item_verbose
	setflag FLAG_UNK_0A3
	goto _0078

_0078:
	npc_msg msg_0619_T27R0801_00003
	waitbutton
	closemsg
	releaseall
	end

_0083:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

_008D:
	npc_msg msg_0619_T27R0801_00004
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T27R0801_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0619_T27R0801_00005
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _00C7
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _00F9
	end

_00C7:
	npc_msg msg_0619_T27R0801_00006
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _00EE
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _00F9
	end

_00EE:
	npc_msg msg_0619_T27R0801_00007
	waitbutton
	closemsg
	releaseall
	end

_00F9:
	closemsg
	releaseall
	end
	.balign 4, 0
