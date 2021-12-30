#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0894_T25R0502_0006 ; 000
	scrdef_end

scr_seq_0894_T25R0502_0006:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_0894_T25R0502_008C
	wait_movement
	wait_se SEQ_SE_DP_KAIDAN2
	play_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_176 197, 0, 3, 3, 3
	fade_screen 6, 1, 1, 0x00
	wait_fade
	wait_se SEQ_SE_DP_KAIDAN2
	scrcmd_606
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0894_T25R0502_0098
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg 0
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0894_T25R0502_00A4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	releaseall
	end

scr_seq_0894_T25R0502_008B:
	.byte 0x00

scr_seq_0894_T25R0502_008C:
	step 13, 3
	step 14, 8
	step_end

scr_seq_0894_T25R0502_0098:
	step 15, 3
	step 13, 3
	step_end

scr_seq_0894_T25R0502_00A4:
	step 13, 2
	step_end
	.byte 0x02, 0x00, 0x00, 0x00
	.balign 4, 0
