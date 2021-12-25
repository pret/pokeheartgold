#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000167_0000000E ; 000
	scrdef scr_seq_00000167_00000027 ; 001
	scrdef scr_seq_00000167_0000093C ; 002
	scrdef_end

scr_seq_00000167_0000000E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x400A, 0
	msgbox 0
	goto scr_seq_00000167_00000040

scr_seq_00000167_00000025:
	.byte 0x02, 0x00
scr_seq_00000167_00000027:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x400A, 1
	msgbox 1
	goto scr_seq_00000167_00000040

scr_seq_00000167_0000003E:
	.byte 0x02, 0x00
scr_seq_00000167_00000040:
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 271, 255, 0
	scrcmd_751 11, 255, 1
	scrcmd_751 12, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000167_000001A7
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000167_0000008C
	goto scr_seq_00000167_000007D9

scr_seq_00000167_0000008A:
	.byte 0x02, 0x00
scr_seq_00000167_0000008C:
	msgbox 11
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_TEMP_x400A, 0
	gotoif ne, scr_seq_00000167_000000B4
	scrcmd_751 272, 255, 0
	goto scr_seq_00000167_000000BC

scr_seq_00000167_000000B4:
	scrcmd_751 278, 255, 7
scr_seq_00000167_000000BC:
	scrcmd_751 273, 255, 1
	scrcmd_751 274, 255, 2
	scrcmd_751 277, 255, 3
	scrcmd_751 275, 255, 4
	scrcmd_751 276, 255, 5
	scrcmd_751 13, 255, 6
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000167_0000015A
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000167_00000165
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000167_00000170
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000167_0000017B
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_00000167_00000186
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_00000167_00000191
	comparevartovalue VAR_SPECIAL_x8008, 7
	gotoif eq, scr_seq_00000167_0000019C
	msgbox 2
	goto scr_seq_00000167_00000040

scr_seq_00000167_00000158:
	.byte 0x02, 0x00
scr_seq_00000167_0000015A:
	msgbox 12
	goto scr_seq_00000167_0000008C

scr_seq_00000167_00000163:
	.byte 0x02, 0x00
scr_seq_00000167_00000165:
	msgbox 14
	goto scr_seq_00000167_0000008C

scr_seq_00000167_0000016E:
	.byte 0x02, 0x00
scr_seq_00000167_00000170:
	msgbox 15
	goto scr_seq_00000167_0000008C

scr_seq_00000167_00000179:
	.byte 0x02, 0x00
scr_seq_00000167_0000017B:
	msgbox 18
	goto scr_seq_00000167_0000008C

scr_seq_00000167_00000184:
	.byte 0x02, 0x00
scr_seq_00000167_00000186:
	msgbox 16
	goto scr_seq_00000167_0000008C

scr_seq_00000167_0000018F:
	.byte 0x02
	.byte 0x00
scr_seq_00000167_00000191:
	msgbox 17
	goto scr_seq_00000167_0000008C

scr_seq_00000167_0000019A:
	.byte 0x02, 0x00
scr_seq_00000167_0000019C:
	msgbox 13
	goto scr_seq_00000167_0000008C

scr_seq_00000167_000001A5:
	.byte 0x02, 0x00
scr_seq_00000167_000001A7:
	scrcmd_358 32780
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif lt, scr_seq_00000167_000007E6
	msgbox 3
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 273, 255, 0
	scrcmd_751 274, 255, 1
	scrcmd_751 277, 255, 4
	scrcmd_751 275, 255, 2
	scrcmd_751 276, 255, 3
	scrcmd_751 13, 255, 5
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000167_00000249
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000167_00000257
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000167_00000265
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000167_00000273
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_00000167_00000281
	msgbox 2
	goto scr_seq_00000167_00000040

scr_seq_00000167_00000247:
	.byte 0x02, 0x00
scr_seq_00000167_00000249:
	setvar VAR_SPECIAL_x8000, 0
	goto scr_seq_00000167_0000028F

scr_seq_00000167_00000255:
	.byte 0x02, 0x00
scr_seq_00000167_00000257:
	setvar VAR_SPECIAL_x8000, 1
	goto scr_seq_00000167_0000028F

scr_seq_00000167_00000263:
	.byte 0x02, 0x00
