#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0071_000E ; 000
	scrdef scr_seq_0071_0010 ; 001
	scrdef scr_seq_0071_0025 ; 002
	scrdef_end

scr_seq_0071_000E:
	end

scr_seq_0071_0010:
	comparevartovalue VAR_UNK_414E, 0
	callif ne, scr_seq_0071_001F
	end

scr_seq_0071_001F:
	scrcmd_375 255
	return

scr_seq_0071_0025:
	scrcmd_609
	lockall
	call scr_seq_0071_0090
	scrcmd_380 32780, 4
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0071_00F2
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0071_010C
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0071_0126
	goto scr_seq_0071_00D8

scr_seq_0071_0068:
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 269, 0, 7, 6, 0
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_0071_0090:
	scrcmd_307 0, 0, 2, 2, 77
	scrcmd_310 77
	scrcmd_308 77
	apply_movement 0, scr_seq_0071_0140
	wait_movement
	scrcmd_374 255
	apply_movement 255, scr_seq_0071_014C
	wait_movement
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	return

scr_seq_0071_00C4:
	.byte 0x5e, 0x00, 0x00, 0x00, 0x88, 0x00, 0x00, 0x00, 0x5e, 0x00, 0xff, 0x00
	.byte 0x90, 0x00, 0x00, 0x00, 0x5f, 0x00, 0x1b, 0x00
scr_seq_0071_00D8:
	apply_movement 0, scr_seq_0071_0178
	apply_movement 255, scr_seq_0071_0188
	wait_movement
	goto scr_seq_0071_0068

scr_seq_0071_00F0:
	.byte 0x02, 0x00
scr_seq_0071_00F2:
	apply_movement 0, scr_seq_0071_019C
	apply_movement 255, scr_seq_0071_01AC
	wait_movement
	goto scr_seq_0071_0068

scr_seq_0071_010A:
	.byte 0x02, 0x00
scr_seq_0071_010C:
	apply_movement 0, scr_seq_0071_01C0
	apply_movement 255, scr_seq_0071_01D0
	wait_movement
	goto scr_seq_0071_0068

scr_seq_0071_0124:
	.byte 0x02, 0x00
scr_seq_0071_0126:
	apply_movement 0, scr_seq_0071_01E4
	apply_movement 255, scr_seq_0071_01F4
	wait_movement
	goto scr_seq_0071_0068

scr_seq_0071_013E:
	.byte 0x02, 0x00

scr_seq_0071_0140:
	.short 13, 3
	.short 0, 1
	.short 254, 0

scr_seq_0071_014C:
	.short 13, 2
	.short 254, 0
	.byte 0x00, 0x00, 0x01, 0x00, 0x0c, 0x00, 0x02, 0x00, 0x45, 0x00, 0x01, 0x00
	.byte 0xfe, 0x00, 0x00, 0x00, 0x0f, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x14, 0x00, 0x01, 0x00
	.byte 0x45, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_0071_0178:
	.short 15, 4
	.short 12, 2
	.short 69, 1
	.short 254, 0

scr_seq_0071_0188:
	.short 13, 1
	.short 15, 4
	.short 12, 2
	.short 69, 1
	.short 254, 0

scr_seq_0071_019C:
	.short 15, 8
	.short 12, 2
	.short 69, 1
	.short 254, 0

scr_seq_0071_01AC:
	.short 13, 1
	.short 15, 8
	.short 12, 2
	.short 69, 1
	.short 254, 0

scr_seq_0071_01C0:
	.short 15, 12
	.short 12, 2
	.short 69, 1
	.short 254, 0

scr_seq_0071_01D0:
	.short 13, 1
	.short 15, 12
	.short 12, 2
	.short 69, 1
	.short 254, 0

scr_seq_0071_01E4:
	.short 15, 16
	.short 12, 2
	.short 69, 1
	.short 254, 0

scr_seq_0071_01F4:
	.short 13, 1
	.short 15, 16
	.short 12, 2
	.short 69, 1
	.short 254, 0
	.balign 4, 0
