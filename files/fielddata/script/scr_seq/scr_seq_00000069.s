#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000069_00000259 ; 000
	scrdef scr_seq_00000069_00000BBF ; 001
	scrdef scr_seq_00000069_000008BC ; 002
	scrdef scr_seq_00000069_00000FB9 ; 003
	scrdef scr_seq_00000069_0000059F ; 004
	scrdef scr_seq_00000069_0000064C ; 005
	scrdef scr_seq_00000069_0000014D ; 006
	scrdef scr_seq_00000069_000007D7 ; 007
	scrdef scr_seq_00000069_000014AD ; 008
	scrdef scr_seq_00000069_00001380 ; 009
	scrdef scr_seq_00000069_0000139A ; 010
	scrdef scr_seq_00000069_000013B4 ; 011
	scrdef scr_seq_00000069_000013CE ; 012
	scrdef scr_seq_00000069_00001428 ; 013
	scrdef scr_seq_00000069_0000143B ; 014
	scrdef scr_seq_00000069_0000144E ; 015
	scrdef scr_seq_00000069_00001461 ; 016
	scrdef scr_seq_00000069_00001474 ; 017
	scrdef scr_seq_00000069_00001487 ; 018
	scrdef scr_seq_00000069_0000149A ; 019
	scrdef scr_seq_00000069_000014AF ; 020
	scrdef scr_seq_00000069_00000062 ; 021
	scrdef scr_seq_00000069_000000AA ; 022
	scrdef scr_seq_00000069_000014DC ; 023
	scrdef_end

scr_seq_00000069_00000062:
	comparevartovalue VAR_UNK_414B, 1
	callif eq, scr_seq_00000069_000000A6
	comparevartovalue VAR_UNK_414B, 3
	callif eq, scr_seq_00000069_000000A6
	comparevartovalue VAR_UNK_414B, 255
	callif eq, scr_seq_00000069_000000A6
	scrcmd_415 16384
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_00000069_000000A0
	setflag FLAG_UNK_22F
	end

scr_seq_00000069_000000A0:
	clearflag FLAG_UNK_22F
	end

scr_seq_00000069_000000A6:
	scrcmd_521
	return

scr_seq_00000069_000000AA:
	comparevartovalue VAR_UNK_414B, 1
	gotoif ne, scr_seq_00000069_000000EF
	scrcmd_415 16384
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_00000069_000000F1
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_00000069_000000F1
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif eq, scr_seq_00000069_000000F1
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif eq, scr_seq_00000069_000000F1
scr_seq_00000069_000000EF:
	end

scr_seq_00000069_000000F1:
	scrcmd_344 3, 2
	end

scr_seq_00000069_000000F9:
	setvar VAR_UNK_414B, 255
	setvar VAR_UNK_414D, 1
	setvar VAR_UNK_414E, 1
	setvar VAR_UNK_414C, 1
	return

scr_seq_00000069_00000113:
	setvar VAR_UNK_414B, 255
	setvar VAR_UNK_414D, 3
	setvar VAR_UNK_414F, 1
	setvar VAR_UNK_4150, 1
	setvar VAR_UNK_4151, 1
	return

scr_seq_00000069_00000133:
	setvar VAR_UNK_414B, 255
	setvar VAR_UNK_414D, 1
	setvar VAR_UNK_414E, 1
	setvar VAR_UNK_414C, 2
	return

scr_seq_00000069_0000014D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4001, 0
	scrcmd_414 16386
	goto scr_seq_00000069_00000167

scr_seq_00000069_00000165:
	.byte 0x02, 0x00
scr_seq_00000069_00000167:
	copyvar VAR_SPECIAL_x8008, VAR_TEMP_x4002
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000069_000001DA
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000069_000001ED
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000069_00000200
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_00000069_000001CF
	msgbox 15
	goto scr_seq_00000069_000001AC

scr_seq_00000069_000001AA:
	.byte 0x02, 0x00
scr_seq_00000069_000001AC:
	waitbutton
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000069_000001C1
	closemsg
	releaseall
	end

scr_seq_00000069_000001C1:
	call scr_seq_00000069_00000872
	goto scr_seq_00000069_00000860

scr_seq_00000069_000001CD:
	.byte 0x02, 0x00
scr_seq_00000069_000001CF:
	msgbox 89
	goto scr_seq_00000069_000001AC

scr_seq_00000069_000001D8:
	.byte 0x02, 0x00
scr_seq_00000069_000001DA:
	scrcmd_198 0, 20
	setvar VAR_SPECIAL_x8004, 85
	goto scr_seq_00000069_00000213

scr_seq_00000069_000001EB:
	.byte 0x02, 0x00
scr_seq_00000069_000001ED:
	scrcmd_198 0, 50
	setvar VAR_SPECIAL_x8004, 86
	goto scr_seq_00000069_00000213

scr_seq_00000069_000001FE:
	.byte 0x02, 0x00
scr_seq_00000069_00000200:
	scrcmd_198 0, 100
	setvar VAR_SPECIAL_x8004, 87
	goto scr_seq_00000069_00000213

scr_seq_00000069_00000211:
	.byte 0x02, 0x00
scr_seq_00000069_00000213:
	msgbox 88
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	comparevartovalue VAR_SPECIAL_x8004, 85
	gotoif ne, scr_seq_00000069_00000233
	clearflag FLAG_UNK_2A9
	goto scr_seq_00000069_0000024E