scr_seq_00000167_00000265:
	setvar VAR_SPECIAL_x8000, 3
	goto scr_seq_00000167_0000028F

scr_seq_00000167_00000271:
	.byte 0x02, 0x00
scr_seq_00000167_00000273:
	setvar VAR_SPECIAL_x8000, 4
	goto scr_seq_00000167_0000028F

scr_seq_00000167_0000027F:
	.byte 0x02
	.byte 0x00
scr_seq_00000167_00000281:
	setvar VAR_SPECIAL_x8000, 2
	goto scr_seq_00000167_0000028F

scr_seq_00000167_0000028D:
	.byte 0x02, 0x00
scr_seq_00000167_0000028F:
	scrcmd_745 3, 32768
	msgbox 4
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000167_000001A7
	scrcmd_815 0
	msgbox 5
	closemsg
	scrcmd_600
	call scr_seq_00000167_000004A3
	scrcmd_307 0, 0, 22, 9, 77
	call scr_seq_00000167_0000045C
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000167_00000820
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	call scr_seq_00000167_000004DE
	apply_movement 255, scr_seq_00000167_00000848
	wait 40, VAR_SPECIAL_x800C
	scrcmd_188 4096
	scrcmd_189
	wait_movement
	scrcmd_078 1208
	scrcmd_190 0
	msgbox 8
	scrcmd_079
	wait 30, VAR_SPECIAL_x800C
	msgbox 6
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000167_00000828
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_309 77
	call scr_seq_00000167_00000766
	scrcmd_188 1
	scrcmd_189
	apply_movement 255, scr_seq_00000167_00000934
	wait_movement
	scrcmd_784 3, 0
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000167_000008DC
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_307 0, 0, 22, 9, 77
	call scr_seq_00000167_0000045C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000167_0000046F
	call scr_seq_00000167_00000505
	call scr_seq_00000167_00000540
	call scr_seq_00000167_00000464
	msgbox 19
	scrcmd_190 0
	scrcmd_198 1, 32769
	scrcmd_198 2, 32770
	msgbox 46
	msgbox 20
	scrcmd_078 1185
	scrcmd_079
	comparevartovalue VAR_SPECIAL_x8003, 0
	callif eq, scr_seq_00000167_000005AB
	call scr_seq_00000167_00000567
	comparevartovalue VAR_UNK_40E2, 1
	callif eq, scr_seq_00000167_000005ED
	comparevartovalue VAR_UNK_40E2, 2
	callif eq, scr_seq_00000167_000005FA
	comparevartovalue VAR_UNK_40E2, 3
	callif eq, scr_seq_00000167_00000607
	checkflag FLAG_UNK_2D5
	callif eq, scr_seq_00000167_0000063E
	checkflag FLAG_UNK_2D6
	callif eq, scr_seq_00000167_00000657
	checkflag FLAG_UNK_2D7
	callif eq, scr_seq_00000167_00000670
	checkflag FLAG_UNK_2D8
	callif eq, scr_seq_00000167_00000689
	checkflag FLAG_UNK_2D9
	callif eq, scr_seq_00000167_000006A2
	msgbox 10
	waitbutton
	closemsg
	releaseall
	scrcmd_606
	scrcmd_784 3, 1
	end

scr_seq_00000167_0000045C:
	scrcmd_310 77
	scrcmd_308 77
	return

scr_seq_00000167_00000464:
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	return

scr_seq_00000167_0000046F:
	scrcmd_784 3, 1
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000167_0000090C
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	call scr_seq_00000167_00000540
	call scr_seq_00000167_00000464
	scrcmd_606
	releaseall
	end

scr_seq_00000167_000004A3:
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	comparevartovalue VAR_TEMP_x400A, 0
	gotoif ne, scr_seq_00000167_000004C8
	apply_movement 255, scr_seq_00000167_00000814
	goto scr_seq_00000167_000004D0

scr_seq_00000167_000004C8:
	apply_movement 255, scr_seq_00000167_0000083C
scr_seq_00000167_000004D0:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	return

scr_seq_00000167_000004DE:
	comparevartovalue VAR_TEMP_x400A, 0
	gotoif ne, scr_seq_00000167_000004F9
	apply_movement 0, scr_seq_00000167_00000914
	goto scr_seq_00000167_00000501

