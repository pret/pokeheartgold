#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000894_00000006 ; 000
	scrdef_end

scr_seq_00000894_00000006:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_00000894_0000008C
	wait_movement
	wait_se SEQ_SE_DP_KAIDAN2
	play_se SEQ_SE_DP_KAIDAN2
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 197, 0, 3, 3, 3
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	wait_se SEQ_SE_DP_KAIDAN2
	scrcmd_606
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000894_00000098
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	msgbox 0
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000894_000000A4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	releaseall
	end

scr_seq_00000894_0000008B:
	.byte 0x00

scr_seq_00000894_0000008C:
	.short 13, 3
	.short 14, 8
	.short 254, 0

scr_seq_00000894_00000098:
	.short 15, 3
	.short 13, 3
	.short 254, 0

scr_seq_00000894_000000A4:
	.short 13, 2
	.short 254, 0
	.byte 0x02, 0x00, 0x00, 0x00
	.balign 4, 0
