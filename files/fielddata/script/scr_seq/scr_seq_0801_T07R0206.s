#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0801_0006 ; 000
	scrdef_end

scr_seq_0801_0006:
	scrcmd_609
	lockall
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0801_0058
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0801_002A
	end

scr_seq_0801_002A:
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0801_0340
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement 253, scr_seq_0801_034C
	wait_movement
	goto scr_seq_0801_0062

scr_seq_0801_0058:
	apply_movement 255, scr_seq_0801_0340
	wait_movement
scr_seq_0801_0062:
	scrcmd_241 16659
	copyvar VAR_SPECIAL_x8008, VAR_UNK_4113
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0801_0095
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0801_00A0
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0801_00AA
	end

scr_seq_0801_0095:
	scrcmd_198 0, 0
	goto scr_seq_0801_00B4

scr_seq_0801_00A0:
	scrcmd_852 0, 3
	goto scr_seq_0801_00B4

scr_seq_0801_00AA:
	scrcmd_852 0, 1
	goto scr_seq_0801_00B4

scr_seq_0801_00B4:
	scrcmd_242 20, 1, 16659, 16659
	npc_msg 0
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
	gotoif eq, scr_seq_0801_0120
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0801_019B
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0801_0216
	goto scr_seq_0801_0322

scr_seq_0801_0120:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 376, 2, 5, 3, 1
	comparevartovalue VAR_UNK_4113, 0
	gotoif eq, scr_seq_0801_0305
	comparevartovalue VAR_UNK_4113, 0
	callif gt, scr_seq_0801_029C
	comparevartovalue VAR_UNK_4113, 0
	callif lt, scr_seq_0801_0291
	comparevartovalue VAR_UNK_4113, 2
	gotoif ne, scr_seq_0801_0176
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_0801_0189

scr_seq_0801_0176:
	comparevartovalue VAR_UNK_4113, 3
	gotoif ne, scr_seq_0801_0189
	setvar VAR_SPECIAL_x8005, 3
scr_seq_0801_0189:
	call scr_seq_0801_02A7
	setvar VAR_UNK_4113, 0
	goto scr_seq_0801_02BB

scr_seq_0801_019B:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 378, 0, 5, 3, 1
	comparevartovalue VAR_UNK_4113, 2
	gotoif eq, scr_seq_0801_0305
	comparevartovalue VAR_UNK_4113, 2
	callif gt, scr_seq_0801_029C
	comparevartovalue VAR_UNK_4113, 2
	callif lt, scr_seq_0801_0291
	comparevartovalue VAR_UNK_4113, 0
	gotoif ne, scr_seq_0801_01F1
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_0801_0204

scr_seq_0801_01F1:
	comparevartovalue VAR_UNK_4113, 3
	gotoif ne, scr_seq_0801_0204
	setvar VAR_SPECIAL_x8005, 1
scr_seq_0801_0204:
	call scr_seq_0801_02A7
	setvar VAR_UNK_4113, 2
	goto scr_seq_0801_02BB

scr_seq_0801_0216:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 379, 1, 5, 3, 1
	comparevartovalue VAR_UNK_4113, 3
	gotoif eq, scr_seq_0801_0305
	comparevartovalue VAR_UNK_4113, 3
	callif gt, scr_seq_0801_029C
	comparevartovalue VAR_UNK_4113, 3
	callif lt, scr_seq_0801_0291
	comparevartovalue VAR_UNK_4113, 0
	gotoif ne, scr_seq_0801_026C
	setvar VAR_SPECIAL_x8005, 3
	goto scr_seq_0801_027F

scr_seq_0801_026C:
	comparevartovalue VAR_UNK_4113, 2
	gotoif ne, scr_seq_0801_027F
	setvar VAR_SPECIAL_x8005, 1
scr_seq_0801_027F:
	call scr_seq_0801_02A7
	setvar VAR_UNK_4113, 3
	goto scr_seq_0801_02BB

scr_seq_0801_0291:
	npc_msg 2
	setvar VAR_SPECIAL_x8004, 0
	return

scr_seq_0801_029C:
	npc_msg 3
	setvar VAR_SPECIAL_x8004, 1
	return

scr_seq_0801_02A7:
	setvar VAR_UNK_4113, 65535
	closemsg
	wait_se SEQ_SE_DP_SELECT
	scrcmd_488 32772, 32773
	return

scr_seq_0801_02BB:
	copyvar VAR_SPECIAL_x8008, VAR_UNK_4113
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0801_02EA
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0801_02F3
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0801_02FC
	end

scr_seq_0801_02EA:
	npc_msg 7
	goto scr_seq_0801_032E

scr_seq_0801_02F3:
	npc_msg 6
	goto scr_seq_0801_032E

scr_seq_0801_02FC:
	npc_msg 5
	goto scr_seq_0801_032E

scr_seq_0801_0305:
	setvar VAR_UNK_4113, 65535
	wait 1, VAR_SPECIAL_x800C
	npc_msg 4
	waitbutton
	closemsg
	setvar VAR_UNK_4125, 1
	releaseall
	end

scr_seq_0801_0322:
	setvar VAR_UNK_4113, 65535
	wait 1, VAR_SPECIAL_x800C
scr_seq_0801_032E:
	npc_msg 1
	waitbutton
	closemsg
	setvar VAR_UNK_4125, 1
	releaseall
	end

scr_seq_0801_033F:
	.byte 0x00

scr_seq_0801_0340:
	.short 12, 2
	.short 33, 1
	.short 254, 0

scr_seq_0801_034C:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
	.balign 4, 0