scr_seq_00000167_000004F9:
	apply_movement 10, scr_seq_00000167_0000091C
scr_seq_00000167_00000501:
	wait_movement
	return

scr_seq_00000167_00000505:
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	comparevartovalue VAR_TEMP_x400A, 0
	gotoif ne, scr_seq_00000167_0000052A
	apply_movement 255, scr_seq_00000167_000008EC
	goto scr_seq_00000167_00000532

scr_seq_00000167_0000052A:
	apply_movement 255, scr_seq_00000167_000008FC
scr_seq_00000167_00000532:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	return

scr_seq_00000167_00000540:
	comparevartovalue VAR_TEMP_x400A, 0
	gotoif ne, scr_seq_00000167_0000055B
	apply_movement 0, scr_seq_00000167_00000924
	goto scr_seq_00000167_00000563

scr_seq_00000167_0000055B:
	apply_movement 10, scr_seq_00000167_00000924
scr_seq_00000167_00000563:
	wait_movement
	return

scr_seq_00000167_00000567:
	comparevartovalue VAR_SPECIAL_x8003, 0
	gotoif ne, scr_seq_00000167_0000057F
	scrcmd_725 0, 10
	goto scr_seq_00000167_000005A9

scr_seq_00000167_0000057F:
	comparevartovalue VAR_SPECIAL_x8003, 1
	gotoif ne, scr_seq_00000167_00000597
	scrcmd_725 0, 5
	goto scr_seq_00000167_000005A9

scr_seq_00000167_00000597:
	comparevartovalue VAR_SPECIAL_x8003, 3
	gotoif ne, scr_seq_00000167_000005A9
	scrcmd_725 1, 5
scr_seq_00000167_000005A9:
	return

scr_seq_00000167_000005AB:
	comparevartovalue VAR_TEMP_x400A, 0
	gotoif ne, scr_seq_00000167_000005C4
	setvar VAR_TEMP_x4009, 100
	goto scr_seq_00000167_000005CA

scr_seq_00000167_000005C4:
	setvar VAR_TEMP_x4009, 300
scr_seq_00000167_000005CA:
	scrcmd_198 2, 16393
	msgbox 22
	scrcmd_122 16393
	scrcmd_190 0
	scrcmd_198 2, 16393
	msgbox 20
	scrcmd_078 1185
	scrcmd_079
	scrcmd_515 13
	return

scr_seq_00000167_000005ED:
	checkflag FLAG_UNK_0EF
	callif eq, scr_seq_00000167_00000614
	return

scr_seq_00000167_000005FA:
	checkflag FLAG_UNK_0F0
	callif eq, scr_seq_00000167_00000622
	return

scr_seq_00000167_00000607:
	checkflag FLAG_UNK_0F1
	callif eq, scr_seq_00000167_00000630
	return

scr_seq_00000167_00000614:
	scrcmd_190 0
	msgbox 23
	setvar VAR_UNK_40E2, 2
	return

scr_seq_00000167_00000622:
	scrcmd_190 0
	msgbox 24
	setvar VAR_UNK_40E2, 3
	return

scr_seq_00000167_00000630:
	scrcmd_190 0
	msgbox 25
	setvar VAR_UNK_40E2, 4
	return

scr_seq_00000167_0000063E:
	scrcmd_724 16, 32780
	comparevartovalue VAR_SPECIAL_x800C, 5000
	gotoif lt, scr_seq_00000167_00000655
	clearflag FLAG_UNK_2D5
scr_seq_00000167_00000655:
	return

scr_seq_00000167_00000657:
	scrcmd_724 12, 32780
	comparevartovalue VAR_SPECIAL_x800C, 50
	gotoif lt, scr_seq_00000167_0000066E
	clearflag FLAG_UNK_2D6
scr_seq_00000167_0000066E:
	return

scr_seq_00000167_00000670:
	scrcmd_724 17, 32780
	comparevartovalue VAR_SPECIAL_x800C, 200
	gotoif lt, scr_seq_00000167_00000687
	clearflag FLAG_UNK_2D7
scr_seq_00000167_00000687:
	return

scr_seq_00000167_00000689:
	scrcmd_724 10, 32780
	comparevartovalue VAR_SPECIAL_x800C, 100
	gotoif lt, scr_seq_00000167_000006A0
	clearflag FLAG_UNK_2D8