scr_seq_00000069_00000233:
	comparevartovalue VAR_SPECIAL_x8004, 86
	gotoif ne, scr_seq_00000069_0000024A
	clearflag FLAG_UNK_2AA
	goto scr_seq_00000069_0000024E

scr_seq_00000069_0000024A:
	clearflag FLAG_UNK_2AB
scr_seq_00000069_0000024E:
	msgbox 15
	goto scr_seq_00000069_000001AC

scr_seq_00000069_00000257:
	.byte 0x02, 0x00
scr_seq_00000069_00000259:
	scrcmd_609
	lockall
	play_se SEQ_SE_DP_SELECT
	scrcmd_409
	msgbox 0
	goto scr_seq_00000069_0000026E

scr_seq_00000069_0000026C:
	.byte 0x02, 0x00
scr_seq_00000069_0000026E:
	msgbox 1
	call scr_seq_00000069_000002AC
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000069_000002D2
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000069_000002A1
	scrcmd_747
	goto scr_seq_00000069_0000085B

scr_seq_00000069_0000029F:
	.byte 0x02
	.byte 0x00
scr_seq_00000069_000002A1:
	msgbox 3
	goto scr_seq_00000069_0000026E

scr_seq_00000069_000002AA:
	.byte 0x02, 0x00
scr_seq_00000069_000002AC:
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 143, 255, 0
	scrcmd_751 144, 255, 1
	scrcmd_751 145, 255, 2
	scrcmd_752
	return

scr_seq_00000069_000002D2:
	msgbox 4
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 475, 255, 0
	scrcmd_751 476, 255, 1
	scrcmd_751 94, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000069_00000321
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000069_00000356
	scrcmd_747
	goto scr_seq_00000069_0000085B

scr_seq_00000069_0000031F:
	.byte 0x02
	.byte 0x00
scr_seq_00000069_00000321:
	scrcmd_410 0, 0
	goto scr_seq_00000069_0000032F

scr_seq_00000069_0000032D:
	.byte 0x02, 0x00
scr_seq_00000069_0000032F:
	scrcmd_412 1, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000069_00000383
	scrcmd_747
	scrcmd_444 91, 3, 0, 0
	goto scr_seq_00000069_0000085E

scr_seq_00000069_00000354:
	.byte 0x02, 0x00
scr_seq_00000069_00000356:
	scrcmd_410 0, 1
	scrcmd_412 1, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000069_0000042F
	scrcmd_747
	scrcmd_444 91, 4, 0, 0
	goto scr_seq_00000069_0000085E

scr_seq_00000069_00000381:
	.byte 0x02, 0x00
scr_seq_00000069_00000383:
	msgbox 8
	call scr_seq_00000069_00000560
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000069_0000085B
	scrcmd_412 32, 0, 32780
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000069_00000546
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000069_00000553
	scrcmd_412 53, 0, 32780
	scrcmd_690 32780, 32780
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_00000069_000014C8
	scrcmd_412 53, 1, 32780
	scrcmd_690 32780, 32780
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_00000069_000014C8
	scrcmd_412 53, 2, 32780
	scrcmd_690 32780, 32780
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_00000069_000014C8
	scrcmd_412 43, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif eq, scr_seq_00000069_00000A97
	goto scr_seq_00000069_000004F6

scr_seq_00000069_0000042D:
	.byte 0x02, 0x00
scr_seq_00000069_0000042F:
	msgbox 8
	call scr_seq_00000069_00000560
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000069_0000085B
	scrcmd_412 32, 0, 32780
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000069_00000546
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000069_00000553
	scrcmd_412 53, 0, 32780
	scrcmd_690 32780, 32780
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_00000069_000014C8
	scrcmd_412 53, 1, 32780
	scrcmd_690 32780, 32780
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_00000069_000014C8
	scrcmd_412 53, 2, 32780
	scrcmd_690 32780, 32780
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_00000069_000014C8
	scrcmd_412 53, 3, 32780
	scrcmd_690 32780, 32780
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_00000069_000014C8
	scrcmd_412 43, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif eq, scr_seq_00000069_00000A97
	goto scr_seq_00000069_000004F6

scr_seq_00000069_000004F4:
	.byte 0x02, 0x00
scr_seq_00000069_000004F6:
	call scr_seq_00000069_000000F9
	scrcmd_412 5, 0, 0
	heal_party
	call scr_seq_00000069_0000053A
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000069_00000855
	scrcmd_815 0
	scrcmd_412 57, 0, 32780
	scrcmd_412 52, 0, 0
	msgbox 11
	scrcmd_049
	goto scr_seq_00000069_000006CD

scr_seq_00000069_00000538:
	.byte 0x02, 0x00
scr_seq_00000069_0000053A:
	callstd 2006
	copyvar VAR_SPECIAL_x800C, VAR_TEMP_x4000
	return

scr_seq_00000069_00000546:
	msgbox 9
	scrcmd_747
	goto scr_seq_00000069_0000085B

scr_seq_00000069_00000551:
	.byte 0x02, 0x00
scr_seq_00000069_00000553:
	msgbox 10
	scrcmd_747
	goto scr_seq_00000069_0000085B

scr_seq_00000069_0000055E:
	.byte 0x02, 0x00
scr_seq_00000069_00000560:
	fade_screen 6, 1, 0, 0
	wait_fade
	closemsg
	scrcmd_412 30, 0, 0
	scrcmd_412 31, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000069_0000058F
	scrcmd_815 0
