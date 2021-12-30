#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0051_D24R0214_000A ; 000
	scrdef scr_seq_0051_D24R0214_015C ; 001
	scrdef_end

scr_seq_0051_D24R0214_000A:
	scrcmd_609
	lockall
	setvar VAR_UNK_40D8, 1
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0051_D24R0214_0034
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0051_D24R0214_007E
	end

scr_seq_0051_D24R0214_0034:
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0051_D24R0214_0053
	apply_movement 255, scr_seq_0051_D24R0214_0108
	goto scr_seq_0051_D24R0214_0076

scr_seq_0051_D24R0214_0053:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0051_D24R0214_006E
	apply_movement 255, scr_seq_0051_D24R0214_0140
	goto scr_seq_0051_D24R0214_0076

scr_seq_0051_D24R0214_006E:
	apply_movement 255, scr_seq_0051_D24R0214_0124
scr_seq_0051_D24R0214_0076:
	wait_movement
	goto scr_seq_0051_D24R0214_00DA

scr_seq_0051_D24R0214_007E:
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0051_D24R0214_00A5
	apply_movement 255, scr_seq_0051_D24R0214_0108
	apply_movement 253, scr_seq_0051_D24R0214_0114
	goto scr_seq_0051_D24R0214_00D8

scr_seq_0051_D24R0214_00A5:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0051_D24R0214_00C8
	apply_movement 255, scr_seq_0051_D24R0214_0140
	apply_movement 253, scr_seq_0051_D24R0214_014C
	goto scr_seq_0051_D24R0214_00D8

scr_seq_0051_D24R0214_00C8:
	apply_movement 255, scr_seq_0051_D24R0214_0124
	apply_movement 253, scr_seq_0051_D24R0214_0130
scr_seq_0051_D24R0214_00D8:
	wait_movement
scr_seq_0051_D24R0214_00DA:
	play_se SEQ_SE_GS_RAKKA01
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 319, 0, 11, 14, 32780
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_0051_D24R0214_0106:
	.byte 0x00, 0x00

scr_seq_0051_D24R0214_0108:
	step 40, 4
	step 69, 1
	step_end

scr_seq_0051_D24R0214_0114:
	step 62, 3
	step 20, 1
	step 69, 1
	step_end

scr_seq_0051_D24R0214_0124:
	step 42, 4
	step 69, 1
	step_end

scr_seq_0051_D24R0214_0130:
	step 62, 3
	step 22, 1
	step 69, 1
	step_end

scr_seq_0051_D24R0214_0140:
	step 43, 4
	step 69, 1
	step_end

scr_seq_0051_D24R0214_014C:
	step 62, 3
	step 23, 1
	step 69, 1
	step_end
scr_seq_0051_D24R0214_015C:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