scr_seq_00000167_000006A0:
	return

scr_seq_00000167_000006A2:
	scrcmd_724 0, 16384
	comparevartovalue VAR_TEMP_x4000, 50
	gotoif lt, scr_seq_00000167_00000764
	scrcmd_724 1, 16384
	comparevartovalue VAR_TEMP_x4000, 50
	gotoif lt, scr_seq_00000167_00000764
	scrcmd_724 2, 16384
	comparevartovalue VAR_TEMP_x4000, 50
	gotoif lt, scr_seq_00000167_00000764
	scrcmd_724 3, 16384
	comparevartovalue VAR_TEMP_x4000, 50
	gotoif lt, scr_seq_00000167_00000764
	scrcmd_724 4, 16384
	comparevartovalue VAR_TEMP_x4000, 50
	gotoif lt, scr_seq_00000167_00000764
	scrcmd_724 5, 16384
	comparevartovalue VAR_TEMP_x4000, 50
	gotoif lt, scr_seq_00000167_00000764
	scrcmd_724 6, 16384
	comparevartovalue VAR_TEMP_x4000, 50
	gotoif lt, scr_seq_00000167_00000764
	scrcmd_724 7, 16384
	comparevartovalue VAR_TEMP_x4000, 50
	gotoif lt, scr_seq_00000167_00000764
	scrcmd_724 8, 16384
	comparevartovalue VAR_TEMP_x4000, 50
	gotoif lt, scr_seq_00000167_00000764
	scrcmd_724 9, 16384
	comparevartovalue VAR_TEMP_x4000, 50
	gotoif lt, scr_seq_00000167_00000764
	clearflag FLAG_UNK_2D9
scr_seq_00000167_00000764:
	return

scr_seq_00000167_00000766:
	comparevartovalue VAR_TEMP_x400A, 0
	gotoif ne, scr_seq_00000167_00000787
	scrcmd_611 0, 0, 32768, 32780, 32769, 32770, 32771
	goto scr_seq_00000167_000007D7

scr_seq_00000167_00000787:
	comparevartovalue VAR_TEMP_x400A, 1
	gotoif ne, scr_seq_00000167_000007A8
	scrcmd_611 0, 1, 32768, 32780, 32769, 32770, 32771
	goto scr_seq_00000167_000007D7

scr_seq_00000167_000007A8:
	comparevartovalue VAR_TEMP_x400A, 2
	gotoif ne, scr_seq_00000167_000007C9
	scrcmd_611 1, 0, 32768, 32780, 32769, 32770, 32771
	goto scr_seq_00000167_000007D7

scr_seq_00000167_000007C9:
	scrcmd_611 1, 1, 32768, 32780, 32769, 32770, 32771
scr_seq_00000167_000007D7:
	return

scr_seq_00000167_000007D9:
	scrcmd_747
scr_seq_00000167_000007DB:
	msgbox 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000167_000007E6:
	scrcmd_747
	msgbox 37
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000167_000007F3:
	.byte 0x00, 0x0c, 0x00, 0x03, 0x00, 0x0e, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00
	.byte 0xfe, 0x00, 0x00, 0x00, 0x3f, 0x00, 0x02, 0x00, 0x0f, 0x00, 0x01, 0x00, 0x0d, 0x00, 0x03, 0x00
	.byte 0xfe, 0x00, 0x00, 0x00

scr_seq_00000167_00000814:
	.short 14, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000167_00000820:
	.short 12, 2
	.short 254, 0

scr_seq_00000167_00000828:
	.short 32, 1
	.short 12, 1
	.short 15, 1
	.short 12, 1
	.short 254, 0

scr_seq_00000167_0000083C:
	.short 15, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000167_00000848:
	.short 0, 1
	.short 60, 1
	.short 3, 1
	.short 60, 1
	.short 1, 1
	.short 60, 1
	.short 2, 1
	.short 60, 1
	.short 0, 1
	.short 60, 1
	.short 3, 1
	.short 60, 1
	.short 1, 1
	.short 60, 1
	.short 2, 1
	.short 60, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 63, 1
	.short 254, 0

scr_seq_00000167_000008DC:
	.short 13, 1
	.short 14, 1
	.short 13, 1
	.short 254, 0