scr_seq_00000069_0000058F:
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	return

scr_seq_00000069_0000059F:
	scrcmd_609
	lockall
	setvar VAR_UNK_414B, 0
	scrcmd_412 4, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000069_0000064C
	msgbox 16
	scrcmd_410 1, 65535
	scrcmd_412 43, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_00000069_000005FD
	call scr_seq_00000069_00000133
	scrcmd_412 5, 0, 0
	call scr_seq_00000069_00000817
	msgbox 11
	scrcmd_049
	goto scr_seq_00000069_000006CD

scr_seq_00000069_000005FB:
	.byte 0x02, 0x00
scr_seq_00000069_000005FD:
	call scr_seq_00000069_0000062C
	scrcmd_412 5, 0, 0
	call scr_seq_00000069_00000817
	scrcmd_412 51, 0, 32780
	copyvar VAR_TEMP_x4009, VAR_SPECIAL_x800C
	msgbox 32
	scrcmd_049
	goto scr_seq_00000069_000006CD

scr_seq_00000069_0000062A:
	.byte 0x02, 0x00
scr_seq_00000069_0000062C:
	setvar VAR_UNK_414B, 255
	setvar VAR_UNK_414D, 2
	setvar VAR_UNK_414F, 1
	setvar VAR_UNK_4150, 2
	setvar VAR_UNK_4151, 0
	return

scr_seq_00000069_0000064C:
	scrcmd_609
	lockall
	msgbox 19
	scrcmd_412 14, 0, 32780
	comparevartovalue VAR_UNK_404D, 1
	callif eq, scr_seq_00000069_0000068A
	comparevartovalue VAR_UNK_404D, 3
	callif eq, scr_seq_00000069_00000692
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif eq, scr_seq_00000069_0000069A
	goto scr_seq_00000069_00000855

scr_seq_00000069_00000688:
	.byte 0x02, 0x00
scr_seq_00000069_0000068A:
	setvar VAR_UNK_404D, 0
	return

scr_seq_00000069_00000692:
	setvar VAR_UNK_404D, 2
	return

scr_seq_00000069_0000069A:
	scrcmd_412 9, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000069_00000855
	scrcmd_412 10, 0, 32780
	copyvar VAR_SPECIAL_x8000, VAR_SPECIAL_x800C
	scrcmd_198 0, 32768
	msgbox 65
	goto scr_seq_00000069_00000855

scr_seq_00000069_000006CB:
	.byte 0x02, 0x00
scr_seq_00000069_000006CD:
	closemsg
	scrcmd_412 43, 0, 32780
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_00000069_00000733
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_00000069_00000733
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000069_0000074D
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000069_00000767
	goto scr_seq_00000069_00000719

scr_seq_00000069_00000717:
	.byte 0x02, 0x00
scr_seq_00000069_00000719:
	setvar VAR_TEMP_x4002, 0
	setvar VAR_TEMP_x4003, 15
	call scr_seq_00000069_0000078F
	goto scr_seq_00000069_00000829

scr_seq_00000069_00000731:
	.byte 0x02, 0x00
scr_seq_00000069_00000733:
	setvar VAR_TEMP_x4002, 2
	setvar VAR_TEMP_x4003, 19
	call scr_seq_00000069_0000078F
	goto scr_seq_00000069_00000829

scr_seq_00000069_0000074B:
	.byte 0x02, 0x00
scr_seq_00000069_0000074D:
	setvar VAR_TEMP_x4002, 1
	setvar VAR_TEMP_x4003, 11
	call scr_seq_00000069_0000078F
	goto scr_seq_00000069_000007CF

scr_seq_00000069_00000765:
	.byte 0x02, 0x00
scr_seq_00000069_00000767:
	setvar VAR_TEMP_x4002, 1
	setvar VAR_TEMP_x4003, 11
	call scr_seq_00000069_0000078F
	goto scr_seq_00000069_00000781

scr_seq_00000069_0000077F:
	.byte 0x02
	.byte 0x00
scr_seq_00000069_00000781:
	setvar VAR_UNK_414D, 2
	goto scr_seq_00000069_00000829

scr_seq_00000069_0000078D:
	.byte 0x02, 0x00
scr_seq_00000069_0000078F:
	apply_movement VAR_TEMP_x4002, scr_seq_00000069_00001348
	apply_movement 255, scr_seq_00000069_00001360
	wait_movement
	scrcmd_307 0, 0, 16387, 2, 77
	scrcmd_310 77
	scrcmd_308 77
	apply_movement VAR_TEMP_x4002, scr_seq_00000069_00001354
	apply_movement 255, scr_seq_00000069_0000136C
	wait_movement
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	return

scr_seq_00000069_000007CF:
	goto scr_seq_00000069_00000829

scr_seq_00000069_000007D5:
	.byte 0x02, 0x00
scr_seq_00000069_000007D7:
	scrcmd_609
	lockall
	call scr_seq_00000069_00000807
	scrcmd_412 100, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000069_0000085B
	msgbox 56
	call scr_seq_00000069_00000817
	goto scr_seq_00000069_00000855

scr_seq_00000069_00000805:
	.byte 0x02, 0x00
scr_seq_00000069_00000807:
	call scr_seq_00000069_00000890
	scrcmd_412 6, 0, 0
	return

