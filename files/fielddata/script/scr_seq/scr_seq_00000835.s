#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000835_00000006 ; 000
	scrdef_end

scr_seq_00000835_00000006:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_00000835_00000088
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 400, 0, 3, 3, 3
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	wait_se SEQ_SE_DP_KAIDAN2
	scrcmd_606
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000835_00000094
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	msgbox 0
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000835_000000A0
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	releaseall
	end

scr_seq_00000835_00000087:
	.byte 0x00

scr_seq_00000835_00000088:
	.short 13, 3
	.short 15, 7
	.short 254, 0

scr_seq_00000835_00000094:
	.short 15, 11
	.short 13, 4
	.short 254, 0

scr_seq_00000835_000000A0:
	.short 13, 2
	.short 254, 0
	.byte 0x02, 0x00, 0x00, 0x00
	.balign 4, 0
