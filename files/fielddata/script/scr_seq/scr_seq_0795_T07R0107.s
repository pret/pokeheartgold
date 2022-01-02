#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T07R0107.h"
#include "msgdata/msg/msg_0500_T07R0107.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T07R0107_000
	scrdef_end

scr_seq_T07R0107_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_241 16659
	switch VAR_UNK_4113
	case 5, _0068
	case 4, _0072
	case 3, _007C
	case 2, _0086
	case 1, _0090
	case 0, _009A
	end

_0068:
	buffer_dept_store_floor_no 0, 6
	goto _00A4

_0072:
	buffer_dept_store_floor_no 0, 5
	goto _00A4

_007C:
	buffer_dept_store_floor_no 0, 4
	goto _00A4

_0086:
	buffer_dept_store_floor_no 0, 3
	goto _00A4

_0090:
	buffer_dept_store_floor_no 0, 2
	goto _00A4

_009A:
	buffer_dept_store_floor_no 0, 1
	goto _00A4

_00A4:
	scrcmd_242 20, 1, 16659, 16659
	npc_msg msg_0500_T07R0107_00000
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
	switch VAR_SPECIAL_x800C
	case 6, _052D
	case 0, _0467
	case 1, _03A1
	case 2, _02DB
	case 3, _0215
	case 4, _014F
	goto _06DE

_014F:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 370, 2, 5, 3, 1
	comparevartovalue VAR_UNK_4113, 0
	gotoif eq, _06C7
	comparevartovalue VAR_UNK_4113, 0
	callif gt, _05FE
	comparevartovalue VAR_UNK_4113, 0
	callif lt, _05F3
	comparevartovalue VAR_UNK_4113, 1
	gotoif ne, _01A5
	setvar VAR_SPECIAL_x8005, 1
	goto _0203

_01A5:
	comparevartovalue VAR_UNK_4113, 2
	gotoif ne, _01BE
	setvar VAR_SPECIAL_x8005, 2
	goto _0203

_01BE:
	comparevartovalue VAR_UNK_4113, 3
	gotoif ne, _01D7
	setvar VAR_SPECIAL_x8005, 3
	goto _0203

_01D7:
	comparevartovalue VAR_UNK_4113, 4
	gotoif ne, _01F0
	setvar VAR_SPECIAL_x8005, 4
	goto _0203

_01F0:
	comparevartovalue VAR_UNK_4113, 5
	gotoif ne, _0203
	setvar VAR_SPECIAL_x8005, 5
_0203:
	call _0609
	setvar VAR_UNK_4113, 0
	goto _0627

_0215:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 371, 2, 19, 3, 1
	comparevartovalue VAR_UNK_4113, 1
	gotoif eq, _06C7
	comparevartovalue VAR_UNK_4113, 1
	callif gt, _05FE
	comparevartovalue VAR_UNK_4113, 1
	callif lt, _05F3
	comparevartovalue VAR_UNK_4113, 0
	gotoif ne, _026B
	setvar VAR_SPECIAL_x8005, 1
	goto _02C9

_026B:
	comparevartovalue VAR_UNK_4113, 2
	gotoif ne, _0284
	setvar VAR_SPECIAL_x8005, 1
	goto _02C9

_0284:
	comparevartovalue VAR_UNK_4113, 3
	gotoif ne, _029D
	setvar VAR_SPECIAL_x8005, 2
	goto _02C9

_029D:
	comparevartovalue VAR_UNK_4113, 4
	gotoif ne, _02B6
	setvar VAR_SPECIAL_x8005, 3
	goto _02C9

_02B6:
	comparevartovalue VAR_UNK_4113, 5
	gotoif ne, _02C9
	setvar VAR_SPECIAL_x8005, 4
_02C9:
	call _0609
	setvar VAR_UNK_4113, 1
	goto _0627

_02DB:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 372, 2, 19, 3, 1
	comparevartovalue VAR_UNK_4113, 2
	gotoif eq, _06C7
	comparevartovalue VAR_UNK_4113, 2
	callif gt, _05FE
	comparevartovalue VAR_UNK_4113, 2
	callif lt, _05F3
	comparevartovalue VAR_UNK_4113, 0
	gotoif ne, _0331
	setvar VAR_SPECIAL_x8005, 2
	goto _038F

_0331:
	comparevartovalue VAR_UNK_4113, 1
	gotoif ne, _034A
	setvar VAR_SPECIAL_x8005, 1
	goto _038F

_034A:
	comparevartovalue VAR_UNK_4113, 3
	gotoif ne, _0363
	setvar VAR_SPECIAL_x8005, 1
	goto _038F

_0363:
	comparevartovalue VAR_UNK_4113, 4
	gotoif ne, _037C
	setvar VAR_SPECIAL_x8005, 2
	goto _038F

_037C:
	comparevartovalue VAR_UNK_4113, 5
	gotoif ne, _038F
	setvar VAR_SPECIAL_x8005, 3
_038F:
	call _0609
	setvar VAR_UNK_4113, 2
	goto _0627

_03A1:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 373, 2, 19, 3, 1
	comparevartovalue VAR_UNK_4113, 3
	gotoif eq, _06C7
	comparevartovalue VAR_UNK_4113, 3
	callif gt, _05FE
	comparevartovalue VAR_UNK_4113, 3
	callif lt, _05F3
	comparevartovalue VAR_UNK_4113, 0
	gotoif ne, _03F7
	setvar VAR_SPECIAL_x8005, 3
	goto _0455

