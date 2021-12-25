#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000164_0000001A ; 000
	scrdef scr_seq_00000164_0000011C ; 001
	scrdef scr_seq_00000164_000001E1 ; 002
	scrdef scr_seq_00000164_00000521 ; 003
	scrdef scr_seq_00000164_00000714 ; 004
	scrdef scr_seq_00000164_00000766 ; 005
	scrdef_end

scr_seq_00000164_0000001A:
	scrcmd_609
	lockall
	msgbox 0
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000164_00000100
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	msgbox 1
	setvar VAR_SPECIAL_x8004, 437
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	goto scr_seq_00000164_0000005C

scr_seq_00000164_0000005A:
	.byte 0x02, 0x00
scr_seq_00000164_0000005C:
	msgbox 2
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 156, 255, 0
	scrcmd_751 157, 255, 1
	scrcmd_752
	scrcmd_747
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000164_000000A5
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000164_000000EE
	goto scr_seq_00000164_000000EE

scr_seq_00000164_000000A3:
	.byte 0x02, 0x00
scr_seq_00000164_000000A5:
	msgbox 3
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 158, 255, 0
	scrcmd_751 157, 255, 1
	scrcmd_752
	scrcmd_747
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000164_000000A5
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000164_000000EE
	goto scr_seq_00000164_000000EE

scr_seq_00000164_000000EC:
	.byte 0x02, 0x00
scr_seq_00000164_000000EE:
	setvar VAR_UNK_4117, 1
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000164_000000FF:
	.byte 0x00

scr_seq_00000164_00000100:
	.short 32, 1
	.short 63, 2
	.short 12, 4
	.short 14, 1
	.short 0, 1
	.short 63, 2
	.short 254, 0
scr_seq_00000164_0000011C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 5
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000164_0000014F
	goto scr_seq_00000164_00000144

scr_seq_00000164_00000142:
	.byte 0x02, 0x00
scr_seq_00000164_00000144:
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000164_0000014F:
	msgbox 6
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 156, 255, 0
	scrcmd_751 157, 255, 1
	scrcmd_752
	scrcmd_747
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000164_00000198
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000164_00000144
	goto scr_seq_00000164_00000144

scr_seq_00000164_00000196:
	.byte 0x02, 0x00
scr_seq_00000164_00000198:
	msgbox 3
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 158, 255, 0
	scrcmd_751 157, 255, 1
	scrcmd_752
	scrcmd_747
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000164_00000198
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000164_00000144
	goto scr_seq_00000164_00000144

scr_seq_00000164_000001DF:
	.byte 0x02
	.byte 0x00
scr_seq_00000164_000001E1:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_584 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000164_000004EC
	scrcmd_187 32780
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_00000164_0000031B
	scrcmd_332 VAR_TEMP_x4009
	setvar VAR_TEMP_x400A, 0
scr_seq_00000164_00000215:
	get_partymon_species VAR_TEMP_x400A, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 172
	gotoif ne, scr_seq_00000164_00000241
	get_partymon_forme VAR_TEMP_x400A, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000164_00000241
	goto scr_seq_00000164_000004F8

scr_seq_00000164_00000241:
	addvar VAR_TEMP_x400A, 1
	comparevartovar VAR_TEMP_x400A, VAR_TEMP_x4009
	gotoif ge, scr_seq_00000164_0000025A
	goto scr_seq_00000164_00000215

scr_seq_00000164_0000025A:
	goto scr_seq_00000164_00000262

scr_seq_00000164_00000260:
	.byte 0x02, 0x00
scr_seq_00000164_00000262:
	msgbox 7
scr_seq_00000164_00000265:
	scrcmd_746
	scrcmd_750 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 14, 255, 0
	scrcmd_751 15, 255, 1
	scrcmd_751 16, 255, 2
	scrcmd_752
	scrcmd_747
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000164_000002BE
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000164_000002B3
	goto scr_seq_00000164_00000326

scr_seq_00000164_000002B1:
	.byte 0x02, 0x00
scr_seq_00000164_000002B3:
	msgbox 13
	goto scr_seq_00000164_00000265

scr_seq_00000164_000002BC:
	.byte 0x02, 0x00
scr_seq_00000164_000002BE:
	scrcmd_565 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000164_000002D7
	goto scr_seq_00000164_00000331

scr_seq_00000164_000002D5:
	.byte 0x02, 0x00
scr_seq_00000164_000002D7:
	scrcmd_564 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000164_00000310
	goto scr_seq_00000164_000002F0

scr_seq_00000164_000002EE:
	.byte 0x02, 0x00