scr_seq_00000167_000008EC:
	.short 13, 2
	.short 15, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000167_000008FC:
	.short 13, 2
	.short 14, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000167_0000090C:
	.short 13, 3
	.short 254, 0

scr_seq_00000167_00000914:
	.short 34, 1
	.short 254, 0

scr_seq_00000167_0000091C:
	.short 35, 1
	.short 254, 0

scr_seq_00000167_00000924:
	.short 33, 1
	.short 254, 0
	.byte 0x20, 0x00, 0x01, 0x00
	.byte 0xfe, 0x00, 0x00, 0x00

scr_seq_00000167_00000934:
	.short 1, 1
	.short 254, 0
scr_seq_00000167_0000093C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_40E2, 0
	gotoif eq, scr_seq_00000167_00000FE4
	setvar VAR_TEMP_x400A, 2
	msgbox 26
scr_seq_00000167_0000095A:
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 271, 255, 0
	scrcmd_751 11, 255, 1
	scrcmd_751 12, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000167_00000AB1
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000167_000009A6
	goto scr_seq_00000167_000007D9

scr_seq_00000167_000009A4:
	.byte 0x02, 0x00
scr_seq_00000167_000009A6:
	msgbox 11
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 272, 255, 0
	scrcmd_751 342, 255, 1
	scrcmd_751 343, 255, 2
	scrcmd_751 344, 255, 3
	scrcmd_751 345, 255, 4
	scrcmd_751 346, 255, 6
	checkflag FLAG_UNK_2B3
	callif lt, scr_seq_00000167_00000B93
	scrcmd_751 13, 255, 7
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000167_00000A64
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000167_00000A6F
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000167_00000A7A
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000167_00000A85
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_00000167_00000A90
	comparevartovalue VAR_SPECIAL_x8008, 6
	gotoif eq, scr_seq_00000167_00000A9B
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_00000167_00000AA6
	msgbox 2
	goto scr_seq_00000167_0000095A

scr_seq_00000167_00000A62:
	.byte 0x02, 0x00
scr_seq_00000167_00000A64:
	msgbox 39
	goto scr_seq_00000167_000009A6

scr_seq_00000167_00000A6D:
	.byte 0x02, 0x00
scr_seq_00000167_00000A6F:
	msgbox 40
	goto scr_seq_00000167_000009A6

scr_seq_00000167_00000A78:
	.byte 0x02, 0x00
scr_seq_00000167_00000A7A:
	msgbox 41
	goto scr_seq_00000167_000009A6

scr_seq_00000167_00000A83:
	.byte 0x02, 0x00
scr_seq_00000167_00000A85:
	msgbox 42
	goto scr_seq_00000167_000009A6

scr_seq_00000167_00000A8E:
	.byte 0x02, 0x00
scr_seq_00000167_00000A90:
	msgbox 43
	goto scr_seq_00000167_000009A6

scr_seq_00000167_00000A99:
	.byte 0x02, 0x00
scr_seq_00000167_00000A9B:
	msgbox 44
	goto scr_seq_00000167_000009A6

scr_seq_00000167_00000AA4:
	.byte 0x02, 0x00
scr_seq_00000167_00000AA6:
	msgbox 45
	goto scr_seq_00000167_000009A6

scr_seq_00000167_00000AAF:
	.byte 0x02
	.byte 0x00
scr_seq_00000167_00000AB1:
	scrcmd_358 32780
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif lt, scr_seq_00000167_000007E6
	callstd 2006
	copyvar VAR_SPECIAL_x800C, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000167_00000AE1
	goto scr_seq_00000167_000007DB

scr_seq_00000167_00000ADF:
	.byte 0x02
	.byte 0x00
scr_seq_00000167_00000AE1:
	setvar VAR_TEMP_x400A, 2
	msgbox 3
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 342, 255, 0
	scrcmd_751 343, 255, 1
	scrcmd_751 344, 255, 2
	scrcmd_751 345, 255, 3
	scrcmd_751 346, 255, 4
	checkflag FLAG_UNK_2B3
	callif lt, scr_seq_00000167_00000B93
	scrcmd_751 12, 255, 6
	scrcmd_752
	copyvar VAR_TEMP_x400B, VAR_SPECIAL_x800C
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000167_00000B9D
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000167_00000BAB
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000167_00000BB9
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000167_00000BC7
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_00000167_00000BD5
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_00000167_00000BE3
	goto scr_seq_00000167_000007D9

