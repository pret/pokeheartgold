#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0002_000E ; 000
	scrdef scr_seq_0002_0028 ; 001
	scrdef scr_seq_0002_0042 ; 002
	scrdef_end

scr_seq_0002_000E:
	setvar VAR_SPECIAL_x8000, 0
	setvar VAR_TEMP_x400F, 0
	setvar VAR_SPECIAL_x8007, 0
	goto scr_seq_0002_005C

scr_seq_0002_0026:
	.byte 0x02, 0x00
scr_seq_0002_0028:
	setvar VAR_SPECIAL_x8000, 1
	setvar VAR_TEMP_x400F, 12
	setvar VAR_SPECIAL_x8007, 1
	goto scr_seq_0002_005C

scr_seq_0002_0040:
	.byte 0x02, 0x00
scr_seq_0002_0042:
	setvar VAR_SPECIAL_x8000, 2
	setvar VAR_TEMP_x400F, 24
	setvar VAR_SPECIAL_x8007, 2
	goto scr_seq_0002_005C

scr_seq_0002_005A:
	.byte 0x02, 0x00
scr_seq_0002_005C:
	scrcmd_784 3, 0
	scrcmd_116 1, 21, 1
	setvar VAR_SPECIAL_x8004, 4
	addvar VAR_SPECIAL_x8004, VAR_TEMP_x400F
	scrcmd_046 VAR_SPECIAL_x8004
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0002_0352
scr_seq_0002_008A:
	fade_screen 6, 1, 0, 0
	wait_fade
	closemsg
	scrcmd_117
	scrcmd_349
	scrcmd_351 32769
	scrcmd_150
	scrcmd_116 1, 21, 1
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x8001, 255
	gotoif eq, scr_seq_0002_0352
	get_partymon_species VAR_SPECIAL_x8001, VAR_SPECIAL_x8002
	comparevartovalue VAR_SPECIAL_x8002, 0
	gotoif eq, scr_seq_0002_0391
	scrcmd_652 32769, 32768, 32770
	comparevartovalue VAR_SPECIAL_x8002, 0
	gotoif eq, scr_seq_0002_00F0
	goto scr_seq_0002_0125

scr_seq_0002_00F0:
	comparevartovalue VAR_SPECIAL_x8007, 0
	gotoif ne, scr_seq_0002_0106
	npc_msg 5
	goto scr_seq_0002_011F

scr_seq_0002_0106:
	comparevartovalue VAR_SPECIAL_x8007, 1
	gotoif ne, scr_seq_0002_011C
	npc_msg 17
	goto scr_seq_0002_011F

scr_seq_0002_011C:
	npc_msg 29
scr_seq_0002_011F:
	goto scr_seq_0002_008A

scr_seq_0002_0125:
	setvar VAR_SPECIAL_x8004, 0
	touchscreen_menu_hide
	scrcmd_490 32768
	scrcmd_490 32769
	scrcmd_490 32770
	scrcmd_490 32771
scr_seq_0002_013D:
	scrcmd_653 32769, 32768, 32772, 32780
	scrcmd_490 32768
	scrcmd_490 32769
	scrcmd_490 32770
	scrcmd_490 32771
	copyvar VAR_SPECIAL_x8003, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8003, 65533
	gotoif ne, scr_seq_0002_018F
	addvar VAR_SPECIAL_x8004, 1
	comparevartovar VAR_SPECIAL_x8004, VAR_SPECIAL_x8002
	gotoif lt, scr_seq_0002_013D
	setvar VAR_SPECIAL_x8004, 0
	goto scr_seq_0002_013D

scr_seq_0002_0189:
	.byte 0x16, 0x00, 0x41, 0x00, 0x00, 0x00
scr_seq_0002_018F:
	comparevartovalue VAR_SPECIAL_x8003, 65534
	gotoif ne, scr_seq_0002_01D0
	bufferpartymonnick 0, VAR_SPECIAL_x8001
	setvar VAR_SPECIAL_x8004, 7
	addvar VAR_SPECIAL_x8004, VAR_TEMP_x400F
	scrcmd_046 VAR_SPECIAL_x8004
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0002_0352
	setvar VAR_SPECIAL_x8004, 0
	closemsg
	goto scr_seq_0002_013D

scr_seq_0002_01D0:
	scrcmd_655 32771, 32773
	scrcmd_557 32773, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0002_01EF
	goto scr_seq_0002_0224

scr_seq_0002_01EF:
	comparevartovalue VAR_SPECIAL_x8007, 0
	gotoif ne, scr_seq_0002_0205
	npc_msg 6
	goto scr_seq_0002_021E