_03F7:
	comparevartovalue VAR_UNK_4113, 1
	gotoif ne, _0410
	setvar VAR_SPECIAL_x8005, 2
	goto _0455

_0410:
	comparevartovalue VAR_UNK_4113, 2
	gotoif ne, _0429
	setvar VAR_SPECIAL_x8005, 1
	goto _0455

_0429:
	comparevartovalue VAR_UNK_4113, 4
	gotoif ne, _0442
	setvar VAR_SPECIAL_x8005, 1
	goto _0455

_0442:
	comparevartovalue VAR_UNK_4113, 5
	gotoif ne, _0455
	setvar VAR_SPECIAL_x8005, 2
_0455:
	call _0609
	setvar VAR_UNK_4113, 3
	goto _0627

_0467:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 374, 2, 19, 3, 1
	comparevartovalue VAR_UNK_4113, 4
	gotoif eq, _06C7
	comparevartovalue VAR_UNK_4113, 4
	callif gt, _05FE
	comparevartovalue VAR_UNK_4113, 4
	callif lt, _05F3
	comparevartovalue VAR_UNK_4113, 0
	gotoif ne, _04BD
	setvar VAR_SPECIAL_x8005, 4
	goto _051B

_04BD:
	comparevartovalue VAR_UNK_4113, 1
	gotoif ne, _04D6
	setvar VAR_SPECIAL_x8005, 3
	goto _051B

_04D6:
	comparevartovalue VAR_UNK_4113, 2
	gotoif ne, _04EF
	setvar VAR_SPECIAL_x8005, 2
	goto _051B

_04EF:
	comparevartovalue VAR_UNK_4113, 3
	gotoif ne, _0508
	setvar VAR_SPECIAL_x8005, 1
	goto _051B

_0508:
	comparevartovalue VAR_UNK_4113, 5
	gotoif ne, _051B
	setvar VAR_SPECIAL_x8005, 1
_051B:
	call _0609
	setvar VAR_UNK_4113, 4
	goto _0627

_052D:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 375, 1, 19, 3, 1
	comparevartovalue VAR_UNK_4113, 5
	gotoif eq, _06C7
	comparevartovalue VAR_UNK_4113, 5
	callif gt, _05FE
	comparevartovalue VAR_UNK_4113, 5
	callif lt, _05F3
	comparevartovalue VAR_UNK_4113, 0
	gotoif ne, _0583
	setvar VAR_SPECIAL_x8005, 5
	goto _05E1

_0583:
	comparevartovalue VAR_UNK_4113, 1
	gotoif ne, _059C
	setvar VAR_SPECIAL_x8005, 4
	goto _05E1

_059C:
	comparevartovalue VAR_UNK_4113, 2
	gotoif ne, _05B5
	setvar VAR_SPECIAL_x8005, 3
	goto _05E1

_05B5:
	comparevartovalue VAR_UNK_4113, 3
	gotoif ne, _05CE
	setvar VAR_SPECIAL_x8005, 2
	goto _05E1

_05CE:
	comparevartovalue VAR_UNK_4113, 4
	gotoif ne, _05E1
	setvar VAR_SPECIAL_x8005, 1
_05E1:
	call _0609
	setvar VAR_UNK_4113, 5
	goto _0627

_05F3:
	npc_msg msg_0500_T07R0107_00002
	setvar VAR_SPECIAL_x8004, 0
	return

_05FE:
	npc_msg msg_0500_T07R0107_00003
	setvar VAR_SPECIAL_x8004, 1
	return

_0609:
	setvar VAR_UNK_4113, 65535
	closemsg
	apply_movement obj_T07R0107_gswoman6, _06F8
	wait_movement
	wait_se SEQ_SE_DP_SELECT
	scrcmd_488 32772, 32773
	return

_0627:
	switch VAR_UNK_4113
	case 5, _067D
	case 4, _0688
	case 3, _0693
	case 2, _069E
	case 1, _06A9
	case 0, _06B4
	end

_067D:
	npc_msg msg_0500_T07R0107_00010
	goto _06BF
	.byte 0x02, 0x00
_0688:
	npc_msg msg_0500_T07R0107_00009
	goto _06BF
	.byte 0x02, 0x00
_0693:
	npc_msg msg_0500_T07R0107_00008
	goto _06BF
	.byte 0x02, 0x00
_069E:
	npc_msg msg_0500_T07R0107_00007
	goto _06BF
	.byte 0x02, 0x00
_06A9:
	npc_msg msg_0500_T07R0107_00006
	goto _06BF
	.byte 0x02, 0x00
_06B4:
	npc_msg msg_0500_T07R0107_00005
	goto _06BF
	.byte 0x02, 0x00
_06BF:
	waitbutton
	closemsg
	releaseall
	end

_06C7:
	setvar VAR_UNK_4113, 65535
	wait 1, VAR_SPECIAL_x800C
	npc_msg msg_0500_T07R0107_00004
	waitbutton
	closemsg
	releaseall
	end

_06DE:
	setvar VAR_UNK_4113, 65535
	wait 1, VAR_SPECIAL_x800C
	npc_msg msg_0500_T07R0107_00001
	waitbutton
	closemsg
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_06F8:
	step 33, 1
	step_end
	.balign 4, 0
