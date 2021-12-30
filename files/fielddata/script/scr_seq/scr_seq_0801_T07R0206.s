#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0801_T07R0206_0006 ; 000
	scrdef_end

scr_seq_0801_T07R0206_0006:
	scrcmd_609
	lockall
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0801_T07R0206_0058
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0801_T07R0206_002A
	end

scr_seq_0801_T07R0206_002A:
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0801_T07R0206_0340
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement 253, scr_seq_0801_T07R0206_034C
	wait_movement
	goto scr_seq_0801_T07R0206_0062

scr_seq_0801_T07R0206_0058:
	apply_movement 255, scr_seq_0801_T07R0206_0340
	wait_movement
scr_seq_0801_T07R0206_0062:
	scrcmd_241 16659
	copyvar VAR_SPECIAL_x8008, VAR_UNK_4113
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0801_T07R0206_0095
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0801_T07R0206_00A0
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0801_T07R0206_00AA
	end

scr_seq_0801_T07R0206_0095:
	buffer_int 0, 0
	goto scr_seq_0801_T07R0206_00B4

scr_seq_0801_T07R0206_00A0:
	scrcmd_852 0, 3
	goto scr_seq_0801_T07R0206_00B4

scr_seq_0801_T07R0206_00AA:
	scrcmd_852 0, 1
	goto scr_seq_0801_T07R0206_00B4

scr_seq_0801_T07R0206_00B4:
	scrcmd_242 20, 1, 16659, 16659
	npc_msg 0
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 116, 255, 0
	menu_item_add 118, 255, 1
	menu_item_add 125, 255, 2
	menu_item_add 126, 255, 3
	menu_exec
	touchscreen_menu_show
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0801_T07R0206_0120
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0801_T07R0206_019B
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0801_T07R0206_0216
	goto scr_seq_0801_T07R0206_0322

scr_seq_0801_T07R0206_0120:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 376, 2, 5, 3, 1
	comparevartovalue VAR_UNK_4113, 0
	gotoif eq, scr_seq_0801_T07R0206_0305
	comparevartovalue VAR_UNK_4113, 0
	callif gt, scr_seq_0801_T07R0206_029C
	comparevartovalue VAR_UNK_4113, 0
	callif lt, scr_seq_0801_T07R0206_0291
	comparevartovalue VAR_UNK_4113, 2
	gotoif ne, scr_seq_0801_T07R0206_0176
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_0801_T07R0206_0189

scr_seq_0801_T07R0206_0176:
	comparevartovalue VAR_UNK_4113, 3
	gotoif ne, scr_seq_0801_T07R0206_0189
	setvar VAR_SPECIAL_x8005, 3
scr_seq_0801_T07R0206_0189:
	call scr_seq_0801_T07R0206_02A7
	setvar VAR_UNK_4113, 0
	goto scr_seq_0801_T07R0206_02BB

scr_seq_0801_T07R0206_019B:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 378, 0, 5, 3, 1
	comparevartovalue VAR_UNK_4113, 2
	gotoif eq, scr_seq_0801_T07R0206_0305
	comparevartovalue VAR_UNK_4113, 2
	callif gt, scr_seq_0801_T07R0206_029C
	comparevartovalue VAR_UNK_4113, 2
	callif lt, scr_seq_0801_T07R0206_0291
	comparevartovalue VAR_UNK_4113, 0
	gotoif ne, scr_seq_0801_T07R0206_01F1
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_0801_T07R0206_0204

scr_seq_0801_T07R0206_01F1:
	comparevartovalue VAR_UNK_4113, 3
	gotoif ne, scr_seq_0801_T07R0206_0204
	setvar VAR_SPECIAL_x8005, 1
scr_seq_0801_T07R0206_0204:
	call scr_seq_0801_T07R0206_02A7
	setvar VAR_UNK_4113, 2
	goto scr_seq_0801_T07R0206_02BB

scr_seq_0801_T07R0206_0216:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 379, 1, 5, 3, 1
	comparevartovalue VAR_UNK_4113, 3
	gotoif eq, scr_seq_0801_T07R0206_0305
	comparevartovalue VAR_UNK_4113, 3
	callif gt, scr_seq_0801_T07R0206_029C
	comparevartovalue VAR_UNK_4113, 3
	callif lt, scr_seq_0801_T07R0206_0291
	comparevartovalue VAR_UNK_4113, 0
	gotoif ne, scr_seq_0801_T07R0206_026C
	setvar VAR_SPECIAL_x8005, 3
	goto scr_seq_0801_T07R0206_027F

scr_seq_0801_T07R0206_026C:
	comparevartovalue VAR_UNK_4113, 2
	gotoif ne, scr_seq_0801_T07R0206_027F
	setvar VAR_SPECIAL_x8005, 1
scr_seq_0801_T07R0206_027F:
	call scr_seq_0801_T07R0206_02A7
	setvar VAR_UNK_4113, 3
	goto scr_seq_0801_T07R0206_02BB

scr_seq_0801_T07R0206_0291:
	npc_msg 2
	setvar VAR_SPECIAL_x8004, 0
	return

scr_seq_0801_T07R0206_029C:
	npc_msg 3
	setvar VAR_SPECIAL_x8004, 1
	return

scr_seq_0801_T07R0206_02A7:
	setvar VAR_UNK_4113, 65535
	closemsg
	wait_se SEQ_SE_DP_SELECT
	scrcmd_488 32772, 32773
	return

scr_seq_0801_T07R0206_02BB:
	copyvar VAR_SPECIAL_x8008, VAR_UNK_4113
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0801_T07R0206_02EA
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0801_T07R0206_02F3
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0801_T07R0206_02FC
	end

scr_seq_0801_T07R0206_02EA:
	npc_msg 7
	goto scr_seq_0801_T07R0206_032E

scr_seq_0801_T07R0206_02F3:
	npc_msg 6
	goto scr_seq_0801_T07R0206_032E

scr_seq_0801_T07R0206_02FC:
	npc_msg 5
	goto scr_seq_0801_T07R0206_032E

scr_seq_0801_T07R0206_0305:
	setvar VAR_UNK_4113, 65535
	wait 1, VAR_SPECIAL_x800C
	npc_msg 4
	waitbutton
	closemsg
	setvar VAR_UNK_4125, 1
	releaseall
	end

scr_seq_0801_T07R0206_0322:
	setvar VAR_UNK_4113, 65535
	wait 1, VAR_SPECIAL_x800C
scr_seq_0801_T07R0206_032E:
	npc_msg 1
	waitbutton
	closemsg
	setvar VAR_UNK_4125, 1
	releaseall
	end

scr_seq_0801_T07R0206_033F:
	.byte 0x00

scr_seq_0801_T07R0206_0340:
	step 12, 2
	step 33, 1
	step_end

scr_seq_0801_T07R0206_034C:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
	.balign 4, 0
