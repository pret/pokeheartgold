#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000839_00000006 ; 000
	scrdef_end

scr_seq_00000839_00000006:
	scrcmd_609
	lockall
	scrcmd_529 16384
	scrcmd_354 16384, 16385
	comparevartovalue VAR_TEMP_x4001, 479
	gotoif ne, scr_seq_00000839_0000018C
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000839_00000154
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement 253, scr_seq_00000839_00000170
	wait_movement
	scrcmd_076 479, 0
	scrcmd_077
	msgbox 0
	closemsg
	goto scr_seq_00000839_00000066

scr_seq_00000839_0000005C:
	.byte 0x5e, 0x00, 0xff, 0x00
	.byte 0xf0, 0x00, 0x00, 0x00, 0x5f, 0x00
scr_seq_00000839_00000066:
	scrcmd_241 16659
	copyvar VAR_SPECIAL_x8008, VAR_UNK_4113
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000839_0000008C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000839_000000C0
	end

scr_seq_00000839_0000008C:
	setvar VAR_SPECIAL_x8004, 0
	call scr_seq_00000839_000000F4
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 402, 0, 3, 3, 1
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000839_000000C0:
	setvar VAR_SPECIAL_x8004, 1
	call scr_seq_00000839_000000F4
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 403, 0, 7, 3, 1
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000839_000000F4:
	wait_se SEQ_SE_DP_SELECT
	scrcmd_488 32772, 1
scr_seq_00000839_000000FE:
	scrcmd_729 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000839_00000142
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000839_0000011E
	end

scr_seq_00000839_0000011E:
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000839_00000180
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	goto scr_seq_00000839_0000014C

scr_seq_00000839_00000142:
	apply_movement 255, scr_seq_00000839_00000180
	wait_movement
scr_seq_00000839_0000014C:
	play_se SEQ_SE_DP_KAIDAN2
	return

scr_seq_00000839_00000152:
	.byte 0x00, 0x00

scr_seq_00000839_00000154:
	.short 12, 2
	.short 33, 1
	.short 254, 0

scr_seq_00000839_00000160:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0

scr_seq_00000839_00000170:
	.short 1, 1
	.short 13, 1
	.short 45, 3
	.short 254, 0

scr_seq_00000839_00000180:
	.short 13, 2
	.short 33, 1
	.short 254, 0
scr_seq_00000839_0000018C:
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000839_00000154
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000839_000001C5
	apply_movement 253, scr_seq_00000839_00000160
	wait_movement
scr_seq_00000839_000001C5:
	msgbox 1
	closemsg
	scrcmd_241 16659
	copyvar VAR_SPECIAL_x8008, VAR_UNK_4113
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000839_000001F0
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000839_00000224
	end

scr_seq_00000839_000001F0:
	setvar VAR_SPECIAL_x8004, 0
	call scr_seq_00000839_000000FE
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 403, 0, 7, 3, 1
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000839_00000224:
	setvar VAR_SPECIAL_x8004, 1
	call scr_seq_00000839_000000FE
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 402, 0, 3, 3, 1
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end
	.balign 4, 0
