#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0795_0006 ; 000
	scrdef_end

scr_seq_0795_0006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_241 16659
	copyvar VAR_SPECIAL_x8008, VAR_UNK_4113
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_0795_0068
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_0795_0072
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0795_007C
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0795_0086
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0795_0090
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0795_009A
	end

scr_seq_0795_0068:
	scrcmd_852 0, 6
	goto scr_seq_0795_00A4

scr_seq_0795_0072:
	scrcmd_852 0, 5
	goto scr_seq_0795_00A4

scr_seq_0795_007C:
	scrcmd_852 0, 4
	goto scr_seq_0795_00A4

scr_seq_0795_0086:
	scrcmd_852 0, 3
	goto scr_seq_0795_00A4

scr_seq_0795_0090:
	scrcmd_852 0, 2
	goto scr_seq_0795_00A4

scr_seq_0795_009A:
	scrcmd_852 0, 1
	goto scr_seq_0795_00A4

scr_seq_0795_00A4:
	scrcmd_242 20, 1, 16659, 16659
	npc_msg 0
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 121, 255, 6
	scrcmd_751 120, 255, 0
	scrcmd_751 119, 255, 1
	scrcmd_751 118, 255, 2
	scrcmd_751 117, 255, 3
	scrcmd_751 116, 255, 4
	scrcmd_751 126, 255, 7
	scrcmd_752
	scrcmd_747
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 6
	gotoif eq, scr_seq_0795_052D
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0795_0467
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0795_03A1
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0795_02DB
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0795_0215
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_0795_014F
	goto scr_seq_0795_06DE

scr_seq_0795_014F:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 370, 2, 5, 3, 1
	comparevartovalue VAR_UNK_4113, 0
	gotoif eq, scr_seq_0795_06C7
	comparevartovalue VAR_UNK_4113, 0
	callif gt, scr_seq_0795_05FE
	comparevartovalue VAR_UNK_4113, 0
	callif lt, scr_seq_0795_05F3
	comparevartovalue VAR_UNK_4113, 1
	gotoif ne, scr_seq_0795_01A5
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0795_0203

scr_seq_0795_01A5:
	comparevartovalue VAR_UNK_4113, 2
	gotoif ne, scr_seq_0795_01BE
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_0795_0203

scr_seq_0795_01BE:
	comparevartovalue VAR_UNK_4113, 3
	gotoif ne, scr_seq_0795_01D7
	setvar VAR_SPECIAL_x8005, 3
	goto scr_seq_0795_0203

scr_seq_0795_01D7:
	comparevartovalue VAR_UNK_4113, 4
	gotoif ne, scr_seq_0795_01F0
	setvar VAR_SPECIAL_x8005, 4
	goto scr_seq_0795_0203

scr_seq_0795_01F0:
	comparevartovalue VAR_UNK_4113, 5
	gotoif ne, scr_seq_0795_0203
	setvar VAR_SPECIAL_x8005, 5
scr_seq_0795_0203:
	call scr_seq_0795_0609
	setvar VAR_UNK_4113, 0
	goto scr_seq_0795_0627

scr_seq_0795_0215:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 371, 2, 19, 3, 1
	comparevartovalue VAR_UNK_4113, 1
	gotoif eq, scr_seq_0795_06C7
	comparevartovalue VAR_UNK_4113, 1
	callif gt, scr_seq_0795_05FE
	comparevartovalue VAR_UNK_4113, 1
	callif lt, scr_seq_0795_05F3
	comparevartovalue VAR_UNK_4113, 0
	gotoif ne, scr_seq_0795_026B
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0795_02C9

scr_seq_0795_026B:
	comparevartovalue VAR_UNK_4113, 2
	gotoif ne, scr_seq_0795_0284
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0795_02C9

scr_seq_0795_0284:
	comparevartovalue VAR_UNK_4113, 3
	gotoif ne, scr_seq_0795_029D
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_0795_02C9

scr_seq_0795_029D:
	comparevartovalue VAR_UNK_4113, 4
	gotoif ne, scr_seq_0795_02B6
	setvar VAR_SPECIAL_x8005, 3
	goto scr_seq_0795_02C9

