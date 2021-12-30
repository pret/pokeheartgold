#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0154_P01R0103_0029 ; 000
	scrdef scr_seq_0154_P01R0103_000E ; 001
	scrdef scr_seq_0154_P01R0103_01F8 ; 002
	scrdef_end

scr_seq_0154_P01R0103_000E:
	scrcmd_445 16384
	comparevartovalue VAR_TEMP_x4000, 387
	gotoif eq, scr_seq_0154_P01R0103_0021
	end

scr_seq_0154_P01R0103_0021:
	scrcmd_341 0, 1
	end

scr_seq_0154_P01R0103_0029:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif ge, scr_seq_0154_P01R0103_014D
	scrcmd_386 VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif eq, scr_seq_0154_P01R0103_0158
	get_weekday VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0154_P01R0103_006C
	goto scr_seq_0154_P01R0103_00EF

scr_seq_0154_P01R0103_0066:
	.byte 0x16, 0x00, 0x83, 0x00, 0x00, 0x00
scr_seq_0154_P01R0103_006C:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0154_P01R0103_0085
	goto scr_seq_0154_P01R0103_0142

scr_seq_0154_P01R0103_007F:
	.byte 0x16
	.byte 0x00, 0x6a, 0x00, 0x00, 0x00
scr_seq_0154_P01R0103_0085:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0154_P01R0103_009E
	goto scr_seq_0154_P01R0103_0142

scr_seq_0154_P01R0103_0098:
	.byte 0x16, 0x00, 0x51, 0x00, 0x00, 0x00
scr_seq_0154_P01R0103_009E:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0154_P01R0103_00B7
	goto scr_seq_0154_P01R0103_00EF

scr_seq_0154_P01R0103_00B1:
	.byte 0x16, 0x00, 0x38, 0x00, 0x00, 0x00
scr_seq_0154_P01R0103_00B7:
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif ne, scr_seq_0154_P01R0103_00D0
	goto scr_seq_0154_P01R0103_0142

scr_seq_0154_P01R0103_00CA:
	.byte 0x16, 0x00, 0x1f, 0x00, 0x00, 0x00
scr_seq_0154_P01R0103_00D0:
	comparevartovalue VAR_SPECIAL_x800C, 5
	gotoif ne, scr_seq_0154_P01R0103_00E9
	goto scr_seq_0154_P01R0103_0142

scr_seq_0154_P01R0103_00E3:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_0154_P01R0103_00E9:
	goto scr_seq_0154_P01R0103_0142

scr_seq_0154_P01R0103_00EF:
	npc_msg 0
	closemsg
	apply_movement 0, scr_seq_0154_P01R0103_0190
	wait_movement
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0154_P01R0103_01B0
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	setvar VAR_TEMP_x4002, 1
	setvar VAR_UNK_40E1, 2
	setvar VAR_UNK_40DC, 0
	clearflag FLAG_UNK_0EB
	setflag FLAG_UNK_22A
	clearflag FLAG_UNK_22C
	setflag FLAG_UNK_22B
	releaseall
	end

scr_seq_0154_P01R0103_0142:
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0154_P01R0103_014D:
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0154_P01R0103_0158:
	apply_movement 0, scr_seq_0154_P01R0103_01B8
	wait_movement
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0154_P01R0103_01D8
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement 0, scr_seq_0154_P01R0103_01E4
	wait_movement
	releaseall
	end

scr_seq_0154_P01R0103_018E:
	.byte 0x00, 0x00

scr_seq_0154_P01R0103_0190:
	step 71, 1
	step 13, 1
	step 72, 1
	step 2, 2
	step 71, 1
	step 15, 1
	step 72, 1
	step_end

scr_seq_0154_P01R0103_01B0:
	step 13, 2
	step_end

scr_seq_0154_P01R0103_01B8:
	step 71, 1
	step 12, 1
	step 72, 1
	step 2, 2
	step 71, 1
	step 15, 1
	step 72, 1
	step_end

scr_seq_0154_P01R0103_01D8:
	step 63, 1
	step 12, 4
	step_end

scr_seq_0154_P01R0103_01E4:
	step 14, 1
	step 1, 2
	step 13, 1
	step 32, 1
	step_end
scr_seq_0154_P01R0103_01F8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