scr_seq_00000069_00000817:
	scrcmd_345
	scrcmd_254 32780
	scrcmd_346
	play_se SEQ_SE_DP_SAVE
	wait_se SEQ_SE_DP_SAVE
	return

scr_seq_00000069_00000829:
	scrcmd_420 59
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 266, 0, 3, 6, 0
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_00000069_00000855:
	call scr_seq_00000069_00000872
scr_seq_00000069_0000085B:
	msgbox 2
scr_seq_00000069_0000085E:
	waitbutton
scr_seq_00000069_00000860:
	closemsg
	call scr_seq_00000069_0000088C
	call scr_seq_00000069_00000890
	releaseall
	end

scr_seq_00000069_00000872:
	scrcmd_412 6, 0, 0
	call scr_seq_00000069_00000882
	return

scr_seq_00000069_00000882:
	scrcmd_412 3, 0, 0
	return

scr_seq_00000069_0000088C:
	scrcmd_411
	return

scr_seq_00000069_00000890:
	setvar VAR_UNK_414B, 0
	setvar VAR_UNK_414D, 0
	setvar VAR_UNK_414E, 0
	setvar VAR_UNK_414F, 0
	setvar VAR_UNK_414C, 0
	setvar VAR_UNK_4150, 0
	setvar VAR_UNK_4151, 0
	return

scr_seq_00000069_000008BC:
	scrcmd_609
	lockall
	play_se SEQ_SE_DP_SELECT
	scrcmd_409
	scrcmd_412 12, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000069_000009F7
	msgbox 36
	goto scr_seq_00000069_000008E6

scr_seq_00000069_000008E4:
	.byte 0x02, 0x00
scr_seq_00000069_000008E6:
	scrcmd_412 15, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000069_00000974
	goto scr_seq_00000069_00000903

scr_seq_00000069_00000901:
	.byte 0x02, 0x00
scr_seq_00000069_00000903:
	msgbox 37
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 143, 255, 0
	scrcmd_751 155, 255, 1
	scrcmd_751 144, 255, 2
	scrcmd_751 145, 255, 3
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000069_00000B97
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000069_00000B46
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000069_00000969
	scrcmd_747
	goto scr_seq_00000069_0000085B

scr_seq_00000069_00000967:
	.byte 0x02, 0x00
scr_seq_00000069_00000969:
	msgbox 38
	goto scr_seq_00000069_000008E6

scr_seq_00000069_00000972:
	.byte 0x02, 0x00
scr_seq_00000069_00000974:
	msgbox 37
	call scr_seq_00000069_000009C1
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000069_00000B97
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000069_00000B46
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000069_00000BA5
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000069_00000969
	scrcmd_747
	goto scr_seq_00000069_0000085B

scr_seq_00000069_000009BF:
	.byte 0x02
	.byte 0x00
scr_seq_00000069_000009C1:
	scrcmd_746
	scrcmd_749 12, 7, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 143, 255, 0
	scrcmd_751 153, 255, 1
	scrcmd_751 154, 255, 2
	scrcmd_751 144, 255, 3
	scrcmd_751 145, 255, 4
	scrcmd_752
	return

scr_seq_00000069_000009F7:
	msgbox 61
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000069_000008E6
	call scr_seq_00000069_0000053A
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000069_0000085B
	scrcmd_815 0
	call scr_seq_00000069_00000A42
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000069_0000085B
	msgbox 60
	goto scr_seq_00000069_0000085B

scr_seq_00000069_00000A40:
	.byte 0x02, 0x00
scr_seq_00000069_00000A42:
	closemsg
	setvar VAR_TEMP_x4001, 1
	call scr_seq_00000069_00000A52
	return

scr_seq_00000069_00000A52:
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_166 16384
	scrcmd_412 16, 16385, 16384
	copyvar VAR_TEMP_x4001, VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif eq, scr_seq_00000069_00000A81
	scrcmd_815 0
scr_seq_00000069_00000A81:
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	copyvar VAR_SPECIAL_x800C, VAR_TEMP_x4001
	return

scr_seq_00000069_00000A97:
	heal_party
	call scr_seq_00000069_0000053A
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000069_00000855
	call scr_seq_00000069_000000F9
	scrcmd_412 5, 0, 0
	heal_party
	closemsg
	setvar VAR_TEMP_x4001, 0
	call scr_seq_00000069_00000A52
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000069_00000855
	goto scr_seq_00000069_00000ADF

scr_seq_00000069_00000ADD:
	.byte 0x02, 0x00
scr_seq_00000069_00000ADF:
	msgbox 47
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000069_000006CD
	msgbox 48
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000069_00000ADF
	setvar VAR_UNK_414B, 2
	scrcmd_412 39, 0, 0
	scrcmd_411
	msgbox 56
	call scr_seq_00000069_00000817
	scrcmd_348 30
	fade_screen 6, 1, 0, 0
	wait_fade
	closemsg
	scrcmd_412 2, 0, 0
	releaseall
	end

scr_seq_00000069_00000B46:
	call scr_seq_00000069_0000053A
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000069_0000085B
	closemsg
	setvar VAR_TEMP_x4001, 2
	scrcmd_815 0
	call scr_seq_00000069_00000A52
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000069_0000085B
	scrcmd_418 32772, 32773
	scrcmd_198 0, 32772
	scrcmd_541 1, 32773, 2, 3
	msgbox 52
	scrcmd_049
	goto scr_seq_00000069_00000860