scr_seq_00000167_00000B91:
	.byte 0x02, 0x00
scr_seq_00000167_00000B93:
	scrcmd_751 279, 255, 5
	return

scr_seq_00000167_00000B9D:
	setvar VAR_SPECIAL_x8000, 5
	goto scr_seq_00000167_00000BF7

scr_seq_00000167_00000BA9:
	.byte 0x02, 0x00
scr_seq_00000167_00000BAB:
	setvar VAR_SPECIAL_x8000, 6
	goto scr_seq_00000167_00000BF7

scr_seq_00000167_00000BB7:
	.byte 0x02, 0x00
scr_seq_00000167_00000BB9:
	setvar VAR_SPECIAL_x8000, 7
	goto scr_seq_00000167_00000BF7

scr_seq_00000167_00000BC5:
	.byte 0x02, 0x00
scr_seq_00000167_00000BC7:
	setvar VAR_SPECIAL_x8000, 8
	goto scr_seq_00000167_00000BF7

scr_seq_00000167_00000BD3:
	.byte 0x02, 0x00
scr_seq_00000167_00000BD5:
	setvar VAR_SPECIAL_x8000, 9
	goto scr_seq_00000167_00000BF7

scr_seq_00000167_00000BE1:
	.byte 0x02, 0x00
scr_seq_00000167_00000BE3:
	setvar VAR_SPECIAL_x8000, 10
	setvar VAR_TEMP_x400A, 3
	goto scr_seq_00000167_00000BF7

scr_seq_00000167_00000BF5:
	.byte 0x02, 0x00
scr_seq_00000167_00000BF7:
	scrcmd_746
	msgbox 27
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 14, 255, 0
	scrcmd_751 15, 255, 1
	scrcmd_751 13, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000167_00000C48
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000167_00000C88
	goto scr_seq_00000167_00000AE1

scr_seq_00000167_00000C44:
	.byte 0x02, 0x00, 0x02, 0x00
scr_seq_00000167_00000C48:
	msgbox 28
	scrcmd_748 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000167_00000BF7
	scrcmd_226 40, 16395, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000167_00000CC8
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_00000167_00000CD2
	goto scr_seq_00000167_00000CE3

scr_seq_00000167_00000C86:
	.byte 0x02, 0x00
scr_seq_00000167_00000C88:
	msgbox 28
	scrcmd_748 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000167_00000BF7
	scrcmd_227 40, 16395, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000167_00000CC8
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_00000167_00000CD2
	goto scr_seq_00000167_00000CE3

scr_seq_00000167_00000CC6:
	.byte 0x02, 0x00
scr_seq_00000167_00000CC8:
	scrcmd_283
	goto scr_seq_00000167_00000BF7

scr_seq_00000167_00000CD0:
	.byte 0x02, 0x00
scr_seq_00000167_00000CD2:
	scrcmd_283
	scrcmd_747
	msgbox 29
	waitbutton
	closemsg
	releaseall
	scrcmd_606
	end

scr_seq_00000167_00000CE3:
	scrcmd_815 0
	msgbox 36
	wait 30, VAR_SPECIAL_x8004
	closemsg
	scrcmd_600
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000167_00000814
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_307 0, 0, 10, 9, 77
	call scr_seq_00000167_0000045C
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000167_00000820
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement 2, scr_seq_00000167_00000914
	apply_movement 255, scr_seq_00000167_00000848
	wait 40, VAR_SPECIAL_x800C
	scrcmd_188 4096
	scrcmd_189
	wait_movement
	scrcmd_078 1208
	scrcmd_190 0
	msgbox 35
	wait 30, VAR_SPECIAL_x8004
	scrcmd_079
	scrcmd_745 3, 32768
	scrcmd_451 16384
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_00000167_00000D96
	msgbox 30
	wait 30, VAR_SPECIAL_x8004
	goto scr_seq_00000167_00000DD7

scr_seq_00000167_00000D96:
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ne, scr_seq_00000167_00000DB2
	msgbox 31
	wait 30, VAR_SPECIAL_x8004
	goto scr_seq_00000167_00000DD7

