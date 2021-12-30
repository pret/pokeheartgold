#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0795_T07R0107_0006 ; 000
	scrdef_end

scr_seq_0795_T07R0107_0006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_241 16659
	copyvar VAR_SPECIAL_x8008, VAR_UNK_4113
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_0795_T07R0107_0068
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_0795_T07R0107_0072
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0795_T07R0107_007C
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0795_T07R0107_0086
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0795_T07R0107_0090
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0795_T07R0107_009A
	end

scr_seq_0795_T07R0107_0068:
	scrcmd_852 0, 6
	goto scr_seq_0795_T07R0107_00A4

scr_seq_0795_T07R0107_0072:
	scrcmd_852 0, 5
	goto scr_seq_0795_T07R0107_00A4

scr_seq_0795_T07R0107_007C:
	scrcmd_852 0, 4
	goto scr_seq_0795_T07R0107_00A4

scr_seq_0795_T07R0107_0086:
	scrcmd_852 0, 3
	goto scr_seq_0795_T07R0107_00A4

scr_seq_0795_T07R0107_0090:
	scrcmd_852 0, 2
	goto scr_seq_0795_T07R0107_00A4

scr_seq_0795_T07R0107_009A:
	scrcmd_852 0, 1
	goto scr_seq_0795_T07R0107_00A4

scr_seq_0795_T07R0107_00A4:
	scrcmd_242 20, 1, 16659, 16659
	npc_msg 0
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 121, 255, 6
	menu_item_add 120, 255, 0
	menu_item_add 119, 255, 1
	menu_item_add 118, 255, 2
	menu_item_add 117, 255, 3
	menu_item_add 116, 255, 4
	menu_item_add 126, 255, 7
	menu_exec
	touchscreen_menu_show
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 6
	gotoif eq, scr_seq_0795_T07R0107_052D
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0795_T07R0107_0467
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0795_T07R0107_03A1
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0795_T07R0107_02DB
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0795_T07R0107_0215
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_0795_T07R0107_014F
	goto scr_seq_0795_T07R0107_06DE

scr_seq_0795_T07R0107_014F:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 370, 2, 5, 3, 1
	comparevartovalue VAR_UNK_4113, 0
	gotoif eq, scr_seq_0795_T07R0107_06C7
	comparevartovalue VAR_UNK_4113, 0
	callif gt, scr_seq_0795_T07R0107_05FE
	comparevartovalue VAR_UNK_4113, 0
	callif lt, scr_seq_0795_T07R0107_05F3
	comparevartovalue VAR_UNK_4113, 1
	gotoif ne, scr_seq_0795_T07R0107_01A5
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0795_T07R0107_0203

scr_seq_0795_T07R0107_01A5:
	comparevartovalue VAR_UNK_4113, 2
	gotoif ne, scr_seq_0795_T07R0107_01BE
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_0795_T07R0107_0203

scr_seq_0795_T07R0107_01BE:
	comparevartovalue VAR_UNK_4113, 3
	gotoif ne, scr_seq_0795_T07R0107_01D7
	setvar VAR_SPECIAL_x8005, 3
	goto scr_seq_0795_T07R0107_0203

scr_seq_0795_T07R0107_01D7:
	comparevartovalue VAR_UNK_4113, 4
	gotoif ne, scr_seq_0795_T07R0107_01F0
	setvar VAR_SPECIAL_x8005, 4
	goto scr_seq_0795_T07R0107_0203

scr_seq_0795_T07R0107_01F0:
	comparevartovalue VAR_UNK_4113, 5
	gotoif ne, scr_seq_0795_T07R0107_0203
	setvar VAR_SPECIAL_x8005, 5
scr_seq_0795_T07R0107_0203:
	call scr_seq_0795_T07R0107_0609
	setvar VAR_UNK_4113, 0
	goto scr_seq_0795_T07R0107_0627

scr_seq_0795_T07R0107_0215:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 371, 2, 19, 3, 1
	comparevartovalue VAR_UNK_4113, 1
	gotoif eq, scr_seq_0795_T07R0107_06C7
	comparevartovalue VAR_UNK_4113, 1
	callif gt, scr_seq_0795_T07R0107_05FE
	comparevartovalue VAR_UNK_4113, 1
	callif lt, scr_seq_0795_T07R0107_05F3
	comparevartovalue VAR_UNK_4113, 0
	gotoif ne, scr_seq_0795_T07R0107_026B
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0795_T07R0107_02C9

scr_seq_0795_T07R0107_026B:
	comparevartovalue VAR_UNK_4113, 2
	gotoif ne, scr_seq_0795_T07R0107_0284
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0795_T07R0107_02C9

scr_seq_0795_T07R0107_0284:
	comparevartovalue VAR_UNK_4113, 3
	gotoif ne, scr_seq_0795_T07R0107_029D
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_0795_T07R0107_02C9

scr_seq_0795_T07R0107_029D:
	comparevartovalue VAR_UNK_4113, 4
	gotoif ne, scr_seq_0795_T07R0107_02B6
	setvar VAR_SPECIAL_x8005, 3
	goto scr_seq_0795_T07R0107_02C9

