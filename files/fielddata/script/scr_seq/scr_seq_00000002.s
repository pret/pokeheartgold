#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000002_0000000E ; 000
	scrdef scr_seq_00000002_00000028 ; 001
	scrdef scr_seq_00000002_00000042 ; 002
	scrdef_end

scr_seq_00000002_0000000E:
	setvar VAR_SPECIAL_x8000, 0
	setvar VAR_TEMP_x400F, 0
	setvar VAR_SPECIAL_x8007, 0
	goto scr_seq_00000002_0000005C

scr_seq_00000002_00000026:
	.byte 0x02, 0x00
scr_seq_00000002_00000028:
	setvar VAR_SPECIAL_x8000, 1
	setvar VAR_TEMP_x400F, 12
	setvar VAR_SPECIAL_x8007, 1
	goto scr_seq_00000002_0000005C

scr_seq_00000002_00000040:
	.byte 0x02, 0x00
scr_seq_00000002_00000042:
	setvar VAR_SPECIAL_x8000, 2
	setvar VAR_TEMP_x400F, 24
	setvar VAR_SPECIAL_x8007, 2
	goto scr_seq_00000002_0000005C

scr_seq_00000002_0000005A:
	.byte 0x02, 0x00
scr_seq_00000002_0000005C:
	scrcmd_784 3, 0
	scrcmd_116 1, 21, 1
	setvar VAR_SPECIAL_x8004, 4
	addvar VAR_SPECIAL_x8004, VAR_TEMP_x400F
	scrcmd_046 VAR_SPECIAL_x8004
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000002_00000352
scr_seq_00000002_0000008A:
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	closemsg
	scrcmd_117
	scrcmd_349
	scrcmd_351 32769
	scrcmd_150
	scrcmd_116 1, 21, 1
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	comparevartovalue VAR_SPECIAL_x8001, 255
	gotoif eq, scr_seq_00000002_00000352
	get_partymon_species VAR_SPECIAL_x8001, VAR_SPECIAL_x8002
	comparevartovalue VAR_SPECIAL_x8002, 0
	gotoif eq, scr_seq_00000002_00000391
	scrcmd_652 32769, 32768, 32770
	comparevartovalue VAR_SPECIAL_x8002, 0
	gotoif eq, scr_seq_00000002_000000F0
	goto scr_seq_00000002_00000125

scr_seq_00000002_000000F0:
	comparevartovalue VAR_SPECIAL_x8007, 0
	gotoif ne, scr_seq_00000002_00000106
	msgbox 5
	goto scr_seq_00000002_0000011F

scr_seq_00000002_00000106:
	comparevartovalue VAR_SPECIAL_x8007, 1
	gotoif ne, scr_seq_00000002_0000011C
	msgbox 17
	goto scr_seq_00000002_0000011F

scr_seq_00000002_0000011C:
	msgbox 29
scr_seq_00000002_0000011F:
	goto scr_seq_00000002_0000008A

scr_seq_00000002_00000125:
	setvar VAR_SPECIAL_x8004, 0
	scrcmd_746
	scrcmd_490 32768
	scrcmd_490 32769
	scrcmd_490 32770
	scrcmd_490 32771
scr_seq_00000002_0000013D:
	scrcmd_653 32769, 32768, 32772, 32780
	scrcmd_490 32768
	scrcmd_490 32769
	scrcmd_490 32770
	scrcmd_490 32771
	copyvar VAR_SPECIAL_x8003, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8003, 65533
	gotoif ne, scr_seq_00000002_0000018F
	addvar VAR_SPECIAL_x8004, 1
	comparevartovar VAR_SPECIAL_x8004, VAR_SPECIAL_x8002
	gotoif lt, scr_seq_00000002_0000013D
	setvar VAR_SPECIAL_x8004, 0
	goto scr_seq_00000002_0000013D

scr_seq_00000002_00000189:
	.byte 0x16, 0x00, 0x41, 0x00, 0x00, 0x00
scr_seq_00000002_0000018F:
	comparevartovalue VAR_SPECIAL_x8003, 65534
	gotoif ne, scr_seq_00000002_000001D0
	bufferpartymonnick 0, VAR_SPECIAL_x8001
	setvar VAR_SPECIAL_x8004, 7
	addvar VAR_SPECIAL_x8004, VAR_TEMP_x400F
	scrcmd_046 VAR_SPECIAL_x8004
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000002_00000352
	setvar VAR_SPECIAL_x8004, 0
	closemsg
	goto scr_seq_00000002_0000013D

scr_seq_00000002_000001D0:
	scrcmd_655 32771, 32773
	scrcmd_557 32773, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000002_000001EF
	goto scr_seq_00000002_00000224

