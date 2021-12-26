#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000040_0000000E ; 000
	scrdef scr_seq_00000040_0000004F ; 001
	scrdef scr_seq_00000040_0000006C ; 002
	scrdef_end

scr_seq_00000040_0000000E:
	play_se SEQ_SE_GS_RAKKA01
	apply_movement 255, scr_seq_00000040_00000064
	scrcmd_374 255
	wait_movement
	scrcmd_561 0, 1, 1, 8
	play_se SEQ_SE_DP_SUTYA2
	setvar VAR_UNK_40CD, 0
	comparevartovalue VAR_UNK_40ED, 1
	gotoif eq, scr_seq_00000040_0000004D
	setvar VAR_UNK_40ED, 1
	addvar VAR_UNK_40F1, 1
scr_seq_00000040_0000004D:
	end

scr_seq_00000040_0000004F:
	comparevartovalue VAR_UNK_40CD, 1
	gotoif ne, scr_seq_00000040_00000060
	scrcmd_375 255
scr_seq_00000040_00000060:
	end

scr_seq_00000040_00000062:
	.byte 0x00, 0x00

scr_seq_00000040_00000064:
	.short 68, 1
	.short 254, 0
scr_seq_00000040_0000006C:
	scrcmd_609
	lockall
	setvar VAR_UNK_40CE, 1
	setflag FLAG_UNK_111
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000040_0000009A
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000040_000000FF
	end

scr_seq_00000040_0000009A:
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000040_000000B9
	apply_movement 255, scr_seq_00000040_00000218
	goto scr_seq_00000040_000000F7

scr_seq_00000040_000000B9:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000040_000000D4
	apply_movement 255, scr_seq_00000040_00000234
	goto scr_seq_00000040_000000F7

scr_seq_00000040_000000D4:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_00000040_000000EF
	apply_movement 255, scr_seq_00000040_00000250
	goto scr_seq_00000040_000000F7

scr_seq_00000040_000000EF:
	apply_movement 255, scr_seq_00000040_0000026C
scr_seq_00000040_000000F7:
	wait_movement
	goto scr_seq_00000040_0000017E

scr_seq_00000040_000000FF:
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000040_00000126
	apply_movement 255, scr_seq_00000040_00000218
	apply_movement 253, scr_seq_00000040_00000224
	goto scr_seq_00000040_0000017C

scr_seq_00000040_00000126:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000040_00000149
	apply_movement 255, scr_seq_00000040_00000234
	apply_movement 253, scr_seq_00000040_00000240
	goto scr_seq_00000040_0000017C

scr_seq_00000040_00000149:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_00000040_0000016C
	apply_movement 255, scr_seq_00000040_00000250
	apply_movement 253, scr_seq_00000040_0000025C
	goto scr_seq_00000040_0000017C

scr_seq_00000040_0000016C:
	apply_movement 255, scr_seq_00000040_0000026C
	apply_movement 253, scr_seq_00000040_00000278
scr_seq_00000040_0000017C:
	wait_movement
scr_seq_00000040_0000017E:
	play_se SEQ_SE_GS_RAKKA01
	comparevartovalue VAR_UNK_403E, 7
	gotoif ge, scr_seq_00000040_000001C4
	comparevartovalue VAR_UNK_403E, 6
	gotoif eq, scr_seq_00000040_000001EE
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 315, 0, 25, 6, 32780
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_00000040_000001C0:
	releaseall
	end

scr_seq_00000040_000001C4:
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 492, 0, 25, 6, 32780
	fade_screen 6, 1, 1, 0
	wait_fade
	goto scr_seq_00000040_000001C0

scr_seq_00000040_000001EE:
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 490, 0, 25, 6, 32780
	fade_screen 6, 1, 1, 0
	wait_fade
	goto scr_seq_00000040_000001C0


scr_seq_00000040_00000218:
	.short 40, 4
	.short 69, 1
	.short 254, 0

scr_seq_00000040_00000224:
	.short 62, 3
	.short 20, 1
	.short 69, 1
	.short 254, 0

scr_seq_00000040_00000234:
	.short 41, 4
	.short 69, 1
	.short 254, 0

scr_seq_00000040_00000240:
	.short 62, 3
	.short 21, 1
	.short 69, 1
	.short 254, 0

scr_seq_00000040_00000250:
	.short 42, 4
	.short 69, 1
	.short 254, 0

scr_seq_00000040_0000025C:
	.short 62, 3
	.short 22, 1
	.short 69, 1
	.short 254, 0

scr_seq_00000040_0000026C:
	.short 43, 4
	.short 69, 1
	.short 254, 0

scr_seq_00000040_00000278:
	.short 62, 3
	.short 23, 1
	.short 69, 1
	.short 254, 0
	.balign 4, 0
