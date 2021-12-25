#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000070_00000012 ; 000
	scrdef scr_seq_00000070_00000146 ; 001
	scrdef scr_seq_00000070_0000015E ; 002
	scrdef scr_seq_00000070_00000176 ; 003
	scrdef_end

scr_seq_00000070_00000012:
	comparevartovalue VAR_UNK_414D, 0
	callif ne, scr_seq_00000070_0000008A
	scrcmd_412 43, 0, 16394
	call scr_seq_00000070_0000008E
	comparevartovalue VAR_TEMP_x400A, 2
	callif eq, scr_seq_00000070_0000009E
	comparevartovalue VAR_TEMP_x400A, 3
	callif eq, scr_seq_00000070_0000009E
	comparevartovalue VAR_TEMP_x400A, 0
	callif eq, scr_seq_00000070_0000008E
	comparevartovalue VAR_TEMP_x400A, 1
	callif eq, scr_seq_00000070_0000008E
	comparevartovalue VAR_TEMP_x400A, 4
	callif eq, scr_seq_00000070_00000096
	comparevartovalue VAR_TEMP_x400A, 5
	callif eq, scr_seq_00000070_00000096
	comparevartovalue VAR_TEMP_x400A, 6
	callif eq, scr_seq_00000070_00000096
	end

scr_seq_00000070_0000008A:
	scrcmd_520
	return

scr_seq_00000070_0000008E:
	setvar VAR_OBJ_10, 282
	return

scr_seq_00000070_00000096:
	setvar VAR_OBJ_10, 286
	return

scr_seq_00000070_0000009E:
	setvar VAR_OBJ_10, 283
	return

scr_seq_00000070_000000A6:
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_412 43, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif eq, scr_seq_00000070_00000200
	comparevartovalue VAR_SPECIAL_x800C, 5
	gotoif eq, scr_seq_00000070_00000200
	scrcmd_436
	scrcmd_627 5
	scrcmd_150
	scrcmd_176 265, 0, 15, 6, 0
	end

scr_seq_00000070_000000E9:
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_436
	scrcmd_627 6
	scrcmd_150
	scrcmd_176 265, 0, 11, 6, 0
	end

scr_seq_00000070_0000010A:
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 271, 0, 8, 2, 1
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000070_00000132:
	call scr_seq_00000070_0000018E
	scrcmd_488 16384, 3
	call scr_seq_00000070_0000019A
	return

scr_seq_00000070_00000146:
	scrcmd_609
	lockall
	setvar VAR_TEMP_x4000, 0
	call scr_seq_00000070_00000132
	goto scr_seq_00000070_000000A6

scr_seq_00000070_0000015C:
	.byte 0x02, 0x00
scr_seq_00000070_0000015E:
	scrcmd_609
	lockall
	setvar VAR_TEMP_x4000, 0
	call scr_seq_00000070_00000132
	goto scr_seq_00000070_000000E9

scr_seq_00000070_00000174:
	.byte 0x02, 0x00
scr_seq_00000070_00000176:
	scrcmd_609
	lockall
	setvar VAR_TEMP_x4000, 1
	call scr_seq_00000070_00000132
	goto scr_seq_00000070_0000010A

scr_seq_00000070_0000018C:
	.byte 0x02, 0x00
scr_seq_00000070_0000018E:
	apply_movement 255, scr_seq_00000070_000001C4
	wait_movement
	return

scr_seq_00000070_0000019A:
	apply_movement 0, scr_seq_00000070_000001D0
	apply_movement 255, scr_seq_00000070_000001EC
	wait_movement
	return

scr_seq_00000070_000001AE:
	.byte 0x00, 0x00
	.byte 0x0c, 0x00, 0x02, 0x00, 0x03, 0x00, 0x01, 0x00, 0x0f, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00
	.byte 0xfe, 0x00, 0x00, 0x00

scr_seq_00000070_000001C4:
	.short 12, 2
	.short 1, 1
	.short 254, 0

scr_seq_00000070_000001D0:
	.short 13, 1
	.short 2, 1
	.short 14, 1
	.short 1, 1
	.short 13, 1
	.short 69, 1
	.short 254, 0

scr_seq_00000070_000001EC:
	.short 63, 2
	.short 61, 1
	.short 13, 2
	.short 69, 1
	.short 254, 0
scr_seq_00000070_00000200:
	scrcmd_436
	scrcmd_627 5
	scrcmd_150
	scrcmd_176 265, 0, 19, 6, 0
	end
	.balign 4, 0