scr_seq_0795_T07R0107_02B6:
	comparevartovalue VAR_UNK_4113, 5
	gotoif ne, scr_seq_0795_T07R0107_02C9
	setvar VAR_SPECIAL_x8005, 4
scr_seq_0795_T07R0107_02C9:
	call scr_seq_0795_T07R0107_0609
	setvar VAR_UNK_4113, 1
	goto scr_seq_0795_T07R0107_0627

scr_seq_0795_T07R0107_02DB:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 372, 2, 19, 3, 1
	comparevartovalue VAR_UNK_4113, 2
	gotoif eq, scr_seq_0795_T07R0107_06C7
	comparevartovalue VAR_UNK_4113, 2
	callif gt, scr_seq_0795_T07R0107_05FE
	comparevartovalue VAR_UNK_4113, 2
	callif lt, scr_seq_0795_T07R0107_05F3
	comparevartovalue VAR_UNK_4113, 0
	gotoif ne, scr_seq_0795_T07R0107_0331
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_0795_T07R0107_038F

scr_seq_0795_T07R0107_0331:
	comparevartovalue VAR_UNK_4113, 1
	gotoif ne, scr_seq_0795_T07R0107_034A
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0795_T07R0107_038F

scr_seq_0795_T07R0107_034A:
	comparevartovalue VAR_UNK_4113, 3
	gotoif ne, scr_seq_0795_T07R0107_0363
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0795_T07R0107_038F

scr_seq_0795_T07R0107_0363:
	comparevartovalue VAR_UNK_4113, 4
	gotoif ne, scr_seq_0795_T07R0107_037C
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_0795_T07R0107_038F

scr_seq_0795_T07R0107_037C:
	comparevartovalue VAR_UNK_4113, 5
	gotoif ne, scr_seq_0795_T07R0107_038F
	setvar VAR_SPECIAL_x8005, 3
scr_seq_0795_T07R0107_038F:
	call scr_seq_0795_T07R0107_0609
	setvar VAR_UNK_4113, 2
	goto scr_seq_0795_T07R0107_0627

scr_seq_0795_T07R0107_03A1:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 373, 2, 19, 3, 1
	comparevartovalue VAR_UNK_4113, 3
	gotoif eq, scr_seq_0795_T07R0107_06C7
	comparevartovalue VAR_UNK_4113, 3
	callif gt, scr_seq_0795_T07R0107_05FE
	comparevartovalue VAR_UNK_4113, 3
	callif lt, scr_seq_0795_T07R0107_05F3
	comparevartovalue VAR_UNK_4113, 0
	gotoif ne, scr_seq_0795_T07R0107_03F7
	setvar VAR_SPECIAL_x8005, 3
	goto scr_seq_0795_T07R0107_0455

scr_seq_0795_T07R0107_03F7:
	comparevartovalue VAR_UNK_4113, 1
	gotoif ne, scr_seq_0795_T07R0107_0410
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_0795_T07R0107_0455

scr_seq_0795_T07R0107_0410:
	comparevartovalue VAR_UNK_4113, 2
	gotoif ne, scr_seq_0795_T07R0107_0429
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0795_T07R0107_0455

scr_seq_0795_T07R0107_0429:
	comparevartovalue VAR_UNK_4113, 4
	gotoif ne, scr_seq_0795_T07R0107_0442
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0795_T07R0107_0455

scr_seq_0795_T07R0107_0442:
	comparevartovalue VAR_UNK_4113, 5
	gotoif ne, scr_seq_0795_T07R0107_0455
	setvar VAR_SPECIAL_x8005, 2
scr_seq_0795_T07R0107_0455:
	call scr_seq_0795_T07R0107_0609
	setvar VAR_UNK_4113, 3
	goto scr_seq_0795_T07R0107_0627

scr_seq_0795_T07R0107_0467:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 374, 2, 19, 3, 1
	comparevartovalue VAR_UNK_4113, 4
	gotoif eq, scr_seq_0795_T07R0107_06C7
	comparevartovalue VAR_UNK_4113, 4
	callif gt, scr_seq_0795_T07R0107_05FE
	comparevartovalue VAR_UNK_4113, 4
	callif lt, scr_seq_0795_T07R0107_05F3
	comparevartovalue VAR_UNK_4113, 0
	gotoif ne, scr_seq_0795_T07R0107_04BD
	setvar VAR_SPECIAL_x8005, 4
	goto scr_seq_0795_T07R0107_051B

scr_seq_0795_T07R0107_04BD:
	comparevartovalue VAR_UNK_4113, 1
	gotoif ne, scr_seq_0795_T07R0107_04D6
	setvar VAR_SPECIAL_x8005, 3
	goto scr_seq_0795_T07R0107_051B

scr_seq_0795_T07R0107_04D6:
	comparevartovalue VAR_UNK_4113, 2
	gotoif ne, scr_seq_0795_T07R0107_04EF
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_0795_T07R0107_051B

scr_seq_0795_T07R0107_04EF:
	comparevartovalue VAR_UNK_4113, 3
	gotoif ne, scr_seq_0795_T07R0107_0508
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0795_T07R0107_051B