scr_seq_0795_02B6:
	comparevartovalue VAR_UNK_4113, 5
	gotoif ne, scr_seq_0795_02C9
	setvar VAR_SPECIAL_x8005, 4
scr_seq_0795_02C9:
	call scr_seq_0795_0609
	setvar VAR_UNK_4113, 1
	goto scr_seq_0795_0627

scr_seq_0795_02DB:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 372, 2, 19, 3, 1
	comparevartovalue VAR_UNK_4113, 2
	gotoif eq, scr_seq_0795_06C7
	comparevartovalue VAR_UNK_4113, 2
	callif gt, scr_seq_0795_05FE
	comparevartovalue VAR_UNK_4113, 2
	callif lt, scr_seq_0795_05F3
	comparevartovalue VAR_UNK_4113, 0
	gotoif ne, scr_seq_0795_0331
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_0795_038F

scr_seq_0795_0331:
	comparevartovalue VAR_UNK_4113, 1
	gotoif ne, scr_seq_0795_034A
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0795_038F

scr_seq_0795_034A:
	comparevartovalue VAR_UNK_4113, 3
	gotoif ne, scr_seq_0795_0363
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0795_038F

scr_seq_0795_0363:
	comparevartovalue VAR_UNK_4113, 4
	gotoif ne, scr_seq_0795_037C
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_0795_038F

scr_seq_0795_037C:
	comparevartovalue VAR_UNK_4113, 5
	gotoif ne, scr_seq_0795_038F
	setvar VAR_SPECIAL_x8005, 3
scr_seq_0795_038F:
	call scr_seq_0795_0609
	setvar VAR_UNK_4113, 2
	goto scr_seq_0795_0627

scr_seq_0795_03A1:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 373, 2, 19, 3, 1
	comparevartovalue VAR_UNK_4113, 3
	gotoif eq, scr_seq_0795_06C7
	comparevartovalue VAR_UNK_4113, 3
	callif gt, scr_seq_0795_05FE
	comparevartovalue VAR_UNK_4113, 3
	callif lt, scr_seq_0795_05F3
	comparevartovalue VAR_UNK_4113, 0
	gotoif ne, scr_seq_0795_03F7
	setvar VAR_SPECIAL_x8005, 3
	goto scr_seq_0795_0455

scr_seq_0795_03F7:
	comparevartovalue VAR_UNK_4113, 1
	gotoif ne, scr_seq_0795_0410
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_0795_0455

scr_seq_0795_0410:
	comparevartovalue VAR_UNK_4113, 2
	gotoif ne, scr_seq_0795_0429
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0795_0455

scr_seq_0795_0429:
	comparevartovalue VAR_UNK_4113, 4
	gotoif ne, scr_seq_0795_0442
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0795_0455

scr_seq_0795_0442:
	comparevartovalue VAR_UNK_4113, 5
	gotoif ne, scr_seq_0795_0455
	setvar VAR_SPECIAL_x8005, 2
scr_seq_0795_0455:
	call scr_seq_0795_0609
	setvar VAR_UNK_4113, 3
	goto scr_seq_0795_0627

scr_seq_0795_0467:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 374, 2, 19, 3, 1
	comparevartovalue VAR_UNK_4113, 4
	gotoif eq, scr_seq_0795_06C7
	comparevartovalue VAR_UNK_4113, 4
	callif gt, scr_seq_0795_05FE
	comparevartovalue VAR_UNK_4113, 4
	callif lt, scr_seq_0795_05F3
	comparevartovalue VAR_UNK_4113, 0
	gotoif ne, scr_seq_0795_04BD
	setvar VAR_SPECIAL_x8005, 4
	goto scr_seq_0795_051B

scr_seq_0795_04BD:
	comparevartovalue VAR_UNK_4113, 1
	gotoif ne, scr_seq_0795_04D6
	setvar VAR_SPECIAL_x8005, 3
	goto scr_seq_0795_051B

scr_seq_0795_04D6:
	comparevartovalue VAR_UNK_4113, 2
	gotoif ne, scr_seq_0795_04EF
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_0795_051B

scr_seq_0795_04EF:
	comparevartovalue VAR_UNK_4113, 3
	gotoif ne, scr_seq_0795_0508
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0795_051B