scr_seq_00000164_000002F0:
	msgbox 11
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000164_00000331
	goto scr_seq_00000164_00000326

scr_seq_00000164_0000030E:
	.byte 0x02, 0x00
scr_seq_00000164_00000310:
	msgbox 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000164_0000031B:
	msgbox 17
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000164_00000326:
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000164_00000331:
	callstd 2006
	copyvar VAR_SPECIAL_x800C, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000164_00000356
	goto scr_seq_00000164_00000326

scr_seq_00000164_0000034E:
	.byte 0x02, 0x00
scr_seq_00000164_00000350:
	callstd 2041
	end

scr_seq_00000164_00000356:
	scrcmd_689 32780
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_00000164_00000350
	msgbox 10
	closemsg
	scrcmd_600
	scrcmd_282
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_815 0
	apply_movement 255, scr_seq_00000164_00000474
	wait_movement
	goto scr_seq_00000164_0000038C

scr_seq_00000164_0000038A:
	.byte 0x02, 0x00
scr_seq_00000164_0000038C:
	scrcmd_307 0, 0, 9, 5, 77
	call scr_seq_00000164_000003E0
	apply_movement 255, scr_seq_00000164_00000480
	wait_movement
	call scr_seq_00000164_000003E8
	apply_movement 255, scr_seq_00000164_00000488
	wait_movement
	scrcmd_307 0, 0, 9, 2, 77
	call scr_seq_00000164_000003E0
	apply_movement 255, scr_seq_00000164_00000490
	wait_movement
	call scr_seq_00000164_000003E8
	goto scr_seq_00000164_000003F3

scr_seq_00000164_000003DE:
	.byte 0x02, 0x00
scr_seq_00000164_000003E0:
	scrcmd_310 77
	scrcmd_308 77
	return

scr_seq_00000164_000003E8:
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	return

scr_seq_00000164_000003F3:
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_436
	scrcmd_565 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000164_0000041A
	scrcmd_152
	goto scr_seq_00000164_0000041C

scr_seq_00000164_0000041A:
	scrcmd_152
scr_seq_00000164_0000041C:
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	scrcmd_307 0, 0, 8, 2, 77
	call scr_seq_00000164_000003E0
	apply_movement 255, scr_seq_00000164_000004A8
	wait_movement
	call scr_seq_00000164_000003E8
	scrcmd_307 0, 0, 8, 5, 77
	call scr_seq_00000164_000003E0
	apply_movement 255, scr_seq_00000164_000004C0
	wait_movement
	call scr_seq_00000164_000003E8
	scrcmd_606
	releaseall
	end

scr_seq_00000164_00000472:
	.byte 0x00, 0x00

scr_seq_00000164_00000474:
	.short 15, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000164_00000480:
	.short 12, 2
	.short 254, 0

scr_seq_00000164_00000488:
	.short 12, 1
	.short 254, 0

scr_seq_00000164_00000490:
	.short 12, 1
	.short 69, 1
	.short 254, 0

scr_seq_00000164_0000049C:
	.short 12, 2
	.short 69, 1
	.short 254, 0

scr_seq_00000164_000004A8:
	.short 1, 1
	.short 70, 1
	.short 13, 2
	.short 254, 0
	.byte 0x0d, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_00000164_000004C0:
	.short 13, 2
	.short 254, 0

scr_seq_00000164_000004C8:
	.short 35, 1
	.short 254, 0

scr_seq_00000164_000004D0:
	.short 12, 1
	.short 15, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000164_000004E0:
	.short 12, 1
	.short 69, 1
	.short 254, 0
scr_seq_00000164_000004EC:
	callstd 9016
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000164_000004F8:
	scrcmd_490 16385
	scrcmd_490 16386
	comparevartovalue VAR_UNK_412F, 0
	gotoif ne, scr_seq_00000164_00000516
	msgbox 29
	goto scr_seq_00000164_00000519

scr_seq_00000164_00000516:
	msgbox 28
scr_seq_00000164_00000519:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000164_00000521:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_187 32780
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_00000164_00000709
	scrcmd_691 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000164_00000560
	scrcmd_446 16470
	copyvar VAR_UNK_4055, VAR_SPECIAL_x800D
	msgbox 18
	goto scr_seq_00000164_0000056B

scr_seq_00000164_0000055E:
	.byte 0x02, 0x00
scr_seq_00000164_00000560:
	msgbox 26
	goto scr_seq_00000164_000005C4

scr_seq_00000164_00000569:
	.byte 0x02, 0x00
