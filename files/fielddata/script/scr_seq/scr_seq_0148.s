#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0148_000A ; 000
	scrdef scr_seq_0148_0013 ; 001
	scrdef_end

scr_seq_0148_000A:
	npc_msg 15
	goto scr_seq_0148_0019

scr_seq_0148_0013:
	buffer_players_name 0
	npc_msg 57
scr_seq_0148_0019:
	scrcmd_247
	scrcmd_477 2, 16384
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_0148_005E
	touchscreen_menu_hide
	scrcmd_750 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 17, 255, 0
	scrcmd_751 16, 255, 1
	scrcmd_752
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0148_00EB
	goto scr_seq_0148_00DA

scr_seq_0148_005E:
	checkflag FLAG_UNK_987
	gotoif TRUE, scr_seq_0148_00AF
	touchscreen_menu_hide
	scrcmd_750 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 18, 255, 0
	scrcmd_751 19, 255, 1
	scrcmd_751 16, 255, 2
	scrcmd_752
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0148_00EB
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0148_0142
	goto scr_seq_0148_00DA

scr_seq_0148_00AF:
	touchscreen_menu_hide
	scrcmd_750 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 19, 255, 0
	scrcmd_751 16, 255, 1
	scrcmd_752
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0148_0142
scr_seq_0148_00DA:
	npc_msg 21
	waitbutton
	closemsg
	setvar VAR_SPECIAL_x800C, 0
	endstd
	end

scr_seq_0148_00EB:
	scrcmd_243 32772
	scrcmd_244 32773
	scrcmd_198 5, 32772
	scrcmd_198 6, 32773
	npc_msg 20
	scrcmd_248 0, 32780, 32768
	play_fanfare VAR_SPECIAL_x8000
	buffer_players_name 0
	scrcmd_046 VAR_SPECIAL_x800C
	wait_fanfare
	scrcmd_423 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0148_012F
	setflag FLAG_UNK_987
	goto scr_seq_0148_0132

scr_seq_0148_012F:
	npc_msg 21
scr_seq_0148_0132:
	waitbutton
	closemsg
	setvar VAR_SPECIAL_x800C, 1
	goto scr_seq_0148_0189

scr_seq_0148_0142:
	scrcmd_245 32772
	scrcmd_246 32773
	scrcmd_198 5, 32772
	scrcmd_198 6, 32773
	npc_msg 20
	scrcmd_248 1, 32780, 32768
	play_fanfare VAR_SPECIAL_x8000
	buffer_players_name 0
	scrcmd_046 VAR_SPECIAL_x800C
	wait_fanfare
	scrcmd_424 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0148_0183
	npc_msg 21
	waitbutton
	closemsg
scr_seq_0148_0183:
	setvar VAR_SPECIAL_x800C, 2
scr_seq_0148_0189:
	endstd
	end
	.balign 4, 0
