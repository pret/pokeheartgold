#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000880_00000006 ; 000
	scrdef_end

scr_seq_00000880_00000006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0C1
	gotoif eq, scr_seq_00000880_00000037
	checkflag FLAG_UNK_0BF
	gotoif lt, scr_seq_00000880_00000042
	checkflag FLAG_UNK_ABD
	gotoif eq, scr_seq_00000880_000000A2
	goto scr_seq_00000880_000000AD

scr_seq_00000880_00000035:
	.byte 0x02, 0x00
scr_seq_00000880_00000037:
	msgbox 11
scr_seq_00000880_0000003A:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000880_00000042:
	msgbox 0
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000880_00000063
	msgbox 4
	goto scr_seq_00000880_0000003A

scr_seq_00000880_00000063:
	scrcmd_332 32780
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif ne, scr_seq_00000880_0000007D
	msgbox 3
	goto scr_seq_00000880_0000003A

scr_seq_00000880_0000007D:
	scrcmd_362 6, 20, 75
	msgbox 1
	scrcmd_190 0
	msgbox 2
	scrcmd_078 1210
	scrcmd_079
	setflag FLAG_UNK_0BF
	setflag FLAG_UNK_ABD
	goto scr_seq_00000880_0000003A

scr_seq_00000880_000000A0:
	.byte 0x02, 0x00
scr_seq_00000880_000000A2:
	msgbox 6
	goto scr_seq_00000880_0000003A

scr_seq_00000880_000000AB:
	.byte 0x02, 0x00
scr_seq_00000880_000000AD:
	msgbox 5
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000880_000001AA
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	closemsg
	scrcmd_349
	scrcmd_351 16384
	comparevartovalue VAR_TEMP_x4000, 255
	gotoif ne, scr_seq_00000880_000000F2
	call scr_seq_00000880_0000019A
	goto scr_seq_00000880_000001AA

scr_seq_00000880_000000F2:
	scrcmd_363 6, 16384, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	callif ne, scr_seq_00000880_0000019A
	scrcmd_490 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000880_00000120
	msgbox 8
	goto scr_seq_00000880_00000192

scr_seq_00000880_00000120:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_00000880_00000136
	msgbox 12
	goto scr_seq_00000880_00000192

scr_seq_00000880_00000136:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000880_0000014C
	msgbox 13
	goto scr_seq_00000880_00000192

scr_seq_00000880_0000014C:
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif ne, scr_seq_00000880_00000162
	msgbox 14
	goto scr_seq_00000880_00000192

scr_seq_00000880_00000162:
	scrcmd_382 32780, 16384
	comparevartovalue VAR_SPECIAL_x800C, 149
	gotoif le, scr_seq_00000880_00000181
	call scr_seq_00000880_0000019A
	goto scr_seq_00000880_000001B5

scr_seq_00000880_00000181:
	scrcmd_364 16384
	call scr_seq_00000880_0000019A
	msgbox 7
	setflag FLAG_UNK_0C1
scr_seq_00000880_00000192:
	goto scr_seq_00000880_0000003A

scr_seq_00000880_00000198:
	.byte 0x02, 0x00
scr_seq_00000880_0000019A:
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	return

scr_seq_00000880_000001AA:
	msgbox 10
	goto scr_seq_00000880_0000003A

scr_seq_00000880_000001B3:
	.byte 0x02, 0x00
scr_seq_00000880_000001B5:
	msgbox 9
	setflag FLAG_UNK_0C1
	goto scr_seq_00000880_0000003A

scr_seq_00000880_000001C2:
	.byte 0x02, 0x00
	.balign 4, 0
