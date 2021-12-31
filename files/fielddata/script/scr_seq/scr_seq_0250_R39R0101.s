#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R39R0101.h"
#include "msgdata/msg/msg_0397_R39R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R39R0101_000
	scrdef scr_seq_R39R0101_001
	scrdef_end

scr_seq_R39R0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0AA
	gotoif TRUE, _002C
	setflag FLAG_UNK_0A8
	npc_msg msg_0397_R39R0101_00000
	waitbutton
	closemsg
	releaseall
	end

_002C:
	setvar VAR_SPECIAL_x8004, 33
	setvar VAR_SPECIAL_x8005, 0
	hasitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 999
	gotoif ne, _0058
	npc_msg msg_0397_R39R0101_00006
	waitbutton
	closemsg
	releaseall
	end

_0058:
	scrcmd_113 20, 2
	npc_msg msg_0397_R39R0101_00001
	touchscreen_menu_hide
	menu_init 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 12, 255, 1
	menu_item_add 13, 255, 2
	menu_item_add 14, 255, 3
	menu_exec
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, _0111
	comparevartovalue VAR_SPECIAL_x800C, 1
	callif eq, _011E
	comparevartovalue VAR_SPECIAL_x800C, 2
	callif eq, _012C
	hasenoughmoneyvar VAR_SPECIAL_x800C, VAR_TEMP_x4001
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _00F7
	setvar VAR_SPECIAL_x8004, 33
	copyvar VAR_SPECIAL_x8005, VAR_TEMP_x4000
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0104
	submoneyvar VAR_TEMP_x4001
	scrcmd_115
	npc_msg msg_0397_R39R0101_00002
	callstd std_give_item_verbose
	closemsg
	scrcmd_114
	releaseall
	end

_00F7:
	npc_msg msg_0397_R39R0101_00003
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

_0104:
	npc_msg msg_0397_R39R0101_00004
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

_0111:
	npc_msg msg_0397_R39R0101_00005
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

_011E:
	setvar VAR_TEMP_x4000, 1
	setvar VAR_TEMP_x4001, 500
	return

_012C:
	setvar VAR_TEMP_x4000, 12
	setvar VAR_TEMP_x4001, 6000
	return

scr_seq_R39R0101_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0AA
	gotoif TRUE, _0158
	npc_msg msg_0397_R39R0101_00007
	waitbutton
	closemsg
	releaseall
	end

_0158:
	checkflag FLAG_UNK_0AB
	gotoif TRUE, _0197
	npc_msg msg_0397_R39R0101_00008
	scrcmd_049
	goto_if_no_item_space ITEM_TM83, 1, _01A2
	callstd std_give_item_verbose
	setflag FLAG_UNK_0AB
	goto _0197

_0197:
	npc_msg msg_0397_R39R0101_00010
	waitbutton
	closemsg
	releaseall
	end

_01A2:
	npc_msg msg_0397_R39R0101_00011
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