scr_seq_00000164_0000056B:
	scrcmd_746
	scrcmd_750 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 23, 255, 0
	scrcmd_751 24, 255, 1
	scrcmd_751 25, 255, 2
	scrcmd_752
	scrcmd_747
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000164_000005D7
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000164_000005CC
	goto scr_seq_00000164_000005B9

scr_seq_00000164_000005B7:
	.byte 0x02, 0x00
scr_seq_00000164_000005B9:
	msgbox 21
	goto scr_seq_00000164_000005C4

scr_seq_00000164_000005C2:
	.byte 0x02, 0x00
scr_seq_00000164_000005C4:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000164_000005CC:
	msgbox 22
	goto scr_seq_00000164_0000056B

scr_seq_00000164_000005D5:
	.byte 0x02, 0x00
scr_seq_00000164_000005D7:
	callstd 2006
	copyvar VAR_SPECIAL_x800C, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000164_000005B9
	msgbox 20
	closemsg
	scrcmd_600
	scrcmd_282
	scrcmd_815 0
	apply_movement 255, scr_seq_00000164_00000474
	wait_movement
	scrcmd_307 0, 0, 5, 5, 77
	call scr_seq_00000164_000003E0
	apply_movement VAR_SPECIAL_x800D, scr_seq_00000164_000004C8
	apply_movement 255, scr_seq_00000164_00000480
	wait_movement
	call scr_seq_00000164_000003E8
	apply_movement VAR_SPECIAL_x800D, scr_seq_00000164_000004D0
	wait_movement
	scrcmd_307 0, 0, 5, 2, 77
	call scr_seq_00000164_000003E0
	apply_movement 255, scr_seq_00000164_0000049C
	apply_movement VAR_SPECIAL_x800D, scr_seq_00000164_000004E0
	wait_movement
	call scr_seq_00000164_000003E8
	setvar VAR_TEMP_x4003, 0
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 516, 0, 20, 11, 0
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000164_0000068F:
	.byte 0xae
	.byte 0x00, 0x06, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0xaf, 0x00, 0xb4, 0x01, 0xa6, 0x00, 0x0c
	.byte 0x80, 0x2a, 0x00, 0x04, 0x80, 0x0c, 0x80, 0x97, 0x02, 0x04, 0x80, 0x96, 0x00, 0xae, 0x00, 0x06
	.byte 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0xaf, 0x00, 0x33, 0x01, 0x00, 0x00, 0x00, 0x00, 0x05
	.byte 0x00, 0x02, 0x00, 0x4d, 0x1a, 0x00, 0x16, 0xfd, 0xff, 0xff, 0x5e, 0x00, 0xff, 0x00, 0xd6, 0xfd
	.byte 0xff, 0xff, 0x5f, 0x00, 0x1a, 0x00, 0x0e, 0xfd, 0xff, 0xff, 0x5e, 0x00, 0xff, 0x00, 0xd6, 0xfd
	.byte 0xff, 0xff, 0x5f, 0x00, 0x33, 0x01, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x05, 0x00, 0x4d, 0x1a
	.byte 0x00, 0xeb, 0xfc, 0xff, 0xff, 0x5e, 0x00, 0xff, 0x00, 0xc3, 0xfd, 0xff, 0xff, 0x5f, 0x00, 0x1a
	.byte 0x00, 0xe3, 0xfc, 0xff, 0xff, 0x61, 0x00, 0x02, 0x00
scr_seq_00000164_00000709:
	msgbox 27
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000164_00000714:
	scrcmd_609
	lockall
	scrcmd_307 0, 0, 5, 2, 77
	call scr_seq_00000164_000003E0
	apply_movement 255, scr_seq_00000164_000004A8
	wait_movement
	call scr_seq_00000164_000003E8
	scrcmd_307 0, 0, 5, 5, 77
	call scr_seq_00000164_000003E0
	apply_movement 255, scr_seq_00000164_000004C0
	wait_movement
	call scr_seq_00000164_000003E8
	scrcmd_606
	setvar VAR_UNK_4137, 0
	releaseall
	end

scr_seq_00000164_00000766:
	debugwatch VAR_UNK_4143
	setvar VAR_UNK_414F, 0
	setvar VAR_UNK_4150, 0
	setvar VAR_UNK_4143, 0
	setvar VAR_UNK_4144, 0
	setvar VAR_UNK_4148, 0
	setvar VAR_UNK_4146, 0
	setvar VAR_UNK_4149, 0
	setvar VAR_UNK_414B, 0
	setvar VAR_UNK_4142, 0
	setvar VAR_UNK_4147, 0
	setvar VAR_UNK_4145, 0
	setvar VAR_UNK_414A, 0
	debugwatch VAR_UNK_4143
	end
	.balign 4, 0