scr_seq_00000069_00000B95:
	.byte 0x02, 0x00
scr_seq_00000069_00000B97:
	scrcmd_410 0, 4
	goto scr_seq_00000069_0000032F

scr_seq_00000069_00000BA3:
	.byte 0x02, 0x00
scr_seq_00000069_00000BA5:
	scrcmd_410 0, 5
	goto scr_seq_00000069_0000032F

scr_seq_00000069_00000BB1:
	.byte 0x02, 0x00
scr_seq_00000069_00000BB3:
	apply_movement 255, scr_seq_00000069_00001378
	wait_movement
	return

scr_seq_00000069_00000BBF:
	scrcmd_609
	lockall
	play_se SEQ_SE_DP_SELECT
	scrcmd_409
	msgbox 20
	goto scr_seq_00000069_00000BD4

scr_seq_00000069_00000BD2:
	.byte 0x02, 0x00
scr_seq_00000069_00000BD4:
	msgbox 21
	call scr_seq_00000069_000002AC
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000069_00000C12
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000069_00000C07
	scrcmd_747
	goto scr_seq_00000069_0000085B

scr_seq_00000069_00000C05:
	.byte 0x02, 0x00
scr_seq_00000069_00000C07:
	msgbox 23
	goto scr_seq_00000069_00000BD4

scr_seq_00000069_00000C10:
	.byte 0x02, 0x00
scr_seq_00000069_00000C12:
	scrcmd_412 1, 2, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000069_00000C39
	scrcmd_747
	scrcmd_444 91, 2, 0, 0
	goto scr_seq_00000069_0000085E

scr_seq_00000069_00000C37:
	.byte 0x02, 0x00
scr_seq_00000069_00000C39:
	msgbox 26
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000069_00000C69
	goto scr_seq_00000069_00000C55

scr_seq_00000069_00000C53:
	.byte 0x02, 0x00
scr_seq_00000069_00000C55:
	scrcmd_410 0, 2
	setvar VAR_TEMP_x4001, 0
	goto scr_seq_00000069_00000C7D

scr_seq_00000069_00000C67:
	.byte 0x02, 0x00
scr_seq_00000069_00000C69:
	scrcmd_410 0, 3
	setvar VAR_TEMP_x4001, 1
	goto scr_seq_00000069_00000C7D

scr_seq_00000069_00000C7B:
	.byte 0x02, 0x00
scr_seq_00000069_00000C7D:
	msgbox 8
	call scr_seq_00000069_00000560
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000069_0000085B
	scrcmd_412 32, 0, 32780
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000069_00000546
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000069_00000553
	scrcmd_412 53, 0, 32780
	scrcmd_690 32780, 32780
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_00000069_000014C8
	scrcmd_412 53, 1, 32780
	scrcmd_690 32780, 32780
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_00000069_000014C8
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000069_00000D40
	call scr_seq_00000069_00000113
	scrcmd_412 5, 0, 0
	heal_party
	call scr_seq_00000069_0000053A
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000069_00000855
	scrcmd_815 0
	scrcmd_412 57, 0, 32780
	scrcmd_412 52, 0, 0
	msgbox 35
	goto scr_seq_00000069_000006CD

scr_seq_00000069_00000D3E:
	.byte 0x02, 0x00
scr_seq_00000069_00000D40:
	heal_party
	call scr_seq_00000069_0000053A
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000069_00000855
scr_seq_00000069_00000D55:
	msgbox 27
	scrcmd_746
	scrcmd_749 18, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 14, 255, 0
	scrcmd_751 15, 255, 1
	scrcmd_751 5, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000069_00000DA6
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000069_00000DFE
	scrcmd_747
	goto scr_seq_00000069_00000855

scr_seq_00000069_00000DA4:
	.byte 0x02, 0x00
scr_seq_00000069_00000DA6:
	msgbox 112
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000069_00000D55
	scrcmd_747
	closemsg
	scrcmd_226 16, 0, 0, 32780
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000069_00000DEC
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_00000069_00000DF4
	goto scr_seq_00000069_00000E56

scr_seq_00000069_00000DEA:
	.byte 0x02, 0x00
scr_seq_00000069_00000DEC:
	goto scr_seq_00000069_00000D55

scr_seq_00000069_00000DF2:
	.byte 0x02, 0x00
scr_seq_00000069_00000DF4:
	scrcmd_283
	goto scr_seq_00000069_00000D55

scr_seq_00000069_00000DFC:
	.byte 0x02, 0x00
scr_seq_00000069_00000DFE:
	msgbox 112
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000069_00000D55
	scrcmd_747
	closemsg
	scrcmd_227 16, 0, 0, 32780
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000069_00000E44
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_00000069_00000E4C
	goto scr_seq_00000069_00000E56

scr_seq_00000069_00000E42:
	.byte 0x02, 0x00
scr_seq_00000069_00000E44:
	goto scr_seq_00000069_00000D55

scr_seq_00000069_00000E4A:
	.byte 0x02, 0x00
scr_seq_00000069_00000E4C:
	scrcmd_283
	goto scr_seq_00000069_00000D55

scr_seq_00000069_00000E54:
	.byte 0x02, 0x00
scr_seq_00000069_00000E56:
	scrcmd_258
	scrcmd_257 1
	scrcmd_412 58, 0, 0
	goto scr_seq_00000069_00000E6C