scr_seq_00000002_000001EF:
	comparevartovalue VAR_SPECIAL_x8007, 0
	gotoif ne, scr_seq_00000002_00000205
	msgbox 6
	goto scr_seq_00000002_0000021E

scr_seq_00000002_00000205:
	comparevartovalue VAR_SPECIAL_x8007, 1
	gotoif ne, scr_seq_00000002_0000021B
	msgbox 18
	goto scr_seq_00000002_0000021E

scr_seq_00000002_0000021B:
	msgbox 30
scr_seq_00000002_0000021E:
	goto scr_seq_00000002_00000352

scr_seq_00000002_00000224:
	bufferpartymonnick 0, VAR_SPECIAL_x8001
	scrcmd_197 1, 32771
	scrcmd_396 32774, 32769
	comparevartovalue VAR_SPECIAL_x8006, 4
	gotoif lt, scr_seq_00000002_00000328
scr_seq_00000002_00000241:
	setvar VAR_SPECIAL_x8004, 8
	addvar VAR_SPECIAL_x8004, VAR_TEMP_x400F
	scrcmd_046 VAR_SPECIAL_x8004
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000002_000003A4
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	closemsg
	scrcmd_117
	scrcmd_352 1, 32769, 32771
	scrcmd_353 1, 32774
	scrcmd_490 32774
	scrcmd_150
	scrcmd_116 1, 21, 1
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	comparevartovalue VAR_SPECIAL_x8006, 4
	gotoif eq, scr_seq_00000002_000003A4
	scrcmd_490 32774
	scrcmd_399 2, 32769, 32774
	setvar VAR_SPECIAL_x8004, 9
	addvar VAR_SPECIAL_x8004, VAR_TEMP_x400F
	scrcmd_046 VAR_SPECIAL_x8004
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000002_000003A4
	comparevartovalue VAR_SPECIAL_x8007, 0
	gotoif ne, scr_seq_00000002_000002EA
	msgbox 12
	goto scr_seq_00000002_00000303

scr_seq_00000002_000002EA:
	comparevartovalue VAR_SPECIAL_x8007, 1
	gotoif ne, scr_seq_00000002_00000300
	msgbox 24
	goto scr_seq_00000002_00000303

scr_seq_00000002_00000300:
	msgbox 36
scr_seq_00000002_00000303:
	play_se SEQ_SE_DP_KON
	wait_se SEQ_SE_DP_KON
	wait 30, VAR_SPECIAL_x800C
	scrcmd_399 1, 32769, 32774
	setvar VAR_SPECIAL_x8004, 13
	addvar VAR_SPECIAL_x8004, VAR_TEMP_x400F
	scrcmd_046 VAR_SPECIAL_x8004
scr_seq_00000002_00000328:
	scrcmd_197 1, 32771
	setvar VAR_SPECIAL_x8004, 14
	addvar VAR_SPECIAL_x8004, VAR_TEMP_x400F
	scrcmd_046 VAR_SPECIAL_x8004
	play_fanfare SEQ_ME_LVUP
	wait_fanfare
	scrcmd_556 32773
	scrcmd_118 1
	scrcmd_654 32769, 32774, 32771
scr_seq_00000002_00000352:
	comparevartovalue VAR_SPECIAL_x8007, 0
	gotoif ne, scr_seq_00000002_00000368
	msgbox 15
	goto scr_seq_00000002_00000381

scr_seq_00000002_00000368:
	comparevartovalue VAR_SPECIAL_x8007, 1
	gotoif ne, scr_seq_00000002_0000037E
	msgbox 27
	goto scr_seq_00000002_00000381

scr_seq_00000002_0000037E:
	msgbox 39
scr_seq_00000002_00000381:
	waitbutton
	closemsg
	scrcmd_747
	scrcmd_117
	scrcmd_784 3, 1
	endstd
	end

scr_seq_00000002_00000391:
	msgbox 40
	waitbutton
	closemsg
	scrcmd_747
	scrcmd_117
	scrcmd_784 3, 1
	endstd
	end

scr_seq_00000002_000003A4:
	setvar VAR_SPECIAL_x8004, 10
	addvar VAR_SPECIAL_x8004, VAR_TEMP_x400F
	scrcmd_046 VAR_SPECIAL_x8004
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000002_00000241
	setvar VAR_SPECIAL_x8004, 11
	addvar VAR_SPECIAL_x8004, VAR_TEMP_x400F
	scrcmd_046 VAR_SPECIAL_x8004
	goto scr_seq_00000002_00000352

scr_seq_00000002_000003DF:
	.byte 0x02
	.byte 0x00, 0x00, 0x00, 0x00
	.balign 4, 0
