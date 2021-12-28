#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0046_D24R0209_000E ; 000
	scrdef scr_seq_0046_D24R0209_004F ; 001
	scrdef scr_seq_0046_D24R0209_006C ; 002
	scrdef_end

scr_seq_0046_D24R0209_000E:
	play_se SEQ_SE_GS_RAKKA01
	apply_movement 255, scr_seq_0046_D24R0209_0064
	scrcmd_374 255
	wait_movement
	scrcmd_561 0, 1, 1, 8
	play_se SEQ_SE_DP_SUTYA2
	setvar VAR_UNK_40D8, 0
	comparevartovalue VAR_UNK_40F0, 1
	gotoif eq, scr_seq_0046_D24R0209_004D
	setvar VAR_UNK_40F0, 1
	addvar VAR_UNK_40F1, 1
scr_seq_0046_D24R0209_004D:
	end

scr_seq_0046_D24R0209_004F:
	comparevartovalue VAR_UNK_40D8, 1
	gotoif ne, scr_seq_0046_D24R0209_0060
	scrcmd_375 255
scr_seq_0046_D24R0209_0060:
	end

scr_seq_0046_D24R0209_0062:
	.byte 0x00, 0x00

scr_seq_0046_D24R0209_0064:
	.short 68, 1
	.short 254, 0
scr_seq_0046_D24R0209_006C:
	scrcmd_609
	lockall
	setvar VAR_UNK_40CE, 1
	setflag FLAG_UNK_111
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0046_D24R0209_009A
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0046_D24R0209_00FF
	end

scr_seq_0046_D24R0209_009A:
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0046_D24R0209_00B9
	apply_movement 255, scr_seq_0046_D24R0209_0218
	goto scr_seq_0046_D24R0209_00F7

scr_seq_0046_D24R0209_00B9:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0046_D24R0209_00D4
	apply_movement 255, scr_seq_0046_D24R0209_0234
	goto scr_seq_0046_D24R0209_00F7

scr_seq_0046_D24R0209_00D4:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0046_D24R0209_00EF
	apply_movement 255, scr_seq_0046_D24R0209_0250
	goto scr_seq_0046_D24R0209_00F7

scr_seq_0046_D24R0209_00EF:
	apply_movement 255, scr_seq_0046_D24R0209_026C
scr_seq_0046_D24R0209_00F7:
	wait_movement
	goto scr_seq_0046_D24R0209_017E

scr_seq_0046_D24R0209_00FF:
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0046_D24R0209_0126
	apply_movement 255, scr_seq_0046_D24R0209_0218
	apply_movement 253, scr_seq_0046_D24R0209_0224
	goto scr_seq_0046_D24R0209_017C

scr_seq_0046_D24R0209_0126:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0046_D24R0209_0149
	apply_movement 255, scr_seq_0046_D24R0209_0234
	apply_movement 253, scr_seq_0046_D24R0209_0240
	goto scr_seq_0046_D24R0209_017C

scr_seq_0046_D24R0209_0149:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0046_D24R0209_016C
	apply_movement 255, scr_seq_0046_D24R0209_0250
	apply_movement 253, scr_seq_0046_D24R0209_025C
	goto scr_seq_0046_D24R0209_017C

scr_seq_0046_D24R0209_016C:
	apply_movement 255, scr_seq_0046_D24R0209_026C
	apply_movement 253, scr_seq_0046_D24R0209_0278
scr_seq_0046_D24R0209_017C:
	wait_movement
scr_seq_0046_D24R0209_017E:
	play_se SEQ_SE_GS_RAKKA01
	comparevartovalue VAR_UNK_403E, 7
	gotoif ge, scr_seq_0046_D24R0209_01C4
	comparevartovalue VAR_UNK_403E, 6
	gotoif eq, scr_seq_0046_D24R0209_01EE
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 315, 0, 5, 24, 32780
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_0046_D24R0209_01C0:
	releaseall
	end

scr_seq_0046_D24R0209_01C4:
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 492, 0, 5, 24, 32780
	fade_screen 6, 1, 1, 0
	wait_fade
	goto scr_seq_0046_D24R0209_01C0

scr_seq_0046_D24R0209_01EE:
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 490, 0, 5, 24, 32780
	fade_screen 6, 1, 1, 0
	wait_fade
	goto scr_seq_0046_D24R0209_01C0


scr_seq_0046_D24R0209_0218:
	.short 40, 4
	.short 69, 1
	.short 254, 0

scr_seq_0046_D24R0209_0224:
	.short 62, 3
	.short 20, 1
	.short 69, 1
	.short 254, 0

scr_seq_0046_D24R0209_0234:
	.short 41, 4
	.short 69, 1
	.short 254, 0

scr_seq_0046_D24R0209_0240:
	.short 62, 3
	.short 21, 1
	.short 69, 1
	.short 254, 0

scr_seq_0046_D24R0209_0250:
	.short 42, 4
	.short 69, 1
	.short 254, 0

scr_seq_0046_D24R0209_025C:
	.short 62, 3
	.short 22, 1
	.short 69, 1
	.short 254, 0

scr_seq_0046_D24R0209_026C:
	.short 43, 4
	.short 69, 1
	.short 254, 0

scr_seq_0046_D24R0209_0278:
	.short 62, 3
	.short 23, 1
	.short 69, 1
	.short 254, 0
	.balign 4, 0