scr_seq_00000167_00000DB2:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_00000167_00000DCE
	msgbox 32
	wait 30, VAR_SPECIAL_x8004
	goto scr_seq_00000167_00000DD7

scr_seq_00000167_00000DCE:
	msgbox 33
	wait 30, VAR_SPECIAL_x8004
scr_seq_00000167_00000DD7:
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000167_00000FD4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_309 77
	scrcmd_257 239
	call scr_seq_00000167_00000766
	scrcmd_283
	scrcmd_188 1
	scrcmd_189
	apply_movement 255, scr_seq_00000167_00000934
	wait_movement
	scrcmd_784 3, 0
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000167_00000FDC
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_307 0, 0, 10, 9, 77
	call scr_seq_00000167_0000045C
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000167_000008EC
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement 2, scr_seq_00000167_00000924
	wait_movement
	call scr_seq_00000167_00000464
	msgbox 19
	scrcmd_190 0
	scrcmd_198 1, 32769
	scrcmd_198 2, 32770
	comparevartovalue VAR_SPECIAL_x8000, 10
	gotoif lt, scr_seq_00000167_00000EB5
	msgbox 47
	goto scr_seq_00000167_00000EB8

scr_seq_00000167_00000EB5:
	msgbox 46
scr_seq_00000167_00000EB8:
	msgbox 20
	scrcmd_078 1185
	scrcmd_079
	comparevartovalue VAR_SPECIAL_x8003, 1
	callif le, scr_seq_00000167_00000F43
	call scr_seq_00000167_00000F8D
	comparevartovalue VAR_UNK_40E2, 1
	callif eq, scr_seq_00000167_000005ED
	comparevartovalue VAR_UNK_40E2, 2
	callif eq, scr_seq_00000167_000005FA
	comparevartovalue VAR_UNK_40E2, 3
	callif eq, scr_seq_00000167_00000607
	checkflag FLAG_UNK_2D5
	callif eq, scr_seq_00000167_0000063E
	checkflag FLAG_UNK_2D6
	callif eq, scr_seq_00000167_00000657
	checkflag FLAG_UNK_2D7
	callif eq, scr_seq_00000167_00000670
	checkflag FLAG_UNK_2D8
	callif eq, scr_seq_00000167_00000689
	checkflag FLAG_UNK_2D9
	callif eq, scr_seq_00000167_000006A2
	msgbox 10
	waitbutton
	closemsg
	releaseall
	scrcmd_606
	scrcmd_784 3, 1
	end

scr_seq_00000167_00000F43:
	comparevartovalue VAR_SPECIAL_x8003, 0
	gotoif ne, scr_seq_00000167_00000F68
	setvar VAR_TEMP_x4009, 500
	scrcmd_198 2, 16393
	msgbox 22
	scrcmd_515 18
	goto scr_seq_00000167_00000F76

scr_seq_00000167_00000F68:
	setvar VAR_TEMP_x4009, 200
	scrcmd_198 2, 16393
	msgbox 34
scr_seq_00000167_00000F76:
	scrcmd_122 16393
	scrcmd_190 0
	scrcmd_198 2, 16393
	msgbox 20
	scrcmd_078 1185
	scrcmd_079
	return

scr_seq_00000167_00000F8D:
	comparevartovalue VAR_SPECIAL_x8003, 0
	gotoif ne, scr_seq_00000167_00000FA5
	scrcmd_725 0, 15
	goto scr_seq_00000167_00000FCF

scr_seq_00000167_00000FA5:
	comparevartovalue VAR_SPECIAL_x8003, 1
	gotoif ne, scr_seq_00000167_00000FBD
	scrcmd_725 0, 10
	goto scr_seq_00000167_00000FCF

scr_seq_00000167_00000FBD:
	comparevartovalue VAR_SPECIAL_x8003, 3
	gotoif ne, scr_seq_00000167_00000FCF
	scrcmd_725 1, 5
scr_seq_00000167_00000FCF:
	return

scr_seq_00000167_00000FD1:
	.byte 0x00, 0x00, 0x00

scr_seq_00000167_00000FD4:
	.short 12, 2
	.short 254, 0

scr_seq_00000167_00000FDC:
	.short 13, 2
	.short 254, 0
scr_seq_00000167_00000FE4:
	msgbox 38
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