scr_seq_0795_0508:
	comparevartovalue VAR_UNK_4113, 5
	gotoif ne, scr_seq_0795_051B
	setvar VAR_SPECIAL_x8005, 1
scr_seq_0795_051B:
	call scr_seq_0795_0609
	setvar VAR_UNK_4113, 4
	goto scr_seq_0795_0627

scr_seq_0795_052D:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 375, 1, 19, 3, 1
	comparevartovalue VAR_UNK_4113, 5
	gotoif eq, scr_seq_0795_06C7
	comparevartovalue VAR_UNK_4113, 5
	callif gt, scr_seq_0795_05FE
	comparevartovalue VAR_UNK_4113, 5
	callif lt, scr_seq_0795_05F3
	comparevartovalue VAR_UNK_4113, 0
	gotoif ne, scr_seq_0795_0583
	setvar VAR_SPECIAL_x8005, 5
	goto scr_seq_0795_05E1

scr_seq_0795_0583:
	comparevartovalue VAR_UNK_4113, 1
	gotoif ne, scr_seq_0795_059C
	setvar VAR_SPECIAL_x8005, 4
	goto scr_seq_0795_05E1

scr_seq_0795_059C:
	comparevartovalue VAR_UNK_4113, 2
	gotoif ne, scr_seq_0795_05B5
	setvar VAR_SPECIAL_x8005, 3
	goto scr_seq_0795_05E1

scr_seq_0795_05B5:
	comparevartovalue VAR_UNK_4113, 3
	gotoif ne, scr_seq_0795_05CE
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_0795_05E1

scr_seq_0795_05CE:
	comparevartovalue VAR_UNK_4113, 4
	gotoif ne, scr_seq_0795_05E1
	setvar VAR_SPECIAL_x8005, 1
scr_seq_0795_05E1:
	call scr_seq_0795_0609
	setvar VAR_UNK_4113, 5
	goto scr_seq_0795_0627

scr_seq_0795_05F3:
	npc_msg 2
	setvar VAR_SPECIAL_x8004, 0
	return

scr_seq_0795_05FE:
	npc_msg 3
	setvar VAR_SPECIAL_x8004, 1
	return

scr_seq_0795_0609:
	setvar VAR_UNK_4113, 65535
	closemsg
	apply_movement 0, scr_seq_0795_06F8
	wait_movement
	wait_se SEQ_SE_DP_SELECT
	scrcmd_488 32772, 32773
	return

scr_seq_0795_0627:
	copyvar VAR_SPECIAL_x8008, VAR_UNK_4113
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_0795_067D
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_0795_0688
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0795_0693
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0795_069E
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0795_06A9
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0795_06B4
	end

scr_seq_0795_067D:
	npc_msg 10
	goto scr_seq_0795_06BF

scr_seq_0795_0686:
	.byte 0x02, 0x00
scr_seq_0795_0688:
	npc_msg 9
	goto scr_seq_0795_06BF

scr_seq_0795_0691:
	.byte 0x02, 0x00
scr_seq_0795_0693:
	npc_msg 8
	goto scr_seq_0795_06BF

scr_seq_0795_069C:
	.byte 0x02, 0x00
scr_seq_0795_069E:
	npc_msg 7
	goto scr_seq_0795_06BF

scr_seq_0795_06A7:
	.byte 0x02, 0x00
scr_seq_0795_06A9:
	npc_msg 6
	goto scr_seq_0795_06BF

scr_seq_0795_06B2:
	.byte 0x02, 0x00
scr_seq_0795_06B4:
	npc_msg 5
	goto scr_seq_0795_06BF

scr_seq_0795_06BD:
	.byte 0x02, 0x00
scr_seq_0795_06BF:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0795_06C7:
	setvar VAR_UNK_4113, 65535
	wait 1, VAR_SPECIAL_x800C
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0795_06DE:
	setvar VAR_UNK_4113, 65535
	wait 1, VAR_SPECIAL_x800C
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0795_06F5:
	.byte 0x00, 0x00, 0x00

scr_seq_0795_06F8:
	.short 33, 1
	.short 254, 0
	.balign 4, 0