scr_seq_00000069_00000E6A:
	.byte 0x02, 0x00
scr_seq_00000069_00000E6C:
	scrcmd_416 0, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000069_00000E6C
	scrcmd_417 0, 16384
	copyvar VAR_SPECIAL_x8008, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000069_00000EE1
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000069_00000EFF
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000069_00000F1D
	scrcmd_258
	scrcmd_257 2
	scrcmd_412 57, 0, 32772
	scrcmd_451 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000069_00000F84
	scrcmd_417 1, 16384
	goto scr_seq_00000069_00000F52

scr_seq_00000069_00000EDF:
	.byte 0x02
	.byte 0x00
scr_seq_00000069_00000EE1:
	call scr_seq_00000069_00000F48
	scrcmd_412 53, 0, 32780
	scrcmd_193 0, 32780
	msgbox 33
	goto scr_seq_00000069_00000855

scr_seq_00000069_00000EFD:
	.byte 0x02, 0x00
scr_seq_00000069_00000EFF:
	call scr_seq_00000069_00000F48
	scrcmd_412 53, 1, 32780
	scrcmd_193 0, 32780
	msgbox 33
	goto scr_seq_00000069_00000855

scr_seq_00000069_00000F1B:
	.byte 0x02, 0x00
scr_seq_00000069_00000F1D:
	call scr_seq_00000069_00000F48
	scrcmd_412 53, 0, 32780
	scrcmd_193 0, 32780
	scrcmd_412 53, 1, 32780
	scrcmd_193 1, 32780
	msgbox 34
	goto scr_seq_00000069_00000855

scr_seq_00000069_00000F46:
	.byte 0x02, 0x00
scr_seq_00000069_00000F48:
	scrcmd_258
	scrcmd_257 8
	scrcmd_283
	return

scr_seq_00000069_00000F52:
	call scr_seq_00000069_00000113
	scrcmd_412 5, 0, 0
	heal_party
	msgbox 69
	call scr_seq_00000069_00000817
	scrcmd_702
	msgbox 32
	wait 30, VAR_SPECIAL_x800C
	scrcmd_258
	scrcmd_257 3
	goto scr_seq_00000069_000006CD

scr_seq_00000069_00000F82:
	.byte 0x02, 0x00
scr_seq_00000069_00000F84:
	scrcmd_412 52, 0, 0
	scrcmd_412 58, 0, 0
	goto scr_seq_00000069_00000F9C

scr_seq_00000069_00000F9A:
	.byte 0x02, 0x00
scr_seq_00000069_00000F9C:
	scrcmd_416 1, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000069_00000F9C
	goto scr_seq_00000069_00000F52

scr_seq_00000069_00000FB7:
	.byte 0x02, 0x00
scr_seq_00000069_00000FB9:
	scrcmd_609
	lockall
	fade_screen 6, 1, 1, 0
	wait_fade
	call scr_seq_00000069_00000807
	scrcmd_412 100, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000069_0000085B
	scrcmd_412 35, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000069_0000107A
	goto scr_seq_00000069_00001001

scr_seq_00000069_00000FFF:
	.byte 0x02
	.byte 0x00
scr_seq_00000069_00001001:
	msgbox 53
	scrcmd_412 43, 0, 32780
	copyvar VAR_TEMP_x4000, VAR_SPECIAL_x800C
	copyvar VAR_SPECIAL_x8008, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_00000069_0000104F
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_00000069_000012B6
	scrcmd_412 49, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	callif eq, scr_seq_00000069_0000106F
	goto scr_seq_00000069_0000104F

scr_seq_00000069_0000104D:
	.byte 0x02, 0x00
scr_seq_00000069_0000104F:
	msgbox 56
	call scr_seq_00000069_00000817
	closemsg
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_00000069_00001286
	goto scr_seq_00000069_00000855

scr_seq_00000069_0000106D:
	.byte 0x02, 0x00
scr_seq_00000069_0000106F:
	msgbox 73
	play_fanfare SEQ_ME_LVUP
	wait_fanfare
	return

scr_seq_00000069_0000107A:
	scrcmd_412 43, 0, 32780
	copyvar VAR_TEMP_x4000, VAR_SPECIAL_x800C
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif eq, scr_seq_00000069_00001268
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_00000069_0000118D
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif eq, scr_seq_00000069_000010E6
	scrcmd_412 49, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000069_000010D2
	call scr_seq_00000069_00001263
	goto scr_seq_00000069_00001273

scr_seq_00000069_000010D0:
	.byte 0x02, 0x00
scr_seq_00000069_000010D2:
	msgbox 12
	msgbox 73
	play_fanfare SEQ_ME_LVUP
	wait_fanfare
	goto scr_seq_00000069_00001273

scr_seq_00000069_000010E4:
	.byte 0x02, 0x00
scr_seq_00000069_000010E6:
	msgbox 12
	scrcmd_412 54, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000069_0000115A
	goto scr_seq_00000069_00001106

scr_seq_00000069_00001104:
	.byte 0x02, 0x00
scr_seq_00000069_00001106:
	scrcmd_412 10, 0, 32780
	copyvar VAR_TEMP_x4000, VAR_SPECIAL_x800C
	buffer_players_name 0
	scrcmd_198 1, 16384
	msgbox 55
	goto scr_seq_00000069_00001127

scr_seq_00000069_00001125:
	.byte 0x02, 0x00