scr_seq_0795_T07R0107_0508:
	comparevartovalue VAR_UNK_4113, 5
	gotoif ne, scr_seq_0795_T07R0107_051B
	setvar VAR_SPECIAL_x8005, 1
scr_seq_0795_T07R0107_051B:
	call scr_seq_0795_T07R0107_0609
	setvar VAR_UNK_4113, 4
	goto scr_seq_0795_T07R0107_0627

scr_seq_0795_T07R0107_052D:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 375, 1, 19, 3, 1
	comparevartovalue VAR_UNK_4113, 5
	gotoif eq, scr_seq_0795_T07R0107_06C7
	comparevartovalue VAR_UNK_4113, 5
	callif gt, scr_seq_0795_T07R0107_05FE
	comparevartovalue VAR_UNK_4113, 5
	callif lt, scr_seq_0795_T07R0107_05F3
	comparevartovalue VAR_UNK_4113, 0
	gotoif ne, scr_seq_0795_T07R0107_0583
	setvar VAR_SPECIAL_x8005, 5
	goto scr_seq_0795_T07R0107_05E1

scr_seq_0795_T07R0107_0583:
	comparevartovalue VAR_UNK_4113, 1
	gotoif ne, scr_seq_0795_T07R0107_059C
	setvar VAR_SPECIAL_x8005, 4
	goto scr_seq_0795_T07R0107_05E1

scr_seq_0795_T07R0107_059C:
	comparevartovalue VAR_UNK_4113, 2
	gotoif ne, scr_seq_0795_T07R0107_05B5
	setvar VAR_SPECIAL_x8005, 3
	goto scr_seq_0795_T07R0107_05E1

scr_seq_0795_T07R0107_05B5:
	comparevartovalue VAR_UNK_4113, 3
	gotoif ne, scr_seq_0795_T07R0107_05CE
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_0795_T07R0107_05E1

scr_seq_0795_T07R0107_05CE:
	comparevartovalue VAR_UNK_4113, 4
	gotoif ne, scr_seq_0795_T07R0107_05E1
	setvar VAR_SPECIAL_x8005, 1
scr_seq_0795_T07R0107_05E1:
	call scr_seq_0795_T07R0107_0609
	setvar VAR_UNK_4113, 5
	goto scr_seq_0795_T07R0107_0627

scr_seq_0795_T07R0107_05F3:
	npc_msg 2
	setvar VAR_SPECIAL_x8004, 0
	return

scr_seq_0795_T07R0107_05FE:
	npc_msg 3
	setvar VAR_SPECIAL_x8004, 1
	return

scr_seq_0795_T07R0107_0609:
	setvar VAR_UNK_4113, 65535
	closemsg
	apply_movement 0, scr_seq_0795_T07R0107_06F8
	wait_movement
	wait_se SEQ_SE_DP_SELECT
	scrcmd_488 32772, 32773
	return

scr_seq_0795_T07R0107_0627:
	copyvar VAR_SPECIAL_x8008, VAR_UNK_4113
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_0795_T07R0107_067D
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_0795_T07R0107_0688
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0795_T07R0107_0693
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0795_T07R0107_069E
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0795_T07R0107_06A9
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0795_T07R0107_06B4
	end

scr_seq_0795_T07R0107_067D:
	npc_msg 10
	goto scr_seq_0795_T07R0107_06BF

scr_seq_0795_T07R0107_0686:
	.byte 0x02, 0x00
scr_seq_0795_T07R0107_0688:
	npc_msg 9
	goto scr_seq_0795_T07R0107_06BF

scr_seq_0795_T07R0107_0691:
	.byte 0x02, 0x00
scr_seq_0795_T07R0107_0693:
	npc_msg 8
	goto scr_seq_0795_T07R0107_06BF

scr_seq_0795_T07R0107_069C:
	.byte 0x02, 0x00
scr_seq_0795_T07R0107_069E:
	npc_msg 7
	goto scr_seq_0795_T07R0107_06BF

scr_seq_0795_T07R0107_06A7:
	.byte 0x02, 0x00
scr_seq_0795_T07R0107_06A9:
	npc_msg 6
	goto scr_seq_0795_T07R0107_06BF

scr_seq_0795_T07R0107_06B2:
	.byte 0x02, 0x00
scr_seq_0795_T07R0107_06B4:
	npc_msg 5
	goto scr_seq_0795_T07R0107_06BF

scr_seq_0795_T07R0107_06BD:
	.byte 0x02, 0x00
scr_seq_0795_T07R0107_06BF:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0795_T07R0107_06C7:
	setvar VAR_UNK_4113, 65535
	wait 1, VAR_SPECIAL_x800C
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0795_T07R0107_06DE:
	setvar VAR_UNK_4113, 65535
	wait 1, VAR_SPECIAL_x800C
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0795_T07R0107_06F5:
	.byte 0x00, 0x00, 0x00

scr_seq_0795_T07R0107_06F8:
	step 33, 1
	step_end
	.balign 4, 0