scr_seq_0002_0205:
	comparevartovalue VAR_SPECIAL_x8007, 1
	gotoif ne, scr_seq_0002_021B
	npc_msg 18
	goto scr_seq_0002_021E

scr_seq_0002_021B:
	npc_msg 30
scr_seq_0002_021E:
	goto scr_seq_0002_0352

scr_seq_0002_0224:
	bufferpartymonnick 0, VAR_SPECIAL_x8001
	buffer_move_name 1, VAR_SPECIAL_x8003
	scrcmd_396 32774, 32769
	comparevartovalue VAR_SPECIAL_x8006, 4
	gotoif lt, scr_seq_0002_0328
scr_seq_0002_0241:
	setvar VAR_SPECIAL_x8004, 8
	addvar VAR_SPECIAL_x8004, VAR_TEMP_x400F
	scrcmd_046 VAR_SPECIAL_x8004
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0002_03A4
	fade_screen 6, 1, 0, 0
	wait_fade
	closemsg
	scrcmd_117
	scrcmd_352 1, 32769, 32771
	scrcmd_353 1, 32774
	scrcmd_490 32774
	scrcmd_150
	scrcmd_116 1, 21, 1
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x8006, 4
	gotoif eq, scr_seq_0002_03A4
	scrcmd_490 32774
	buffer_party_mon_move_name 2, VAR_SPECIAL_x8001, VAR_SPECIAL_x8006
	setvar VAR_SPECIAL_x8004, 9
	addvar VAR_SPECIAL_x8004, VAR_TEMP_x400F
	scrcmd_046 VAR_SPECIAL_x8004
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0002_03A4
	comparevartovalue VAR_SPECIAL_x8007, 0
	gotoif ne, scr_seq_0002_02EA
	npc_msg 12
	goto scr_seq_0002_0303

scr_seq_0002_02EA:
	comparevartovalue VAR_SPECIAL_x8007, 1
	gotoif ne, scr_seq_0002_0300
	npc_msg 24
	goto scr_seq_0002_0303

scr_seq_0002_0300:
	npc_msg 36
scr_seq_0002_0303:
	play_se SEQ_SE_DP_KON
	wait_se SEQ_SE_DP_KON
	wait 30, VAR_SPECIAL_x800C
	buffer_party_mon_move_name 1, VAR_SPECIAL_x8001, VAR_SPECIAL_x8006
	setvar VAR_SPECIAL_x8004, 13
	addvar VAR_SPECIAL_x8004, VAR_TEMP_x400F
	scrcmd_046 VAR_SPECIAL_x8004
scr_seq_0002_0328:
	buffer_move_name 1, VAR_SPECIAL_x8003
	setvar VAR_SPECIAL_x8004, 14
	addvar VAR_SPECIAL_x8004, VAR_TEMP_x400F
	scrcmd_046 VAR_SPECIAL_x8004
	play_fanfare SEQ_ME_LVUP
	wait_fanfare
	scrcmd_556 32773
	scrcmd_118 1
	scrcmd_654 32769, 32774, 32771
scr_seq_0002_0352:
	comparevartovalue VAR_SPECIAL_x8007, 0
	gotoif ne, scr_seq_0002_0368
	npc_msg 15
	goto scr_seq_0002_0381

scr_seq_0002_0368:
	comparevartovalue VAR_SPECIAL_x8007, 1
	gotoif ne, scr_seq_0002_037E
	npc_msg 27
	goto scr_seq_0002_0381

scr_seq_0002_037E:
	npc_msg 39
scr_seq_0002_0381:
	waitbutton
	closemsg
	touchscreen_menu_show
	scrcmd_117
	scrcmd_784 3, 1
	endstd
	end

scr_seq_0002_0391:
	npc_msg 40
	waitbutton
	closemsg
	touchscreen_menu_show
	scrcmd_117
	scrcmd_784 3, 1
	endstd
	end

scr_seq_0002_03A4:
	setvar VAR_SPECIAL_x8004, 10
	addvar VAR_SPECIAL_x8004, VAR_TEMP_x400F
	scrcmd_046 VAR_SPECIAL_x8004
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0002_0241
	setvar VAR_SPECIAL_x8004, 11
	addvar VAR_SPECIAL_x8004, VAR_TEMP_x400F
	scrcmd_046 VAR_SPECIAL_x8004
	goto scr_seq_0002_0352

scr_seq_0002_03DF:
	.byte 0x02
	.byte 0x00, 0x00, 0x00, 0x00
	.balign 4, 0