scr_seq_00000069_00001127:
	scrcmd_412 49, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000069_000012F1
	goto scr_seq_00000069_00001144

scr_seq_00000069_00001142:
	.byte 0x02, 0x00
scr_seq_00000069_00001144:
	scrcmd_198 0, 16384
	msgbox 70
	play_fanfare SEQ_ME_LVUP
	wait_fanfare
	goto scr_seq_00000069_000012F1

scr_seq_00000069_00001158:
	.byte 0x02, 0x00
scr_seq_00000069_0000115A:
	scrcmd_412 49, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000069_000012F1
	goto scr_seq_00000069_00001177

scr_seq_00000069_00001175:
	.byte 0x02, 0x00
scr_seq_00000069_00001177:
	scrcmd_198 0, 16384
	msgbox 132
	play_fanfare SEQ_ME_LVUP
	wait_fanfare
	goto scr_seq_00000069_000012F1

scr_seq_00000069_0000118B:
	.byte 0x02, 0x00
scr_seq_00000069_0000118D:
	scrcmd_412 45, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000069_000011AA
	goto scr_seq_00000069_000011F1

scr_seq_00000069_000011A8:
	.byte 0x02, 0x00
scr_seq_00000069_000011AA:
	call scr_seq_00000069_00001263
	goto scr_seq_00000069_000011B8

scr_seq_00000069_000011B6:
	.byte 0x02, 0x00
scr_seq_00000069_000011B8:
	msgbox 14
	call scr_seq_00000069_00000817
	scrcmd_414 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000069_00000855
	msgbox 113
	closemsg
	copyvar VAR_TEMP_x4002, VAR_SPECIAL_x800C
	setvar VAR_TEMP_x4001, 1
	call scr_seq_00000069_00000BB3
	goto scr_seq_00000069_00000167

scr_seq_00000069_000011EF:
	.byte 0x02
	.byte 0x00
scr_seq_00000069_000011F1:
	comparevartovalue VAR_UNK_404D, 1
	callif eq, scr_seq_00000069_00001231
	comparevartovalue VAR_UNK_404D, 3
	callif eq, scr_seq_00000069_00001248
	scrcmd_412 48, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000069_000011B8
	msgbox 84
	play_fanfare SEQ_ME_LVUP
	wait_fanfare
	goto scr_seq_00000069_000011B8

scr_seq_00000069_0000122F:
	.byte 0x02
	.byte 0x00
scr_seq_00000069_00001231:
	msgbox 85
	buffer_players_name 0
	msgbox 87
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	setvar VAR_UNK_404D, 2
	return

scr_seq_00000069_00001248:
	msgbox 85
	buffer_players_name 0
	msgbox 86
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	setvar VAR_UNK_404D, 4
	callstd 2040
	return

scr_seq_00000069_00001263:
	msgbox 12
	return

scr_seq_00000069_00001268:
	msgbox 54
	goto scr_seq_00000069_00001273

scr_seq_00000069_00001271:
	.byte 0x02, 0x00
scr_seq_00000069_00001273:
	msgbox 14
	call scr_seq_00000069_00000817
	closemsg
	goto scr_seq_00000069_00000855

scr_seq_00000069_00001284:
	.byte 0x02, 0x00
scr_seq_00000069_00001286:
	scrcmd_414 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000069_00000855
	msgbox 113
	closemsg
	copyvar VAR_TEMP_x4002, VAR_SPECIAL_x800C
	setvar VAR_TEMP_x4001, 1
	call scr_seq_00000069_00000BB3
	goto scr_seq_00000069_00000167

scr_seq_00000069_000012B4:
	.byte 0x02, 0x00
scr_seq_00000069_000012B6:
	scrcmd_412 9, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000069_000012D3
	goto scr_seq_00000069_000012F1

scr_seq_00000069_000012D1:
	.byte 0x02, 0x00
scr_seq_00000069_000012D3:
	scrcmd_412 10, 0, 32780
	copyvar VAR_SPECIAL_x8000, VAR_SPECIAL_x800C
	scrcmd_198 0, 32768
	msgbox 65
	goto scr_seq_00000069_000012F1

scr_seq_00000069_000012EF:
	.byte 0x02
	.byte 0x00
scr_seq_00000069_000012F1:
	scrcmd_412 11, 1, 0
	goto scr_seq_00000069_00001301

scr_seq_00000069_000012FF:
	.byte 0x02
	.byte 0x00
scr_seq_00000069_00001301:
	call scr_seq_00000069_00000872
	msgbox 56
	call scr_seq_00000069_00000817
	msgbox 57
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000069_0000085B
	call scr_seq_00000069_00000A42
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000069_0000085B
	msgbox 60
	goto scr_seq_00000069_0000085B

scr_seq_00000069_00001344:
	.byte 0x02, 0x00, 0x00, 0x00

scr_seq_00000069_00001348:
	.short 62, 1
	.short 12, 2
	.short 254, 0

scr_seq_00000069_00001354:
	.short 12, 1
	.short 69, 1
	.short 254, 0

scr_seq_00000069_00001360:
	.short 62, 1
	.short 12, 2
	.short 254, 0

scr_seq_00000069_0000136C:
	.short 12, 2
	.short 69, 1
	.short 254, 0

scr_seq_00000069_00001378:
	.short 3, 1
	.short 254, 0
