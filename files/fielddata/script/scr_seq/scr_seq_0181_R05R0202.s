#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R05R0202.h"
#include "msgdata/msg/msg_0331_R05R0202.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R05R0202_000
	scrdef scr_seq_R05R0202_001
	scrdef_end

scr_seq_R05R0202_001:
	setvar VAR_TEMP_x4000, 0
	end

scr_seq_R05R0202_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, _00BE
	checkflag FLAG_UNK_164
	gotoif TRUE, _00D8
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, _006E
	hasitem ITEM_RAGECANDYBAR, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _005F
	npc_msg msg_0331_R05R0202_00000
	waitbutton
	closemsg
	releaseall
	end

_005F:
	npc_msg msg_0331_R05R0202_00001
	closemsg
	apply_movement obj_R05R0202_gsmiddleman1, _0100
	wait_movement
_006E:
	npc_msg msg_0331_R05R0202_00002
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _00E3
	hasspaceforitem ITEM_TM64, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _00F4
	buffer_players_name 0
	npc_msg msg_0331_R05R0202_00003
	takeitem ITEM_RAGECANDYBAR, 1, VAR_SPECIAL_x800C
	npc_msg msg_0331_R05R0202_00004
	closemsg
	setvar VAR_SPECIAL_x8004, 391
	setvar VAR_SPECIAL_x8005, 1
	callstd 2008
_00BE:
	npc_msg msg_0331_R05R0202_00005
	closemsg
	npc_msg msg_0331_R05R0202_00006
	waitbutton
	closemsg
	setvar VAR_TEMP_x4001, 1
	setflag FLAG_UNK_164
	releaseall
	end

_00D8:
	npc_msg msg_0331_R05R0202_00007
	waitbutton
	closemsg
	releaseall
	end

_00E3:
	npc_msg msg_0331_R05R0202_00008
	waitbutton
	closemsg
	releaseall
	setvar VAR_TEMP_x4000, 1
	end

_00F4:
	npc_msg msg_0331_R05R0202_00009
	waitbutton
	closemsg
	releaseall
	end
	.byte 0x00

_0100:
	step 75, 1
	step_end
	.balign 4, 0
