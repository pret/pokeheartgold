#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000860_0000001A ; 000
	scrdef scr_seq_00000860_0000033E ; 001
	scrdef scr_seq_00000860_00000351 ; 002
	scrdef scr_seq_00000860_00000364 ; 003
	scrdef scr_seq_00000860_00000026 ; 004
	scrdef scr_seq_00000860_00000264 ; 005
	scrdef_end

scr_seq_00000860_0000001A:
	setvar VAR_SPECIAL_x8007, 3
	callstd 2002
	end

scr_seq_00000860_00000026:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 12
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000860_0000021D
	scrcmd_815 0
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	closemsg
	scrcmd_493 32780, 32768, 32769
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000860_0000021F
	msgbox 13
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	closemsg
	scrcmd_815 0
	scrcmd_493 32780, 32770, 32771
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000860_0000021F
	scrcmd_498 32780, 32768, 32769, 32770, 32771
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_00000860_000000DD
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000860_00000212
	goto scr_seq_00000860_0000022A

scr_seq_00000860_000000DD:
	scrcmd_499 32780, 32768, 32769, 32770, 32771
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_00000860_00000212
	comparevartovalue VAR_SPECIAL_x800C, 8
	gotoif eq, scr_seq_00000860_0000011D
	comparevartovalue VAR_SPECIAL_x800C, 9
	gotoif eq, scr_seq_00000860_00000157
	comparevartovalue VAR_SPECIAL_x800C, 10
	gotoif eq, scr_seq_00000860_00000191
scr_seq_00000860_0000011D:
	checkflag FLAG_UNK_159
	gotoif eq, scr_seq_00000860_00000212
	scrcmd_332 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif eq, scr_seq_00000860_00000207
	setflag FLAG_UNK_159
	msgbox 18
	scrcmd_190 0
	scrcmd_202 1, 179, 0, 0
	scrcmd_138 179, 14
	goto scr_seq_00000860_000001CB

scr_seq_00000860_00000157:
	checkflag FLAG_UNK_15A
	gotoif eq, scr_seq_00000860_00000212
	scrcmd_332 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif eq, scr_seq_00000860_00000207
	setflag FLAG_UNK_15A
	msgbox 18
	scrcmd_190 0
	scrcmd_202 1, 194, 0, 0
	scrcmd_138 194, 14
	goto scr_seq_00000860_000001CB

scr_seq_00000860_00000191:
	checkflag FLAG_UNK_15B
	gotoif eq, scr_seq_00000860_00000212
	scrcmd_332 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif eq, scr_seq_00000860_00000207
	setflag FLAG_UNK_15B
	msgbox 18
	scrcmd_190 0
	scrcmd_202 1, 218, 0, 0
	scrcmd_138 218, 14
	goto scr_seq_00000860_000001CB

scr_seq_00000860_000001CB:
	closemsg
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000860_000001EC
	apply_movement 8, scr_seq_00000860_0000023C
	goto scr_seq_00000860_000001F4

scr_seq_00000860_000001EC:
	apply_movement 8, scr_seq_00000860_00000250
scr_seq_00000860_000001F4:
	wait_movement
	play_fanfare SEQ_ME_TAMAGO_GET
	msgbox 19
	wait_fanfare
	waitbutton
	goto scr_seq_00000860_00000235

scr_seq_00000860_00000207:
	msgbox 20
	waitbutton
	goto scr_seq_00000860_00000235

scr_seq_00000860_00000212:
	msgbox 14
	waitbutton
	goto scr_seq_00000860_00000235

scr_seq_00000860_0000021D:
	scrcmd_747
scr_seq_00000860_0000021F:
	msgbox 15
	waitbutton
	goto scr_seq_00000860_00000235

scr_seq_00000860_0000022A:
	msgbox 16
	waitbutton
	goto scr_seq_00000860_00000235

scr_seq_00000860_00000235:
	closemsg
	releaseall
	end

scr_seq_00000860_0000023B:
	.byte 0x00

scr_seq_00000860_0000023C:
	.short 63, 1
	.short 32, 1
	.short 63, 2
	.short 33, 1
	.short 254, 0

scr_seq_00000860_00000250:
	.short 63, 1
	.short 32, 1
	.short 63, 2
	.short 35, 1
	.short 254, 0
scr_seq_00000860_00000264:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_2C5
	gotoif eq, scr_seq_00000860_00000280
	msgbox 21
	goto scr_seq_00000860_0000028C

scr_seq_00000860_00000280:
	scrcmd_201 0
	msgbox 26
	goto scr_seq_00000860_0000028C

scr_seq_00000860_0000028C:
	msgbox 22
	scrcmd_746
	scrcmd_287
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 53, 255, 0
	scrcmd_751 54, 255, 1
	scrcmd_751 55, 255, 2
	scrcmd_751 56, 255, 3
	scrcmd_751 44, 255, 4
	scrcmd_752
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_00000860_00000331
	comparevartovalue VAR_SPECIAL_x8008, 65534
	gotoif eq, scr_seq_00000860_00000331
	scrcmd_288 32772, 32773
	scrcmd_849 0, 32773
	scrcmd_851 0
	msgbox 23
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000860_00000313
	goto scr_seq_00000860_0000028C

scr_seq_00000860_00000313:
	scrcmd_747
	scrcmd_849 0, 32773
	msgbox 24
	setflag FLAG_UNK_2C5
	scrcmd_558 32772, 32773
	scrcmd_289 32773
	goto scr_seq_00000860_00000333

scr_seq_00000860_00000331:
	scrcmd_747
scr_seq_00000860_00000333:
	msgbox 25
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000860_0000033E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000860_00000351:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000860_00000364:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 11
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