scr_seq_00000069_00001380:
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_SPECIAL_x8000, 0
	setvar VAR_SPECIAL_x8001, 0
	call scr_seq_00000069_00001404
	end

scr_seq_00000069_0000139A:
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_SPECIAL_x8000, 0
	setvar VAR_SPECIAL_x8001, 1
	call scr_seq_00000069_00001404
	end

scr_seq_00000069_000013B4:
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_SPECIAL_x8000, 0
	setvar VAR_SPECIAL_x8001, 2
	call scr_seq_00000069_00001404
	end

scr_seq_00000069_000013CE:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_419 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000069_000013F9
	setvar VAR_SPECIAL_x8000, 1
	setvar VAR_SPECIAL_x8001, 0
	call scr_seq_00000069_00001404
	end

scr_seq_00000069_000013F9:
	msgbox 111
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000069_00001404:
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_408 32768, 32769
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	return

scr_seq_00000069_00001428:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 74
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000069_0000143B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 75
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000069_0000144E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 76
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000069_00001461:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 77
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000069_00001474:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 78
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000069_00001487:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 79
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000069_0000149A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 80
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000069_000014AD:
	end

scr_seq_00000069_000014AF:
	scrcmd_076 25, 0
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 81
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000069_000014C8:
	scrcmd_747
	call scr_seq_00000069_0000088C
	call scr_seq_00000069_00000890
	callstd 2041
	end

scr_seq_00000069_000014DC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_14F
	callif FALSE, scr_seq_00000069_0000158E
	checkflag FLAG_UNK_14F
	callif TRUE, scr_seq_00000069_00001593
	setflag FLAG_UNK_14F
	goto scr_seq_00000069_00001506

scr_seq_00000069_00001504:
	.byte 0x02, 0x00
scr_seq_00000069_00001506:
	fade_screen 6, 1, 0, 0
	wait_fade
	closemsg
	scrcmd_349
	scrcmd_351 32780
	scrcmd_150
	copyvar VAR_SPECIAL_x8000, VAR_SPECIAL_x800C
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x8000, 255
	gotoif eq, scr_seq_00000069_00001645
	get_partymon_species VAR_SPECIAL_x8000, VAR_SPECIAL_x8004
	comparevartovalue VAR_SPECIAL_x8004, 0
	gotoif eq, scr_seq_00000069_00001598
	scrcmd_657 32768, 32769, 32770, 32771
	comparevartovalue VAR_SPECIAL_x8001, 90
	gotoif le, scr_seq_00000069_000015E5
	comparevartovalue VAR_SPECIAL_x8001, 120
	gotoif le, scr_seq_00000069_000015F0
	comparevartovalue VAR_SPECIAL_x8001, 150
	gotoif le, scr_seq_00000069_000015FB
	comparevartovalue VAR_SPECIAL_x8001, 151
	gotoif ge, scr_seq_00000069_00001606
	end

scr_seq_00000069_0000158E:
	msgbox 114
	return

scr_seq_00000069_00001593:
	msgbox 115
	return

scr_seq_00000069_00001598:
	msgbox 117
	goto scr_seq_00000069_00001506

scr_seq_00000069_000015A1:
	.byte 0x02, 0x00
scr_seq_00000069_000015A3:
	scrcmd_046 VAR_SPECIAL_x8002
	goto scr_seq_00000069_000015AF

scr_seq_00000069_000015AD:
	.byte 0x02, 0x00
scr_seq_00000069_000015AF:
	comparevartovalue VAR_SPECIAL_x8003, 15
	gotoif le, scr_seq_00000069_00001611
	comparevartovalue VAR_SPECIAL_x8003, 25
	gotoif le, scr_seq_00000069_0000161C
	comparevartovalue VAR_SPECIAL_x8003, 30
	gotoif le, scr_seq_00000069_00001627
	comparevartovalue VAR_SPECIAL_x8003, 31
	gotoif ge, scr_seq_00000069_00001632
	end

scr_seq_00000069_000015E5:
	msgbox 118
	goto scr_seq_00000069_000015A3

scr_seq_00000069_000015EE:
	.byte 0x02, 0x00
scr_seq_00000069_000015F0:
	msgbox 119
	goto scr_seq_00000069_000015A3

scr_seq_00000069_000015F9:
	.byte 0x02, 0x00
scr_seq_00000069_000015FB:
	msgbox 120
	goto scr_seq_00000069_000015A3

scr_seq_00000069_00001604:
	.byte 0x02, 0x00
scr_seq_00000069_00001606:
	msgbox 121
	goto scr_seq_00000069_000015A3

scr_seq_00000069_0000160F:
	.byte 0x02
	.byte 0x00
scr_seq_00000069_00001611:
	msgbox 128
	goto scr_seq_00000069_0000163D

scr_seq_00000069_0000161A:
	.byte 0x02, 0x00
scr_seq_00000069_0000161C:
	msgbox 129
	goto scr_seq_00000069_0000163D

scr_seq_00000069_00001625:
	.byte 0x02, 0x00
scr_seq_00000069_00001627:
	msgbox 130
	goto scr_seq_00000069_0000163D

scr_seq_00000069_00001630:
	.byte 0x02, 0x00
scr_seq_00000069_00001632:
	msgbox 131
	goto scr_seq_00000069_0000163D

scr_seq_00000069_0000163B:
	.byte 0x02, 0x00
scr_seq_00000069_0000163D:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000069_00001645:
	msgbox 116
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
