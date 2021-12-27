#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0067_0006 ; 000
	scrdef_end

scr_seq_0067_0006:
	scrcmd_609
	lockall
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0067_0058
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0067_002A
	end

scr_seq_0067_002A:
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0067_00F4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement 253, scr_seq_0067_0100
	wait_movement
	goto scr_seq_0067_0062

scr_seq_0067_0058:
	apply_movement 255, scr_seq_0067_00F4
	wait_movement
scr_seq_0067_0062:
	scrcmd_241 16659
	copyvar VAR_SPECIAL_x8008, VAR_UNK_4113
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0067_0088
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0067_00A5
	end

scr_seq_0067_0088:
	npc_msg 0
	closemsg
	scrcmd_240 225, 1, 5, 3, 1
	setvar VAR_SPECIAL_x8004, 0
	goto scr_seq_0067_00C2

scr_seq_0067_00A5:
	npc_msg 1
	closemsg
	scrcmd_240 115, 1, 5, 3, 1
	setvar VAR_SPECIAL_x8004, 1
	goto scr_seq_0067_00C2

scr_seq_0067_00C2:
	wait_se SEQ_SE_DP_SELECT
	scrcmd_488 32772, 5
	comparevartovalue VAR_UNK_4113, 0
	gotoif ne, scr_seq_0067_00E2
	npc_msg 2
	goto scr_seq_0067_00E5

scr_seq_0067_00E2:
	npc_msg 3
scr_seq_0067_00E5:
	waitbutton
	closemsg
	setvar VAR_UNK_4125, 1
	releaseall
	end

scr_seq_0067_00F3:
	.byte 0x00

scr_seq_0067_00F4:
	.short 12, 2
	.short 33, 1
	.short 254, 0

scr_seq_0067_0100:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
	.balign 4, 0
