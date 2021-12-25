#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000801_00000006 ; 000
	scrdef_end

scr_seq_00000801_00000006:
	scrcmd_609
	lockall
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000801_00000058
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000801_0000002A
	end

scr_seq_00000801_0000002A:
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000801_00000340
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement 253, scr_seq_00000801_0000034C
	wait_movement
	goto scr_seq_00000801_00000062

scr_seq_00000801_00000058:
	apply_movement 255, scr_seq_00000801_00000340
	wait_movement
scr_seq_00000801_00000062:
	scrcmd_241 16659
	copyvar VAR_SPECIAL_x8008, VAR_UNK_4113
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000801_00000095
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000801_000000A0
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000801_000000AA
	end

scr_seq_00000801_00000095:
	scrcmd_198 0, 0
	goto scr_seq_00000801_000000B4

scr_seq_00000801_000000A0:
	scrcmd_852 0, 3
	goto scr_seq_00000801_000000B4

scr_seq_00000801_000000AA:
	scrcmd_852 0, 1
	goto scr_seq_00000801_000000B4

scr_seq_00000801_000000B4:
	scrcmd_242 20, 1, 16659, 16659
	msgbox 0
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 116, 255, 0
	scrcmd_751 118, 255, 1
	scrcmd_751 125, 255, 2
	scrcmd_751 126, 255, 3
	scrcmd_752
	scrcmd_747
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000801_00000120
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000801_0000019B
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000801_00000216
	goto scr_seq_00000801_00000322

scr_seq_00000801_00000120:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 376, 2, 5, 3, 1
	comparevartovalue VAR_UNK_4113, 0
	gotoif eq, scr_seq_00000801_00000305
	comparevartovalue VAR_UNK_4113, 0
	callif gt, scr_seq_00000801_0000029C
	comparevartovalue VAR_UNK_4113, 0
	callif lt, scr_seq_00000801_00000291
	comparevartovalue VAR_UNK_4113, 2
	gotoif ne, scr_seq_00000801_00000176
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_00000801_00000189

scr_seq_00000801_00000176:
	comparevartovalue VAR_UNK_4113, 3
	gotoif ne, scr_seq_00000801_00000189
	setvar VAR_SPECIAL_x8005, 3
scr_seq_00000801_00000189:
	call scr_seq_00000801_000002A7
	setvar VAR_UNK_4113, 0
	goto scr_seq_00000801_000002BB

scr_seq_00000801_0000019B:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 378, 0, 5, 3, 1
	comparevartovalue VAR_UNK_4113, 2
	gotoif eq, scr_seq_00000801_00000305
	comparevartovalue VAR_UNK_4113, 2
	callif gt, scr_seq_00000801_0000029C
	comparevartovalue VAR_UNK_4113, 2
	callif lt, scr_seq_00000801_00000291
	comparevartovalue VAR_UNK_4113, 0
	gotoif ne, scr_seq_00000801_000001F1
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_00000801_00000204

scr_seq_00000801_000001F1:
	comparevartovalue VAR_UNK_4113, 3
	gotoif ne, scr_seq_00000801_00000204
	setvar VAR_SPECIAL_x8005, 1
scr_seq_00000801_00000204:
	call scr_seq_00000801_000002A7
	setvar VAR_UNK_4113, 2
	goto scr_seq_00000801_000002BB

scr_seq_00000801_00000216:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 379, 1, 5, 3, 1
	comparevartovalue VAR_UNK_4113, 3
	gotoif eq, scr_seq_00000801_00000305
	comparevartovalue VAR_UNK_4113, 3
	callif gt, scr_seq_00000801_0000029C
	comparevartovalue VAR_UNK_4113, 3
	callif lt, scr_seq_00000801_00000291
	comparevartovalue VAR_UNK_4113, 0
	gotoif ne, scr_seq_00000801_0000026C
	setvar VAR_SPECIAL_x8005, 3
	goto scr_seq_00000801_0000027F

scr_seq_00000801_0000026C:
	comparevartovalue VAR_UNK_4113, 2
	gotoif ne, scr_seq_00000801_0000027F
	setvar VAR_SPECIAL_x8005, 1
scr_seq_00000801_0000027F:
	call scr_seq_00000801_000002A7
	setvar VAR_UNK_4113, 3
	goto scr_seq_00000801_000002BB

scr_seq_00000801_00000291:
	msgbox 2
	setvar VAR_SPECIAL_x8004, 0
	return

scr_seq_00000801_0000029C:
	msgbox 3
	setvar VAR_SPECIAL_x8004, 1
	return

scr_seq_00000801_000002A7:
	setvar VAR_UNK_4113, 65535
	closemsg
	wait_se SEQ_SE_DP_SELECT
	scrcmd_488 32772, 32773
	return

scr_seq_00000801_000002BB:
	copyvar VAR_SPECIAL_x8008, VAR_UNK_4113
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000801_000002EA
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000801_000002F3
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000801_000002FC
	end

scr_seq_00000801_000002EA:
	msgbox 7
	goto scr_seq_00000801_0000032E

scr_seq_00000801_000002F3:
	msgbox 6
	goto scr_seq_00000801_0000032E

scr_seq_00000801_000002FC:
	msgbox 5
	goto scr_seq_00000801_0000032E

scr_seq_00000801_00000305:
	setvar VAR_UNK_4113, 65535
	wait 1, VAR_SPECIAL_x800C
	msgbox 4
	waitbutton
	closemsg
	setvar VAR_UNK_4125, 1
	releaseall
	end

scr_seq_00000801_00000322:
	setvar VAR_UNK_4113, 65535
	wait 1, VAR_SPECIAL_x800C
scr_seq_00000801_0000032E:
	msgbox 1
	waitbutton
	closemsg
	setvar VAR_UNK_4125, 1
	releaseall
	end

scr_seq_00000801_0000033F:
	.byte 0x00

scr_seq_00000801_00000340:
	.short 12, 2
	.short 33, 1
	.short 254, 0

scr_seq_00000801_0000034C:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
	.balign 4, 0
