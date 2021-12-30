#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0835_T11R0602_0006 ; 000
	scrdef_end

scr_seq_0835_T11R0602_0006:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_0835_T11R0602_0088
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_176 400, 0, 3, 3, 3
	fade_screen 6, 1, 1, 0x00
	wait_fade
	wait_se SEQ_SE_DP_KAIDAN2
	scrcmd_606
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0835_T11R0602_0094
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg 0
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0835_T11R0602_00A0
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	releaseall
	end

scr_seq_0835_T11R0602_0087:
	.byte 0x00

scr_seq_0835_T11R0602_0088:
	step 13, 3
	step 15, 7
	step_end

scr_seq_0835_T11R0602_0094:
	step 15, 11
	step 13, 4
	step_end

scr_seq_0835_T11R0602_00A0:
	step 13, 2
	step_end
	.byte 0x02, 0x00, 0x00, 0x00
	.balign 4, 0
