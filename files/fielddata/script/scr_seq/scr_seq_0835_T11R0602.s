#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0835_0006 ; 000
	scrdef_end

scr_seq_0835_0006:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_0835_0088
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 400, 0, 3, 3, 3
	fade_screen 6, 1, 1, 0
	wait_fade
	wait_se SEQ_SE_DP_KAIDAN2
	scrcmd_606
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0835_0094
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg 0
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0835_00A0
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	releaseall
	end

scr_seq_0835_0087:
	.byte 0x00

scr_seq_0835_0088:
	.short 13, 3
	.short 15, 7
	.short 254, 0

scr_seq_0835_0094:
	.short 15, 11
	.short 13, 4
	.short 254, 0

scr_seq_0835_00A0:
	.short 13, 2
	.short 254, 0
	.byte 0x02, 0x00, 0x00, 0x00
	.balign 4, 0
