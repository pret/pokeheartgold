#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000825_00000010 ; 000
	scrdef scr_seq_00000825_0000000A ; 001
	scrdef_end

scr_seq_00000825_0000000A:
	scrcmd_081 0
	end

scr_seq_00000825_00000010:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000825_00000188
	apply_movement 0, scr_seq_00000825_00000194
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_190 0
	scrcmd_132 0, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000825_000001A8
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_356 32780
	scrcmd_514 32780
	scrcmd_515 23
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	call scr_seq_00000825_000001B4
	hasitem ITEM_S_S__TICKET, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000825_0000009A
	setvar VAR_UNK_4106, 3
scr_seq_00000825_0000009A:
	setflag FLAG_UNK_97E
	clearflag FLAG_UNK_2CC
	checkflag FLAG_UNK_116
	callif lt, scr_seq_00000825_000001C9
	checkflag FLAG_UNK_117
	callif lt, scr_seq_00000825_000001CF
	checkflag FLAG_UNK_169
	callif lt, scr_seq_00000825_000001D5
	checkflag FLAG_UNK_16A
	callif lt, scr_seq_00000825_000001DB
	checkflag FLAG_UNK_16B
	callif lt, scr_seq_00000825_000001E1
	checkflag FLAG_UNK_16C
	callif lt, scr_seq_00000825_000001E7
	checkflag FLAG_UNK_14A
	callif lt, scr_seq_00000825_000001ED
	checkflag FLAG_UNK_16D
	callif lt, scr_seq_00000825_00000206
	checkflag FLAG_UNK_173
	gotoif lt, scr_seq_00000825_0000020C
scr_seq_00000825_00000105:
	checkflag FLAG_UNK_175
	callif lt, scr_seq_00000825_00000227
	scrcmd_495 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, scr_seq_00000825_0000012D
	goto scr_seq_00000825_0000023A

scr_seq_00000825_00000127:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_00000825_0000012D:
	goto scr_seq_00000825_0000024F

scr_seq_00000825_00000133:
	checkflag FLAG_UNK_17B
	callif lt, scr_seq_00000825_00000264
	comparevartovalue VAR_UNK_4046, 2
	callif eq, scr_seq_00000825_0000026A
	comparevartovalue VAR_UNK_4045, 2
	callif eq, scr_seq_00000825_00000275
	comparevartovalue VAR_UNK_4047, 2
	callif eq, scr_seq_00000825_00000280
	comparevartovalue VAR_UNK_4048, 2
	callif eq, scr_seq_00000825_0000028B
	scrcmd_163 0
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end


scr_seq_00000825_00000188:
	.short 12, 14
	.short 3, 2
	.short 254, 0

scr_seq_00000825_00000194:
	.short 12, 12
	.short 3, 2
	.short 15, 1
	.short 2, 2
	.short 254, 0

scr_seq_00000825_000001A8:
	.short 0, 2
	.short 12, 4
	.short 254, 0
scr_seq_00000825_000001B4:
	checkflag FLAG_UNK_964
	gotoif eq, scr_seq_00000825_000001C3
	setflag FLAG_UNK_998
scr_seq_00000825_000001C3:
	clearflag FLAG_UNK_25F
	return

scr_seq_00000825_000001C9:
	clearflag FLAG_UNK_242
	return

scr_seq_00000825_000001CF:
	clearflag FLAG_UNK_243
	return

scr_seq_00000825_000001D5:
	clearflag FLAG_UNK_1C2
	return

scr_seq_00000825_000001DB:
	clearflag FLAG_UNK_1E3
	return

scr_seq_00000825_000001E1:
	clearflag FLAG_UNK_305
	return

scr_seq_00000825_000001E7:
	clearflag FLAG_UNK_306
	return

scr_seq_00000825_000001ED:
	scrcmd_294 15, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000825_00000204
	clearflag FLAG_UNK_297
scr_seq_00000825_00000204:
	return

scr_seq_00000825_00000206:
	clearflag FLAG_UNK_307
	return

scr_seq_00000825_0000020C:
	checkflag FLAG_UNK_0F9
	gotoif eq, scr_seq_00000825_0000021D
	goto scr_seq_00000825_00000105

scr_seq_00000825_0000021D:
	clearflag FLAG_UNK_31B
	goto scr_seq_00000825_00000105

scr_seq_00000825_00000227:
	comparevartovalue VAR_UNK_4089, 3
	gotoif ne, scr_seq_00000825_00000238
	clearflag FLAG_UNK_30E
scr_seq_00000825_00000238:
	return

scr_seq_00000825_0000023A:
	checkflag FLAG_UNK_17A
	gotoif eq, scr_seq_00000825_00000133
	clearflag FLAG_UNK_18B
	goto scr_seq_00000825_00000133

scr_seq_00000825_0000024F:
	checkflag FLAG_UNK_17A
	gotoif eq, scr_seq_00000825_00000133
	clearflag FLAG_UNK_18B
	goto scr_seq_00000825_00000133

scr_seq_00000825_00000264:
	clearflag FLAG_UNK_2D2
	return

scr_seq_00000825_0000026A:
	setvar VAR_UNK_4046, 0
	scrcmd_464 1
	return

scr_seq_00000825_00000275:
	setvar VAR_UNK_4045, 0
	scrcmd_464 0
	return

scr_seq_00000825_00000280:
	setvar VAR_UNK_4047, 0
	scrcmd_464 2
	return

scr_seq_00000825_0000028B:
	setvar VAR_UNK_4048, 0
	scrcmd_464 3
	return
	.balign 4, 0
