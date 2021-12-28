#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0181_R05R0202_0012 ; 000
	scrdef scr_seq_0181_R05R0202_000A ; 001
	scrdef_end

scr_seq_0181_R05R0202_000A:
	setvar VAR_TEMP_x4000, 0
	end

scr_seq_0181_R05R0202_0012:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0181_R05R0202_00BE
	checkflag FLAG_UNK_164
	gotoif TRUE, scr_seq_0181_R05R0202_00D8
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_0181_R05R0202_006E
	hasitem ITEM_RAGECANDYBAR, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0181_R05R0202_005F
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0181_R05R0202_005F:
	npc_msg 1
	closemsg
	apply_movement 0, scr_seq_0181_R05R0202_0100
	wait_movement
scr_seq_0181_R05R0202_006E:
	npc_msg 2
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0181_R05R0202_00E3
	hasspaceforitem ITEM_TM64, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0181_R05R0202_00F4
	buffer_players_name 0
	npc_msg 3
	takeitem ITEM_RAGECANDYBAR, 1, VAR_SPECIAL_x800C
	npc_msg 4
	closemsg
	setvar VAR_SPECIAL_x8004, 391
	setvar VAR_SPECIAL_x8005, 1
	callstd 2008
scr_seq_0181_R05R0202_00BE:
	npc_msg 5
	closemsg
	npc_msg 6
	waitbutton
	closemsg
	setvar VAR_TEMP_x4001, 1
	setflag FLAG_UNK_164
	releaseall
	end

scr_seq_0181_R05R0202_00D8:
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0181_R05R0202_00E3:
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	setvar VAR_TEMP_x4000, 1
	end

scr_seq_0181_R05R0202_00F4:
	npc_msg 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0181_R05R0202_00FF:
	.byte 0x00

scr_seq_0181_R05R0202_0100:
	.short 75, 1
	.short 254, 0
	.balign 4, 0
